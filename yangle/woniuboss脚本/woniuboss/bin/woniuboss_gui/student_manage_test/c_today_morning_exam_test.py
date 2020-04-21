from woniuboss.lib.woniuboss_gui.login.decrypt import Decrypt
from woniuboss.lib.woniuboss_gui.student_manage.today_morning_exam import TodayMorningExam
from woniuboss.tools.woniuboss_gui.service import Service
import unittest
from woniuboss.tools.woniuboss_gui.utility import Utility
from parameterized import parameterized

test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_gui\\testdata_stu_manage.conf')
today_morning_exam_info = Utility.get_excel_to_tuple(test_config_info[5])
today_morning_exam_user_info = Utility.get_excel_to_user(test_config_info[5])

class TodayMorningExamTest(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(today_morning_exam_user_info)
        cls.today_morning_exam = TodayMorningExam(cls.driver)
        Service.miss_login(cls.driver, today_morning_exam_user_info)
        Decrypt(cls.driver).do_decrypt(today_morning_exam_user_info['secondpwd'])

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(today_morning_exam_info)
    def test_today_morning_exam(cls,method,score,question,expect):
        import time
        local_time = time.strftime('%Y-%m-%d', time.localtime(time.time()))
        sql = f'select count(*) from morn_exam where create_time like "{local_time}%"'
        db_result1 = Utility.query_one(today_morning_exam_user_info, sql)
        cls.today_morning_exam.do_morning_exam(method,score,question)

        db_result2 = Utility.query_one(today_morning_exam_user_info, sql)
        num = db_result2[0] - db_result1[0]
        if num == 1:
            actual = 'test today morning exam pass'
            sql_del = 'delete from morn_exam order by morn_exam_id desc limit 1'
            Utility.update_data(today_morning_exam_user_info,sql_del)
        else:
            actual = 'test today morning exam fail'

        cls.assertEqual(expect,actual)

if __name__ == '__main__':
    unittest.main(verbosity=2)
