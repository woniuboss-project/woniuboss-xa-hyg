
# 该模块封装与登录相关的测试
from time import sleep

from parameterized import parameterized
from selenium.webdriver.common.by import By
from woniuboss.lib.woniuboss_4_gui.login.login import Login
from woniuboss.tools.woniuboss_4_gui.service import Service
from woniuboss.tools.woniuboss_4_gui.utility import Utility
import unittest
test_config_info=Utility.get_json('..\\..\\..\\conf\\woniuboss_4_gui\\testdata.conf')

#在该页面调试时test_config_info里需要多加一层跳出"..\\",testdata也需要多加一层
#准备数据
login_info=Utility.get_excel_to_tuple(test_config_info[0])
add_user_info = Utility.get_excel_to_user(test_config_info[0])
print(login_info)
print(add_user_info['username'])
class LoginTest(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(add_user_info)

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(login_info)
    def testLogin(cls,uname,upass,ucode,expect):

        # driver =Service.get_driver(add_user_info)
        login_data = {'username': add_user_info['username'], 'password': add_user_info['password'],'code':'0000'}
        Login(cls.driver).do_login(add_user_info,login_data)
        Service.click_text(cls.driver, '行政综合')
        Service.decryption(cls.driver)
        Service.click_text(cls.driver, '就业培训')
        sleep(5)
        if cls.driver.find_element_by_link_text('注销'):
            actual = 'loogin_correct'
            # cls.driver.find_element_by_link_text('注销').click()
        else:
            actual = 'loogin_failed'
            cls.driver.refresh()
        cls.assertEqual(actual, expect)
        sleep(5)
        Service.restart(cls)


    @parameterized.expand(login_info)
    def test_Login(cls,uname,upass,ucode,expect):

        # driver =Service.get_driver(add_user_info)
        login_data = {'username': add_user_info['username'], 'password': add_user_info['password'],'code':'0000'}
        Login(cls.driver).do_login(add_user_info,login_data)
        Service.click_text(cls.driver, '行政综合')
        Service.decryption(cls.driver)
        if cls.driver.find_element_by_link_text('注销'):
            actual = 'loogin_correct'
            # cls.driver.find_element_by_link_text('注销').click()
        else:
            actual = 'loogin_failed'
            cls.driver.refresh()
        cls.assertEqual(actual, expect)
        sleep(5)
        Service.restart(cls)

    @parameterized.expand(login_info)
    def test_Login_T(cls,uname,upass,ucode,expect):

        Service.login_account(cls, add_user_info)
        Service.click_text(cls.driver, '行政综合')
        Service.decryption(cls.driver)
        if cls.driver.find_element_by_link_text('注销'):
            actual = 'loogin_correct'
            # cls.driver.find_element_by_link_text('注销').click()
        else:
            actual = 'loogin_failed'
            cls.driver.refresh()
        cls.assertEqual(actual, expect)
        sleep(5)
        Service.restart(cls)


if __name__ == '__main__':
   unittest.main(verbosity=2)

