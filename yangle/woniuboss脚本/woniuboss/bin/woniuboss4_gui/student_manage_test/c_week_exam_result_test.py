import time
from selenium.webdriver.common.by import By
from woniuboss.lib.woniuboss4_gui.login.decrypt import Decrypt
from woniuboss.lib.woniuboss4_gui.login.login import Login
from woniuboss.lib.woniuboss4_gui.student_manage.week_exam_result import WeekExamResult
from woniuboss.tools.woniuboss_gui.service import Service
import unittest
from woniuboss.tools.woniuboss_gui.utility import Utility
from parameterized import parameterized

test_config_info=Utility.get_json('..\\..\\conf\\woniuboss4_gui\\stu_manage.conf')
query_week_exam_info = Utility.get_excel_to_tuple(test_config_info[5])
user_info = Utility.get_excel_to_user(test_config_info[5])
entry_sigle_exam_info = Utility.get_excel_to_tuple(test_config_info[6])
upload_exam_info = Utility.get_excel_to_tuple(test_config_info[7])

class WeekExamResultTest(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(user_info)
        cls.week_exam = WeekExamResult(cls.driver)
        Login(cls.driver).login(user_info)
        Decrypt(cls.driver).do_decrypt(user_info['secondpwd'])

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(query_week_exam_info)
    def test_a_query_week_exam_info(self,class_name,stu_name,expect):
        self.week_exam.do_query_week_exam_info(class_name,stu_name)
        time.sleep(2)
        if class_name == '全部':
            re_class = '%'
        else:
            re_class = class_name
        if stu_name == '':
            re_name = '%'
        else:
            re_name = stu_name
        sql = f"select count(*) from student where student_class_id in (select class_id from class where class_no like '{re_class}' " \
              f") and status like '02' and student_name like '{re_name}%'"
        db_result = Utility.query_one(user_info, sql)
        sum_text = self.driver.find_element_by_css_selector('#stagetest > div.bootstrap-table > div.fixed-table-container >'
                                                 ' div.fixed-table-pagination > div.pull-left.pagination-detail >'
                                                 ' span.pagination-info').text
        if '总共' in sum_text:
            sum_num = sum_text.split('总共 ')[1].split(' 条')[0]
            if db_result[0] == int(sum_num):
                actual = 'test query week exam pass'
            else:
                actual = 'test query week exam fail'
        else:
            actual = 'test query week exam fail'
        self.assertEqual(expect,actual)

    @parameterized.expand(entry_sigle_exam_info)
    def test_b_entry_sigle_exam(self,class_name,phase,week,score,expect):
        self.week_exam.do_entry_sigle_score(class_name,phase,week,score)
        if Service.is_element_present(self.driver,By.CSS_SELECTOR,'body > div.bootbox.modal.fade.mydialog.in'
                                                                  ' > div > div'):
            actual = 'test entry sigle exam fail'
            self.driver.refresh()
        else:
            ele = self.driver.find_element_by_css_selector('#pe-result > tbody > tr:nth-child(1) > '
                                                           'td:nth-child(9) > button')
            attr = ele.get_attribute('onclick')
            print(attr)
            attr_dict = attr.split('(')[1].split(')')[0]
            import json
            dict_attr = json.loads(attr_dict, encoding='utf-8')
            student_id = dict_attr['student_id']
            phase1_score = dict_attr['phase1']
            sql1 = f"select AVG(score) from week_exam where week_exam_student_id='{student_id}' and phase='01'"
            db_result = Utility.query_one(user_info,sql1)
            print(db_result, phase1_score)
            if db_result[0] == int(phase1_score):
                actual = 'test entry sigle exam pass'
            else:
                actual = 'test entry sigle exam fail'
        self.assertEqual(expect,actual)

    @parameterized.expand(upload_exam_info)
    def test_c_upload_exam(self,class_name,phase,week,file_path,expect):
        sql = 'select count(*) from week_exam'
        db_result1 = Utility.query_one(user_info,sql)
        self.week_exam.do_upload_week_exam(class_name,phase,week,file_path)
        time.sleep(5)
        db_result2 = Utility.query_one(user_info,sql)
        print(db_result1,db_result2)
        if Service.is_element_present(self.driver,By.CSS_SELECTOR,'body > div.bootbox.modal.fade.'
                                                                  'mydialog.in > div > div'):
            actual = 'test upload exam file fail'
            self.driver.refresh()
        else:
            if db_result2[0] - db_result1[0] >= 1:
                actual = 'test upload exam file pass'
            else:
                actual = 'test upload exam file fail'
        self.assertEqual(expect,actual)

