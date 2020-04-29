from selenium.webdriver import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

from woniuboss.tools.woniuboss_gui.service import Service
import time

class MorningExamRecord:
    def __init__(self, driver):
        self.driver = driver

    def click_student_link(self):
        self.driver.find_element_by_link_text('学员管理').click()

    def click_morning_exam_link(self):
        Service.wait_until_element_is_visible(self.driver, By.LINK_TEXT, '晨考记录')
        self.driver.find_element_by_link_text('晨考记录').click()

    def select_class(self,class_name):
        Service.box_name_click(self.driver,'studyClass',class_name)

    def select_orientation(self,guide):
        Service.box_name_click(self.driver,'studyOrientation',guide)

    def input_name(self,name):
        ele = self.driver.find_element_by_name('stu_name')
        Service.send_input(ele,name)

    def input_start_time(self,s_time):
        ele = self.driver.find_element_by_name('s_att_time')
        js = 'document.querySelector("#morningexam > div.col-lg-8.col-md-8.col-sm-12.col-xs-12.con-body-padding.' \
             'text-left > input:nth-child(2)").value="";'
        ele.click()
        self.driver.execute_script(js)
        Service.send_input(ele,s_time)
        ele.send_keys(Keys.ENTER)

    def input_end_time(self,e_time):
        ele = self.driver.find_element_by_name('e_att_time')
        js = 'document.querySelector("#morningexam > div.col-lg-8.col-md-8.col-sm-12.col-xs-12.con-body-padding.' \
             'text-left > input:nth-child(3)").value="";'
        ele.click()
        self.driver.execute_script(js)
        Service.send_input(ele, e_time)
        ele.send_keys(Keys.ENTER)

    def click_query_btn(self):
        ele = self.driver.find_element_by_xpath('//*[@id="morningexam"]/div[2]/button')
        ele.click()

    def get_sum_record(self):
        ele = '//*[@id="morningexam"]/div[3]/div[2]/div[4]/div[1]/span[1]'
        Service.wait_until_element_is_visible(self.driver, By.XPATH, ele)
        ele_text = self.driver.find_element_by_xpath(ele).text
        return ele_text

    def count_tr(self):
        Service.wait_until_element_is_visible(self.driver, By.CSS_SELECTOR, '#attendace-result > tbody')
        find_tr = self.driver.find_element_by_css_selector("#attendace-result > tbody").find_elements_by_tag_name("tr")
        sum_tr = len(find_tr)
        return sum_tr

    def do_query_all_record(self,class_name,guide,name,s_time,e_time):
        self.click_student_link()
        self.click_morning_exam_link()
        time.sleep(5)
        # Service.wait_until_element_is_visible(self.driver,By.CSS_SELECTOR,'#attendace-result > tbody')
        self.select_class(class_name)
        self.select_orientation(guide)
        self.input_name(name)
        self.input_start_time(s_time)
        self.input_end_time(e_time)
        self.click_query_btn()
        time.sleep(5)
        return self.get_sum_record()

    def do_query_part_record(self,class_name,guide,name,s_time,e_time):
        self.click_student_link()
        self.click_morning_exam_link()
        time.sleep(5)
        self.select_class(class_name)
        self.select_orientation(guide)
        time.sleep(5)
        self.input_name(name)
        self.input_start_time(s_time)
        self.input_end_time(e_time)
        # time.sleep(10)
        self.click_query_btn()
        time.sleep(10)
        return self.count_tr()