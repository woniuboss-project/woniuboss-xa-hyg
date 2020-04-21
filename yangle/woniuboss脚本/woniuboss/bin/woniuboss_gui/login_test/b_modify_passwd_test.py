import time
from woniuboss.lib.woniuboss_gui.login.modify_password import ModifyPassword
from woniuboss.tools.woniuboss_gui.service import Service
from woniuboss.tools.woniuboss_gui.utility import Utility
import unittest

test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_gui\\testdata_login.conf')
modify_passwd_login_info=Utility.get_excel_to_tuple(test_config_info[1])
login_user_info = Utility.get_excel_to_user_extend(test_config_info[1])

modify_passwd_second_info=Utility.get_excel_to_tuple(test_config_info[2])
second_user_info = Utility.get_excel_to_user_extend(test_config_info[2])

class ModifyPasswdTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(login_user_info[0])
        cls.modify_passwd = ModifyPassword(cls.driver)

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    def test_a_modify_login_pd(cls):
        for one_user_info,one_modify_info in zip(login_user_info,modify_passwd_login_info):
            old = one_modify_info[0]
            new1 = one_modify_info[1]
            new2 = one_modify_info[2]
            expect = one_modify_info[3]
            Service.miss_login(cls.driver,one_user_info)
            cls.modify_passwd.modify_login_pqsswd(old,new1,new2)
            time.sleep(3)
            try:
                if '修改成功' in cls.driver.find_element_by_css_selector(
                        '#panel-password-success>div.modal-body.modal-warning>div>h4').text:
                    actual = 'login: modify password pass'
                    cls.driver.refresh()
                else:
                    content = cls.driver.find_element_by_css_selector('body>div.bootbox.modal.fade.mydialog.in'
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
                    cls.driver.refresh()
            except Exception as e:
                actual = 'login:unknow error'
            if Utility.assert_equals(expect,actual):
                print('test modify login password pass')
            else:
                print('test modify login password fail')

    def test_b_modify_second_pd(cls):
        for one_user_info, one_modify_info in zip(second_user_info, modify_passwd_second_info):
            old = one_modify_info[0]
            new1 = one_modify_info[1]
            new2 = one_modify_info[2]
            expect = one_modify_info[3]
            Service.miss_login(cls.driver,one_user_info)
            cls.modify_passwd.modify_2st_passwd(old,new1,new2)
            if '修改成功' in cls.driver.find_element_by_css_selector(
                    '#panel-password-success>div.modal-body.modal-warning>div>h4').text:
                actual='second: modify password pass'
                cls.driver.refresh()
            else:
                content = cls.driver.find_element_by_css_selector('body>div.bootbox.modal.fade.mydialog.in'
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
                cls.driver.refresh()
            if Utility.assert_equals(expect,actual):
                print('test modify second level password pass')
            else:
                print('test modify second level password fail')

if __name__ == '__main__':
    # ModifyPasswdTest().test_a_modify_login_pd()
    # ModifyPasswdTest().test_b_modify_second_pd()
    unittest.main(verbosity=2)