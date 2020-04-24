import time
from selenium.webdriver.common.by import By
from woniuboss.lib.woniuboss4_gui.login.decrypt import Decrypt
from woniuboss.lib.woniuboss4_gui.login.login import Login
from woniuboss.lib.woniuboss4_gui.teaching_manage.overtime_application import OverTimeApplication
from woniuboss.tools.woniuboss_gui.service import Service
import unittest
from woniuboss.tools.woniuboss_gui.utility import Utility
from parameterized import parameterized

test_config_info=Utility.get_json('..\\..\\..\\conf\\woniuboss4_gui\\teaching_manage.conf')
query_application_info = Utility.get_excel_to_tuple(test_config_info[9])
user_info = Utility.get_excel_to_user(test_config_info[9])
add_application_info = Utility.get_excel_to_tuple(test_config_info[10])
undo_application_info = Utility.get_excel_to_tuple(test_config_info[11])

class OverTimeApplicationTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(user_info)
        cls.overtime_application = OverTimeApplication(cls.driver)
        Login(cls.driver).login(user_info)
        Decrypt(cls.driver).do_decrypt(user_info['secondpwd'])

    # @classmethod
    # def tearDownClass(cls):
    #     cls.driver.quit()

    @parameterized.expand(query_application_info)
    def test_a_query_overtime_application(self,status,code,s_time,e_time,expect):
        count_text = self.overtime_application.do_query_overtime_application(status,code,s_time,e_time)
        if '总共' in count_text:
            actual = 'test query overtime application pass'
        else:
            actual = 'test query overtime application fail'
        self.assertEqual(expect,actual)

    @parameterized.expand(add_application_info)
    def test_b_add_overtime_application(self,s_time,e_time,way,hours,region,reason,expect):
        sql = 'select count(*) from apply'
        db_result1 = Utility.query_one(user_info,sql)
        alert_text = self.overtime_application.do_add_overtime_application(s_time,e_time,way,hours,region,reason)
        db_result2 = Utility.query_one(user_info,sql)
        if '加班申请已提交' in alert_text and db_result2[0] - db_result1[0] == 1:
            actual = 'test add overtime application pass'
        else:
            actual = 'test add overtime application fail'
        self.driver.refresh()
        self.assertEqual(expect,actual)

    @parameterized.expand(undo_application_info)
    def test_c_undo_overtime_application(self,unkonw,expect):
        attr1,attr2 = self.overtime_application.do_undo_action()
        attr_dict = attr1.split('(')[1].split(')')[0]
        import json
        dict_attr = json.loads(attr_dict, encoding='utf-8')
        id = dict_attr['id']
        sql1 = f'select status from apply where id ={id}'
        db_result = Utility.query_one(user_info,sql1)
        time.sleep(2)
        status_text = self.overtime_application.get_line1_status()
        if '已撤销' in status_text and db_result[0] == '04' and attr2 == 'true':
            actual = 'test undo overtime application pass'
            sql2 = f"UPDATE apply SET status='03' WHERE (`id`='{id}')"
            Utility.update_data(user_info,sql2)
        else:
            actual = 'test undo overtime application fail'
        self.assertEqual(expect,actual)

