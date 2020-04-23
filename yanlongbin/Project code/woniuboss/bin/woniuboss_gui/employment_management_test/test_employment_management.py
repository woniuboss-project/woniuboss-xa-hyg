import urllib

from parameterized import parameterized
import unittest

from selenium.webdriver.common.by import By

from woniuboss.lib.woniuboss_gui.employment_management.employment_management import EmploymentManagement
from woniuboss.tools.woniuboss_gui.utility import Utility
from woniuboss.tools.woniuboss_gui.service import Service
from urllib import parse,request
# 在该页面调试时test_config_info里需要多加一层跳出"..\\",testdata也需要多加一层
# 准备数据
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_api\\EM\\testdata.conf')
em_technology_info = Utility.get_excel_to_tuple(test_config_info[0])
em_technology_user_info = Utility.get_excel_to_user(test_config_info[0])
em_employment_info = Utility.get_excel_to_tuple(test_config_info[1])


# ('http://192.168.75.128:8080/WoniuBoss2.5/user/login', 'POST',
# {'username': 'WNCD000', 'password': 'woniu123', 'verifycode': '0000'}, 200, 'employment_management-pass'),
# login_info中[]的需要参照上面选取


class EmploymentManagementTest(unittest.TestCase):

	@classmethod
	def setUpClass(cls):
		print("test start")
		cls.driver = Service.get_driver(em_technology_user_info)
		Service.login_account(cls, em_technology_user_info)
		Service.click_text(cls.driver, '就业管理')
		Service.decryption(cls.driver)

	@classmethod
	def tearDownClass(cls):
		cls.driver.quit()
		print("test end")

	# 技术面试模块

	# 界面
	@parameterized.expand(em_employment_info)
	def test_em_technology_interface(cls, data, expect):
		EmploymentManagement(cls.driver).em_technology_interface()
		if Service.is_element_present(cls.driver, By.LINK_TEXT, '技术面试'):
			actual = 'EM_correct'
		else:
			actual = 'EM_failed'
			cls.driver.refresh()
		cls.assertEqual(actual, expect)

	# 就业管理模块

	# 界面
	@parameterized.expand(em_technology_info)
	def test_em_employment_interface(cls, data, expect):
		EmploymentManagement(cls.driver).em_employment_interface()
		if Service.is_element_present(cls.driver, By.LINK_TEXT, '就业管理'):
			actual = 'EM_correct'
		else:
			actual = 'EM_failed'
			cls.driver.refresh()
		cls.assertEqual(actual, expect)



if __name__ == '__main__':

	unittest.main(verbosity=2)

