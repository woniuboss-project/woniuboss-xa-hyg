import time
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from woniuboss.tools.woniuboss_gui.service import Service

class MyApproval:

    def __init__(self, driver):
        self.driver = driver

    def click_teaching_manage_link(self):
        self.driver.find_element_by_link_text('教学管理').click()

    def click_my_approval_link(self):
        Service.wait_until_element_is_visible(self.driver, By.LINK_TEXT, '我的审批')
        self.driver.find_element_by_link_text('我的审批').click()

    def select_approval_type(self,type):
        Service.wait_until_element_is_visible(self.driver,By.NAME,'type')
        Service.box_name_click(self.driver,'type',type)

    def select_approval_status(self,status):
        Service.box_name_click(self.driver,'status',status)

    def input_id(self,id):
        ele = self.driver.find_element_by_name('code')
        Service.send_input(ele,id)

    def click_query_btn(self):
        self.driver.find_element_by_css_selector('#queryPara > div.col-lg-12.col-md-12.col-xs-12.con-body-padding.'
                                                 'text-left > button').click()

    def do_query_approval_info(self,type,status,id):
        self.click_teaching_manage_link()
        self.click_my_approval_link()
        self.select_approval_type(type)
        self.select_approval_status(status)
        self.input_id(id)
        self.click_query_btn()

    def get_sum_text(self):
        sum_text = self.driver.find_element_by_css_selector('#queryPara > div.bootstrap-table > div.fixed-table-'
                                                            'container > div.fixed-table-pagination > div.pull-left.'
                                                            'pagination-detail > span.pagination-info').text
        return sum_text