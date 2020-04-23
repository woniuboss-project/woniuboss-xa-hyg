from parameterized import parameterized
import unittest
from woniuboss.lib.woniuboss_api.personnel_management.personnel_management import PersonnelManagement
from woniuboss.tools.woniuboss_api.utility import Utility
# 在该页面调试时test_config_info里需要多加一层跳出"..\\",testdata也需要多加一层
# 准备数据
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_api\\PM\\testdata.conf')
pm_page_info = Utility.get_excel_to_tuple(test_config_info[0])
pm_new_info = Utility.get_excel_to_tuple(test_config_info[1])
pm_modify_info = Utility.get_excel_to_tuple(test_config_info[2])
# ('http://192.168.75.128:8080/WoniuBoss2.5/user/login', 'POST',
# {'username': 'WNCD000', 'password': 'woniu123', 'verifycode': '0000'}, 200, 'employment_management-pass'),
# login_info中[]的需要参照上面选取


class PersonnelManagementTest(unittest.TestCase):

	def setUp(self):
		print("test start")

	def tearDown(self):
		print("test end")

	@parameterized.expand(pm_page_info)
	# PM_001
	def test_pm_page(self, url, action, data, code, expect):
		pm_page_url = f'{url}'
		pm_page_resp = PersonnelManagement().do_pm_query(pm_page_url, data)
		pm_page_code = pm_page_resp.status_code
		if pm_page_code == code:
			actual = 'PM-succeed'
		else:
			actual = 'PM-failed'

		# 断言
		self.assertEqual(actual, expect)



	@parameterized.expand(pm_new_info)
	# PM_002
	def test_pm_new_page(self, url, action, data, code, expect):
		pm_new_url = f'{url}'
		pm_new_resp = PersonnelManagement().do_pm_new(pm_new_url, data)
		pm_new_code = pm_new_resp.json()
		if pm_new_code:
			actual = 'PM-succeed'
		else:
			actual = 'PM-failed'

		# 断言
		self.assertEqual(actual, expect)

	@parameterized.expand(pm_modify_info)
	# PM_003
	def test_pm_modify_page(self, url, action, data, code, expect):
		pm_modify_url = f'{url}'
		pm_modify_resp = PersonnelManagement().do_pm_modify(pm_modify_url, data)
		pm_modify_code = pm_modify_resp.json()
		if pm_modify_code:
			actual = 'PM-succeed'
		else:
			actual = 'PM-failed'

		# 断言
		self.assertEqual(actual, expect)

if __name__ == '__main__':

	unittest.main(verbosity=2)
