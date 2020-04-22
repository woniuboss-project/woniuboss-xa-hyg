import time
from selenium.webdriver.common.by import By
from woniuboss.lib.woniuboss4_gui.login.decrypt import Decrypt
from woniuboss.lib.woniuboss4_gui.login.login import Login
from woniuboss.lib.woniuboss4_gui.student_manage.daily_exam import DailyExam
from woniuboss.tools.woniuboss_gui.service import Service
import unittest
from woniuboss.tools.woniuboss_gui.utility import Utility
from parameterized import parameterized

test_config_info=Utility.get_json('..\\..\\..\\conf\\woniuboss4_gui\\stu_manage.conf')
homework_info = Utility.get_excel_to_tuple(test_config_info[2])
user_info = Utility.get_excel_to_user(test_config_info[2])
morning_exam_info = Utility.get_excel_to_tuple(test_config_info[3])
do_all_homework_info = Utility.get_excel_to_tuple(test_config_info[4])

class DailyExamTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(user_info)
        cls.daily_exam = DailyExam(cls.driver)
        Login(cls.driver).login(user_info)
        Decrypt(cls.driver).do_decrypt(user_info['secondpwd'])

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(homework_info)
    def test_a_click_homework(self,level,expect):
        attr = self.daily_exam.do_click_homework_btn(level)
        attr_dict = attr.split('(')[1].split(',$')[0]
        import json
        dict_attr = json.loads(attr_dict, encoding='utf-8')
        homeword_id = dict_attr['homework_id']
        sql = f'select result from homework where homework_id = {homeword_id}'
        db_result = Utility.query_one(user_info,sql)
        if db_result:
            if db_result[0] == '01':
                re = '忧'
            elif db_result[0] == '02':
                re = '良'
            elif db_result[0] == '03':
                re = '中'
            elif db_result[0] == '04':
                re = '查'
            else:
                re = '未交'
        else:
            re = ''
        if re == level:
            actual = 'test do homework pass'
        else:
            actual = 'test do homework fail'
        self.assertEqual(expect,actual)

    @parameterized.expand(morning_exam_info)
    def test_b_click_morning_exam(self,level,expect):
        attr = self.daily_exam.do_click_morning_exam(level)
        attr_dict = attr.split('(')[1].split(',$')[0]
        import json
        dict_attr = json.loads(attr_dict, encoding='utf-8')
        student_id = dict_attr['student_id']
        sql = f'select result from morn_exam where morn_exam_student_id = {student_id} ' \
              f'order by morn_exam_id desc limit 1'
        db_result = Utility.query_one(user_info,sql)
        if db_result:
            if db_result[0] == '01':
                re = '优'
            elif db_result[0] == '02':
                re = '良'
            elif db_result[0] == '03':
                re = '中'
            elif db_result[0] == '04':
                re = '查'
            else:
                re = '未交'
        else:
            re = ''
        if re == level:
            actual = 'test do morning exam pass'
        else:
            actual = 'test do morning exam fail'
        self.assertEqual(expect,actual)

    @parameterized.expand(do_all_homework_info)
    def test_c_do_all_homework(self,unknow,expect):
        self.daily_exam.do_click_do_all_work()
        if Service.is_element_present(self.driver,By.CSS_SELECTOR,'body > div.bootbox.modal.fade.mydialog.in > div > div'):
            text = self.driver.find_element_by_css_selector('body > div.bootbox.modal.fade.mydialog.in > div > '
                                                            'div > div.modal-body > div').text
            print(text)
            if '录入完毕' in text:
                actual = 'test do all homework pass'
            else:
                actual = 'test do all homework fail'
        else:
            actual = 'test do all homework fail'
        self.assertEqual(expect,actual)
