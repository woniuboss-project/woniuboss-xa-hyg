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
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_gui\\EM\\testdata.conf')
em_technology_info = Utility.get_excel_to_tuple(test_config_info[0])
em_technology_user_info = Utility.get_excel_to_user(test_config_info[0])
em_interview_info = Utility.get_excel_to_tuple(test_config_info[1])
em_interview_query_info = Utility.get_excel_to_tuple(test_config_info[2])
em_technology_interview_info = Utility.get_excel_to_tuple(test_config_info[3])
em_employment_info = Utility.get_excel_to_tuple(test_config_info[4])
em_class_info = Utility.get_excel_to_tuple(test_config_info[5])
em_direction_info = Utility.get_excel_to_tuple(test_config_info[6])
em_class_query_info = Utility.get_excel_to_tuple(test_config_info[7])
emdirection_query_info = Utility.get_excel_to_tuple(test_config_info[8])
em_name_query_info = Utility.get_excel_to_tuple(test_config_info[9])
em_student_id_query_info = Utility.get_excel_to_tuple(test_config_info[10])
em_mock_interviews_info = Utility.get_excel_to_tuple(test_config_info[11])
em_real_interview_info = Utility.get_excel_to_tuple(test_config_info[12])
em_induction_info = Utility.get_excel_to_tuple(test_config_info[13])
em_submit_info = Utility.get_excel_to_tuple(test_config_info[14])





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
	@parameterized.expand(em_technology_info)
	def test_em_technology_interface(cls, data, expect):
		try:
			EmploymentManagement(cls.driver).em_technology_interface()
			if Service.is_element_present(cls.driver, By.LINK_TEXT, '技术面试'):
				actual = 'EM_correct'
			else:
				actual = 'EM_failed'
				cls.driver.refresh()
			cls.assertEqual(actual, expect)
		except Exception as e:
			actual = 'EM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 技术面试下拉框
	@parameterized.expand(em_interview_info)
	def test_em_end_time(cls, data, expect):
		try:
			test_em_interview = EmploymentManagement(cls.driver).em_technology()
			if '全部' in test_em_interview:
				actual = 'EM_correct'
			else:
				actual = 'EM_failed'
				cls.driver.refresh()
			cls.assertEqual(actual, expect)
		except Exception as e:
			actual = 'EM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 技术面试查询
	@parameterized.expand(em_interview_query_info)
	def test_em_interview_query(cls, technology, expect):
		try:
			EmploymentManagement(cls.driver).em_technology_query(technology)

			actual = Service.text_xpath(cls.driver,'/html/body/div[7]/div[3]/div/div/div/div[1]/div[2]/div[2]/div[2]/table/tbody/tr[1]/td[1]')
			cls.assertEqual(actual, expect)
			cls.driver.refresh()
		except Exception as e:
			actual = 'EM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)
	# 面试工作流
	@parameterized.expand(em_technology_interview_info)
	def test_em_technology_interview(cls, results, em_questions, em_evaluation, expect):
		try:
			EmploymentManagement(cls.driver).em_technology_interview(results, em_questions, em_evaluation)
			questions = f"'{em_questions}'"
			valuate = f"'{em_evaluation}'"

			sql = f'SELECT result FROM skill_record WHERE questions = {questions} and valuate= {valuate};'
			em_technology_interview = Utility.query_one(em_technology_user_info, sql)
			em_results = em_technology_interview[0]
			if em_results == results:
				actual = 'EM_correct'
			else:
				actual = 'EM_failed'
				cls.driver.refresh()
			cls.assertEqual(actual, expect)
			cls.driver.refresh()
		except Exception as e:
			actual = 'EM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 就业管理模块

	# 界面
	@parameterized.expand(em_employment_info)
	def test_em_employment_interface(cls, data, expect):
		try:
			EmploymentManagement(cls.driver).em_employment_interface()
			if Service.is_element_present(cls.driver, By.LINK_TEXT, '就业管理'):
				actual = 'EM_correct'
			else:
				actual = 'EM_failed'
				cls.driver.refresh()
			cls.assertEqual(actual, expect)
		except Exception as e:
			actual = 'EM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 班级下拉框
	@parameterized.expand(em_class_info)
	def test_em_class(cls, data, expect):
		try:

			test_em_class = EmploymentManagement(cls.driver).em_class()

			if '全部' in test_em_class:
				actual = 'EM_correct'
			else:
				actual = 'EM_failed'
				cls.driver.refresh()
			cls.assertEqual(actual, expect)
		except Exception as e:
			actual = 'EM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 方向下拉框
	@parameterized.expand(em_direction_info)
	def test_em_direction(cls, data, expect):
		try:
			test_em_direction = EmploymentManagement(cls.driver).em_direction()

			if '全部' in test_em_direction:
				actual = 'EM_correct'
			else:
				actual = 'EM_failed'
				cls.driver.refresh()
			cls.assertEqual(actual, expect)
		except Exception as e:
			actual = 'EM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 班级查询
	@parameterized.expand(em_class_query_info)
	def test_em_class_query(cls, class_query, expect):
		try:
			EmploymentManagement(cls.driver).em_class_query(class_query)

			actual = Service.text_xpath(cls.driver,'/html/body/div[7]/div[3]/div/div/div/div[2]/div[3]/div[2]/div[2]/table/tbody/tr[1]/td[1]')
			cls.assertEqual(actual, expect)
			cls.driver.refresh()
		except Exception as e:
			actual = 'EM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 方向查询
	@parameterized.expand(emdirection_query_info)
	def test_em_direction_query(cls, direction_query, expect):
		try:
			EmploymentManagement(cls.driver).em_direction_query(direction_query)

			actual = Service.text_css(cls.driver,'/html/body/div[7]/div[3]/div/div/div/div[2]/div[3]/div[2]/div[2]/table/tbody/tr[1]/td[1]')
			cls.assertEqual(actual, expect)
			cls.driver.refresh()
		except Exception as e:
			actual = 'EM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 姓名查询
	@parameterized.expand(em_name_query_info)
	def test_em_name_query(cls, em_name, expect):
		try:
			EmploymentManagement(cls.driver).em_name_query(em_name)

			actual = Service.text_xpath(cls.driver,'/html/body/div[7]/div[3]/div/div/div/div[2]/div[3]/div[2]/div[2]/table/tbody/tr[1]/td[1]')
			cls.assertEqual(actual, expect)
			cls.driver.refresh()
		except Exception as e:
			actual = 'EM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 学号查询
	@parameterized.expand(em_student_id_query_info)
	def test_em_student_id_query(cls, student_id_query, expect):
		try:
			EmploymentManagement(cls.driver).em_student_id_query(student_id_query)

			actual = Service.text_css(cls.driver,'/html/body/div[7]/div[3]/div/div/div/div[2]/div[3]/div[2]/div[2]/table/tbody/tr[1]/td[1]')
			cls.assertEqual(actual, expect)
			cls.driver.refresh()
		except Exception as e:
			actual = 'EM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)


	# 面试

	# 模拟面试工作流
	@parameterized.expand(em_mock_interviews_info)
	def test_em_mock_interviews(cls, em_xpected_salary, mock_interviews, em_note, expect):
		try:
			EmploymentManagement(cls.driver).em_mock_interviews(em_xpected_salary, mock_interviews, em_note)
			interviews = f"'{mock_interviews}'"
			note = f"'{em_note}'"

			sql = f'SELECT intent_salary FROM mockinterview WHERE comm = {interviews} and remark = {note};'
			em_mock_interviews = Utility.query_one(em_technology_user_info, sql)
			em_results = em_mock_interviews[0]
			if em_results == em_xpected_salary:
				actual = 'EM_correct'
			else:
				actual = 'EM_failed'
				cls.driver.refresh()
			cls.assertEqual(actual, expect)
			cls.driver.refresh()
		except Exception as e:
			actual = 'EM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 真实面试工作流
	@parameterized.expand(em_real_interview_info)
	def test_em_real_interview(cls, enterprise, jobs, em_interview_time, em_interview_feedback, expect):
		try:
			EmploymentManagement(cls.driver).em_real_interview(enterprise, jobs, em_interview_time, em_interview_feedback)
			interview_time = f"'{em_interview_time}'"
			interview_feedback = f"'{em_interview_feedback}'"

			sql = f'SELECT interview_post FROM realinterview WHERE rinterview_time = {interview_time} and remark = {interview_feedback};'
			em_real_interview = Utility.query_one(em_technology_user_info, sql)
			em_results = em_real_interview[0]
			if em_results == jobs:
				actual = 'EM_correct'
			else:
				actual = 'EM_failed'
				cls.driver.refresh()
			cls.assertEqual(actual, expect)
			cls.driver.refresh()
		except Exception as e:
			actual = 'EM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# 入职情况工作流
	@parameterized.expand(em_induction_info)
	def test_em_induction(cls, enterprise, jobs, em_induction_time, em_induction_salary, em_interview_note, expect):
		try:
			EmploymentManagement(cls.driver).em_induction(enterprise, jobs, em_induction_time,em_induction_salary, em_interview_note)
			em_enterprise = f"'{enterprise}'"
			induction_salary = f"'{em_induction_salary}'"

			sql = f'SELECT job_position FROM job_register WHERE ent_name = {em_enterprise} and operator = {induction_salary};'
			em_induction = Utility.query_one(em_technology_user_info, sql)
			em_results = em_induction[0]
			if em_results == jobs:
				actual = 'EM_correct'
			else:
				actual = 'EM_failed'
				cls.driver.refresh()
			cls.assertEqual(actual, expect)
			cls.driver.refresh()
		except Exception as e:
			actual = 'EM_failed'
			cls.driver.refresh()
			cls.assertEqual(actual, expect)

	# # 提交
	#
	# # 提交工作流
	# @parameterized.expand(em_submit_info)
	# def test_em_submit(cls, data, expect):
	# 	try:
	# 		EmploymentManagement(cls.driver).em_submit()
	# 		em_results = Service.text_xpath(cls.driver,'/html/body/div[7]/div[3]/div/div/div/div[2]/div[3]/div[2]/div[2]'
	# 												   '/table/tbody/tr[1]/td[8]/label[1]')
	# 		if em_results == '电脑回收':
	# 			actual = 'EM_correct'
	# 		else:
	# 			actual = 'EM_failed'
	# 			cls.driver.refresh()
	# 		cls.assertEqual(actual, expect)
	# 		cls.driver.refresh()
	# 	except Exception as e:
	# 		actual = 'EM_failed'
	# 		cls.driver.refresh()
	# 		cls.assertEqual(actual, expect)


if __name__ == '__main__':

	unittest.main(verbosity=2)

