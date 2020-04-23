import urllib

from parameterized import parameterized
import unittest
from woniuboss.lib.woniuboss_api.employment_management.employment_management import EmploymentManagement
from woniuboss.tools.woniuboss_api.utility import Utility
from urllib import parse,request
# 在该页面调试时test_config_info里需要多加一层跳出"..\\",testdata也需要多加一层
# 准备数据
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_api\\EM\\testdata.conf')
em_page_info = Utility.get_excel_to_tuple(test_config_info[0])
em_all_info = Utility.get_excel_to_tuple(test_config_info[1])
em_through_info = Utility.get_excel_to_tuple(test_config_info[2])
em_not_through_info = Utility.get_excel_to_tuple(test_config_info[3])
em_search_info = Utility.get_excel_to_tuple(test_config_info[4])
em_real_info = Utility.get_excel_to_tuple(test_config_info[5])
em_induction_info = Utility.get_excel_to_tuple(test_config_info[6])
em_technology_info = Utility.get_excel_to_tuple(test_config_info[7])
em_submit_info = Utility.get_excel_to_tuple(test_config_info[8])
em_simulation_info = Utility.get_excel_to_tuple(test_config_info[9])

# ('http://192.168.75.128:8080/WoniuBoss2.5/user/login', 'POST',
# {'username': 'WNCD000', 'password': 'woniu123', 'verifycode': '0000'}, 200, 'employment_management-pass'),
# login_info中[]的需要参照上面选取


class EmploymentManagementTest(unittest.TestCase):

	def setUp(self):
		print("test start")

	def tearDown(self):
		print("test end")

	@parameterized.expand(em_page_info)
	# EM_001
	def test_em_page(self, url, action, data, code, expect):
		em_page_url = f'{url}'
		em_page_resp = EmploymentManagement().do_em_page(em_page_url)
		em_page_code = em_page_resp.status_code
		# em_page_request = em_page_resp.request
		# em_page_request_data = em_page_request.find_element_by_css_selector('html>head>title').text
		# if em_page_request_data == '就业部学员管理':
		# 	actual = 'EM-succeed'
		# else:
		# 	actual = 'EM-failed'
		if em_page_code == code:
			actual = 'EM-succeed'
		else:
			actual = 'EM-failed'

		# 断言
		self.assertEqual(actual, expect)
		
	@parameterized.expand(em_all_info)
	# EM_002
	def test_em_all(self, url, action, data, code, expect):
		em_all_url = f'{url}'
		em_all_resp = EmploymentManagement().do_em_all(em_all_url, data)
		em_all_code = em_all_resp.json()
		if em_all_code:
			actual = 'EM-succeed'
		else:
			actual = 'EM-failed'

		# 断言
		self.assertEqual(actual, expect)
		
	@parameterized.expand(em_through_info)
	# EM_003
	def test_em_through(self, url, action, data, code, expect):
		em_through_url = f'{url}'
		em_through_resp = EmploymentManagement().do_em_through(em_through_url, data)
		em_through_code = em_through_resp.json()
		if em_through_code:
			actual = 'EM-succeed'
		else:
			actual = 'EM-failed'

		# 断言
		self.assertEqual(actual, expect)
		
	@parameterized.expand(em_not_through_info)
	# EM_004
	def test_em_not_through(self, url, action, data, code, expect):
		em_not_through_url = f'{url}'
		em_not_through_resp = EmploymentManagement().do_em_not_through(em_not_through_url, data)
		em_not_through_code = em_not_through_resp.json()
		if em_not_through_code:
			actual = 'EM-succeed'
		else:
			actual = 'EM-failed'

		# 断言
		self.assertEqual(actual, expect)
		
	@parameterized.expand(em_search_info)
	# EM_005
	def test_em_search(self, url, action, data, code, expect):
		em_search_url = f'{url}'
		em_search_resp = EmploymentManagement().do_em_search(em_search_url, data)
		em_search_code = em_search_resp.json()
		if em_search_code:
			actual = 'EM-succeed'
		else:
			actual = 'EM-failed'

		# 断言
		self.assertEqual(actual, expect)
		
	@parameterized.expand(em_real_info)
	# EM_006
	def test_em_real(self, url, action, data, code, expect):
		em_real_url = f'{url}'
		em_real_resp = EmploymentManagement().do_em_real(em_real_url, data)
		em_real_code = em_real_resp.json()
		if em_real_code:
			actual = 'EM-succeed'
		else:
			actual = 'EM-failed'

		# 断言
		self.assertEqual(actual, expect)
		
	@parameterized.expand(em_induction_info)
	# EM_007
	def test_em_induction(self, url, action, data, code, expect):
		em_induction_url = f'{url}'
		em_induction_resp = EmploymentManagement().do_em_induction(em_induction_url, data)
		em_induction_code = em_induction_resp.json()
		if em_induction_code:
			actual = 'EM-succeed'
		else:
			actual = 'EM-failed'

		# 断言
		self.assertEqual(actual, expect)

	@parameterized.expand(em_technology_info)
	# EM_008
	def test_em_technology(self, url, action, data, code, expect):
		ispass = request.quote(data.get('ispass'))
		student_id = data.get('sr.skillrecord_student_id')
		questions = request.quote(data.get('sr.questions'))
		valuate = request.quote(data.get('sr.valuate'))
		ndata ={'ispass': ispass, 'student_id': student_id,'questions':questions, 'valuate':valuate}
		textmod = parse.urlencode(ndata)
		em_technology_url = f'{url}?{textmod}'
		em_technology_resp = EmploymentManagement().do_em_technology(em_technology_url)
		em_technology_code = em_technology_resp.json()
		if em_technology_code:
			actual = 'EM-succeed'
		else:
			actual = 'EM-failed'

		# 断言
		self.assertEqual(actual, expect)
		

	#
	# @parameterized.expand(em_submit_info)
	# def test_em_submit(self, url, action, data, code, expect):
	# 	submit = data.get('submit')
	# 	isSign = data.get('isSign')
	# 	isHired = data.get('isHired')
	# 	stuId = data.get('stuId')
	# 	ndata ={'submit': submit, 'isSign': isSign, 'isHired': isHired, 'stuId': stuId}
	# 	textmod = parse.urlencode(ndata)
	# 	em_submit_url = f'{url}?{textmod}'
	# 	em_submit_resp = EmploymentManagement().do_em_submit(em_submit_url)
	# 	em_submit_code = em_submit_resp.status_code
	# 	if em_submit_code == code:
	# 		actual = 'EM-succeed'
	# 	else:
	# 		actual = 'EM-failed'
	#
	# 	# 断言
	# 	self.assertEqual(actual, expect)
	#
	# @parameterized.expand(em_simulation_info)
	# def test_em_simulation(self, url, action, data, code, expect):
	# 	simulation = data.get('simulation')
	# 	intent_salary= data.get('m.intent_salary')
	# 	comm = request.quote(data.get('m.comm'))
	# 	remark = request.quote(data.get('m.remark'))
	# 	ndata ={'simulation': simulation, 'm.intent_salary': intent_salary, 'm.comm': comm, 'm.remark': remark}
	# 	textmod = parse.urlencode(ndata)
	# 	em_simulation_url = f'{url}?{textmod}'
	# 	em_simulation_resp = EmploymentManagement().do_em_simulation(em_simulation_url)
	# 	em_simulation_code = em_simulation_resp.status_code
	# 	if em_simulation_code == code:
	# 		actual = 'EM-succeed'
	# 	else:
	# 		actual = 'EM-failed'
	#
	# 	# 断言
	# 	self.assertEqual(actual, expect)



if __name__ == '__main__':

	unittest.main(verbosity=2)

