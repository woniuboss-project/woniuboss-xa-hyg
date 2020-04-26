from parameterized import parameterized
import unittest

from selenium.webdriver.common.by import By

from woniuboss.lib.woniuboss_4_gui.financial_management.financial_management import FinancialManagement
from woniuboss.tools.woniuboss_4_gui.utility import Utility
from woniuboss.tools.woniuboss_4_gui.service import Service
# 在该页面调试时test_config_info里需要多加一层跳出"..\\",testdata也需要多加一层
# 准备数据
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_4_gui\\FM\\testdata.conf')
fm_financial_info = Utility.get_excel_to_tuple(test_config_info[0])
fm_financial_user_info = Utility.get_excel_to_user(test_config_info[0])
fm_advance_settlement_info = Utility.get_excel_to_tuple(test_config_info[1])
fm_students_tuition_info = Utility.get_excel_to_tuple(test_config_info[2])
fm_deposit_check_info = Utility.get_excel_to_tuple(test_config_info[3])
fm_class_management_info = Utility.get_excel_to_tuple(test_config_info[4])
fm_monthly_accounting_info = Utility.get_excel_to_tuple(test_config_info[5])
fm_account_management_info = Utility.get_excel_to_tuple(test_config_info[6])
fm_accountant_course_info = Utility.get_excel_to_tuple(test_config_info[7])
fm_financial_statements_info = Utility.get_excel_to_tuple(test_config_info[8])





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
		Service.decryption(cls.driver)

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

	# 预支结算
	# 界面
	@parameterized.expand(fm_advance_settlement_info)
	def test_fm_advance_settlement(cls, data, expect):
		FinancialManagement(cls.driver).fm_advance_settlement()
		if Service.is_element_present(cls.driver, By.LINK_TEXT, '预支结算'):
			actual = 'FM_correct'
		else:
			actual = 'FM_failed'
			cls.driver.refresh()
		cls.assertEqual(actual, expect)

	# 学员学费
	# 界面
	@parameterized.expand(fm_students_tuition_info)
	def test_fm_students_tuition(cls, data, expect):
		FinancialManagement(cls.driver).fm_students_tuition()
		if Service.is_element_present(cls.driver, By.LINK_TEXT, '学员学费'):
			actual = 'FM_correct'
		else:
			actual = 'FM_failed'
			cls.driver.refresh()
		cls.assertEqual(actual, expect)

	# 定金复核
	# 界面
	@parameterized.expand(fm_deposit_check_info)
	def test_fm_deposit_check(cls, data, expect):
		FinancialManagement(cls.driver).fm_deposit_check()
		if Service.is_element_present(cls.driver, By.LINK_TEXT, '定金复核'):
			actual = 'FM_correct'
		else:
			actual = 'FM_failed'
			cls.driver.refresh()
		cls.assertEqual(actual, expect)
	# 班级管理
	# 界面
	@parameterized.expand(fm_class_management_info)
	def test_fm_class_management(cls, data, expect):
		FinancialManagement(cls.driver).fm_class_management()
		if Service.is_element_present(cls.driver, By.LINK_TEXT, '班级管理'):
			actual = 'FM_correct'
		else:
			actual = 'FM_failed'
			cls.driver.refresh()
		cls.assertEqual(actual, expect)

	# 月度核算
	# 界面
	@parameterized.expand(fm_monthly_accounting_info)
	def test_fm_monthly_accounting(cls, data, expect):
		FinancialManagement(cls.driver).fm_monthly_accounting()
		if Service.is_element_present(cls.driver, By.LINK_TEXT, '月度核算'):
			actual = 'FM_correct'
		else:
			actual = 'FM_failed'
			cls.driver.refresh()
		cls.assertEqual(actual, expect)

	# 账户管理
	# 界面
	@parameterized.expand(fm_account_management_info)
	def test_fm_account_management(cls, data, expect):
		FinancialManagement(cls.driver).fm_account_management()
		if Service.is_element_present(cls.driver, By.LINK_TEXT, '账户管理'):
			actual = 'FM_correct'
		else:
			actual = 'FM_failed'
			cls.driver.refresh()
		cls.assertEqual(actual, expect)

	# 会计科目
	# 界面
	@parameterized.expand(fm_accountant_course_info)
	def test_fm_accountant_course(cls, data, expect):
		FinancialManagement(cls.driver).fm_accountant_course()
		if Service.is_element_present(cls.driver, By.LINK_TEXT, '会计科目'):
			actual = 'FM_correct'
		else:
			actual = 'FM_failed'
			cls.driver.refresh()
		cls.assertEqual(actual, expect)

	# 财务报表
	# 界面
	@parameterized.expand(fm_financial_statements_info)
	def test_fm_financial_statements(cls, data, expect):
		FinancialManagement(cls.driver).fm_financial_statements()
		if Service.is_element_present(cls.driver, By.LINK_TEXT, '财务报表'):
			actual = 'FM_correct'
		else:
			actual = 'FM_failed'
			cls.driver.refresh()
		cls.assertEqual(actual, expect)





if __name__ == '__main__':

	unittest.main(verbosity=2)

