#!/usr/bin/env python
# -*- coding: utf-8 -*-

from parameterized import parameterized
import unittest

from selenium.webdriver.common.by import By

from woniuboss.lib.woniuboss_gui.administrative_management.administrative_management import AdministrativeManagement
from woniuboss.tools.woniuboss_gui.utility import Utility
from woniuboss.tools.woniuboss_gui.service import Service
from urllib import parse, request
# 在该页面调试时test_config_info里需要多加一层跳出"..\\",testdata也需要多加一层
# 准备数据
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_gui\\AM\\testdata.conf')

am_management_info = Utility.get_excel_to_tuple(test_config_info[0])
am_management_user_info = Utility.get_excel_to_user(test_config_info[0])

am_recipients_info = Utility.get_excel_to_tuple(test_config_info[1])


am_return_info = Utility.get_excel_to_tuple(test_config_info[2])


# ('http://192.168.75.128:8080/WoniuBoss2.5/user/login', 'POST',
# {'username': 'WNCD000', 'password': 'woniu123', 'verifycode': '0000'}, 200, 'employment_management-pass'),
# login_info中[]的需要参照上面选取


class AdministrativeManagementTest(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        print("test start")
        cls.driver = Service.get_driver(am_management_user_info)
        Service.login_account(cls, am_management_user_info)
        Service.click_text(cls.driver, '行政综合')

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()
        print("test end")

    # 固定资产管理模块

    # 界面
    @parameterized.expand(am_management_info)
    def test_am_management(cls, data,expect):
        AdministrativeManagement(cls.driver).am_management_interface()
        if Service.is_element_present(cls.driver, By.LINK_TEXT, '固定资产管理'):
            actual = 'AM_correct'
        else:
            actual = 'AM_failed'
            cls.driver.refresh()
        cls.assertEqual(actual, expect)



    # 固定资产领用登记模块

    # 界面
    @parameterized.expand(am_recipients_info)
    def test_am_recipients(cls, data,expect):
        AdministrativeManagement(cls.driver).am_recipients_interface()
        if Service.is_element_present(cls.driver, By.LINK_TEXT, '固定资产领用登记'):
            actual = 'AM_correct'
        else:
            actual = 'AM_failed'
            cls.driver.refresh()
        cls.assertEqual(actual, expect)


    # 固定资产归还模块

    # 界面
    @parameterized.expand(am_return_info)
    def test_am_return(cls, data,expect):
        AdministrativeManagement(cls.driver).am_return_interface()
        if Service.is_element_present(cls.driver, By.LINK_TEXT, '固定资产归还'):
            actual = 'AM_correct'
        else:
            actual = 'AM_failed'
            cls.driver.refresh()
        cls.assertEqual(actual, expect)





if __name__ == '__main__':

    unittest.main(verbosity=2)