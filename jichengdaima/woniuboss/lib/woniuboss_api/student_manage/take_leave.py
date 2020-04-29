from woniuboss.tools.woniuboss_api.service import Service

class TakeLeave:
    def __init__(self,base_info):
        self.session = Service.get_session(base_info)

    def query_take_leave_student(self,query_take_leave_url,query_take_leave_data):
        return self.session.post(query_take_leave_url,query_take_leave_data)

    def add_take_leave(self,add_take_leave_url,add_take_leave_data):
        return self.session.post(add_take_leave_url,add_take_leave_data)

    def modify_take_leave(self,modify_take_leave_url,modify_take_leave_data):
        return self.session.post(modify_take_leave_url,modify_take_leave_data)

    def upload_leave_permit(self,upload_url,upload_data,upload_file):
        return self.session.post(url=upload_url,data=upload_data,files=upload_file)

    def write_off_leave(self,write_url,write_data):
        return self.session.post(write_url,write_data)