from parameterized import parameterized
import unittest

from selenium.webdriver.common.by import By

from woniuboss.lib.woniuboss_gui.financial_management.financial_management import FinancialManagement
from woniuboss.tools.woniuboss_gui.utility import Utility
from woniuboss.tools.woniuboss_gui.service import Service
# 在该页面调试时test_config_info里需要多加一层跳出"..\\",testdata也需要多加一层
# 准备数据
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_gui\\FM\\testdata.conf')
fm_financial_info = Utility.get_excel_to_tuple(test_config_info[0])
fm_financial_user_info = Utility.get_excel_to_user(test_config_info[0])
fm_accounts_info = Utility.get_excel_to_tuple(test_config_info[1])
fm_students_info = Utility.get_excel_to_tuple(test_config_info[2])


# ('http://192.168.75.128:8080/WoniuBoss2.5/user/login', 'POST',
# {'username': 'WNCD000', 'password': 'woniu123', 'verifycode': '0000'}, 200, 'employment_management-pass'),
# login_info中[]的需要参照上面选取


class FinancialManagementTest(unittest.TestCase):

	@classmethod
	def setUpClass(cls):
		print("test start")
		cls.driver = Service.get_driver(fm_financial_user_info)
		Service.login_account(cls, fm_financial_user_info)
		Service.click_text(cls.driver, '财务管理')


	@classmethod
	def tearDownClass(cls):
		cls.driver.quit()
		print("test end")

	# 财务流水
	# 界面
	@parameterized.expand(fm_financial_info)
	def test_fm_financial_interface(cls, data, expect):
		FinancialManagement(cls.driver).fm_financial_interface()
		if Service.is_element_present(cls.driver, By.LINK_TEXT, '财务流水'):
			actual = 'FM_correct'
		else:
			actual = 'FM_failed'
			cls.driver.refresh()
		cls.assertEqual(actual, expect)

	# 公账导入
	# 界面
	@parameterized.expand(fm_accounts_info)
	def test_fm_accounts_interface(cls, data, expect):
		FinancialManagement(cls.driver).fm_accounts_interface()
		if Service.is_element_present(cls.driver, By.LINK_TEXT, '公账导入'):
			actual = 'FM_correct'
		else:
			actual = 'FM_failed'
			cls.driver.refresh()
		cls.assertEqual(actual, expect)

	# 学员缴费
	# 界面
	@parameterized.expand(fm_students_info)
	def test_fm_students_interface(cls, data, expect):
		FinancialManagement(cls.driver).fm_students_interface()
		if Service.is_element_present(cls.driver, By.LINK_TEXT, '学员缴费'):
			actual = 'FM_correct'
		else:
			actual = 'FM_failed'
			cls.driver.refresh()
		cls.assertEqual(actual, expect)


if __name__ == '__main__':

	unittest.main(verbosity=2)

