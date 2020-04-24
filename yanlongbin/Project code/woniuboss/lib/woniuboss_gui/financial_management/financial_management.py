
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
	def fm_start_time(self, fm_start_time):
		start_time = self.driver.find_element_by_id('selectTimeStart')
		Service.send_input(start_time, fm_start_time)

	# 结束时间
	def fm_end_time(self, fm_end_time):
		end_time = self.driver.find_element_by_id('selectTimeEnd')
		Service.send_input(end_time, fm_end_time)

	# 一级科目
	def fm_1_subject(self):
		Service.box_content_id(self.driver, '1_subject')

	# 二级科目
	def fm_2_subject(self):
		Service.box_content_id(self.driver, '2_subject')

	# 查询

	# 查询工作流

	def fm_financial_query(self, fm_start_time, fm_end_time, one_subject, two_subject):
		# 开始时间
		self.fm_start_time(fm_start_time)
		# 结束时间
		self.fm_end_time(fm_end_time)

		# 一级科目
		Service.box_id_click(self.driver, '1_subject',one_subject)
		# 二级科目
		Service.box_id_click(self.driver, '2_subject', two_subject)

		# 查询
		Service.click_id(self.driver, 'add')

	# 上月查询
	def fm_last_month_query(self):
		Service.click_id(self.driver, 'electLastMonthAll')

	# 本月查询
	def fm_month_query(self):
		Service.click_id(self.driver, 'selectThisMonthAll')

	# 新增流水工作流
	def fm_new_water(self, one_subject, two_subject, fm_type, settlement, fm_trading_time, head, payment,
					 fm_amount, trading, fm_other_trading, fm_capital_uses):
		# 一级科目
		Service.box_id_click(self.driver, 'empNameSelect1', one_subject)
		# 二级科目
		Service.box_id_click(self.driver, 'empNameSelect2', two_subject)
		# 类型
		Service.box_id_click(self.driver, 'Select3', fm_type)
		# 结算方式
		Service.box_id_click(self.driver, 'Select5', settlement)
		# 交易时间
		trading_time = self.driver.find_element_by_id('tradingTime')
		Service.send_input(trading_time, fm_trading_time)


		# 负责人
		Service.box_id_click(self.driver, 'finance_person_in_charge', head)

		# 收支类型
		Service.box_id_click(self.driver, 'income.and.expenses', payment)

		# 金额
		amount = self.driver.find_element_by_id('moneyNo')
		Service.send_input(amount, fm_amount)


		# 交易账号
		Service.box_id_click(self.driver, 'jiaoyizhanghao', trading)

		# 对方账号
		other_trading = self.driver.find_element_by_id('moneyNo')
		Service.send_input(other_trading, fm_other_trading)

		# 资金用途
		capital_uses = self.driver.find_element_by_id('textarea')
		Service.send_input(capital_uses, fm_capital_uses)

		Service.click_id(self.driver, 'changeButton')

	# 修改工作流
	def fm_modify_water(self, one_subject, two_subject, fm_type, settlement, fm_trading_time, head, payment,
					 fm_amount, trading, fm_other_trading, fm_capital_uses):
		# 一级科目
		Service.box_id_click(self.driver, 'empNameSelect1', one_subject)
		# 二级科目
		Service.box_id_click(self.driver, 'empNameSelect2', two_subject)
		# 类型
		Service.box_id_click(self.driver, 'Select3', fm_type)
		# 结算方式
		Service.box_id_click(self.driver, 'Select5', settlement)
		# 交易时间
		trading_time = self.driver.find_element_by_id('tradingTime')
		Service.send_input(trading_time, fm_trading_time)


		# 负责人
		Service.box_id_click(self.driver, 'finance_person_in_charge', head)

		# 收支类型
		Service.box_id_click(self.driver, 'income.and.expenses', payment)

		# 金额
		amount = self.driver.find_element_by_id('moneyNo')
		Service.send_input(amount, fm_amount)


		# 交易账号
		Service.box_id_click(self.driver, 'jiaoyizhanghao', trading)

		# 对方账号
		other_trading = self.driver.find_element_by_id('moneyNo')
		Service.send_input(other_trading, fm_other_trading)

		# 资金用途
		capital_uses = self.driver.find_element_by_id('textarea')
		Service.send_input(capital_uses, fm_capital_uses)

		Service.click_id(self.driver, 'changeButton')

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

	# 姓名搜索输入框
	def fm_name_search(self, fm_name):
		name_search = self.driver.find_element_by_id('selectStuName')
		Service.send_input(name_search, fm_name)

	# 查询

	# 状态查询
	def	fm_state_query(self, fm_state):
		Service.box_id_click(self.driver, 'selectNewStatus', fm_state)

	# 姓名查询
	def	fm_name_query(self, fm_name):
		self.fm_name_search(fm_name)
		Service.click_css(self.driver, '.col-lg-9 > button:nth-child(2)')

	# 缴费退费工作流

	def fm_payment_refund(self, student_class, stustatus, fm_stupay_amount, select, payment_account, fm_added):
		# 班级
		Service.box_id_click(self.driver, 'student_class', student_class)
		# 缴费状态
		Service.box_id_click(self.driver, 'stuStatus', stustatus)
		# 支付金额
		stupay_amount = self.driver.find_element_by_id('stupay')
		Service.send_input(stupay_amount, fm_stupay_amount)
		# 支付方式
		Service.box_id_click(self.driver, 'Select4', select)
		# 支付账户
		Service.box_id_click(self.driver, 'zhuanRuZhangHao1', payment_account)
		# 补充说明
		added = self.driver.find_element_by_css('div.row:nth-child(6) > div:nth-child(1) > textarea:nth-child(2)')
		Service.send_input(added, fm_added)









