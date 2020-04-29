
from woniuboss.tools.woniuboss_api.utility import Utility
import requests

class Service:

	@classmethod
	def get_session(cls,base_info):
		login_url = "%s://%s:%s/%s/" %(base_info['PROTOCOL'],base_info['HOSTNAME'],base_info['PORT'],base_info['AURL'])
		login_data = {"userName":base_info["USERNAME"],"userPass":base_info["PASSWORD"],"checkcode":base_info["VERIFYCODE"]}
		session = requests.session()
		session.post(login_url,login_data)
		return session

