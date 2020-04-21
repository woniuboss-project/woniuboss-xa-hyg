from woniuboss.tools.woniuboss_api.service import Service

class TodayAttendance:
    def __init__(self,base_info):
        self.session = Service.get_session(base_info)

    def do_one_attendance(self,one_attendance_url,oneattendance_data):
        return self.session.post(one_attendance_url,oneattendance_data)
    def search_student_info(self,search_stu_url,search_stu_data):
        return self.session.post(search_stu_url,search_stu_data)
    def do_all_attendance(self,all_attendance_url,all_attendance_data):
        return self.session.post(all_attendance_url,all_attendance_data)