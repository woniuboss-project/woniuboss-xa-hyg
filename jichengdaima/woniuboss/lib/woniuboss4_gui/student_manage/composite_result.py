import time
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from woniuboss.tools.woniuboss_gui.service import Service

class CompositeResult:

    def __init__(self, driver):
        self.driver = driver

    def click_student_manage_link(self):
        self.driver.find_element_by_link_text('学员管理').click()

    def click_composite_result_link(self):
        Service.wait_until_element_is_visible(self.driver, By.LINK_TEXT, '综合成绩')
        self.driver.find_element_by_link_text('综合成绩').click()

    def select_orientation(self,orientation):
        Service.wait_until_element_is_visible(self.driver,By.NAME,'peOrientation')
        Service.box_name_click(self.driver,'peOrientation',orientation)

    def select_class(self,class_name):
        Service.box_name_click(self.driver,'peClass',class_name)

    def select_phase(self,phase):
        Service.box_name_click(self.driver,'pePhase',phase)

    def input_name(self,name):
        ele = self.driver.find_element_by_name('peStuName')
        Service.send_input(ele,name)

    def click_query_btn(self):
        self.driver.find_element_by_css_selector('#stagetest > div.col-lg-12.col-md-12.col-sm-12.col-xs-12.'
                                                 'con-body-padding.text-left > button').click()

    def do_query_record(self,orientation,class_name,phase,name):
        self.click_student_manage_link()
        self.click_composite_result_link()
        self.select_orientation(orientation)
        self.select_class(class_name)
        self.select_phase(phase)
        self.input_name(name)
        self.click_query_btn()
        time.sleep(2)
        ele = self.driver.find_element_by_css_selector('#stagetest > div.bootstrap-table > div.fixed-table-container >'
                                                       ' div.fixed-table-pagination > div.pull-left.pagination-detail >'
                                                       ' span.pagination-info')
        return ele.text
