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
fm_1_subject_info = Utility.get_excel_to_tuple(test_config_info[1])
fm_2_subject_info = Utility.get_excel_to_tuple(test_config_info[2])
fm_financial_query_info = Utility.get_excel_to_tuple(test_config_info[3])
fm_last_month_query_info = Utility.get_excel_to_tuple(test_config_info[4])
fm_month_query_info = Utility.get_excel_to_tuple(test_config_info[5])
fm_new_water_info = Utility.get_excel_to_tuple(test_config_info[6])
fm_modify_water_info = Utility.get_excel_to_tuple(test_config_info[7])
fm_accounts_info = Utility.get_excel_to_tuple(test_config_info[8])
fm_students_info = Utility.get_excel_to_tuple(test_config_info[9])
fm_search_info = Utility.get_excel_to_tuple(test_config_info[10])
ffm_state_query_info = Utility.get_excel_to_tuple(test_config_info[11])
fm_name_query_info = Utility.get_excel_to_tuple(test_config_info[12])
fm_payment_refund_info = Utility.get_excel_to_tuple(test_config_info[13])




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
		try:
			FinancialManagement(cls.driver).fm_financial_interface()
			if Service.is_element_present(cls.driver, By.LINK_TEXT, '财务流水'):
				actual = 'FM_correct'
			else:
				actual = 'FM_failed'
				cls.driver.refresh()
			cls.assertEqual(actual, expect)
		except Exception as e:
			actual = 'FM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 一级科目
	@parameterized.expand(fm_1_subject_info)
	def test_fm_1_subject(cls, data, expect):
		try:
			test_fm_1_subject= FinancialManagement(cls.driver).fm_1_subject()

			if '主营业务收入' in test_fm_1_subject:
				actual = 'FM_correct'
			else:
				actual = 'FM_failed'
				cls.driver.refresh()
			cls.assertEqual(actual, expect)
		except Exception as e:
			actual = 'FM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 二级科目
	@parameterized.expand(fm_2_subject_info)
	def test_fm_2_subject(cls, data, expect):
		try:
			test_fm_2_subject= FinancialManagement(cls.driver).fm_2_subject()

			if '就业培训' in test_fm_2_subject:
				actual = 'FM_correct'
			else:
				actual = 'FM_failed'
				cls.driver.refresh()
			cls.assertEqual(actual, expect)
		except Exception as e:
			actual = 'FM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 查询

	# 查询工作流
	@parameterized.expand(fm_financial_query_info)
	def test_fm_financial_query(cls, fm_start_time, fm_end_time, one_subject, two_subject, expect):
		try:
			FinancialManagement(cls.driver).fm_financial_query(fm_start_time, fm_end_time, one_subject, two_subject)

			actual = Service.text_css(cls.driver, '/html/body/div[7]/div[3]/div/div/div/div[1]/div[4]'
												  '/div[1]/div[2]/div[2]/table/tbody/tr[1]/td[11]')
			cls.assertEqual(actual, expect)
			cls.driver.refresh()
		except Exception as e:
			actual = 'FM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 上月查询
	@parameterized.expand(fm_last_month_query_info)
	def test_fm_last_month_query(cls, data, expect):
		try:
			FinancialManagement(cls.driver).fm_last_month_query()

			actual = Service.text_xpath(cls.driver, '/html/body/div[7]/div[3]/div/div/div/div[1]/'
												  'div[4]/div[1]/div[2]/div[2]/table/tbody/tr/td')
			cls.assertEqual(actual, expect)
			cls.driver.refresh()
		except Exception as e:
			actual = 'FM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 本月查询
	@parameterized.expand(fm_month_query_info)
	def test_fm_month_query(cls, data, expect):
		try:
			FinancialManagement(cls.driver).fm_month_query()

			actual = Service.text_xpath(cls.driver, '/html/body/div[7]/div[3]/div/div/div/div[1]/div[4]'
													'/div[1]/div[2]/div[2]/table/tbody/tr[1]/td[11]')
			cls.assertEqual(actual, expect)
			cls.driver.refresh()
		except Exception as e:
			actual = 'FM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 新增流水工作流

	@parameterized.expand(fm_new_water_info)
	def test_fm_new_water(cls, one_subject, two_subject, fm_type, settlement, fm_trading_time, head, payment,
					 fm_amount, trading, fm_other_trading, fm_capital_uses, expect):
		try:
			FinancialManagement(cls.driver).fm_new_water(one_subject, two_subject, fm_type, settlement, fm_trading_time, head, payment,
						 fm_amount, trading, fm_other_trading, fm_capital_uses)
			capital_uses = f"'{fm_capital_uses}'"

			sql = f'SELECT first_subject_id FROM detailed_dealings WHERE comm = {capital_uses} ;'
			fm_new_water = Utility.query_one(fm_financial_user_info, sql)
			fm_results = fm_new_water[0]
			if fm_results == one_subject:
				actual = 'FM_correct'
			else:
				actual = 'FM_failed'
				cls.driver.refresh()
			cls.assertEqual(actual, expect)
			cls.driver.refresh()
		except Exception as e:
			actual = 'FM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 修改工作流

	@parameterized.expand(fm_modify_water_info)
	def test_fm_modify_water(cls, one_subject, two_subject, fm_type, settlement, fm_trading_time, head, payment,
					 fm_amount, trading, fm_other_trading, fm_capital_uses, expect):
		try:
			FinancialManagement(cls.driver).fm_new_water(one_subject, two_subject, fm_type, settlement, fm_trading_time, head, payment,
						 fm_amount, trading, fm_other_trading, fm_capital_uses)
			capital_uses = f"'{fm_capital_uses}'"

			sql = f'SELECT first_subject_id FROM detailed_dealings WHERE comm = {capital_uses} ;'
			fm_modify_water = Utility.query_one(fm_financial_user_info, sql)
			fm_results = fm_modify_water[0]
			if fm_results == one_subject:
				actual = 'FM_correct'
			else:
				actual = 'FM_failed'
				cls.driver.refresh()
			cls.assertEqual(actual, expect)
			cls.driver.refresh()
		except Exception as e:
			actual = 'FM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 公账导入
	# 界面
	@parameterized.expand(fm_accounts_info)
	def test_fm_accounts_interface(cls, data, expect):
		try:
			FinancialManagement(cls.driver).fm_accounts_interface()
			if Service.is_element_present(cls.driver, By.LINK_TEXT, '公账导入'):
				actual = 'FM_correct'
			else:
				actual = 'FM_failed'
				cls.driver.refresh()
			cls.assertEqual(actual, expect)
		except Exception as e:
			actual = 'FM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 学员缴费
	# 界面
	@parameterized.expand(fm_students_info)
	def test_fm_students_interface(cls, data, expect):
		try:
			FinancialManagement(cls.driver).fm_students_interface()
			if Service.is_element_present(cls.driver, By.LINK_TEXT, '学员缴费'):
				actual = 'FM_correct'
			else:
				actual = 'FM_failed'
				cls.driver.refresh()
			cls.assertEqual(actual, expect)
		except Exception as e:
			actual = 'FM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 搜索状态下拉框
	@parameterized.expand(fm_search_info)
	def test_fm_search(cls, data, expect):
		try:
			test_fm_search= FinancialManagement(cls.driver).fm_search()

			if '待缴费' in test_fm_search:
				actual = 'FM_correct'
			else:
				actual = 'FM_failed'
				cls.driver.refresh()
			cls.assertEqual(actual, expect)
		except Exception as e:
			actual = 'FM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 查询

	# 状态查询

	@parameterized.expand(ffm_state_query_info)
	def test_fm_state_query(cls, fm_state, expect):
		try:
			FinancialManagement(cls.driver).fm_state_query(fm_state)

			actual = Service.text_xpath(cls.driver, '/html/body/div[7]/div[3]/div/div/div/div[3]/div[3]/div[1]'
													'/div[2]/div[2]/table/tbody/tr[2]/td[2]')
			cls.assertEqual(actual, expect)
			cls.driver.refresh()
		except Exception as e:
			actual = 'FM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 姓名查询
	@parameterized.expand(fm_name_query_info)
	def test_fm_name_query(cls, fm_name, expect):
		try:
			FinancialManagement(cls.driver).fm_name_query(fm_name)

			actual = Service.text_css(cls.driver, '/html/body/div[7]/div[3]/div/div/div/div[3]/div[3]'
												  '/div[1]/div[2]/div[2]/table/tbody/tr/td[2]')
			cls.assertEqual(actual, expect)
			cls.driver.refresh()
		except Exception as e:
			actual = 'FM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 缴费退费工作流

	@parameterized.expand(fm_payment_refund_info)
	def test_fm_payment_refund(cls, student_class, stustatus, fm_stupay_amount, select, payment_account, fm_added, expect):
		try:
			FinancialManagement(cls.driver).fm_payment_refund(student_class, stustatus, fm_stupay_amount, select, payment_account, fm_added)

			actual = Service.text_xpath(cls.driver, '/html/body/div[7]/div[3]/div/div/div/div[3]/div[3]/div[1]'
													'/div[2]/div[2]/table/tbody/tr/td[7]')
			if actual == stustatus:
				actual = 'FM_correct'
			else:
				actual = 'FM_failed'
				cls.driver.refresh()
			cls.assertEqual(actual, expect)
			cls.driver.refresh()
		except Exception as e:
			actual = 'FM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)



if __name__ == '__main__':

	unittest.main(verbosity=2)

