from parameterized import parameterized
import unittest

from selenium.webdriver.common.by import By

from woniuboss.lib.woniuboss_gui.personnel_management.personnel_management import PersonnelManagement
from woniuboss.tools.woniuboss_gui.utility import Utility
from woniuboss.tools.woniuboss_gui.service import Service
# 在该页面调试时test_config_info里需要多加一层跳出"..\\",testdata也需要多加一层
# 准备数据
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_gui\\PM\\testdata.conf')
pm_employees_info = Utility.get_excel_to_tuple(test_config_info[0])
pm_employees_user_info = Utility.get_excel_to_user(test_config_info[0])
pm_area_info = Utility.get_excel_to_tuple(test_config_info[1])
pm_department_info = Utility.get_excel_to_tuple(test_config_info[2])
pm_state_info = Utility.get_excel_to_tuple(test_config_info[3])
pm_area_query_info = Utility.get_excel_to_tuple(test_config_info[4])
pm_department_query_info = Utility.get_excel_to_tuple(test_config_info[5])
pm_state_query_info = Utility.get_excel_to_tuple(test_config_info[6])
pm_name_input_query_info = Utility.get_excel_to_tuple(test_config_info[7])
pm_new_input_info = Utility.get_excel_to_tuple(test_config_info[8])
pm_modify_input_info = Utility.get_excel_to_tuple(test_config_info[9])


# ('http://192.168.75.128:8080/WoniuBoss2.5/user/login', 'POST',
# {'username': 'WNCD000', 'password': 'woniu123', 'verifycode': '0000'}, 200, 'employment_management-pass'),
# login_info中[]的需要参照上面选取


class PersonnelManagementTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        print("test start")
        cls.driver = Service.get_driver(pm_employees_user_info)
        Service.login_account(cls, pm_employees_user_info)
        Service.click_text(cls.driver, '人事管理')

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()
        print("test end")

    # 员工管理
    # 界面
    @parameterized.expand(pm_employees_info)
    def test_pm_recipients(cls, data, expect):
        try:
            PersonnelManagement(cls.driver).pm_employees_interface()
            if Service.is_element_present(cls.driver, By.LINK_TEXT, '员工管理'):
                actual = 'PM_correct'
            else:
                actual = 'PM_failed'
                cls.driver.refresh()
            cls.assertEqual(actual, expect)
        except Exception as e:
            actual = 'PM_failed'
            cls.driver.refresh()
            cls.assertEqual(actual, expect)

    # 内容

    # 区域
    @parameterized.expand(pm_area_info)
    def test_pm_area(cls, data, expect):
        try:
            test_pm_area = PersonnelManagement(cls.driver).pm_area()

            if '全部' in test_pm_area:
                actual = 'PM_correct'
            else:
                actual = 'PM_failed'
                cls.driver.refresh()
            cls.assertEqual(actual, expect)
        except Exception as e:
            actual = 'PM_failed'
            cls.driver.refresh()
            cls.assertEqual(actual, expect)


    # 部门
    @parameterized.expand(pm_department_info)
    def test_pm_department(cls, data, expect):
        try:
            test_pm_department = PersonnelManagement(cls.driver).pm_department()

            if '全部' in test_pm_department:
                actual = 'PM_correct'
            else:
                actual = 'PM_failed'
                cls.driver.refresh()
            cls.assertEqual(actual, expect)
        except Exception as e:
            actual = 'PM_failed'
            cls.driver.refresh()
            cls.assertEqual(actual, expect)


    # 状态
    @parameterized.expand(pm_state_info)
    def test_pm_state(cls, data, expect):
        try:
            test_pm_state = PersonnelManagement(cls.driver).pm_state()

            if '全部' in test_pm_state:
                actual = 'PM_correct'
            else:
                actual = 'PM_failed'
                cls.driver.refresh()
            cls.assertEqual(actual, expect)
        except Exception as e:
            actual = 'PM_failed'
            cls.driver.refresh()
            cls.assertEqual(actual, expect)

    # 查询

    # 区域查询
    @parameterized.expand(pm_area_query_info)
    def test_pm_area_query(cls, region, expect):
        try:
            PersonnelManagement(cls.driver).pm_area_query(region)

            actual = Service.text_xpath(cls.driver, '/html/body/div[7]/div[2]/div[3]/div[2]'
                                                    '/div[2]/table/tbody/tr[1]/td[2]')

            cls.assertEqual(actual, expect)
            cls.driver.refresh()
        except Exception as e:
            actual = 'PM_failed'
            cls.driver.refresh()
            cls.assertEqual(actual, expect)

    # 部门查询
    @parameterized.expand(pm_department_query_info)
    def test_pm_department_query(cls, region, department, expect):
        try:
            PersonnelManagement(cls.driver).pm_department_query(region, department)

            actual = Service.text_xpath(cls.driver, '/html/body/div[7]/div[2]/div[3]'
                                                    '/div[2]/div[2]/table/tbody/tr[1]/td[2]')

            cls.assertEqual(actual, expect)
            cls.driver.refresh()
        except Exception as e:
            actual = 'PM_failed'
            cls.driver.refresh()
            cls.assertEqual(actual, expect)

    # 状态查询
    @parameterized.expand(pm_state_query_info)
    def test_pm_state_query(cls, region, department, state, expect):
        try:
            PersonnelManagement(cls.driver).pm_state_query(region, department, state)

            actual = Service.text_xpath(cls.driver, '/html/body/div[7]/div[2]/div[3]/div[2]/div[2]/table/tbody/tr[1]/td[2]')

            cls.assertEqual(actual, expect)
            cls.driver.refresh()
        except Exception as e:
            actual = 'PM_failed'
            cls.driver.refresh()
            cls.assertEqual(actual, expect)

    # 姓名查询
    @parameterized.expand(pm_name_input_query_info)
    def test_pm_name_input_query(cls, uname, expect):
        try:
            PersonnelManagement(cls.driver).pm_name_input_query(uname)

            actual = Service.text_xpath(cls.driver, '/html/body/div[7]/div[2]/div[3]/div[2]/div[2]/table/tbody/tr[1]/td[2]')

            cls.assertEqual(actual, expect)
            cls.driver.refresh()
        except Exception as e:
            actual = 'PM_failed'
            cls.driver.refresh()
            cls.assertEqual(actual, expect)

    # 新增
    @parameterized.expand(pm_new_input_info)
    def test_pm_new_input(cls, area, department, uname, number, position, gender, phone, email, qq, expect):
        try:
            PersonnelManagement(cls.driver).pm_new_input(area, department, uname, number, position, gender, phone, email, qq)
            sql = 'SELECT work_id FROM employee WHERE work_id = %s;' % number
            pm_new = Utility.query_one(pm_employees_user_info, sql)
            results = pm_new[0]
            if results == number:
                actual = 'PM_correct'
            else:
                actual = 'PM_failed'
                cls.driver.refresh()
            cls.assertEqual(actual, expect)
            cls.driver.refresh()
        except Exception as e:
            actual = 'PM_failed'
            cls.driver.refresh()
            cls.assertEqual(actual, expect)

    # 修改
    @parameterized.expand(pm_modify_input_info)
    def test_pm_modify_input(cls, area, department, uname, number, position, gender, phone, email, qq, state, expect):
        try:
            PersonnelManagement(cls.driver).pm_modify_input(area, department, uname, number, position, gender, phone, email,qq, state)
            sql = 'SELECT work_id FROM employee WHERE work_id = %s;' % number
            pm_new = Utility.query_one(pm_employees_user_info, sql)
            results = pm_new[0]
            if results == number:
                actual = 'PM_correct'
            else:
                actual = 'PM_failed'
                cls.driver.refresh()
            cls.assertEqual(actual, expect)
            cls.driver.refresh()
        except Exception as e:
            actual = 'PM_failed'
            cls.driver.refresh()
            cls.assertEqual(actual, expect)

if __name__ == '__main__':

    unittest.main(verbosity=2)
