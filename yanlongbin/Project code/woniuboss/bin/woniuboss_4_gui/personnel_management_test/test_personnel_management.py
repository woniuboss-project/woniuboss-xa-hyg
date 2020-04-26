from parameterized import parameterized
import unittest

from selenium.webdriver.common.by import By

from woniuboss.lib.woniuboss_4_gui.personnel_management.personnel_management import PersonnelManagement
from woniuboss.tools.woniuboss_4_gui.utility import Utility
from woniuboss.tools.woniuboss_4_gui.service import Service
# 在该页面调试时test_config_info里需要多加一层跳出"..\\",testdata也需要多加一层
# 准备数据
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_4_gui\\PM\\testdata.conf')
pm_staff_management_info = Utility.get_excel_to_tuple(test_config_info[0])
pm_staff_management_user_info = Utility.get_excel_to_user(test_config_info[0])
pm_attendance_records_info = Utility.get_excel_to_tuple(test_config_info[1])


# ('http://192.168.75.128:8080/WoniuBoss2.5/user/login', 'POST',
# {'username': 'WNCD000', 'password': 'woniu123', 'verifycode': '0000'}, 200, 'employment_management-pass'),
# login_info中[]的需要参照上面选取


class PersonnelManagementTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        print("test start")
        cls.driver = Service.get_driver(pm_staff_management_user_info)
        Service.login_account(cls, pm_staff_management_user_info)
        Service.click_text(cls.driver, '人事管理')

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()
        print("test end")

    # 员工管理
    # 界面
    @parameterized.expand(pm_staff_management_info)
    def test_pm_recipients(cls, data, expect):
        PersonnelManagement(cls.driver).pm_staff_management()
        if Service.is_element_present(cls.driver, By.LINK_TEXT, '员工管理'):
            actual = 'PM_correct'
        else:
            actual = 'PM_failed'
            cls.driver.refresh()
        cls.assertEqual(actual, expect)

    # 考勤记录
    # 界面
    @parameterized.expand(pm_attendance_records_info)
    def test_pm_attendance_records(cls, data, expect):
        PersonnelManagement(cls.driver).pm_attendance_records()
        if Service.is_element_present(cls.driver, By.LINK_TEXT, '考勤记录'):
            actual = 'PM_correct'
        else:
            actual = 'PM_failed'
            cls.driver.refresh()
        cls.assertEqual(actual, expect)


if __name__ == '__main__':

    unittest.main(verbosity=2)
