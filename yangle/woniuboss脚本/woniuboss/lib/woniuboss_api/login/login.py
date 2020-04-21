from woniuboss.tools.woniuboss_api.service import Service
import requests
class Login:
    def __init__(self,base_info):
        self.session = Service.get_session(base_info)

    def modify_passwd(self,login_url,login_data):
        return self.session.post(login_url,login_data)

    def do_login(self,url,data):
        return requests.post(url,data)

    def Decrypt(self,url,data):
        return self.session.post(url,data)