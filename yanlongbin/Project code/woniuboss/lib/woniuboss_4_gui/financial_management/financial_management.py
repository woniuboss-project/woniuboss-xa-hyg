
import requests
from woniuboss.tools.woniuboss_4_gui.service import Service


class FinancialManagement:

	def __init__(self, driver):
		self.driver = driver

	# 财务流水
	# 界面
	def fm_financial_interface(self):
		Service.click_text(self.driver, '财务流水')

	# 预支结算
	# 界面
	def fm_advance_settlement(self):
		Service.click_text(self.driver, '预支结算')

	# 学员学费
	# 界面
	def fm_students_tuition(self):
		Service.click_text(self.driver, '学员学费')

	# 定金复核
	# 界面
	def fm_deposit_check(self):
		Service.click_text(self.driver, '定金复核')

	# 班级管理
	# 界面
	def fm_class_management(self):
		Service.click_text(self.driver, '班级管理')

	# 月度核算
	# 界面
	def fm_monthly_accounting(self):
		Service.click_text(self.driver, '月度核算')

	# 账户管理
	# 界面
	def fm_account_management(self):
		Service.click_text(self.driver, '账户管理')

	# 会计科目
	# 界面
	def fm_accountant_course(self):
		Service.click_text(self.driver, '会计科目')

	# 财务报表
	# 界面
	def fm_financial_statements(self):
		Service.click_text(self.driver, '财务报表')











