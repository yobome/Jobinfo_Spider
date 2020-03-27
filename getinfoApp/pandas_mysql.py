'''
#使用pandas操作数据库，效率高
使用 sqlalchemy 对象模型映射（对象的一个映射模式）
pip install sqlalchemy

1)创建数据库驱动 create_engine("mysql+pymysql://username:password@ip_address:3306/database_name")
2) 发送sql语句，读取结果
read_sql_query(sql,驱动链接)
3)数据处理
pandas DataFrame()
'''
import pandas as pd
from sqlalchemy import create_engine
con=create_engine("mysql+pymysql://root:root@localhost:3306/pythonDB")
sql="select * from jobinfo order by pubtime"
df=pd.read_sql_query(sql,con)