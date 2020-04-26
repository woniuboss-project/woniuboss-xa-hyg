import urllib

from parameterized import parameterized
import unittest

from selenium.webdriver.common.by import By

from woniuboss.lib.woniuboss_4_gui.employment_management.employment_management import EmploymentManagement
from woniuboss.tools.woniuboss_4_gui.utility import Utility
from woniuboss.tools.woniuboss_4_gui.service import Service
from urllib import parse,request
# 在该页面调试时test_config_info里需要多加一层跳出"..\\",testdata也需要多加一层
# 准备数据
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_4_gui\\EM\\testdata.conf')
em_mock_interviews_info = Utility.get_excel_to_tuple(test_config_info[0])
em_mock_interviews_user_info = Utility.get_excel_to_user(test_config_info[0])
em_interview_records_info = Utility.get_excel_to_tuple(test_config_info[1])
em_orientation_information_info = Utility.get_excel_to_tuple(test_config_info[2])
em_corporate_clients_info = Utility.get_excel_to_tuple(test_config_info[3])


# ('http://192.168.75.128:8080/WoniuBoss2.5/user/login', 'POST',
# {'username': 'WNCD000', 'password': 'woniu123', 'verifycode': '0000'}, 200, 'employment_management-pass'),
# login_info中[]的需要参照上面选取


class EmploymentManagementTest(unittest.TestCase):

	@classmethod
	def setUpClass(cls):
		print("test start")
		cls.driver = Service.get_driver(em_mock_interviews_user_info)
		Service.login_account(cls, em_mock_interviews_user_info)
		Service.click_text(cls.driver, '就业管理')
		Service.decryption(cls.driver)

	@classmethod
	def tearDownClass(cls):
		cls.driver.quit()
		print("test end")

	# 模拟面试模块

	# 界面
	@parameterized.expand(em_mock_interviews_info)
	def test_em_mock_interviews(cls, data, expect):
		EmploymentManagement(cls.driver).em_mock_interviews()
		if Service.is_element_present(cls.driver, By.LINK_TEXT, '模拟面试'):
			actual = 'EM_correct'
		else:
			actual = 'EM_failed'
			cls.driver.refresh()
		cls.assertEqual(actual, expect)

	# 面试记录模块

	# 界面
	@parameterized.expand(em_interview_records_info)
	def test_em_interview_records(cls, data, expect):
		EmploymentManagement(cls.driver).em_interview_records()
		if Service.is_element_present(cls.driver, By.LINK_TEXT, '面试记录'):
			actual = 'EM_correct'
		else:
			actual = 'EM_failed'
			cls.driver.refresh()
		cls.assertEqual(actual, expect)

	# 入职信息模块

	# 界面
	@parameterized.expand(em_orientation_information_info)
	def test_em_orientation_information(cls, data, expect):
		EmploymentManagement(cls.driver).em_orientation_information()
		if Service.is_element_present(cls.driver, By.LINK_TEXT, '入职信息'):
			actual = 'EM_correct'
		else:
			actual = 'EM_failed'
			cls.driver.refresh()
		cls.assertEqual(actual, expect)

	# 企业客户模块

	# 界面
	@parameterized.expand(em_corporate_clients_info)
	def test_em_corporate_clients(cls, data, expect):
		EmploymentManagement(cls.driver).em_corporate_clients()
		if Service.is_element_present(cls.driver, By.LINK_TEXT, '企业客户'):
			actual = 'EM_correct'
		else:
			actual = 'EM_failed'
			cls.driver.refresh()
		cls.assertEqual(actual, expect)






if __name__ == '__main__':

	unittest.main(verbosity=2)

