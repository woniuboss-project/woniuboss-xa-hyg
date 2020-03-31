from parameterized import parameterized
import unittest
from woniuboss.lib.woniuboss_api.login.login import Login
from woniuboss.tools.woniuboss_api.service import Service
from woniuboss.tools.woniuboss_api.utility import Utility
#在该页面调试时test_config_info里需要多加一层跳出"..\\",testdata也需要多加一层
#准备数据
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_api\\testdata.conf')
login_info = Utility.get_excel_to_tuple(test_config_info[0])
add_user_info = Utility.get_excel_to_user(test_config_info[0])
# ('http://192.168.75.128:8080/WoniuBoss2.5/user/login', 'POST', {'username': 'WNCD000', 'password': 'woniu123', 'verifycode': '0000'}, 200, 'login-pass'),
#login_info中[]的需要参照上面选取

class LoginTest(unittest.TestCase):

	# # 获取测试数据配置
	# def __init__(self):
	#
	# 	self.data_config_info = add_user_info

	# @parameterized.expand(login_info)
	def test_login(cls):

		for info in  login_info:
			login_url = info[0]
			login_data = info[2]
			expect = info[4]
			login_resp = Login().do_login(login_url,login_data)
			#获取响应码和响应正文
			login_resp_code = login_resp.json
			#获取响应码和响应头
			login_resp123 = login_resp.text
			#响应中文并非success具体实现自行解决
			#将返回的正文当做预期结果
			login_resp_content = login_resp.text
			# 断言
			flag = Utility.assert_equals(login_resp_content,info[4])
			if flag:
				actual = 'loogin_correct'
			else:
				actual = 'looginfailed'
			print(actual)
			cls.assertEqual(actual, expect)

