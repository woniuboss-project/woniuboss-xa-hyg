import unittest
from woniuboss.lib.woniuboss_api.student_manage.phase_test import PhaseExam
from parameterized import parameterized
from woniuboss.tools.woniuboss_api.utility import Utility
import time
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_api\\testdata_stu_manage.conf')
# query_totalrow=Utility.get_excel_to_tuple(test_config_info[14])
do_test_info=Utility.get_excel_to_tuple(test_config_info[15])
do_down_grade_info=Utility.get_excel_to_tuple(test_config_info[16])
add_user_info = Utility.get_excel_to_user(test_config_info[16])

class TestPhaseTest(unittest.TestCase):
    @parameterized.expand(do_test_info)
    def test_a_do_phase(self,url,post,data,status_code,expect):
        sql1='select count(*) from phase_exam'
        db_result1=Utility.query_one(add_user_info,sql1)
        phase_resp=PhaseExam(add_user_info).click_do_phase(url,data)
        time.sleep(2)
        sql2='select count(*) from phase_exam'
        db_result2=Utility.query_one(add_user_info,sql2)
        if db_result2[0]-db_result1[0] == 1 and phase_resp.text=='success':
            actual='test do test pass'
        else:
            actual='test do test fail'
        self.assertEqual(expect,actual)

    @parameterized.expand(do_down_grade_info)
    def test_b_down_grade(self,url,post,data,status_code,expect):
        resp1=PhaseExam(add_user_info).query_totalrow()
        PhaseExam(add_user_info).click_down_grade(url,data)
        resp2 = PhaseExam(add_user_info).query_totalrow()
        start_totalrow=resp1.json()['totalRow']
        end_totalrow=resp2.json()['totalRow']
        if start_totalrow-end_totalrow==1:
            actual='test down grade pass'
        else:
            actual='test down grade fail'
        self.assertEqual(expect,actual)
if __name__ == '__main__':
    unittest.main(verbosity=2)

