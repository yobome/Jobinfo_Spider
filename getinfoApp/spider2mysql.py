import requests
import pymysql
from bs4 import BeautifulSoup

url = "https://xiaoyuan.zhaopin.com/full/0/0_0_0_0_0_-1_%E4%BA%BA%E5%B7%A5%E6%99%BA%E8%83%BD_{}_0"          #1.导入包并准备网址

con=pymysql.connect("localhost","root","root","pythonDB")
db=con.cursor()
pages_div = BeautifulSoup(requests.get(url.format(1)).text,"html.parser")
page = pages_div.find("span",attrs={"class":'searchResultPagePer fr'}).get_text()[2:]
# with open("data.csv", "a+", encoding="utf8") as file:
for i in range(1,int(page)+1):
    f = requests.get(url.format(i)).text                    # 2.爬取 requests.get(url)---->text
    soup = BeautifulSoup(f, "html.parser")                  # 3.解析信息
    divlist = soup.find_all(class_='searchResultItemSimple clearfix ')          # 3.1查找用户需求内容 find()唯一   find_all()查询所有 get_text()获取标签内容
    for div in divlist:                 # 3.2 遍历内容
        job = div.find("a").get_text()
        city = div.find("em", attrs={"class": "searchResultJobCityval"}).get_text()
        num = div.find("em", attrs={"class": "searchResultJobPeopnum"}).get_text()
        cmp = div.find("p", attrs={"class":"searchResultCompanyname"}).get_text()
        cmptype = div.find("p", attrs={"class": "searchResultCompanyIndustry"}).get_text();
        pubtime = div.find("p", attrs={"class": "pt15 pb10"}).get_text().strip()[5:];
        sql = "insert into jobinfo(jobname,city,neednum,company,cptype,pubtime) values('%s','%s','%s','%s','%s','%s')" % (
        job, city, num, cmp, cmptype, pubtime)
        db.execute(sql)
            # file.write(job+"#"+city+"#"+num+ "\n")
con.commit()
db.close()
con.close()