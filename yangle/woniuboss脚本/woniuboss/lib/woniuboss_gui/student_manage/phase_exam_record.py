from woniuboss.tools.woniuboss_gui.service import Service
import time
from selenium.webdriver.common.by import By

class PhaseExamRecord:
    def __init__(self, driver):
        self.driver = driver

    def click_student_link(self):
        self.driver.find_element_by_link_text('学员管理').click()

    def click_phase_record_link(self):
        Service.wait_until_element_is_visible(self.driver, By.LINK_TEXT, '测评记录')
        self.driver.find_element_by_link_text('测评记录').click()

    def select_class(self,class_name):
        Service.box_css_click(self.driver,'#stagetest > div.col-lg-12.col-md-12.col-sm-12.col-xs-12.'
                                          'con-body-padding.text-left > select.sel-text.stu-class',class_name)

    def select_orientation(self,orientation):
        Service.box_css_click(self.driver,'#stagetest > div.col-lg-12.col-md-12.col-sm-12.col-xs-12.'
                                          'con-body-padding.text-left > select.sel-text.stu-orientation',orientation)

    def select_phase(self,phase):
        Service.box_css_click(self.driver,'#stagetest > div.col-lg-12.col-md-12.col-sm-12.col-xs-12.'
                                          'con-body-padding.text-left > select.sel-text.stu-phase',phase)

    def input_name(self,name):
        ele = self.driver.find_element_by_css_selector('#stagetest > div.col-lg-12.col-md-12.col-sm-12.col-xs-12.'
                                                       'con-body-padding.text-left > input[type=text]')
        Service.send_input(ele,name)

    def click_query_btn(self):
        self.driver.find_element_by_css_selector('#stagetest > div.col-lg-12.col-md-12.col-sm-12.col-xs-12.'
                                                 'con-body-padding.text-left > button').click()

    def count_td(self):
        find_td = self.driver.find_element_by_css_selector("#pe-result > tbody > tr:nth-child(1)").\
            find_elements_by_tag_name("td")
        sum_td = len(find_td)
        return sum_td

    def do_query_record(self,class_name,orientation,phase,name):
        self.click_student_link()
        self.click_phase_record_link()
        time.sleep(5)
        self.select_class(class_name)
        self.select_orientation(orientation)
        self.select_phase(phase)
        self.input_name(name)
        self.click_query_btn()
        time.sleep(5)
        return self.count_td()