# -*- coding: utf-8 -*-#
#-------------------------------------------------------------------------------
# Name:         test_customer
# Description:  
# Author:       Administrator
# Date:         2020/2/13
#-------------------------------------------------------------------------------
import time
import unittest
from parameterized import parameterized
from selenium.webdriver.common.by import By

from woniuboss.tools.woniuboss_gui.service import Service
from woniuboss.tools.woniuboss_gui.utility import Utility
from woniuboss.lib.woniuboss_gui.customer.customer import Customer
test_config_info = Utility.get_json('..\\conf\\woniuboss_gui\\testdata.conf')
add_customer_info = Utility.get_excel_to_dict(test_config_info[1])
add_user_info = Utility.get_excel_to_user(test_config_info[1])

class CustomerTest(unittest.TestCase):

	def setUp(self):
		self.driver = Service.get_driver(add_user_info)

		self.customer = Customer(self.driver)

	def tearDown(self):
		self.driver.quit()

	@parameterized.expand(add_customer_info)
	def test_add_customer(self,cname,cphone,cdate,ckids,ccloth,expect):
		add_customer_data = {'customername':cname,'customerphone':cphone,
		                     'childdate':cdate,'creditkids':ckids,
		                     'creditcloth':ccloth}
		# 添加之前检查会员的总数
		sql = 'select count(customerid) from customer'
		old_customer_count = Utility.query_one(add_user_info, sql)
		# 执行添加会员的操作
		self.customer.add_customer(add_user_info,add_customer_data)

		# 对添加动作的结果进行验证
		if Service.is_element_present(self.driver, By.CSS_SELECTOR,
		                              '.modal-sm > div:nth-child(1) > div:nth-child(3) > button:nth-child(1)'):
			time.sleep(2)
			# 用于获取弹出页面的文本内容
			content = self.driver.find_element_by_css_selector('.bootbox-body').text
			if '请勿重复添加' in content:
				actual = 'already-added'
			else:
				actual = 'add-failed'
		else:
			# 判断customer表中的记录数是否增加
			new_customer_count = Utility.query_one(add_user_info, sql)
			if new_customer_count[0] - old_customer_count[0] == 1:
				actual = 'add-successful'
			else:
				actual = 'add-failed'

		self.assertEqual(actual,expect)
		Service.get_error_png(self.driver)