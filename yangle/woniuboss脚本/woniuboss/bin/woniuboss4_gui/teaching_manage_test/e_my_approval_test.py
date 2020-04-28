import time
from selenium.webdriver.common.by import By
from woniuboss.lib.woniuboss4_gui.login.decrypt import Decrypt
from woniuboss.lib.woniuboss4_gui.login.login import Login
from woniuboss.lib.woniuboss4_gui.teaching_manage.my_approval import MyApproval
from woniuboss.tools.woniuboss_gui.service import Service
import unittest
from woniuboss.tools.woniuboss_gui.utility import Utility
from parameterized import parameterized

test_config_info=Utility.get_json('..\\..\\conf\\woniuboss4_gui\\teaching_manage.conf')
query_my_approval_info = Utility.get_excel_to_tuple(test_config_info[12])
user_info = Utility.get_excel_to_user(test_config_info[12])

class MyApprovalTest(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(user_info)
        cls.my_approval = MyApproval(cls.driver)
        Login(cls.driver).login(user_info)
        Decrypt(cls.driver).do_decrypt(user_info['secondpwd'])

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(query_my_approval_info)
    def test_query_my_approval(self,type,status,id,expect):
        self.my_approval.do_query_approval_info(type,status,id)
        sum_text = self.my_approval.get_sum_text()
        if '总共' in sum_text:
            actual = 'test query my approval pass'
        else:
            actual = 'test query my approval fail'
        self.assertEqual(expect,actual)
