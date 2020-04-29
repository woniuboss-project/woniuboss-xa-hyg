import time
from selenium.webdriver.common.by import By
from woniuboss.lib.woniuboss4_gui.login.decrypt import Decrypt
from woniuboss.lib.woniuboss4_gui.login.login import Login
from woniuboss.lib.woniuboss4_gui.teaching_manage.technical_interview import TechnicalInterview

from woniuboss.tools.woniuboss_gui.service import Service
import unittest
from woniuboss.tools.woniuboss_gui.utility import Utility
from parameterized import parameterized

test_config_info=Utility.get_json('..\\..\\conf\\woniuboss4_gui\\teaching_manage.conf')
query_interview_info = Utility.get_excel_to_tuple(test_config_info[3])
user_info = Utility.get_excel_to_user(test_config_info[3])
do_interview_info = Utility.get_excel_to_tuple(test_config_info[4])

class TechnicalIntervewTest(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(user_info)
        cls.technical_interview = TechnicalInterview(cls.driver)
        Login(cls.driver).login(user_info)
        Decrypt(cls.driver).do_decrypt(user_info['secondpwd'])

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(query_interview_info)
    def test_a_query_interview_info(self,level,class_name,name,no,expect):
        count_td = self.technical_interview.do_search_info(level,class_name,name,no)
        if count_td == 9:
            actual = 'test query interview info pass'
        else:
            actual = 'test query interview info fail'
        self.assertEqual(expect,actual)

    @parameterized.expand(do_interview_info)
    def test_b_do_iterview(self,result,comment,expect):
        sql = 'select count(*) from skill_record'
        db_result1 = Utility.query_one(user_info,sql)
        ele_text = self.technical_interview.do_interview(result,comment)
        db_result2 = Utility.query_one(user_info,sql)
        if '保存成功' in ele_text and db_result2[0] - db_result1[0] == 1:
            actual = 'test do technical interview pass'
        else:
            actual = 'test do technical interview fail'
        self.driver.refresh()
        self.assertEqual(expect,actual)