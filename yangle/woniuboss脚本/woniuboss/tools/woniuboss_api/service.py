
from woniuboss.tools.woniuboss_api.utility import Utility
import requests

class Service:

	@classmethod
	def get_session(cls,base_info):
		#base_info = Utility.get_json('..\\conf\\base.conf')
		login_url = "%s://%s:%s/%s/" %(base_info['PROTOCOL'],base_info['HOSTNAME'],base_info['PORT'],base_info['AURL'])
		login_data = {"userName":base_info["USERNAME"],"userPass":base_info["PASSWORD"],"checkcode":base_info["VERIFYCODE"]}
		session = requests.session()
		resp=session.post(login_url,login_data)
		return session

if __name__ == '__main__':
	test_config_info = Utility.get_json('..\\..\\conf\\woniuboss_api\\testdata_stu_manage.conf')
	basicinfo_info = Utility.get_excel_to_tuple(test_config_info[0])
	add_user_info = Utility.get_excel_to_user(test_config_info[0])
	print(add_user_info)
	Service.get_session(add_user_info)