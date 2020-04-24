# 该模块封装与登录相关的测试
from parameterized import parameterized
from selenium.webdriver.common.by import By
from woniuboss4.common.login import Login
from woniuboss4.unit.service import Service
from woniuboss4.unit.utility import Unitily
import unittest
test_config_info=Unitily.get_json('..\\confing\\testdata_login.conf')


#准备数据
login_info=Unitily.get_excel_to_tuple(test_config_info[0])
add_user_info =Unitily.get_excel_to_user(test_config_info[0])
class LoginTest(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(add_user_info)
        cls.login = Login(cls.driver)

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(login_info)
    def testLogin(cls,uname,upass,ucode,expect):

        # report =Service.get_driver(add_user_info)
        login_data = {'username': uname, 'password': upass,'code':ucode }
        cls.login.do_login(add_user_info,login_data)

        if Service.wait_until_element_is_visible(cls.driver,By.LINK_TEXT, '注销'):
            actual = 'test login pass'
            cls.driver.find_element_by_link_text('注销').click()
        else:
            actual = 'test login fail'
            cls.driver.refresh()
        cls.assertEqual(expect,actual)
if __name__ == '__main__':
   unittest.main(verbosity=2)




