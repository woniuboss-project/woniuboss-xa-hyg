import time
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

from woniuboss.tools.woniuboss_gui.service import Service

class DailyExam:
    def __init__(self, driver):
        self.driver = driver

    def click_student_manage_link(self):
        self.driver.find_element_by_link_text('学员管理').click()

    def click_daily_exam_link(self):
        Service.wait_until_element_is_visible(self.driver, By.LINK_TEXT, '日常考评')
        self.driver.find_element_by_link_text('日常考评').click()

    def select_homework_level(self,level):
        Service.box_xpath_click(self.driver,'//*[@id="4"]/tbody/tr[1]/td[9]/select[1]',level)

    def click_work_btn(self):
        ele = self.driver.find_element_by_css_selector('#confirmAttenBtn_1')
        ele.click()
        return ele.get_attribute('onclick')

    def do_click_homework_btn(self,level):
        self.click_student_manage_link()
        self.click_daily_exam_link()
        time.sleep(5)
        self.select_homework_level(level)
        attr = self.click_work_btn()
        return attr

    def click_morning_exam(self):
        ele = self.driver.find_element_by_css_selector('#mornExam_1')
        ele.click()
        return ele.get_attribute('onclick')

    def select_morning_exam_level(self,level):
        Service.box_xpath_click(self.driver,'//*[@id="4"]/tbody/tr[1]/td[9]/select[2]',level)

    def do_click_morning_exam(self,level):
        self.click_daily_exam_link()
        self.select_morning_exam_level(level)
        attr = self.click_morning_exam()
        return attr

    def click_all_work(self):
        self.driver.find_element_by_css_selector('#panel-element-4 > div > button').click()

    def do_click_do_all_work(self):
        self.click_student_manage_link()
        self.click_daily_exam_link()
        time.sleep(7)
        self.click_all_work()
        self.driver.find_element_by_css_selector('body > div.bootbox.modal.fade.mydialog.in > div > div'
                                                 ' > div.modal-footer > button.btn.btn-primary').click()
        time.sleep(5)
