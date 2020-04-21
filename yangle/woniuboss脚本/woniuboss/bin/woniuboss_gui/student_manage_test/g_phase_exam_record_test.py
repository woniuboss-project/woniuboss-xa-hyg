from woniuboss.lib.woniuboss_gui.login.decrypt import Decrypt
from woniuboss.lib.woniuboss_gui.student_manage.phase_exam_record import PhaseExamRecord
from woniuboss.tools.woniuboss_gui.service import Service
import unittest
from woniuboss.tools.woniuboss_gui.utility import Utility
from parameterized import parameterized

test_config_info = Utility.get_json('..\\..\\conf\\woniuboss_gui\\testdata_stu_manage.conf')
query_phase_record_info = Utility.get_excel_to_tuple(test_config_info[16])
user_info=Utility.get_excel_to_user(test_config_info[16])

class PhaseExamRecordTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(user_info)
        cls.phase_exam_record = PhaseExamRecord(cls.driver)
        Service.miss_login(cls.driver, user_info)
        Decrypt(cls.driver).do_decrypt(user_info['secondpwd'])

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(query_phase_record_info)
    def test_query_record(cls,class_name,orientation,phase,name,expect):
        count_td = cls.phase_exam_record.do_query_record(class_name,orientation,phase,name)
        if count_td == 8:
            actual = 'test query phase exam record pass'
        else:
            actual = 'test query phase exam record fail'
        cls.assertEqual(expect,actual)