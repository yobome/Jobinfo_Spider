import pymysql

import datetime
import time
def getYesterday():
    today=datetime.date.today()
    oneday=datetime.timedelta(days=1)
    yesterday=today-oneday
    return yesterday
def getBeforeYesterday():
    today=datetime.date.today()
    oneday=datetime.timedelta(days=1)
    beforeyesterday=today-oneday-oneday
    return beforeyesterday
yesterday=getYesterday()
beforeyesterday=getBeforeYesterday()
def dataclean():
    con = pymysql.connect("localhost", "root", "root", "pythonDB")
    db = con.cursor()
    sql1 = "update jobinfo set neednum = '99' where neednum='若干'"
    db.execute(sql1)
    sql2 = "update jobinfo set pubtime = '%s' where pubtime='昨天'"%(yesterday)
    db.execute(sql2)
    sql3 = "update jobinfo set pubtime = '%s' where pubtime like '_小时前'"%(time.strftime("%Y-%m-%d"))
    db.execute(sql3)
    sql4 = "update jobinfo set pubtime = '%s' where pubtime like '__小时前'" % (time.strftime("%Y-%m-%d"))
    db.execute(sql4)
    sql5 = "update jobinfo set pubtime = '%s' where pubtime like '前天'"%(beforeyesterday)
    db.execute(sql5)
    con.commit()
    db.close()
    con.close()