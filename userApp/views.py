from django.shortcuts import render,HttpResponse
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import JsonResponse
# Create your views here.
from userApp import data_crawl
from userApp import data_clean
def index(request):
    v = request.session.get('username')
    if v:
        if v == 'root':
            return render(request, 'index_admin.html', {'msg': v})
        return render(request, 'index.html', {'msg': v})
    else:
        return render(request,'login.html')
    return render(request,"index.html")
def products(request):
    v = request.session.get('username')
    if v:
        return render(request, "data_display.html",{'msg': v})
    else:
        return render(request, 'login.html')

def datamining(request):
    v = request.session.get('username')
    if v:
        return render(request, "data_mining.html", {'msg': v})
    else:
        return render(request, 'login.html')
def add_product(request):
    v = request.session.get('username')
    if v:
        return render(request, "chart_display_send.html",{'msg': v})
    else:
        return render(request, 'login.html')
def edit_product(request):
    v = request.session.get('username')
    if v:
        return render(request, "insert_data.html", {'msg': v})
    else:
        return render(request, 'login.html')
def userregister(req):
    return render(req,"register.html")
def login(req):
    if req.method=='POST':
        uu = req.POST.get("username")
        psw = req.POST.get("password")
        obj=models.User.objects.filter(username=uu,password=psw).first()
        if obj:
            if obj.username == 'root':
                req.session["username"] = obj.username
                req.session["password"] = obj.password
                req.session.set_expiry(30 * 60)
                return render(req, "index_admin.html", {"msg": obj.username})
            req.session["username"] = obj.username
            req.session["password"] = obj.password
            req.session.set_expiry(30 * 60)
            return render(req, "index.html", {"msg":obj.username})
        else:
            return render(req, "login.html",{"msg":"Failed! Unknown username or password!"})
    if req.method=='GET':
        return render(req,"login.html")

def register2db(req):
    #1.用户注册： 往User表里插入一条记录
    #2.获取form表单提交的数据
    if req.method=='POST':
        uu = req.POST.get("username")
        psw = req.POST.get("password")
        tel = req.POST.get("telephone")
        d={"username":uu,"password":psw,"telephone":tel}
        obj=models.User.objects.filter(username=uu)
        if obj:
            return render(req, "register.html",{"msg":"Register Failed! This ID was registered!"})
        else:
            models.User.objects.create(**d)
            return render(req,"login.html", {"msg":"Register Successfully!"})
    if req.method=='GET':
        return render(req,"register.html")

def logoutView(request):
    request.session.flush()
    return render(request,'login.html')
from userApp import models
def getJobs(req):
    models.Jobinfo.objects.all()
    print(list)
    return render(req,"index.html",{"jobs":list})

def crawlInfo(req):
    input_job=req.GET.get("inputjob")
    input_num=int(req.GET.get("inputnum"))
    data_crawl.datacrawl(input_job,input_num)
    return render(req, "data_mining.html", {"msg1": "Crawl Successfully!"})

def datacleaning(req):
    v = req.session.get('username')
    if v:
        return render(req, "data_cleaning.html", {'msg': v})
    else:
        return render(req, 'login.html')

def dataclean(req):
    data_clean.dataclean()
    return render(req,'data_cleaning.html',{"msg2":"Data has been cleaned!"})

def listing(request):
    contact_list = models.Jobinfo.objects.all()  # 获取所有contacts,假设在models.py中已定义了Contacts模型
    paginator = Paginator(contact_list, 10) # 每页25条
    page = request.GET.get('page')
    try:
        contacts = paginator.page(page) # contacts为Page对象！
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        contacts = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        contacts = paginator.page(paginator.num_pages)
    return render(request, 'data_display.html', {'contacts': contacts})
cityname = ''
import json
def chartdisplay(req):
    tempcity = req.GET.get("cityname")
    cityname=tempcity.split(',')
    # print(cityname)
    startdate = req.GET.get("startdate")
    enddate = req.GET.get("enddate")
    date_list = []
    jobnum_list = []
    # lcityname = []
    # lcityname.append(cityname)
    for i in jobinfosend.get_all_dates(startdate,enddate):
        date_list.append(i)
    for i in jobinfosend.get_data_within(startdate,enddate,cityname):
        jobnum_list.append(i["data"])
    import html
    html.unescape(date_list)
    city_data1 = sum(jobnum_list[0])
    city_data2 = sum(jobnum_list[1])
    city_data3 = sum(jobnum_list[2])
    city_data = []
    city_data.append(city_data1)
    city_data.append(city_data2)
    city_data.append(city_data3)
    sum_data = list_add(jobnum_list[0],jobnum_list[1],jobnum_list[2])
    data = {
        'label_data1': cityname[0],
        'label_data2': cityname[1],
        'label_data3': cityname[2],
        'jobnum_data1': jobnum_list[0],
        'jobnum_data2': jobnum_list[1],
        'jobnum_data3': jobnum_list[2],
        'startdate': startdate,
        'enddate': enddate,
        'sumdata': sum_data,
        'citydata': city_data,

        # 'date_data': html.unescape(date_list),
    }
    # print(date_list)
    return render(req,'chart_display.html',data)


def temp(req):
    return render(req,'temp.html')

from userApp import jobinfosend

def list_add(a,b,c):
    d = []
    for i in range(len(a)):
        d.append(a[i]+b[i]+c[i])
    return d

def get_data(request):
    import numpy as np
    for i in jobinfosend.get_data_within('2019.07.04','2019.07.10',['北京']):
        jobnum_list_beijing=i["data"]
    for i in jobinfosend.get_data_within('2019.07.04','2019.07.10',['上海']):
        jobnum_list_shanghai=i["data"]
    for i in jobinfosend.get_data_within('2019.07.04','2019.07.10',['广州']):
        jobnum_list_guangzhou=i["data"]
    shanghai_citydata=sum(jobnum_list_shanghai)
    guangzhou_citydata=sum(jobnum_list_guangzhou)
    beijing_citydata=sum(jobnum_list_beijing)
    citydata = []
    citydata.append(shanghai_citydata)
    citydata.append(guangzhou_citydata)
    citydata.append(beijing_citydata)
    sumdata = list_add(jobnum_list_beijing,jobnum_list_guangzhou,jobnum_list_shanghai)
    data = {
        'beijing_jobnum_data': jobnum_list_beijing,
        'shanghai_jobnum_data': jobnum_list_shanghai,
        'guangzhou_jobnum_data': jobnum_list_guangzhou,
        'sum_data': sumdata,
        'city_data': citydata,
        'date_data': jobinfosend.datelist(),
    }
    return HttpResponse(json.dumps(data))

def insertdata(req):
    job_name = req.GET.get("jobname")
    need_nums = req.GET.get("neednums")
    cityname = req.GET.get("city")
    pub_time = req.GET.get("pubtime")
    import requests
    import pymysql
    con = pymysql.connect("localhost", "root", "root", "pythonDB")
    db = con.cursor()
    sql = "insert into jobinfo(jobname,city,neednum,pubtime) values('%s','%s','%s','%s')" % (
    job_name,cityname, need_nums,pub_time)
    db.execute(sql)
    con.commit()
    db.close()
    con.close()
    return render(req,'insert_data.html',{"msg":"Insert successfully!"})

def updatedata(req):
    return render(req,'update_data.html')