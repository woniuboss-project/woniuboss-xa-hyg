from parameterized import parameterized
import unittest
from woniuboss.lib.woniuboss_api.login.login import Login
from woniuboss.tools.woniuboss_api.service import Service
from woniuboss.tools.woniuboss_api.utility import Utility
#在该页面调试时test_config_info里需要多加一层跳出"..\\",testdata也需要多加一层
#准备数据
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_api\\testdata_login.conf')
login_info = Utility.get_excel_to_tuple(test_config_info[0])
add_user_info = Utility.get_excel_to_user(test_config_info[0])

modify_passwd_info=Utility.get_excel_to_tuple(test_config_info[1])
add_user_info1 = Utility.get_user_to_dict(test_config_info[1])
modify_user_info=Utility.get_excel_to_user(test_config_info[1])
decrypt_info=Utility.get_excel_to_tuple(test_config_info[2])
add_user_info2 = Utility.get_user_to_dict(test_config_info[2])
decrypt_user_info=Utility.get_excel_to_user(test_config_info[2])

# ('http://192.168.75.128:8080/WoniuBoss2.5/user/login', 'POST', {'username': 'WNCD000', 'password': 'woniu123', 'verifycode': '0000'}, 200, 'login-pass'),
#login_info中[]的需要参照上面选取

class LoginTest(unittest.TestCase):

	# # 获取测试数据配置
	# def __init__(self):
	#
	# 	self.data_config_info = add_user_info

	@parameterized.expand(login_info)
	def test_login(self,url,post,data,status_code,expect):
			login_resp = Login(add_user_info).do_login(url,data)
			#获取响应码和响应头
			actual= login_resp.text
			self.assertEqual(actual, expect)

	@parameterized.expand(modify_passwd_info)
	def test_modify_passwd(self,url,post,data,status_code,expect):
		# for one_user_info,one_modify_info in zip(add_user_info1,modify_passwd_info):
		# 	url=one_modify_info[0]
		# 	data=one_modify_info[2]
		# 	expect=one_modify_info[4]
		modify_passwd_resp=Login(modify_user_info).modify_passwd(url,data)
		actual=modify_passwd_resp.text
		self.assertEqual(expect,actual)


	@parameterized.expand(decrypt_info)
	def test_decrypt(self,url,post,data,status_code,expect):
		# for one_user_info, one_decrypt in zip(add_user_info2,decrypt_info):
		# 	url=one_decrypt[0]
		# 	data=one_decrypt[2]
		# 	expect=one_decrypt[4]
		decrype_resp=Login(decrypt_user_info).Decrypt(url,data)
		actual=decrype_resp.text
		print(actual)
		self.assertEqual(expect,actual)

if __name__ == '__main__':
	import os
	print(os.getcwd())
	unittest.main(verbosity=2)
