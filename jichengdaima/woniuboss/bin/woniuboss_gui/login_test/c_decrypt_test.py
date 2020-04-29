from parameterized import parameterized
from selenium.webdriver.common.by import By

from woniuboss.lib.woniuboss_gui.login.decrypt import Decrypt

from woniuboss.tools.woniuboss_gui.service import Service
from woniuboss.tools.woniuboss_gui.utility import Utility
import unittest

test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_gui\\testdata_login.conf')
decrypt_info = Utility.get_excel_to_tuple(test_config_info[3])
decrypt_user_info = Utility.get_excel_to_user(test_config_info[3])

class DecryptTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.driver = Service.get_driver(decrypt_user_info)
        cls.decrypt = Decrypt(cls.driver)
        Service.miss_login(cls.driver,decrypt_user_info)

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()

    @parameterized.expand(decrypt_info)
    def test_decrypt(cls,second_pwd,expect):
        cls.decrypt.do_decrypt(second_pwd)
        if Service.is_element_present(cls.driver, By.CSS_SELECTOR, 'body > div.bootbox.modal.fade.mydialog.in > div > '
                                                                   'div > div.modal-body > div'):
            actual = 'test decrypt fail'
            cls.driver.refresh()
        else:
            actual = 'test decrypt pass'
        cls.assertEqual(expect,actual)

if __name__ == '__main__':
    unittest.main(verbosity=2)


