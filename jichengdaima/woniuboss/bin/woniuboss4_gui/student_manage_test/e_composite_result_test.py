import time
from selenium.webdriver.common.by import By
from woniuboss.lib.woniuboss4_gui.login.decrypt import Decrypt
from woniuboss.lib.woniuboss4_gui.login.login import Login
from woniuboss.lib.woniuboss4_gui.student_manage.composite_result import CompositeResult

from woniuboss.tools.woniuboss_gui.service import Service
import unittest
from woniuboss.tools.woniuboss_gui.utility import Utility
from parameterized import parameterized

test_config_info=Utility.get_json('..\\..\\conf\\woniuboss4_gui\\stu_manage.conf')
query_record_info = Utility.get_excel_to_tuple(test_config_info[10])
user_info = Utility.get_excel_to_user(test_config_info[10])

class CompositeResultTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(user_info)
        cls.composite_result = CompositeResult(cls.driver)
        Login(cls.driver).login(user_info)
        Decrypt(cls.driver).do_decrypt(user_info['secondpwd'])

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(query_record_info)
    def test_query_all_result(self,orientation,class_name,phase,name,expect):
        sum_text = self.composite_result.do_query_record(orientation,class_name,phase,name)
        sql = 'select count(*) from phase_exam'
        db_result = Utility.query_one(user_info,sql)
        if '总共' in sum_text:
            sum_num = sum_text.split('总共 ')[1].split(' 条')[0]
        else:
            sum_num = 0
        if db_result[0] == int(sum_num):
            actual = 'test query composite result pass'
        else:
            actual = 'test query composite result fail'
        self.assertEqual(expect,actual)