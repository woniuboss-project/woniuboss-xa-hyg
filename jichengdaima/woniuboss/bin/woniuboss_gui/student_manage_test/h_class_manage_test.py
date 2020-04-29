from woniuboss.lib.woniuboss_gui.login.decrypt import Decrypt
from woniuboss.lib.woniuboss_gui.student_manage.class_manage import ClassManage
import time
from woniuboss.tools.woniuboss_gui.service import Service
import unittest
from woniuboss.tools.woniuboss_gui.utility import Utility
from parameterized import parameterized
test_config_info = Utility.get_json('..\\..\\conf\\woniuboss_gui\\testdata_stu_manage.conf')
query_info = Utility.get_excel_to_tuple(test_config_info[17])
user_info=Utility.get_excel_to_user(test_config_info[17])
seperate_class_info = Utility.get_excel_to_tuple(test_config_info[18])

class ClassManageTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(user_info)
        cls.class_manage = ClassManage(cls.driver)
        Service.miss_login(cls.driver, user_info)
        Decrypt(cls.driver).do_decrypt(user_info['secondpwd'])

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(query_info)
    def test_a_query_stu_info(cls,name,expect):
        sum_td = cls.class_manage.do_query_info(name)
        print(sum_td)
        if sum_td == 6:
            actual = 'test query stu_info pass'
        else:
            actual = 'test query stu_info fail'
        cls.assertEqual(expect,actual)

    @parameterized.expand(seperate_class_info)
    def test_b_seperate_class(cls,class_name,orientation,expect):
        text1= cls.class_manage.do_seperate_class(class_name,orientation)
        time.sleep(5)
        sum_start = text1.split('总共 ')[1].split(' 条')[0]

        print(sum_start)
        ele_text = cls.driver.find_element_by_css_selector('body > div.bootbox.modal.fade.mydialog.in > div > div >'
                                                           ' div.modal-body > div').text
        if '至少勾选' in ele_text or '请选择' in ele_text:
            actual = 'test seperate class fail'
            cls.driver.refresh()
        elif '确定将勾选的' in ele_text:
            cls.driver.find_element_by_css_selector('body > div.bootbox.modal.fade.mydialog.in > div > div > '
                                                    'div.modal-footer > button.btn.btn-primary').click()
            time.sleep(2)
            cls.driver.find_element_by_css_selector('body > div.bootbox.modal.fade.mydialog.in > div '
                                                    '> div > div.modal-footer > button').click()
            text2 = cls.class_manage.get_text()
            sum_end = text2.split('总共 ')[1].split(' 条')[0]
            print(sum_end)
            if int(sum_start) - int(sum_end) == 1:
                actual = 'test seperate class pass'
            else:
                actual = 'test seperate class fail'

        else:
            actual = 'test seperate class fail'
            cls.driver.refresh()
        cls.assertEqual(expect, actual)