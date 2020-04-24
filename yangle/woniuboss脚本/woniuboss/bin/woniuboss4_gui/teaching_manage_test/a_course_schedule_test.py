import time
from selenium.webdriver.common.by import By
from woniuboss.lib.woniuboss4_gui.login.decrypt import Decrypt
from woniuboss.lib.woniuboss4_gui.login.login import Login
from woniuboss.lib.woniuboss4_gui.teaching_manage.course_schedule import CourseSchedule
from woniuboss.tools.woniuboss_gui.service import Service
import unittest
from woniuboss.tools.woniuboss_gui.utility import Utility
from parameterized import parameterized

test_config_info=Utility.get_json('..\\..\\..\\conf\\woniuboss4_gui\\teaching_manage.conf')
query_course_info = Utility.get_excel_to_tuple(test_config_info[0])
user_info = Utility.get_excel_to_user(test_config_info[0])
add_course_info = Utility.get_excel_to_tuple(test_config_info[1])
modify_course_info = Utility.get_excel_to_tuple(test_config_info[2])

class CourseScheduleTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(user_info)
        cls.course_schedule = CourseSchedule(cls.driver)
        Login(cls.driver).login(user_info)
        Decrypt(cls.driver).do_decrypt(user_info['secondpwd'])

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(query_course_info)
    def test_a_query_course_info(self,region,teacher,orientation,s_time,e_time,expect):
        self.course_schedule.do_query_curriculum(region,teacher,orientation,s_time,e_time)
        time.sleep(5)
        count_td = self.course_schedule.count_td()
        if count_td == 9:
            actual = 'test query course pass'
        else:
            actual = 'test query course fail'
        self.assertEqual(expect,actual)

    @parameterized.expand(add_course_info)
    def test_b_add_course(self,s_time,e_time,teacher,classroom,class_num,course,expect):
        sql = 'select count(*) from curriculum_schedule'
        db_result1 = Utility.query_one(user_info,sql)
        self.course_schedule.do_add_curriculum(s_time,e_time,teacher,classroom,class_num,course)
        time.sleep(5)
        text = self.driver.find_element_by_css_selector('body > div.bootbox.modal.fade.mydialog.in > div > div >'
                                                        ' div.modal-body > div').text
        db_result2 = Utility.query_one(user_info,sql)
        if '排课成功' in text and db_result2[0] - db_result1[0] == 1:
            actual = 'test add course pass'
        else:
            actual = 'test add course fail'
        self.driver.refresh()
        self.assertEqual(expect,actual)

    @parameterized.expand(modify_course_info)
    def test_c_modify_course(self,s_time,e_time,teacher,classroom,class_num,course,expect):
        self.course_schedule.do_modify_curriculum(s_time,e_time,teacher,classroom,class_num,course)
        time.sleep(5)
        if Service.is_element_present(self.driver,By.CSS_SELECTOR,'body > div.bootbox.modal.fade.mydialog.in > div > div'):
            actual = 'test modify course fail'
        else:
            actual = 'test modify course pass'
        self.assertEqual(expect,actual)
