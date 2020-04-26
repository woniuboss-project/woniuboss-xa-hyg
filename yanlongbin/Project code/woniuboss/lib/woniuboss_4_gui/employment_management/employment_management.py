
import requests
from woniuboss.tools.woniuboss_4_gui.service import Service


class EmploymentManagement:

	def __init__(self, driver):
		self.driver = driver

	# 模拟面试模块
	# 界面
	def em_mock_interviews(self):
		Service.click_text(self.driver, '模拟面试')

	# 面试记录模块
	# 界面
	def em_interview_records(self):
		Service.click_text(self.driver, '面试记录')

	# 入职信息模块
	# 界面
	def em_orientation_information(self):
		Service.click_text(self.driver, '入职信息')

	# 企业客户模块
	# 界面
	def em_corporate_clients(self):
		Service.click_text(self.driver, '企业客户')







