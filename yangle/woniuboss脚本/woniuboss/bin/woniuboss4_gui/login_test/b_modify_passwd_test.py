import time

from selenium.webdriver.common.by import By

from woniuboss.lib.woniuboss4_gui.login.login import Login
from woniuboss.lib.woniuboss4_gui.login.modify_password import ModifyPassWord
from woniuboss.tools.woniuboss_gui.service import Service
from woniuboss.tools.woniuboss_gui.utility import Utility
import unittest
from parameterized import parameterized
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss4_gui\\login.conf')
modify_passwd_login_info=Utility.get_excel_to_tuple(test_config_info[1])
login_user_info = Utility.get_excel_to_user(test_config_info[1])
modify_passwd_second_info=Utility.get_excel_to_tuple(test_config_info[2])
second_user_info = Utility.get_excel_to_user(test_config_info[2])

class ModifyPasswdTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(login_user_info)
        Login(cls.driver).login(login_user_info)
        cls.modify_passwd = ModifyPassWord(cls.driver)

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(modify_passwd_login_info)
    def test_a_modify_login_passwd(self,old,new1,new2,expect):
        self.modify_passwd.do_modify_login_passwd(old,new1,new2)
        username = login_user_info['username']
        sql = f'update system_user set pwd="B5B1C07C180FEFC77671906F382488F2" where name="{username}"'
        if '修改成功' in self.driver.find_element_by_css_selector(
                '#panel-password-success>div.modal-body.modal-warning>div>h4').text:
            actual = 'login: modify password pass'
            Utility.update_data(login_user_info, sql)
            self.driver.refresh()
        else:
            if Service.is_element_present(self.driver,By.CSS_SELECTOR,'body>div.bootbox.modal.fade.mydialog.in'
                                                              '>div>div>div.modal-body>div'):
                content = self.driver.find_element_by_css_selector('body>div.bootbox.modal.fade.mydialog.in'
                                                              '>div>div>div.modal-body>div').text

                if '新密码和原密码一致' in content:
                    actual = 'login:new vs old is same'
                elif '原密码错误' in content:
                    actual = 'login:old password is wrong'
                elif '请输入原密码' in content:
                    actual = 'login:old passeord is empty'
                elif '两次新密码输入不一致' in content:
                    actual = 'login:new_1st vs new_2st is not equal'
                elif '新密码格式不正确' in content:
                    actual = 'login:new password format is wrong'
                else:
                    actual = 'login:unknow error'
            else:
                actual = 'alert not appear'
            self.driver.refresh()
        self.assertEqual(expect,actual)

    @parameterized.expand(modify_passwd_second_info)
    def test_b_modify_second_passwd(self,old,new1,new2,expect):
        self.modify_passwd.do_modify_second_passwd(old,new1,new2)
        username = login_user_info['username']
        sql = f'update system_user set pwd2="B5B1C07C180FEFC77671906F382488F2" where name="{username}"'
        if '修改成功' in self.driver.find_element_by_css_selector(
                '#panel-password-success>div.modal-body.modal-warning>div>h4').text:
            actual = 'second: modify password pass'
            Utility.update_data(login_user_info, sql)
            time.sleep(5)
            self.driver.refresh()
        else:
            if Service.is_element_present(self.driver, By.CSS_SELECTOR, 'body>div.bootbox.modal.fade.mydialog.in'
                                                                        '>div>div>div.modal-body>div'):
                content = self.driver.find_element_by_css_selector('body>div.bootbox.modal.fade.mydialog.in'
                                                              '>div>div>div.modal-body>div').text

                if '新密码和原密码一致' in content:
                    actual = 'second:new vs old is same'
                elif '原密码错误' in content:
                    actual = 'second:old password is wrong'
                elif '请输入原密码' in content:
                    actual = 'second:old passeord is empty'
                elif '两次新密码输入不一致' in content:
                    actual = 'second:new_1st vs new_2st is not equal'
                elif '新密码格式不正确' in content:
                    actual = 'second:new password format is wrong'
                else:
                    actual = 'second:unknow error'
            else:
                actual = 'alert not appear'
            self.driver.refresh()
        self.assertEqual(expect,actual)


