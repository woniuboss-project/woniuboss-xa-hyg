from woniuboss.lib.woniuboss_gui.login.decrypt import Decrypt
from woniuboss.lib.woniuboss_gui.student_manage.phase_exam import PhaseExam
from woniuboss.tools.woniuboss_gui.service import Service
import unittest
from woniuboss.tools.woniuboss_gui.utility import Utility
from parameterized import parameterized
import time

test_config_info = Utility.get_json('..\\..\\conf\\woniuboss_gui\\testdata_stu_manage.conf')
query_phase_info = Utility.get_excel_to_tuple(test_config_info[13])

user_info=Utility.get_excel_to_user(test_config_info[13])

do_phase_test_info = Utility.get_excel_to_tuple(test_config_info[14])

do_down_grade_info = Utility.get_excel_to_tuple(test_config_info[15])

class PhaseExamTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(user_info)
        cls.phase_exam = PhaseExam(cls.driver)
        Service.miss_login(cls.driver, user_info)
        Decrypt(cls.driver).do_decrypt(user_info['secondpwd'])

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(query_phase_info)
    def test_a_query_phase(cls,class_name,orientation,name,expect):
        ele_text = cls.phase_exam.do_query_info(class_name,orientation,name)
        print(ele_text)
        if "19" in ele_text:
            actual = 'test query phase exam pass'
        else:
            actual = 'test query phase exam fail'
        cls.assertEqual(expect,actual)

    @parameterized.expand(do_phase_test_info)
    def test_b_phase_exam(cls,phase,score,comment,expect):
        sql = 'select count(*) from phase_exam'
        db_result1 = Utility.query_one(user_info, sql)
        cls.phase_exam.do_phase_test(phase,score,comment)
        time.sleep(5)
        db_result2 = Utility.query_one(user_info, sql)
        if db_result2[0] - db_result1[0] == 1:
            actual = 'test do phase exam pass'
        else:
            actual = 'test do phase exam fail'
        cls.assertEqual(expect,actual)

    @parameterized.expand(do_down_grade_info)
    def test_c_down_grade(cls,orientation,class_name,expect):
        text_start,text_end = cls.phase_exam.do_down_grade(orientation,class_name)
        sum_start = text_start.split('总共 ')[1].split(' 条')[0]
        sum_end = text_end.split('总共 ')[1].split(' 条')[0]
        print(sum_start,sum_end)
        if int(sum_start) - int(sum_end) == 1:
            actual = 'test down grade pass'
        else:
            actual = 'test down grade fail'

        cls.assertEqual(expect,actual)

if __name__ == '__main__':
    unittest.main(verbosity=2)
