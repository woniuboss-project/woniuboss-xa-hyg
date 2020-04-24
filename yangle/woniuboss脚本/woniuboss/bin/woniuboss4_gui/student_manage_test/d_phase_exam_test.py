import time
from selenium.webdriver.common.by import By
from woniuboss.lib.woniuboss4_gui.login.decrypt import Decrypt
from woniuboss.lib.woniuboss4_gui.login.login import Login
from woniuboss.lib.woniuboss4_gui.student_manage.phase_exam import PhaseExam
from woniuboss.tools.woniuboss_gui.service import Service
import unittest
from woniuboss.tools.woniuboss_gui.utility import Utility
from parameterized import parameterized

test_config_info=Utility.get_json('..\\..\\..\\conf\\woniuboss4_gui\\stu_manage.conf')
import_sigle_phase_info = Utility.get_excel_to_tuple(test_config_info[8])
user_info = Utility.get_excel_to_user(test_config_info[8])
import_all_phase_info = Utility.get_excel_to_tuple(test_config_info[9])

class PhaseExamTest(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(user_info)
        cls.phase_exam = PhaseExam(cls.driver)
        Login(cls.driver).login(user_info)
        Decrypt(cls.driver).do_decrypt(user_info['secondpwd'])

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(import_sigle_phase_info)
    def test_a_entry_sigle_phase_exam(self,class_name,score,phase,comment,expect):
        self.phase_exam.do_entry_sigle_phase_exam(class_name,score,phase,comment)
        if Service.is_element_present(self.driver,By.CSS_SELECTOR,'body > div.bootbox.modal.fade.mydialog.in > '
                                                                  'div > div'):
            actual = 'test import sigle phase exam fail'
            self.driver.refresh()
        else:
            ele = self.driver.find_element_by_css_selector( '#pe-result > tbody > tr:nth-child(1) > '
                                                            'td:nth-child(9) > button')
            attr = ele.get_attribute('onclick')
            print(attr)
            attr_dict = attr.split('(')[1].split(')')[0]
            import json
            dict_attr = json.loads(attr_dict, encoding='utf-8')
            student_id = dict_attr['student_id']
            phase1_score = dict_attr['phase1']
            phase2_score = dict_attr['phase2']
            phase3_score = dict_attr['phase3']
            phase4_score = dict_attr['phase4']
            sql = f"select score from phase_exam where phase_exam_student_id ='{student_id}' and phase_exam_class_id = '4' order by phase asc"
            db_result = Utility.query_all(user_info, sql)
            print(db_result)
            num = len(db_result)
            print(num)
            print(float(db_result[0][0]))
            print(float(phase1_score))
            if num == 1:
                if float(db_result[0][0]) == float(phase1_score):
                    actual = 'test import sigle phase exam pass'
                else:
                    actual = 'test import sigle phase exam fail'
            elif num == 2:
                if float(db_result[0][0]) == float(phase1_score) and float(db_result[1][0]) == float(phase2_score):
                    actual = 'test import sigle phase exam pass'
                else:
                    actual = 'test import sigle phase exam fail'
            elif num == 3:
                if float(db_result[0][0]) == float(phase1_score) and float(db_result[1][0]) == float(phase2_score) and \
                        float(db_result[2][0]) == float(phase3_score):
                    actual = 'test import sigle phase exam pass'
                else:
                    actual = 'test import sigle phase exam fail'
            elif num == 4:
                if float(db_result[0][0]) == float(phase1_score) and float(db_result[1][0]) == float(phase2_score) and float(db_result[2][0]) == float(phase3_score)\
                         and float(db_result[3][0]) == float(phase4_score):
                    actual = 'test import sigle phase exam pass'
                else:
                    actual = 'test import sigle phase exam fail'
            else:
                actual = 'test import sigle phase exam fail'
        self.assertEqual(expect,actual)

    @parameterized.expand(import_all_phase_info)
    def test_b_import_all_phase_exam(self,class_name,phase,file_path,expect):
        sql = 'select count(*) from phase_exam'
        db_result1 = Utility.query_one(user_info,sql)
        self.phase_exam.do_import_phase_exam(class_name,phase,file_path)
        db_result2 = Utility.query_one(user_info,sql)
        if Service.is_element_present(self.driver,By.CSS_SELECTOR,'body > div.bootbox.modal.fade.mydialog.in > div > div'):
            actual = 'test import all phase exam fail'
            self.driver.refresh()
        else:
            if db_result2[0] - db_result1[0] >= 1:
                actual = 'test import all phase exam pass'
            else:
                actual = 'test import all phase exam fail'
        self.assertEqual(expect,actual)