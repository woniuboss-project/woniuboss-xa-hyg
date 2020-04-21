from woniuboss.tools.woniuboss_api.service import Service
class CourseManage:
    def __init__(self,base_info):
        self.session = Service.get_session(base_info)
    def add_course_schedule(self,url,data):
        return self.session.post(url,data)
    def modify_course_schedule(self,url,data):
        return self.session.post(url,data)