
from woniuboss.tools.woniuboss_api.service import Service

class BasicInfo:
    def __init__(self,base_info):
        self.session = Service.get_session(base_info)

    def query_all_student(self,query_all_url,query_all_data):
        return self.session.post(query_all_url,query_all_data)

    def view_one_student(self,view_one_url,view_one_data):
        return self.session.post(view_one_url,view_one_data)

    def modify_student_info(self,modify_student_url,modify_student_data):
        return self.session.post(url=modify_student_url,files=modify_student_data)