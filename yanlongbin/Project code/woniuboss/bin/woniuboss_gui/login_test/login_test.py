#!/usr/bin/env python
# -*- coding:utf-8 -*-  
#====#====#====#====   
#Author:
#CreatDate:
#Version: 
#====#====#====#====
# 该模块封装与登录相关的测试
from parameterized import parameterized
from selenium.webdriver.common.by import By
from woniuboss.lib.woniuboss_gui.login.login import Login
from woniuboss.tools.woniuboss_gui.service import Service
from woniuboss.tools.woniuboss_gui.utility import Utility
import unittest
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_gui\\testdata.conf')
login_info=Utility.get_excel_to_tuple(test_config_info[0])
add_user_info = Utility.get_excel_to_user(test_config_info[0])
class LoginTest(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(add_user_info)
        cls.login = Login(cls.driver)
    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()
    @parameterized.expand(login_info)
    def testLogin(cls,uname,upass,ucode,expect):

        # driver =Service.get_driver(add_user_info)
        login_data = {'username': uname, 'password': upass,'code':ucode }
        Login(cls.driver).do_login(add_user_info,login_data)

        if Service.is_element_present(cls, By.LINK_TEXT, '全部'):
        # if cls.driver.find_element_by_link_text('注销'):
            actual = 'loogin_correct'
            cls.driver.find_element_by_link_text('注销').click()
        else:
            actual = 'loogin_failed'
            cls.driver.refresh()
        cls.assertEqual(actual, expect)
if __name__ == '__main__':
   unittest.main(verbosity=2)

