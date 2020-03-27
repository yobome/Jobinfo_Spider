from datetime import timedelta
from datetime import date
import pymysql

con = pymysql.connect("127.0.0.1", "root", "root", "pythonDB")
db = con.cursor()

def get_all_dates(date1,date2):
    the_date = date(int(date1.split('.')[0]),int(date1.split('.')[1]),int(date1.split('.')[2]))
    end_date = date(int(date2.split('.')[0]),int(date2.split('.')[1]),int(date2.split('.')[2]))
    days = timedelta(days=1)

    while the_date <= end_date:
        yield (the_date.strftime('%m-%d'))
        the_date = the_date + days

def get_all_dates_full(date1,date2):
    the_date = date(int(date1.split('.')[0]),int(date1.split('.')[1]),int(date1.split('.')[2]))
    end_date = date(int(date2.split('.')[0]),int(date2.split('.')[1]),int(date2.split('.')[2]))
    days = timedelta(days=1)

    while the_date <= end_date:
        yield (the_date.strftime('%Y-%m-%d'))
        the_date = the_date + days

def datelist():
    date_list=[]
    for i in get_all_dates('2019.07.04','2019.07.10'):
        date_list.append(i)
    return date_list

def get_data_within(date1, date2, areas):
    for area in areas:
        area_day_posts = []
        for date in get_all_dates_full(date1, date2):
            sql = "select * from jobinfo where city='%s' and pubtime='%s' " % (area, date)
            db.execute(sql)
            results = db.fetchall()
            # a = list(item_info.find({'pub_date': date, 'area': area}))
            a = list(results)
            each_day_post = len(a)
            area_day_posts.append(each_day_post)
        data = {
            'name': area,
            'data': area_day_posts,
            'type': 'line'
        }
        yield data
lname = []
lname.append('北京')
# lname.append('广州')
# print(lname)
for i in get_data_within('2019.07.02','2019.07.08',lname):
    a=i["data"]
# for i in get_data_within('2019.07.02','2019.07.08',['北京','广州']):
#     print(i["data"])
#
# options = {
#     'title'   : {'text': '工作数量统计'},
#     'subtitle': {'text': '可视化统计图表'},
#     'xAxis'   : {'categories': [i for i in get_all_dates('2019.07.01','2019.07.07')]},
#     'yAxis'   : {'title': {'text': '数量'}}
#     }
#
# series = [i for i in get_data_within('2019.07.01','2019.07.07',['广州','无锡','北京'])]

# charts.plot(series, options=options,show='inline')