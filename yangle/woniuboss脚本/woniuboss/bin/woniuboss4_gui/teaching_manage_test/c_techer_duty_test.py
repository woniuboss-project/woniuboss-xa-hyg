import time
from selenium.webdriver.common.by import By
from woniuboss.lib.woniuboss4_gui.login.decrypt import Decrypt
from woniuboss.lib.woniuboss4_gui.login.login import Login
from woniuboss.lib.woniuboss4_gui.teaching_manage.teacher_on_duty import TeacherOnDuty
from woniuboss.tools.woniuboss_gui.service import Service
import unittest
from woniuboss.tools.woniuboss_gui.utility import Utility
from parameterized import parameterized

test_config_info=Utility.get_json('..\\..\\..\\conf\\woniuboss4_gui\\teaching_manage.conf')
query_teacher_duty_info = Utility.get_excel_to_tuple(test_config_info[5])
user_info = Utility.get_excel_to_user(test_config_info[5])
refer_to_duty_info = Utility.get_excel_to_tuple(test_config_info[6])
add_logs_info = Utility.get_excel_to_tuple(test_config_info[7])
modify_duty_info = Utility.get_excel_to_tuple(test_config_info[8])

class TeacherDutyTest(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(user_info)
        cls.teacher_duty = TeacherOnDuty(cls.driver)
        Login(cls.driver).login(user_info)
        Decrypt(cls.driver).do_decrypt(user_info['secondpwd'])

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(query_teacher_duty_info)
    def test_a_query_duty_info(self,status,id,s_time,e_time,expect):
        sum_text = self.teacher_duty.do_query_duty_info(status,id,s_time,e_time)
        # sum_num = sum_text.split('总共 ')[1].split(' 条')[0]
        if '总共' in sum_text:
            actual = 'query teacher duty pass'
        else:
            actual = 'query teacher duty fail'
        self.assertEqual(expect,actual)

    @parameterized.expand(refer_to_duty_info)
    def test_b_refer_to_duty(self,who,date,expect):
        sql = 'select count(*) from duty'
        db_result1 = Utility.query_one(user_info,sql)
        self.teacher_duty.do_refer_to_duty(who,date)
        db_result2 = Utility.query_one(user_info,sql)
        ele_text = self.driver.find_element_by_css_selector('body > div.bootbox.modal.fade.mydialog.in > div > div '
                                                            '> div.modal-body > div').text
        if '新增值班成功' in ele_text and db_result2[0] - db_result1[0] == 1:
            actual = 'test refer to duty pass'
        else:
            actual = 'test refer to duty fail'
        self.driver.refresh()
        self.assertEqual(expect,actual)

    @parameterized.expand(add_logs_info)
    def test_c_add_logs(self,s_time,e_time,hour,way,logs,expect):
        attr = self.teacher_duty.do_add_logs(s_time,e_time,hour,way,logs)
        attr_dict = attr.split('(')[1].split(')')[0]
        import json
        dict_attr = json.loads(attr_dict, encoding='utf-8')
        id = dict_attr['id']
        sql = f'update duty set log_status = "01" where id = {id}'
        ele_text = self.driver.find_element_by_css_selector('body > div.bootbox.modal.fade.mydialog.in > div > div > '
                                                            'div.modal-body > div').text
        if '日志填写成功' in ele_text:
            actual = 'test add duty logs pass'
            Utility.update_data(user_info,sql)
        else:
            actual = 'test add duty logs fail'
        self.driver.refresh()
        self.assertEqual(expect,actual)

    @parameterized.expand(modify_duty_info)
    def test_d_modify_duty(self,person,date,expect):
        self.teacher_duty.do_modify_duty(person,date)
        ele_text = self.driver.find_element_by_css_selector('body > div.bootbox.modal.fade.mydialog.in > div > div '
                                                            '> div.modal-body > div').text
        if '修改成功' in ele_text:
            actual = 'test modify duty pass'
        else:
            actual = 'test modify duty fail'
        self.assertEqual(expect,actual)


