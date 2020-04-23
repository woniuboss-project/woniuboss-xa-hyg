
import requests
from woniuboss.tools.woniuboss_gui.service import Service


class EmploymentManagement:

	def __init__(self, driver):
		self.driver = driver

	# 技术面试模块
	# 界面
	def em_technology_interface(self):
		Service.click_text(self.driver, '技术面试')

	# 技术面试下拉框
	def em_technology(self):
		Service.box_content_id(self.driver, 'studentSelect')

	# 技术面试查询
	def em_technology_query(self):
		Service.box_id_click(self.driver, 'studentSelect')

	# 面试

	# 面试结果
	def em_result(self):
		Service.box_content_id(self.driver, 'isPassSkill')

	# 提问
	def em_questions(self):
		the_name = self.driver.find_element_by_css('#addEmp-form > div:nth-child(1) > div:nth-child(2) > '
												   'div:nth-child(1) > input:nth-child(2)')
		Service.send_input(the_name, uname)

	# 评价


	# 面试工作流


	# 就业管理模块
	# 界面
	def em_employment_interface(self):
		Service.click_text(self.driver, '就业管理')

	# 班级下拉框
	def em_class(self):
		Service.box_content_id(self.driver, 'semesterSelect')

	# 方向下拉框
	def em_direction(self):
		Service.box_content_id(self.driver, 'stu-orientation')

	# 姓名输入框

	# 学号

	# 搜索

	# 查询

	# 班级查询
	def em_class_query(self):
		Service.box_id_click(self.driver, 'semesterSelect')

	# 方向查询
	def em_direction_query(self):
		Service.box_id_click(self.driver, 'stu-orientation')

	# 姓名查询

	# 学号查询

	# 面试

	# 模拟面试工作流
	def em_mock_interviews(self):

		# 沟通能力
		Service.box_id_click(self.driver, 'mcomm')


	# 真实面试工作流
	def em_real_interview(self):
		# 企业名称
		Service.box_css_click(self.driver, '.form-group > div:nth-child(3) > button:nth-child(1) > span:nth-child(1)')
		# 面试岗位
		Service.box_css_click(self.driver, '#form-real > div:nth-child(3) > select:nth-child(2)')


	# 入职情况工作流
	def em_induction(self):
		# 企业名称
		Service.box_css_click(self.driver, '#form-jobRegi > div:nth-child(2) > '
											 'div:nth-child(3) > button:nth-child(1) > span:nth-child(1)')
		# 入职岗位
		Service.box_css_click(self.driver, '#form-jobRegi > div:nth-child(3) > select:nth-child(2)')

	# 提交

	# 电脑回收

	# 协议签署

	# 已入职

	# 提交工作流

