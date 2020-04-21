from woniuboss.tools.woniuboss_api.service import Service
class PhaseExam:
    def __init__(self,base_info):
        self.session = Service.get_session(base_info)

    def click_do_phase(self,do_phase_url,do_phase_data):
       return self.session.post(do_phase_url,do_phase_data)

    def click_down_grade(self,down_grade_url,data):
       return self.session.post(down_grade_url,data)

    def query_totalrow(self):
        url='http://yangle4:8080/WoniuBoss2.5/student/queryStuOfTeacher'
        data={"pageSize":"10","pageIndex":"1","stuClass":"","orientation":"","stuName":""}
        return self.session.post(url,data)
