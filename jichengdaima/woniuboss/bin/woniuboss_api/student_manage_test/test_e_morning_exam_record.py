import unittest
from woniuboss.lib.woniuboss_api.student_manage.morning_exam_record import MorningExamRecord
from parameterized import parameterized
from woniuboss.tools.woniuboss_api.utility import Utility
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_api\\testdata_stu_manage.conf')
click_exam_morning_record_info=Utility.get_excel_to_tuple(test_config_info[13])
add_user_info = Utility.get_excel_to_user(test_config_info[13])

class TestMorningExamRecord(unittest.TestCase):
    @parameterized.expand(click_exam_morning_record_info)
    def test_click_exam_morning_record(self,url,post,data,status_code,expect):
        click_exam_morning_record_resp=MorningExamRecord(add_user_info).click_morning_exam_record(url,data)
        result=click_exam_morning_record_resp.json()['totalRow']
        if result == 19:
            actual='query morning record pass'
        else:
            actual='query morning record fail'
        self.assertEqual(expect,actual)

if __name__ == '__main__':
    unittest.main(verbosity=2)