#!/usr/bin/env python
# -*- coding: utf-8 -*-

from parameterized import parameterized
import unittest
from woniuboss.lib.woniuboss_api.administrative_management.administrative_management import AdministrativeManagement
from woniuboss.tools.woniuboss_api.utility import Utility
from urllib import parse, request
# 在该页面调试时test_config_info里需要多加一层跳出"..\\",testdata也需要多加一层
# 准备数据
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_api\\AM\\testdata.conf')
am_page_info = Utility.get_excel_to_tuple(test_config_info[0])

# ('http://192.168.75.128:8080/WoniuBoss2.5/user/login', 'POST',
# {'username': 'WNCD000', 'password': 'woniu123', 'verifycode': '0000'}, 200, 'employment_management-pass'),
# login_info中[]的需要参照上面选取


class AdministrativeManagementTest(unittest.TestCase):

    def setUp(self):
        print("test start")

    def tearDown(self):
        print("test end")

    @parameterized.expand(am_page_info)
    # AM_001
    def test_am_page(self, url, action, data, code, expect):
        am_page_url = f'{url}'
        am_page_resp = AdministrativeManagement().do_am_page(am_page_url)
        am_page_code = am_page_resp.status_code

        if am_page_code == code:
            actual = 'AM-succeed'
        else:
            actual = 'AM-failed'

        # 断言
        self.assertEqual(actual, expect)


if __name__ == '__main__':

    unittest.main(verbosity=2)
