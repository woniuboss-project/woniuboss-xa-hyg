#!/usr/bin/env python
# -*- coding:utf-8 -*-  
#====#====#====#====   
#Author:
#CreatDate:
#Version: 
#====#====#====#====

class Unitily:
    #从json文件中读取内容
    @classmethod
    def get_json(cls,path):
        import json
        with open(path) as file:
            return json.load(file)
    #从一个普通的文本文件中读取内容
    @classmethod
    def get_txt(cls,path):
        with open(path,encoding='utf8') as file:
            return file.readlines()
    #将文件读取出来的内容转化为列表加元祖
    @classmethod
    def trans_tuple(cls,path):
        contents = cls.get_txt(path)
        info = []
        for i in range(1,len(contents)):
            if not contents[i].startswith('#'):
                li = contents[i].strip().split(',')
                tup = tuple(li)
                info.append(tup)
        return info
        # 获取mysql连接

    @classmethod
    def getConn(cls, base_config_path):
        import pymysql
        DB_INFO = cls.get_json(base_config_path)
        return pymysql.connect(DB_INFO['HOSTNAME'], DB_INFO['DB_UNAME'],
                               DB_INFO['DB_UPASS'], DB_INFO['DB_NAME'], charset='utf8')

    # 更新操作
    @classmethod
    def update_data(cls, base_config_path, sql):
        flag = False
        try:
            conn = cls.getConn(base_config_path)
            cursor = conn.cursor()
            cursor.execute(sql)
            conn.commit()
            flag = True
        finally:
            cursor.close()
            conn.close()
            return flag

    # 查询一条记录
    @classmethod
    def query_one(cls, base_config_path, sql):
        conn = cls.getConn(base_config_path)
        cursor = conn.cursor()
        cursor.execute(sql)
        result = cursor.fetchone()
        cursor.close()
        conn.close()
        return result

    # 查询多条记录
    @classmethod
    def query_all(cls, base_config_path, sql):
        conn = cls.getConn(base_config_path)
        cursor = conn.cursor()
        cursor.execute(sql)
        result = cursor.fetchall()
        cursor.close()
        conn.close()
        return result

    @classmethod
    def read_xls(cls, path, sheet_name, m, k, row, col):
        import xlrd
        workbook = xlrd.open_workbook(path)
        contents = workbook.sheet_by_name(sheet_name)
        test_data = []
        for i in range(m, k):
            data = contents.cell(i, row).value
            expect = contents.cell(i, col).value
            temp = data.split('\n')
            dic = {}
            for j in temp:
                dic[j.split("=")[0]] = j.split("=")[1]
            dic['expect'] = expect
            test_data.append(dic)
        return test_data
    #excel文件读取
    @classmethod
    def get_excel(cls,path,sheet_name,r,s,m,n):
        import xlrd
        # 将excel内容赋给workbook
        workbook = xlrd.open_workbook(path)
        # 获取excel下标为  x  的那一页
        contents = workbook.sheet_by_name(sheet_name)
        test_data = []
        # 对表格每一行进行遍历
        for i in range(r, s):
            d = {}
            tup = ()
            # 获取一行中的第m列的值
            temp = contents.cell(i, m).value
            # print(temp)
            # 获取一行中的n列的值
            expect = contents.cell(i, n).value
            # print(expect)
            # 对获取的c1列的内容使用’\n‘切割    成   列表
            temp_list = temp.split('\n')
            # print(temp_list)

            # 对切割的列表进行遍历
            for j in temp_list:
                # print(j)
                # 对遍历的每个字符串使用'='切割并   以他的第0项作为字典的键    第1项作为字典的值  放入d字典中
                d[j.split('=')[0]] = j.split('=')[1]
            # 以’expect‘作为字典的键   c2列的 第2项  作为 值  放入d字典中
            d['expect'] = expect
            tup = (d,)
            # 最后将这一行生成的字典放入列表中
            test_data.append(tup)
        return test_data

    @classmethod
    def get_list_excel(cls, path, sheet_name, r, s, m, n):
        import xlrd
        # 将excel内容赋给workbook
        workbook = xlrd.open_workbook(path)
        # 获取excel下标为  x  的那一页
        contents = workbook.sheet_by_name(sheet_name)
        test_data = []
        # 对表格每一行进行遍历
        for i in range(r, s):
            tup = ()
            # 获取一行中的第m列的值
            temp = contents.cell(i, m).value
            # print(temp)
            # 获取一行中的n列的值
            expect = contents.cell(i, n).value
            # print(expect)
            # 对获取的c1列的内容使用’\n‘切割    成   列表
            temp_list = temp.split('\n')
            # print(temp_list)

            # 对切割的列表进行遍历
            s =[]
            for j in temp_list:
                # print(j)
                # 对遍历的每个字符串使用'='切割并   以他的第0项作为字典的键    第1项作为字典的值  放入d字典中
                a = j.split('=')[1]
                s.append(a)
            # 以’expect‘作为字典的键   c2列的 第2项  作为 值  放入d字典中
            s.append(expect)
            # 最后将这一行生成的字典放入列表中
            tup = tuple(s)
            test_data.append(tup)

        return test_data
    # 断言
    @classmethod
    def assert_equal(cls, expect, actual):
        if expect == actual:
            return True
        else:
            return False
    # # 获取url
    # @classmethod
    # def get_url(cls):
    #     base_config = cls.get_json('..\\config\\base_config')
    #     url = 'http://%s:%s/%s' % (base_config['HOSTNAME'], base_config['PORT'], base_config['AURL'])
    #     return url

    # 获取当前的时间格式为%Y-%m-%d-%H-%M-%S
    @classmethod
    def get_time(cls):
        import time
        return time.strftime('%Y-%m-%d-%H-%M-%S', time.localtime())
if __name__ == '__main__':
    unitily.get_list_excel('../data/WoniuBoss_info.xlsx','login',1,2,3,4)


