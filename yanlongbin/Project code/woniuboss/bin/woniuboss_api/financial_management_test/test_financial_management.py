from parameterized import parameterized
import unittest
from woniuboss.lib.woniuboss_api.financial_management.financial_management import FinancialManagement
from woniuboss.tools.woniuboss_api.utility import Utility
# 在该页面调试时test_config_info里需要多加一层跳出"..\\",testdata也需要多加一层
# 准备数据
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_api\\FM\\testdata.conf')
fm_page_info = Utility.get_excel_to_tuple(test_config_info[0])
fm_last_info = Utility.get_excel_to_tuple(test_config_info[1])
fm_this_info = Utility.get_excel_to_tuple(test_config_info[2])
fm_new_info = Utility.get_excel_to_tuple(test_config_info[3])
fm_modify_info = Utility.get_excel_to_tuple(test_config_info[4])
fm_pay_info = Utility.get_excel_to_tuple(test_config_info[5])
fm_refund_info = Utility.get_excel_to_tuple(test_config_info[6])

# ('http://192.168.75.128:8080/WoniuBoss2.5/user/login', 'POST',
# {'username': 'WNCD000', 'password': 'woniu123', 'verifycode': '0000'}, 200, 'employment_management-pass'),
# login_info中[]的需要参照上面选取


class FinancialManagementTest(unittest.TestCase):

	def setUp(self):
		print("test start")

	def tearDown(self):
		print("test end")

	@parameterized.expand(fm_page_info)
	def test_fm_page(self, url, action, data, code, expect):
		# FM_001
		fm_page_url = f'{url}'
		fm_page_resp = FinancialManagement().do_fm_page(fm_page_url, data)
		fm_page_code = fm_page_resp.status_code
		if fm_page_code == code:
			actual = 'FM-succeed'
		else:
			actual = 'FM-failed'

		# 断言
		self.assertEqual(actual, expect)

	@parameterized.expand(fm_last_info)
	# FM_002
	def test_fm_last(self, url, action, data, code, expect):
		fm_last_url = f'{url}'
		fm_last_resp = FinancialManagement().do_fm_last(fm_last_url, data)
		fm_last_code = fm_last_resp.json()
		if fm_last_code:
			actual = 'FM-succeed'
		else:
			actual = 'FM-failed'

		# 断言
		self.assertEqual(actual, expect)

	@parameterized.expand(fm_this_info)
	# FM_003
	def test_fm_this(self, url, action, data, code, expect):
		fm_this_url = f'{url}'
		fm_this_resp = FinancialManagement().do_fm_this(fm_this_url, data)
		fm_this_code = fm_this_resp.json()
		if fm_this_code:
			actual = 'FM-succeed'
		else:
			actual = 'FM-failed'

		# 断言
		self.assertEqual(actual, expect)

	@parameterized.expand(fm_new_info)
	# FM_004
	def test_fm_new(self, url, action, data, code, expect):
		fm_new_url = f'{url}'
		fm_new_resp = FinancialManagement().do_fm_new(fm_new_url, data)
		fm_new_code = fm_new_resp.json()
		if fm_new_code:
			actual = 'FM-succeed'
		else:
			actual = 'FM-failed'

		# 断言
		self.assertEqual(actual, expect)

	@parameterized.expand(fm_modify_info)
	# FM_005
	def test_fm_modify(self, url, action, data, code, expect):
		fm_modify_url = f'{url}'
		fm_modify_resp = FinancialManagement().do_fm_modify(fm_modify_url, data)
		fm_modify_code = fm_modify_resp.json()
		if fm_modify_code:
			actual = 'FM-succeed'
		else:
			actual = 'FM-failed'

		# 断言
		self.assertEqual(actual, expect)

	@parameterized.expand(fm_pay_info)
	# FM_006
	def test_fm_pay(self, url, action, data, code, expect):
		fm_pay_url = f'{url}'
		fm_pay_resp = FinancialManagement().do_fm_pay(fm_pay_url, data)
		fm_pay_code = fm_pay_resp.json()
		if fm_pay_code:
			actual = 'FM-succeed'
		else:
			actual = 'FM-failed'

		# 断言
		self.assertEqual(actual, expect)

	@parameterized.expand(fm_page_info)
	# FM_007
	def test_fm_page(self, url, action, data, code, expect):
		fm_page_url = f'{url}'
		fm_page_resp = FinancialManagement().do_fm_page(fm_page_url, data)
		fm_page_code = fm_page_resp.json()
		if fm_page_code:
			actual = 'FM-succeed'
		else:
			actual = 'FM-failed'

		# 断言
		self.assertEqual(actual, expect)


if __name__ == '__main__':

	unittest.main(verbosity=2)

