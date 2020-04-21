from woniuboss.tools.woniuboss_api.service import Service
class ClassManage:
    def __init__(self,base_info):
        self.session = Service.get_session(base_info)
    def click_class_manage(self,url,data):
        return self.session.post(url,data)
    def separate_class(self,url,data):
        return self.session.post(url,data)