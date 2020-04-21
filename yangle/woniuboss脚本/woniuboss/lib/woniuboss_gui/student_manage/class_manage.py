from woniuboss.tools.woniuboss_gui.service import Service
import time
from selenium.webdriver.common.by import By

class ClassManage:
    def __init__(self, driver):
        self.driver = driver

    def click_student_link(self):
        self.driver.find_element_by_link_text('学员管理').click()

    def click_class_manage_link(self):
        Service.wait_until_element_is_visible(self.driver, By.LINK_TEXT, '班级管理')
        self.driver.find_element_by_link_text('班级管理').click()

    def input_name(self,name):
        Service.wait_until_element_is_visible(self.driver,By.CSS_SELECTOR,'#class-table > tbody')
        ele = self.driver.find_element_by_css_selector('#cmDiv > div.col-lg-8.col-md-8.col-sm-12.col-xs-12.'
                                                     'con-body-padding.text-left > input[type=text]')
        Service.send_input(ele,name)

    def click_query_btn(self):
        self.driver.find_element_by_css_selector('#cmDiv > div.col-lg-8.col-md-8.col-sm-12.col-xs-12.con-body-padding.'
                                               'text-left > button:nth-child(2)').click()

    def count_td(self):
        find_td = self.driver.find_element_by_css_selector("#class-table > tbody > tr:nth-child(1)").\
            find_elements_by_tag_name("td")
        sum_td = len(find_td)
        return sum_td

    def do_query_info(self,name):
        self.click_student_link()
        time.sleep(5)
        self.click_class_manage_link()
        time.sleep(5)
        self.input_name(name)
        self.click_query_btn()
        return self.count_td()

    def random_locat_tr(self):
        Service.wait_until_element_is_visible(self.driver, By.CSS_SELECTOR, '#class-table > tbody')
        find_tr = self.driver.find_element_by_css_selector("#class-table > tbody").find_elements_by_tag_name("tr")
        sum_tr = len(find_tr)
        import random
        ram_num = random.randint(1, sum_tr - 1)
        self.driver.find_element_by_xpath('//*[@id="class-table"]/tbody/tr[%d]/td[1]/input' % ram_num).click()

    def select_class(self,class_name):
        Service.box_css_click(self.driver,'#cmDiv > div.col-lg-8.col-md-8.col-sm-12.col-xs-12.con-body-padding.'
                                          'text-left > select.sel-text.stu-class',class_name)

    def select_orientation(self,orientation):
        Service.box_css_click(self.driver,'#cmDiv > div.col-lg-8.col-md-8.col-sm-12.col-xs-12.con-body-padding.'
                                          'text-left > select.sel-text.stu-orientation',orientation)

    def click_confirm_btn(self):
        self.driver.find_element_by_xpath('//*[@id="cmDiv"]/div[1]/button[2]').click()

    def do_seperate_class(self,class_name,orientation):
        self.click_student_link()
        self.click_class_manage_link()
        time.sleep(8)
        ele_text1 = self.get_text()
        self.random_locat_tr()
        self.select_class(class_name)
        self.select_orientation(orientation)
        self.click_confirm_btn()
        return ele_text1

    def get_text(self):
        ele_text = self.driver.find_element_by_xpath('//*[@id="cmDiv"]/div[2]/div[2]/div[4]/div[1]').text
        return ele_text

