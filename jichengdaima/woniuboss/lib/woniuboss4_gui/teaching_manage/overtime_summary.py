import time
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from woniuboss.tools.woniuboss_gui.service import Service

class OverTimeSummary:

    def __init__(self, driver):
        self.driver = driver

    def click_teaching_manage_link(self):
        self.driver.find_element_by_link_text('教学管理').click()

    def click_overtime_summary_link(self):
        Service.wait_until_element_is_visible(self.driver, By.LINK_TEXT, '加班汇总')
        self.driver.find_element_by_link_text('加班汇总').click()

    def select_teacher(self,teacher):
        Service.wait_until_element_is_visible(self.driver,By.NAME,'teacher')
        Service.box_name_click(self.driver,'teacher',teacher)

    def select_count_way(self,way):
        Service.box_name_click(self.driver,'accounting_way',way)

    def input_start_time(self,s_time):
        ele = self.driver.find_element_by_name('start-time')
        Service.send_input(ele,s_time)

    def input_end_time(self,e_time):
        ele = self.driver.find_element_by_name('end-time')
        Service.send_input(ele,e_time)

    def click_query_btn(self):
        self.driver.find_element_by_css_selector('#content > div.row.con-margin.con-body-con > div.col-lg-12.col-md-12.'
                                                 'col-xs-12.con-body-padding.text-left.queryArea > button').click()

    def do_query_overtime_summary(self,teacher,way,s_time,e_time):
        self.click_teaching_manage_link()
        self.click_overtime_summary_link()
        self.select_teacher(teacher)
        self.select_count_way(way)
        self.input_start_time(s_time)
        self.input_end_time(e_time)
        self.click_query_btn()
        time.sleep(3)

    def get_sum_text(self):
        sum_text = self.driver.find_element_by_css_selector('#content > div.row.con-margin.con-body-con > div.bootstrap'
                                                            '-table > div.fixed-table-container > div.fixed-table-'
                                                            'pagination > div.pull-left.pagination-detail > '
                                                            'span.pagination-info').text
        return sum_text