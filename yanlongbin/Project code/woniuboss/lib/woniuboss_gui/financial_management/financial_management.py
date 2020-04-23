
import requests
from woniuboss.tools.woniuboss_gui.service import Service


class FinancialManagement:

	def __init__(self, driver):
		self.driver = driver

	# 财务流水
	# 界面
	def fm_financial_interface(self):
		Service.click_text(self.driver, '财务流水')

	# 开始时间

	# 结束时间

	# 一级科目
	def fm_1_subject(self):
		Service.box_content_id(self.driver, '1_subject')

	# 二级科目
	def fm_2_subject(self):
		Service.box_content_id(self.driver, '2_subject')

	# 查询

	# 查询工作流

	def fm_financial_query(self):
		# 一级科目
		Service.box_id_click(self.driver, '1_subject')
		# 二级科目
		Service.box_id_click(self.driver, '2_subject')

	# 上月查询

	# 本月查询

	# 新增流水工作流
	def fm_new_water(self):
		# 一级科目
		Service.box_id_click(self.driver, 'empNameSelect1')
		# 二级科目
		Service.box_id_click(self.driver, 'empNameSelect2')
		# 类型
		Service.box_id_click(self.driver, 'Select3')
		# 结算方式
		Service.box_id_click(self.driver, 'Select5')

		# 负责人
		Service.box_id_click(self.driver, 'finance_person_in_charge')

		# 收支类型
		Service.box_id_click(self.driver, 'income.and.expenses')

		# 交易账号
		Service.box_id_click(self.driver, 'jiaoyizhanghao')




	# 修改工作流
	def fm_modify_water(self):
		# 一级科目
		Service.box_id_click(self.driver, 'empNameSelect1')
		# 二级科目
		Service.box_id_click(self.driver, 'empNameSelect2')
		# 类型
		Service.box_id_click(self.driver, 'Select3')
		# 结算方式
		Service.box_id_click(self.driver, 'Select5')

		# 负责人
		Service.box_id_click(self.driver, 'finance_person_in_charge')

		# 收支类型
		Service.box_id_click(self.driver, 'income.and.expenses')

		# 交易账号
		Service.box_id_click(self.driver, 'jiaoyizhanghao')

	# 公账导入
	# 界面
	def fm_accounts_interface(self):
		Service.click_text(self.driver, '公账导入')

	# 学员缴费
	# 界面
	def fm_students_interface(self):
		Service.click_text(self.driver, '学员缴费')

	# 搜索状态下拉框
	def fm_search(self):
		Service.box_content_id(self.driver, 'selectNewStatus')

	# 姓名搜索

	# 查询

	# 状态查询
	def	fm_state_query(self):
		Service.box_id_click(self.driver, 'selectNewStatus')


	# 姓名查询
	def	fm_name_query(self):

	# 缴费退费工作流

	def fm_payment_refund(self):
		# 班级
		Service.box_id_click(self.driver, 'student_class')
		# 缴费状态
		Service.box_id_click(self.driver, 'stuStatus')
		# 支付方式
		Service.box_id_click(self.driver, 'Select4')
		# 支付账户
		Service.box_id_click(self.driver, '#zhuanRuZhangHao1')








