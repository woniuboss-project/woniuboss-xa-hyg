import time
from selenium.webdriver.common.by import By
from woniuboss.lib.woniuboss4_gui.login.decrypt import Decrypt
from woniuboss.lib.woniuboss4_gui.login.login import Login
from woniuboss.lib.woniuboss4_gui.teaching_manage.overtime_summary import OverTimeSummary
from woniuboss.tools.woniuboss_gui.service import Service
import unittest
from woniuboss.tools.woniuboss_gui.utility import Utility
from parameterized import parameterized

test_config_info=Utility.get_json('..\\..\\..\\conf\\woniuboss4_gui\\teaching_manage.conf')
query_overtime_summary_info = Utility.get_excel_to_tuple(test_config_info[13])
user_info = Utility.get_excel_to_user(test_config_info[13])
class OverTimeSummaryTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(user_info)
        cls.overtime_summary = OverTimeSummary(cls.driver)
        Login(cls.driver).login(user_info)
        Decrypt(cls.driver).do_decrypt(user_info['secondpwd'])

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(query_overtime_summary_info)
    def test_query_summary(self,teacher,way,s_time,e_time,expect):
        self.overtime_summary.do_query_overtime_summary(teacher,way,s_time,e_time)
        sum_text = self.overtime_summary.get_sum_text()
        if '总共' in sum_text:
            actual = 'test query overtime summary pass'
        else:
            actual = 'test query overtime summary fail'
        self.assertEqual(expect,actual)