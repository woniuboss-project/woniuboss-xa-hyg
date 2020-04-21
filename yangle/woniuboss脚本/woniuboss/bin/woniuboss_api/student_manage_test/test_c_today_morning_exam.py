import unittest
from woniuboss.lib.woniuboss_api.student_manage.today_morning_exam import TodayMorningExam
from parameterized import parameterized
from woniuboss.tools.woniuboss_api.utility import Utility
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_api\\testdata_stu_manage.conf')
query_student_info=Utility.get_excel_to_tuple(test_config_info[6])
add_user_info1 = Utility.get_excel_to_user(test_config_info[6])
do_morning_exam_info = Utility.get_excel_to_tuple(test_config_info[7])
add_user_info2 = Utility.get_excel_to_user(test_config_info[7])

class TestTodayMorningExam(unittest.TestCase):
    @parameterized.expand(query_student_info)
    def test_a_query_student(self,url,post,data,status_code,expect):
        query_student_resp=TodayMorningExam(add_user_info1).query_all_student(url,data)
        real=query_student_resp.json()['totalRow']
        if real==19:
            actual='test query morning exam student pass'
        else:
            actual = 'test query morning exam student fail'
        self.assertEqual(expect,actual)

    @parameterized.expand(do_morning_exam_info)
    def test_b_do_moring_exam(self,url,post,data,status_code,expect):
        do_morning_exam_resp=TodayMorningExam(add_user_info2).do_morning_exam(url,data)
        import time
        local_time = time.strftime('%Y-%m-%d', time.localtime(time.time()))
        db_id=data['me.morn_exam_student_id']
        sql=f'select * from morn_exam where morn_exam_student_id="{db_id}" and create_time like "{local_time}%"'
        db_result=Utility.query_one(add_user_info2,sql)
        if db_result:
            if do_morning_exam_resp.text=="success":
                actual="test do morning exam pass"
            else:
                actual="test do morning exam fail"
        else:
            actual="test do morning exam fail"

        self.assertEqual(expect,actual)



if __name__ == '__main__':
    unittest.main(verbosity=2)
