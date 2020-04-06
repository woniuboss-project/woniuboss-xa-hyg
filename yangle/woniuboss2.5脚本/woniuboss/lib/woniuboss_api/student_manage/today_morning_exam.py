from woniuboss.tools.woniuboss_api.service import Service
class TodayMorningExam:
    def __init__(self,base_info):
        self.session = Service.get_session(base_info)

    def query_all_student(self,query_all_url,query_all_data):
        return self.session.post(query_all_url,query_all_data)

    def do_morning_exam(self,morning_exam_url,morning_exam_data):
        return self.session.post(morning_exam_url,morning_exam_data)