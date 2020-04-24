
import requests
from woniuboss.tools.woniuboss_gui.service import Service


class EmploymentManagement:

	def __init__(self, driver):
		self.driver = driver

	# 技术面试模块
	# 界面
	def em_technology_interface(self):
		Service.click_text(self.driver, '技术面试')

	# 内容

	# 技术面试下拉框
	def em_technology(self):
		Service.box_content_id(self.driver, 'studentSelect')

	# 技术面试查询
	def em_technology_query(self, technology):
		Service.box_id_click(self.driver, 'studentSelect', technology)

	# 面试

	# 面试结果
	def em_result(self, results):
		Service.box_id_click(self.driver, 'isPassSkill', results)

	# 提问
	def em_questions(self, em_questions):
		questions = self.driver.find_element_by_id('squestion')
		Service.send_input(questions, em_questions)

	# 评价
	def em_evaluation(self, em_evaluation):
		evaluation = self.driver.find_element_by_id('sval')
		Service.send_input(evaluation, em_evaluation)

	# 面试工作流
	def em_technology_interview(self, results, em_questions, em_evaluation):
		self.em_result(results)
		self.em_questions(em_questions)
		self.em_evaluation(em_evaluation)
		# 保存
		Service.click_id(self.driver, 'saveSkillbtn')

	# 就业管理模块
	# 界面
	def em_employment_interface(self):
		Service.click_text(self.driver, '就业管理')

	# 内容

	# 班级下拉框
	def em_class(self):
		Service.box_content_id(self.driver, 'semesterSelect')

	# 方向下拉框
	def em_direction(self):
		Service.box_content_id(self.driver, 'stu-orientation')

	# 姓名输入框
	def em_name_input(self, em_name):
		name_input = self.driver.find_element_by_css('input.sel-text')
		Service.send_input(name_input, em_name)

	# 学号
	def em_student_id_input(self, em_student_id):
		student_id = self.driver.find_element_by_css('.col-lg-8 > input:nth-child(2)')
		Service.send_input(student_id, em_student_id)

	# 搜索
	def em_search(self):
		Service.click_css(self.driver, 'button.btn:nth-child(3)')

	# 查询

	# 班级查询
	def em_class_query(self, class_query):
		Service.box_id_click(self.driver, 'semesterSelect', class_query)

	# 方向查询
	def em_direction_query(self, direction_query):
		Service.box_id_click(self.driver, 'stu-orientation', direction_query)

	# 姓名查询
	def em_name_query(self, em_name):
		name_input = self.driver.find_element_by_css('input.sel-text')
		Service.send_input(name_input, em_name)
		self.em_search()

	# 学号查询
	def em_student_id_query(self, em_student_id):
		student_id = self.driver.find_element_by_css('.col-lg-8 > input:nth-child(2)')
		Service.send_input(student_id, em_student_id)
		self.em_search()

	# 面试

	# 模拟面试工作流
	def em_mock_interviews(self, em_xpected_salary, mock_interviews, em_note):

		self.driver.find_element_by_link_text('模拟面试').click()

		# 期望薪资
		xpected_salary = self.driver.find_element_by_css('.col-lg-8 > input:nth-child(2)')
		Service.send_input(xpected_salary, em_xpected_salary)
		# 沟通能力
		Service.box_id_click(self.driver, 'mcomm', mock_interviews)

		# 备注
		note = self.driver.find_element_by_css('.col-lg-8 > input:nth-child(2)')
		Service.send_input(note, em_note)

		# 保存
		Service.click_id(self.driver, 'saveEditMBtn')

	# 真实面试工作流
	def em_real_interview(self, enterprise, jobs, em_interview_time, em_interview_feedback):

		self.driver.find_element_by_link_text('真实面试').click()

		# 企业名称
		Service.box_css_click(self.driver, '.form-group > div:nth-child(3) > button:nth-child(1) > span:nth-child(1)', enterprise)
		# 面试岗位
		Service.box_css_click(self.driver, '#form-real > div:nth-child(3) > select:nth-child(2)', jobs)

		# 面试时间
		interview_time = self.driver.find_element_by_id('reatime')
		Service.send_input(interview_time, em_interview_time)

		# 反馈
		interview_feedback = self.driver.find_element_by_id('rearemark')
		Service.send_input(interview_feedback, em_interview_feedback)

		# 保存
		Service.click_id(self.driver, 'saveEditRBtn')

	# 入职情况工作流
	def em_induction(self, enterprise, jobs, em_induction_time, em_induction_salary, em_interview_note):
		self.driver.find_element_by_link_text('入职情况').click()
		# 企业名称
		Service.box_css_click(self.driver, '#form-jobRegi > div:nth-child(2) > '
											 'div:nth-child(3) > button:nth-child(1) > span:nth-child(1)', enterprise)
		# 入职岗位
		Service.box_css_click(self.driver, '#form-jobRegi > div:nth-child(3) > select:nth-child(2)', jobs)

		# 入职时间
		induction_time = self.driver.find_element_by_id('jdate')
		Service.send_input(induction_time, em_induction_time)
		# 薪资
		induction_salary = self.driver.find_element_by_id('jsalary')
		Service.send_input(induction_salary, em_induction_salary)

		# 备注
		interview_note = self.driver.find_element_by_id('jremark')
		Service.send_input(interview_note, em_interview_note)

		# 保存
		Service.click_id(self.driver, 'saveEditRBtn')

	# 提交

	# 提交工作流

	def em_submit(self):
		# 电脑回收
		Service.click_id(self.driver, 'computer0')

		# 协议签署
		Service.click_id(self.driver, 'protocol0')

		# 已入职
		Service.click_id(self.driver, 'entry0')

		# 提交
		Service.click_css(self.driver, 'button.btn:nth-child(2)')

		# 确认弹窗

		Service.alert_windows(self.driver)




