import time

from selenium.webdriver.common.by import By

from woniuboss.lib.woniuboss_gui.login.decrypt import Decrypt
from woniuboss.lib.woniuboss_gui.student_manage.basic_info import BasicInfo
from woniuboss.tools.woniuboss_gui.service import Service
import unittest
from woniuboss.tools.woniuboss_gui.utility import Utility
from parameterized import parameterized
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_gui\\testdata_stu_manage.conf')
search_stu_info = Utility.get_excel_to_tuple(test_config_info[0])
search_stu_user_info = Utility.get_excel_to_user(test_config_info[0])

modify_stu_info = Utility.get_excel_to_tuple(test_config_info[1])
modify_stu_user_info = Utility.get_excel_to_user(test_config_info[1])

class BasicInfoTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(search_stu_user_info)
        cls.basic_info = BasicInfo(cls.driver)
        Service.miss_login(cls.driver,search_stu_user_info)
        Decrypt(cls.driver).do_decrypt(search_stu_user_info['secondpwd'])

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(search_stu_info)
    def test_a_serach_stu_info(cls,class_name,orien_name,status_name,stu_name,stu_no,expect):
        cls.basic_info.do_search_student(class_name,orien_name,status_name,stu_name,stu_no)
        time.sleep(5)
        sum_td = cls.basic_info.count_td()
        if sum_td == 12:
            actual = 'test query stu_info pass'
        else:
            actual = 'test query stu_info fail'
        cls.assertEqual(expect,actual)

    @parameterized.expand(modify_stu_info)
    def test_b_modify_stu_info(cls,name,stu_no,stu_tel,stu_mail,stu_qq,school,major,id_num,age,pacture_path,expect):
        cls.basic_info.do_modify_stu_info(name,stu_no,stu_tel,stu_mail,stu_qq,school,major,id_num,age,pacture_path)
        if Service.is_element_present(cls.driver,By.CSS_SELECTOR,'body > div.bootbox.modal.fade.mydialog.in > div > '
                                                                 'div > div.modal-body > div'):
            if '修改失败' in cls.driver.find_element_by_css_selector('body > div.bootbox.modal.fade.mydialog.in >'
                                                                 ' div > div > div.modal-body > div').text:
                actual = 'test modify stu_info fail'

            else:
                actual = 'test modify stu_info fail'
            cls.driver.refresh()
        else:
            actual = 'test modify stu_info pass'
        cls.assertEqual(expect,actual)



if __name__ == '__main__':
    unittest.main(verbosity=2)