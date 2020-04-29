from selenium.webdriver.common.by import By
from woniuboss.lib.woniuboss_gui.login.decrypt import Decrypt
from woniuboss.lib.woniuboss_gui.student_manage.today_attendance import TodayAttendance
from woniuboss.tools.woniuboss_gui.service import Service
import unittest
from woniuboss.tools.woniuboss_gui.utility import Utility
from parameterized import parameterized
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_gui\\testdata_stu_manage.conf')
search_attendance_info=Utility.get_excel_to_tuple(test_config_info[2])
search_att_user_info = Utility.get_excel_to_user(test_config_info[2])

attendance_one_info = Utility.get_excel_to_tuple(test_config_info[3])

attendance_all_info = Utility.get_excel_to_tuple(test_config_info[4])
import time
local_time = time.strftime('%Y-%m-%d', time.localtime(time.time()))
class TodayAttendanceTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(search_att_user_info)
        cls.today_attendance = TodayAttendance(cls.driver)
        Service.miss_login(cls.driver, search_att_user_info)
        Decrypt(cls.driver).do_decrypt(search_att_user_info['secondpwd'])

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()
    
    #查询今日考勤
    @parameterized.expand(search_attendance_info)
    def test_a_search_attendance(cls,name,expect):
        cls.today_attendance.do_search_student(name)
        time.sleep(5)
        sum_td = cls.today_attendance.count_td()
        if sum_td == 7:
            actual = 'test search attendance pass'
        else:
            actual = 'test search attendance fail'

        cls.assertEqual(expect,actual)
    
    #操作单个考勤
    @parameterized.expand(attendance_one_info)
    def test_b_attendance_one(cls,status,expect):
        attr = cls.today_attendance.do_random_attandence(status)
        time.sleep(5)
        stu_id = attr.split("_")[1]
        print(stu_id)
        sql = f'select result from attendance where attendance_student_id={stu_id} and update_time like "{local_time}%"'
        db_result = Utility.query_one(search_att_user_info, sql)
        print(db_result)
        if  db_result[0]==status:
            actual='test random attendance pass'
        else:
            actual='test random attendance fail'
        cls.assertEqual(expect,actual)
    
    #批量考勤
    @parameterized.expand(attendance_all_info)
    def test_c_attendance_all(cls,kn,expect):
        cls.today_attendance.do_attendance_all()
        record_sum = cls.today_attendance.get_record_text()
        sql = f'select count(teacher_id) from attendance where create_time like "{local_time}%"'
        db_result = Utility.query_one(search_att_user_info, sql)
        if str(db_result[0]) in record_sum:
            actual = 'test all attendance pass'
        else:
            actual = 'test all attendance fail'
        cls.assertEqual(expect, actual)

if __name__ == '__main__':
    unittest.main(verbosity=2)