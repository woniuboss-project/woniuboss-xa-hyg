import time
from selenium.webdriver.common.by import By
from woniuboss.lib.woniuboss_gui.login.decrypt import Decrypt
from woniuboss.lib.woniuboss_gui.student_manage.morning_exam_record import MorningExamRecord

from woniuboss.tools.woniuboss_gui.service import Service
import unittest
from woniuboss.tools.woniuboss_gui.utility import Utility
from parameterized import parameterized

test_config_info = Utility.get_json('..\\..\\conf\\woniuboss_gui\\testdata_stu_manage.conf')
query_all_parameter = Utility.get_excel_to_tuple(test_config_info[11])
user_info=Utility.get_excel_to_user(test_config_info[11])

query_part_parameter = Utility.get_excel_to_tuple(test_config_info[12])

class MorningExamTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(user_info)
        cls.exam_record = MorningExamRecord(cls.driver)
        Service.miss_login(cls.driver, user_info)
        Decrypt(cls.driver).do_decrypt(user_info['secondpwd'])

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(query_all_parameter)
    def test_query_all_exam_record(cls, class_name, guide, name, s_time, e_time, expect):
        sum_text = cls.exam_record.do_query_all_record(class_name, guide, name, s_time, e_time)
        time.sleep(5)
        sum_num = sum_text.split('总共 ')[1].split(' 条')[0]
        sql = 'select count(*) from morn_exam'
        db_result = Utility.query_one(user_info,sql)
        if int(sum_num) == db_result[0]:
            actual ='test query all morning exam record pass'
        else:
            actual = 'test query all morning exam record fail'
        cls.assertEqual(expect,actual)

    @parameterized.expand(query_part_parameter)
    def test_query_part_exam_record(cls,class_name,guide,name,s_time,e_time,expect):
        count_tr = cls.exam_record.do_query_part_record(class_name,guide,name,s_time,e_time)
        if count_tr==1:
            actual='test query part morning exam record fail'
        else:
            actual = 'test query part morning exam record pass'
        cls.assertEqual(expect,actual)



