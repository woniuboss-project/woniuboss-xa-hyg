import time

from selenium.webdriver.common.by import By

from woniuboss.lib.woniuboss_gui.login.decrypt import Decrypt
from woniuboss.lib.woniuboss_gui.student_manage.take_leave import TakeLeave

from woniuboss.tools.woniuboss_gui.service import Service
import unittest
from woniuboss.tools.woniuboss_gui.utility import Utility
from parameterized import parameterized

test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_gui\\testdata_stu_manage.conf')
query_leave_info = Utility.get_excel_to_tuple(test_config_info[6])
user_info=Utility.get_excel_to_user(test_config_info[6])

add_leave_info = Utility.get_excel_to_tuple(test_config_info[7])
upload_permit_info = Utility.get_excel_to_tuple(test_config_info[8])
modify_leave_info = Utility.get_excel_to_tuple(test_config_info[9])
cancel_leave_info = Utility.get_excel_to_tuple(test_config_info[10])

class TakeLeaveTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(user_info)
        cls.take_leave = TakeLeave(cls.driver)
        Service.miss_login(cls.driver, user_info)
        Decrypt(cls.driver).do_decrypt(user_info['secondpwd'])

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(query_leave_info)
    def test_a_query_leave(cls,unknow,expect):
        cls.take_leave.do_query_leave()
        time.sleep(5)
        page_lines=cls.take_leave.get_leave_record()
        sql = 'select count(*) from student_leave where create_time >"2020-03-01" and leave_status="请假中"'
        db_result = Utility.query_one(user_info, sql)
        if db_result[0] == page_lines:
            actual = 'test query leave pass'

        else:
            actual = 'test query leave fail'
        cls.assertEqual(expect,actual)

    @parameterized.expand(add_leave_info)
    def test_b_add_leave(cls,s_time,e_time,type,days,name,reason,comment,expect):
        sql = 'select count(*) from student_leave where create_time >"2020-03-01" and leave_status="请假中"'
        db_result1 = Utility.query_one(user_info, sql)
        attr = cls.take_leave.do_add_leave(s_time,e_time,type,days,name,reason,comment)
        get_obj = attr.split('(')[1].split(')')[0]
        import json
        dict_attr = json.loads(get_obj, encoding='utf-8')
        student_name = dict_attr['student_name']
        db_result2 = Utility.query_one(user_info, sql)
        if Service.wait_until_element_is_visible(cls.driver,By.CSS_SELECTOR,
                                                 'body > div.bootbox.modal.fade.mydialog.in > div > '
                                                        'div > div.modal-body > div')\
                and db_result2[0] - db_result1[0] == 0 and student_name != name:
            actual = 'test add leave fail'
            cls.driver.refresh()
        else:
            actual = 'test add leave pass'
        cls.assertEqual(expect,actual)

    @parameterized.expand(upload_permit_info)
    def test_c_upload_picture(self,path,expect):
        attr = self.take_leave.do_upload_leave_permit(path)
        print(attr)
        get_obj = attr.split('(')[1].split(')')[0]
        import json
        dict_attr = json.loads(get_obj, encoding='utf-8')
        leave_id = int(dict_attr['leave_id'])
        sql = 'select path from student_leave where leave_id=%d'%leave_id
        db_result = Utility.query_one(user_info,sql)
        if db_result != None:
            actual = 'test upload picture pass'
        else:
            actual = 'test upload picture fail'
        self.assertEqual(expect,actual)


    @parameterized.expand(modify_leave_info)
    def test_d_modify_leave(cls,s_time,e_time,type,days,name,teacher,reason,comment,expect):
        cls.take_leave.do_modify_leave(s_time,e_time,type,days,name,teacher,reason,comment)
        time.sleep(5)
        ele_text = cls.driver.find_element_by_id('modLeave-modal').get_attribute('style')
        if 'none' in ele_text:
            actual = 'test modify take leave pass'

        else:
            actual = 'test modify take leave fail'
        cls.assertEqual(expect,actual)

    @parameterized.expand(cancel_leave_info)
    def test_e_cancel_leave(cls,unknow,expect):
        attr = cls.take_leave.do_cancel_leave()
        get_obj=attr.split('(')[1].split(')')[0]
        import json
        dict_attr = json.loads(get_obj,encoding='utf-8')
        leave_id = dict_attr['leave_id']
        sql = f'select leave_status from student_leave where leave_id={leave_id}'
        db_result = Utility.query_one(user_info,sql)
        if db_result[0] == '已销假':
            actual = 'test cancel leave record pass'
        else:
            actual = 'test cancel leave record fail'
        cls.assertEqual(expect,actual)




if __name__ == '__main__':
    unittest.main(verbosity=2)
