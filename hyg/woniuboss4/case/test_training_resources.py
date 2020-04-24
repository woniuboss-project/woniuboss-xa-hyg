
import unittest
from selenium import webdriver
from woniuboss4.common.Training_resources import Training_Resources
from woniuboss4.common.login import Login
from woniuboss4.unit.utility import Unitily
from parameterized import parameterized
exlce = '../data/WoniuBoss_info.xlsx'
#获取excel文件内容
data = Unitily.get_excel(exlce,'ziyuanpeixun',1,6,3,4)
login_data = Unitily.get_list_excel(exlce,'login',1,2,3,4)


class Test_train(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.driver = webdriver.Firefox()
        cls.driver.get('http://192.168.1.72:8080/WoniuBoss4.0')
        #登陆
        Login().do_login(cls.driver,login_data)
        Training_Resources().tranin(cls.driver)

    @parameterized.expand(data)
    def test_one(self,data):
        Training_Resources().all_opration(self.driver,data)
        try :
            name = self.driver.find_element_by_xpath('/html/body/div[8]/div[2]/div/div/div/div[2]/div[2]/div[2]/table/tbody/tr/td[1]').text
        except :
            actual = 'fail'
        else :
            if name == data['姓名']:
                actual = 'success'
            else :
                actual = 'fail'
        self.assertEquals(actual,data['expect'])
        self.driver.refresh()
    @classmethod
    def tearDownClass(cls):
        cls.driver.close()

if __name__ == '__main__':
    unittest.main(verbosity=2)
