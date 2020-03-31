import unittest
from woniuboss.lib.woniuboss_api.student_manage.today_morning_exam import TodayMorningExam
from parameterized import parameterized
from woniuboss.tools.woniuboss_api.utility import Utility
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_api\\testdata_stu_manage.conf')
query_student_info=Utility.get_excel_to_tuple(test_config_info[6])
print(query_student_info)
add_user_info1 = Utility.get_excel_to_user(test_config_info[6])
do_morning_exam_info = Utility.get_excel_to_tuple(test_config_info[7])
add_user_info2 = Utility.get_excel_to_user(test_config_info[7])

class TestTodayMorningExam(unittest.TestCase):
    @parameterized.expand(query_student_info)
    def test_query_student(self,url,post,data,status_code,expect):
        query_student_resp=TodayMorningExam(add_user_info1).query_all_student(url,data)
        actual=query_student_resp.json()['totalRow']
        self.assertEqual(expect,actual)

    @parameterized.expand(do_morning_exam_info)
    def test_do_moring_exam(self,url,post,data,status_code,expect):
        do_morning_exam_resp=TodayMorningExam(add_user_info2).do_morning_exam(url,data)
        actual=do_morning_exam_resp.text
        print(actual)
        self.assertEqual(expect,actual)



if __name__ == '__main__':
    unittest.main(verbosity=2)
