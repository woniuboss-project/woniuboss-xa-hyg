from woniuboss.tools.woniuboss_api.service import Service
class MorningExamRecord:
    def __init__(self,base_info):
        self.session = Service.get_session(base_info)

    def click_morning_exam_record(self,record_url,record_data):
        return self.session.post(record_url,record_data)