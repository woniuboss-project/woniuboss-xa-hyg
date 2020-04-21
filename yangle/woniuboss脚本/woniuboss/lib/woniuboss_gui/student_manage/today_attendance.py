from selenium.webdriver.common.by import By

from woniuboss.tools.woniuboss_gui.service import Service
import time
class TodayAttendance:
    def __init__(self, driver):
        self.driver = driver

    def click_student_link(self):
        self.driver.find_element_by_link_text('学员管理').click()

    def click_attendance_link(self):
        Service.wait_until_element_is_visible(self.driver,By.LINK_TEXT,'今日考勤')
        self.driver.find_element_by_link_text('今日考勤').click()

    def input_stu_name(self,name):
        ele = self.driver.find_element_by_css_selector('#atten > div.col-lg-12.col-md-12.col-xs-12.con-body-padding.text-left '
                                                       '> input[type=text]')
        Service.send_input(ele,name)

    def click_search_btn(self):
        self.driver.find_element_by_css_selector('#atten > div:nth-child(1) > button:nth-child(2)').click()

    def count_td(self):
        find_td = self.driver.find_element_by_css_selector("#attendance_table > tbody > tr:nth-child(1)").\
            find_elements_by_tag_name("td")
        sum_td = len(find_td)
        return sum_td

    def do_search_student(self,name):
        self.click_student_link()
        self.click_attendance_link()
        time.sleep(5)
        self.input_stu_name(name)
        self.click_search_btn()

    def random_attendance_single(self,status):
        Service.wait_until_element_is_visible(self.driver,By.CSS_SELECTOR,'#attendance_table > tbody')
        find_tr = self.driver.find_element_by_css_selector("#attendance_table > tbody").find_elements_by_tag_name("tr")
        sum_tr = len(find_tr)
        import random
        ram_num = random.randint(1, sum_tr - 1)
        Service.box_css_click(self.driver,'#attendance_table > tbody > tr:nth-child(%d) > td:nth-child(7) '
                                          '> select' %(ram_num),status)
        css_ele = self.driver.find_element_by_css_selector('#attendance_table > tbody > tr:nth-child(%d) > td:nth-child(7) '
                                          '> button' %(ram_num))
        css_ele.click()
        return css_ele.get_attribute('id')

    def do_random_attandence(self,status):
        self.click_student_link()
        self.click_attendance_link()
        time.sleep(10)
        attr = self.random_attendance_single(status)
        return attr

    def click_attendance_all(self):
        Service.wait_until_element_is_visible(self.driver,By.CSS_SELECTOR,'#atten > div:nth-child(1) > button:nth-child(3)')
        self.driver.find_element_by_css_selector('#atten > div:nth-child(1) > button:nth-child(3)').click()

    def click_attendance_all_confirm(self):
        self.driver.find_element_by_css_selector('body > div.bootbox.modal.fade.mydialog.in > div > div >'
                                                 ' div.modal-footer > button.btn.btn-primary').click()
        self.driver.refresh()

    def do_attendance_all(self):
        self.click_student_link()
        self.click_attendance_link()
        time.sleep(5)
        self.click_attendance_all()
        self.click_attendance_all_confirm()

    def get_record_text(self):
        if Service.wait_until_element_is_visible(self.driver,By.XPATH,
                                              '//*[@id="stuInfo"]/div[3]/div[2]/div[4]/div[1]/span[1]'):
            ele_text = self.driver.find_element_by_xpath('//*[@id="stuInfo"]/div[3]/div[2]/div[4]/div[1]/span[1]').text
            return ele_text
