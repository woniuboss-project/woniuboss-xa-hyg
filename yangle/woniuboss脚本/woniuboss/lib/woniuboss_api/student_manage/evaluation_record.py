from woniuboss.tools.woniuboss_api.service import Service

class EvaluationRecord:
    def __init__(self,base_info):
        self.session = Service.get_session(base_info)

    def query_record_num(self,url,data):
        return self.session.post(url,data)