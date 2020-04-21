import time

from selenium.common.exceptions import NoAlertPresentException

from woniuboss.lib.woniuboss_gui.corpor_ate_customers.corporate_customers import CorporateCustomers
from woniuboss.lib.woniuboss_gui.login.decrypt import Decrypt
from woniuboss.tools.woniuboss_gui.service import Service
import unittest
from woniuboss.tools.woniuboss_gui.utility import Utility
from parameterized import parameterized

test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_gui\\corporate_customers.conf')
search_enterprise_info = Utility.get_excel_to_tuple(test_config_info[0])
user_info = Utility.get_excel_to_user(test_config_info[0])
add_enterp_info = Utility.get_excel_to_tuple(test_config_info[1])
modify_enterp_info = Utility.get_excel_to_tuple(test_config_info[2])

class CorporateTest(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(user_info)
        cls.enterprise_info = CorporateCustomers(cls.driver)
        Service.miss_login(cls.driver, user_info)
        Decrypt(cls.driver).do_decrypt(user_info['secondpwd'])

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(search_enterprise_info)
    def test_a_query_enterprise_info(self,name,expect):
        sum_td = self.enterprise_info.do_query_ent_info(name)
        if sum_td == 7:
            actual = 'test query enterprise info pass'
        else:
            actual = 'test query enterprise info fail'
        self.assertEqual(expect,actual)

    @parameterized.expand(add_enterp_info)
    def test_b_add_enterprise(self,enter_name,ent_industry,enter_address,enter_person,enter_tel,email,qq,expect):
        sql = 'select count(*) from enterprise_info'
        db_result1 = Utility.query_one(user_info,sql)
        content = self.enterprise_info.do_add_enterprise(enter_name,ent_industry,enter_address,enter_person,enter_tel,email,qq)
        db_result2 = Utility.query_one(user_info,sql)
        result = db_result2[0] - db_result1[0]
        time.sleep(5)
        if "不能为空" in content:
            actual = 'test add corporate customer fail'
            self.enterprise_info.click_close_btn()
        elif '新增成功' in content:
            if result == 1:
                actual = 'test add corporate customer pass'
            else:
                actual = 'test add corporate customer fail'
        else:
            actual = 'test add corporate customer fail'
        self.driver.refresh()
        self.assertEqual(expect,actual)

    @parameterized.expand(modify_enterp_info)
    def test_c_modify_enterprise(self,name,industry,address,person,tel,email,qq,expect):
        self.enterprise_info.do_modify_enterprise_info(name,industry,address,person,tel,email,qq)
        time.sleep(5)
        try:
            if '修改成功' in self.driver.switch_to.alert.text:
                actual = 'test modify corporate customer pass'
            else:
                actual = 'test modify corporate customer fail'
            self.driver.switch_to.alert.accept()
        except NoAlertPresentException:
            actual = 'test modify corporate customer fail'
        self.driver.refresh()
        self.assertEqual(expect,actual)