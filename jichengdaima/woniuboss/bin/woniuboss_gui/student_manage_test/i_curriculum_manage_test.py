from selenium.webdriver.common.by import By

from woniuboss.lib.woniuboss_gui.login.decrypt import Decrypt
from woniuboss.lib.woniuboss_gui.student_manage.course_schedule import CourseSchedule
import time
from woniuboss.tools.woniuboss_gui.service import Service
import unittest
from woniuboss.tools.woniuboss_gui.utility import Utility
from parameterized import parameterized
test_config_info = Utility.get_json('..\\..\\conf\\woniuboss_gui\\testdata_stu_manage.conf')
query_teacher_info = Utility.get_excel_to_tuple(test_config_info[19])
add_curriculum_info = Utility.get_excel_to_tuple(test_config_info[20])
user_info=Utility.get_excel_to_user(test_config_info[19])
modify_curriculum_info = Utility.get_excel_to_tuple(test_config_info[21])

class CourseScheduleTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(user_info)
        cls.course_schedule = CourseSchedule(cls.driver)
        Service.miss_login(cls.driver, user_info)
        Decrypt(cls.driver).do_decrypt(user_info['secondpwd'])

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(query_teacher_info)
    def test_a_query_info(self,teacher,expect):
        ele_text = self.course_schedule.do_query_teacher_info(teacher)
        sum_record = ele_text.split('总共 ')[1].split(' 条')[0]
        sql = 'select count(*) from curriculum_schedule where work_id = WNCD005'
        db_result = Utility.query_one(user_info,sql)
        if db_result[0] == int(sum_record):
            actual = 'query teacher schedule pass'
        else:
            actual = 'query teacher schedule fail'
        self.assertEqual(expect,actual)

    @parameterized.expand(add_curriculum_info)
    def test_b_add_course_schedule(cls,s_time,e_time,status1,classroom1,class1,orientation1,course1,
                          status2,classroom2,class2,orientation2,course2,
                          status3,classroom3,class3,orientation3,course3,
                          status4,classroom4,class4,orientation4,course4,
                          status5,classroom5,class5,orientation5,course5,
                          status6,classroom6,class6,orientation6,course6,
                          status7,classroom7,class7,orientation7,course7,
                          status8,classroom8,class8,orientation8,course8,
                          status9,classroom9,class9,orientation9,course9,expect):

        sql ='select count(*) from curriculum_schedule'

        db_result1 = Utility.query_one(user_info,sql)
        attr = cls.course_schedule.do_add_curriculum(s_time,e_time,status1,classroom1,class1,orientation1,course1,
                          status2,classroom2,class2,orientation2,course2,
                          status3,classroom3,class3,orientation3,course3,
                          status4,classroom4,class4,orientation4,course4,
                          status5,classroom5,class5,orientation5,course5,
                          status6,classroom6,class6,orientation6,course6,
                          status7,classroom7,class7,orientation7,course7,
                          status8,classroom8,class8,orientation8,course8,
                          status9,classroom9,class9,orientation9,course9)
        print(attr)
        db_result2 = Utility.query_one(user_info,sql)
        num = db_result2[0] - db_result1[0]
        time.sleep(2)
        if Service.is_element_present(cls.driver,By.CSS_SELECTOR,'body > div.bootbox.modal.fade.mydialog.in > div > '
                                                                 'div > div.modal-footer > button'):
            actual = 'test add course schedule fail'
            cls.driver.refresh()
        else:
            if 'none' in attr and num ==9:
                actual = 'test add course schedule pass'

            else:
                actual = 'test add course schedule fail'
        cls.assertEqual(expect,actual)

    @parameterized.expand(modify_curriculum_info)
    def test_c_modify_course_schedule(cls,s_time,e_time,status,orientation,course,class_num,classroom,expect):
        attr = cls.course_schedule.do_modify_curriculum(s_time,e_time,status,orientation,course,class_num,classroom)
        time.sleep(2)
        if 'none' in attr:
            actual = 'test modify course schedule pass'
        else:
            actual = 'test modify course schedule fail'
        cls.assertEqual(expect,actual)