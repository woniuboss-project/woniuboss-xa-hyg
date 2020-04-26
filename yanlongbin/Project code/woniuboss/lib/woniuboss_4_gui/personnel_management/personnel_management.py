
import requests
from woniuboss.tools.woniuboss_4_gui.service import Service
from selenium.webdriver.support.select import Select


class PersonnelManagement:

    def __init__(self, driver):
        self.driver = driver

    # 员工管理
    # 界面
    def pm_staff_management(self):
        Service.click_text(self.driver, '员工管理')

    # 考勤记录
    # 界面
    def pm_attendance_records(self):
        Service.click_text(self.driver, '考勤记录')


