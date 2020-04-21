import unittest
from woniuboss.lib.woniuboss_api.student_manage.today_attendance import TodayAttendance
from parameterized import parameterized
from woniuboss.tools.woniuboss_api.utility import Utility
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_api\\testdata_stu_manage.conf')
do_one_attendance_info = Utility.get_excel_to_tuple(test_config_info[3])
add_user_info1 = Utility.get_excel_to_user(test_config_info[3])
search_student_information=Utility.get_excel_to_tuple(test_config_info[4])
add_user_info2 = Utility.get_excel_to_user(test_config_info[4])
do_all_attendance_info= Utility.get_excel_to_tuple(test_config_info[5])
add_user_info3 = Utility.get_excel_to_user(test_config_info[5])
import time
local_time = time.strftime('%Y-%m-%d', time.localtime(time.time()))
class TestTodayAttendance(unittest.TestCase):
    @parameterized.expand(do_one_attendance_info)
    def test_a_do_one_attendance(self,url,post,data,status_code,expect):
        one_data=data['value']
        print(one_data)
        str_id,str_status=one_data.split('_')
        sql = f'select result from attendance where attendance_student_id={str_id} and update_time like "{local_time}%"'
        TodayAttendance(add_user_info1).do_one_attendance(url, data)
        db_result = Utility.query_one(add_user_info1, sql)
        print(db_result)
        if  db_result[0]==str_status:
            actual='test one attendance pass'
        else:
            actual='test one attendance fail'
        self.assertEqual(expect,actual)
    @parameterized.expand(search_student_information)
    def test_b_search_student(self,url,post,data,status_code,expect):
        search_stucent_resp=TodayAttendance(add_user_info2).search_student_info(url,data)
        real_totalrow=search_stucent_resp.json()['totalRow']
        if real_totalrow >= 1:
            actual='test search student pass'
        else:
            actual = 'test search student fail'

        self.assertEqual(expect,actual)
    @parameterized.expand(do_all_attendance_info)
    def test_c_do_all_attendance(self,url,post,data,status_code,expect):
        TodayAttendance(add_user_info3).do_all_attendance(url,data)

        sql=f'select count(teacher_id) from attendance where create_time like "{local_time}%"'
        db_result=Utility.query_one(add_user_info3, sql)
        print(db_result)
        if db_result[0] == 19:
            actual='test all attendance pass'
        else:
            actual = 'test all attendance fail'
        self.assertEqual(expect,actual)



if __name__ == '__main__':
    unittest.main(verbosity=2)