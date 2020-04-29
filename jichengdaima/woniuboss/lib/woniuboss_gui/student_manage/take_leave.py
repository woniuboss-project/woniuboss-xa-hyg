from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

from woniuboss.tools.woniuboss_gui.service import Service
import time

class TakeLeave:
    def __init__(self, driver):
        self.driver = driver
    def click_student_link(self):
        self.driver.find_element_by_link_text('学员管理').click()

    def click_take_leave_link(self):
        Service.wait_until_element_is_visible(self.driver, By.LINK_TEXT, '学员请假')
        self.driver.find_element_by_link_text('学员请假').click()

    def click_query_btn(self):
        self.driver.find_element_by_css_selector('#leave > div.col-lg-6.col-md-6.col-xs-12.con-body-padding.text-left '
                                                 '> button').click()

    def do_query_leave(self):
        self.click_student_link()
        self.click_take_leave_link()
        time.sleep(5)
        self.click_query_btn()

    def click_add_leave_btn(self):
        self.driver.find_element_by_css_selector('#leave > button').click()

    def input_start_time(self,start_time):
        ele = self.driver.find_element_by_css_selector('#leave-form > div:nth-child(2) > div:nth-child(1) > input')
        js = 'document.querySelector("#leave-form > div:nth-child(2) > div:nth-child(1) > input").value="";'
        ele.click()
        self.driver.execute_script(js)
        Service.send_input(ele,start_time)
        ele.send_keys(Keys.ENTER)

    def input_end_time(self,end_time):
        ele =  self.driver.find_element_by_css_selector('#leave-form > div:nth-child(2) > div:nth-child(2) > input')
        js = 'document.querySelector("#leave-form > div:nth-child(2) > div:nth-child(2) > input").value="";'
        ele.click()
        self.driver.execute_script(js)
        Service.send_input(ele, end_time)
        ele.send_keys(Keys.ENTER)

    def select_type(self,leave_type):
        Service.box_css_click(self.driver,'#leave-form > div:nth-child(3) > div:nth-child(1) > select',leave_type)

    def input_days(self,leave_days):
        ele = self.driver.find_element_by_css_selector('#leave-form > div:nth-child(3) > div:nth-child(2) > input')
        Service.send_input(ele, leave_days)

    def input_name(self,leave_name):
        ele = self.driver.find_element_by_css_selector('#leave-form > div:nth-child(4) > div > input')
        Service.send_input(ele, leave_name)
        ele.send_keys(Keys.ENTER)

    def input_reason(self,leave_reason):
        ele = self.driver.find_element_by_css_selector('#leave-form > div:nth-child(5) > div > textarea')
        Service.send_input(ele, leave_reason)

    def input_comment(self,back_comment):
        ele = self.driver.find_element_by_css_selector('#leave-form > div:nth-child(6) > div > textarea')
        Service.send_input(ele, back_comment)

    def click_add_save_btn(self):
        self.driver.find_element_by_css_selector('#leave-modal > div > div > div.modal-footer > button').click()


    def do_add_leave(self,s_time,e_time,type,days,name,reason,comment):
        # self.click_student_link()
        self.click_take_leave_link()
        time.sleep(5)
        self.click_add_leave_btn()
        self.input_start_time(s_time)
        self.input_end_time(e_time)
        self.select_type(type)
        self.input_days(days)
        self.input_name(name)
        self.input_reason(reason)
        self.input_comment(comment)
        self.click_add_save_btn()
        time.sleep(3)
        attr = self.get_first_line_info()
        return attr

    def click_leave_permit(self):
        self.driver.find_element_by_css_selector('#leave-table > tbody > tr:nth-child(1) > '
                                                 'td:nth-child(13) > button:nth-child(1)').click()

    def input_path(self,path):
        ele=self.driver.find_element_by_css_selector('#selectStuLeave')
        ele.send_keys(path)

    def click_upload_btn(self):
        self.driver.find_element_by_css_selector('#leavePermit-modal > div > div '
                                                 '> div.modal-footer > button').click()

    def do_upload_leave_permit(self,path):
        # self.click_student_link()
        self.click_take_leave_link()
        time.sleep(5)
        self.click_leave_permit()
        time.sleep(5)
        self.input_path(path)
        self.click_upload_btn()
        attr = self.get_first_line_info()
        return attr

    def click_modify_btn(self):
        self.driver.find_element_by_css_selector('#leave-table > tbody > tr:nth-child(1) > '
                                                 'td:nth-child(13) > button:nth-child(2)').click()

    def input_modify_start_time(self,s_time):
        ele = self.driver.find_element_by_css_selector('#modLeave-form > div:nth-child(3) > div:nth-child(1) > input')
        js = 'document.querySelector("#modLeave-form > div:nth-child(3) > div:nth-child(1) > input").value="";'
        ele.click()
        self.driver.execute_script(js)
        Service.send_input(ele,s_time)
        ele.send_keys(Keys.ENTER)

    def input_modify_end_time(self,e_time):
        ele = self.driver.find_element_by_css_selector('#modLeave-form > div:nth-child(3) > div:nth-child(2) > input')
        js = 'document.querySelector("#modLeave-form > div:nth-child(3) > div:nth-child(2) > input").value="";'
        ele.click()
        self.driver.execute_script(js)
        Service.send_input(ele,e_time)
        ele.send_keys(Keys.ENTER)

    def select_modify_type(self,type):
        Service.box_css_click(self.driver,'#modLeave-form > div:nth-child(4) > div:nth-child(1) > select',type)

    def input_modify_days(self,days):
        ele = self.driver.find_element_by_css_selector('#modLeave-form > div:nth-child(4) > div:nth-child(2) > input')
        Service.send_input(ele,days)

    def input_modify_name(self,name):
        ele = self.driver.find_element_by_css_selector('#modLeave-form > div:nth-child(5) > div > div > input')
        Service.send_input(ele,name)
        ele.send_keys(Keys.ENTER)

    def select_modify_teacher(self,teacher):
        Service.box_css_click(self.driver,'#modLeave-form > div:nth-child(5) > div > select',teacher)

    def input_modify_reason(self,reason):
        ele = self.driver.find_element_by_css_selector('#modLeave-form > div:nth-child(6) > div > textarea')
        Service.send_input(ele,reason)

    def input_modify_comment(self,comment):
        ele = self.driver.find_element_by_css_selector('#modLeave-form > div:nth-child(7) > div > textarea')
        Service.send_input(ele,comment)

    def click_modify_save_btn(self):
        self.driver.find_element_by_css_selector('#modLeave-modal > div > div > div.modal-footer > button').click()

    def get_first_line_info(self):
        ele = self.driver.find_element_by_css_selector('#leave-table > tbody > tr:nth-child(1) > '
                                                'td:nth-child(13) > button:nth-child(2)')
        get_attr = str(ele.get_attribute('onclick'))
        return get_attr

    def do_modify_leave(self,s_time,e_time,type,days,name,teacher,reason,comment):
        # self.click_student_link()
        self.click_take_leave_link()
        time.sleep(5)
        self.click_modify_btn()
        self.input_modify_start_time(s_time)
        self.input_modify_end_time(e_time)
        self.select_modify_type(type)
        self.input_modify_days(days)
        self.input_modify_name(name)
        self.select_modify_teacher(teacher)
        self.input_modify_reason(reason)
        self.input_modify_comment(comment)
        self.click_modify_save_btn()

    def click_cancel_leave_btn(self):
        self.driver.find_element_by_css_selector('#leave-table > tbody > tr:nth-child(1) >'
                                                 ' td:nth-child(13) > button:nth-child(3)').click()

    def accept_alert(self):
        self.driver.find_element_by_css_selector('body > div.bootbox.modal.fade.mydialog.in > div >'
                                                 ' div > div.modal-footer > button.btn.btn-primary').click()

    def get_leave_record(self):
        Service.wait_until_element_is_visible(self.driver, By.CSS_SELECTOR, '#leave-table > tbody')
        find_tr = self.driver.find_element_by_css_selector("#leave-table > tbody").find_elements_by_tag_name("tr")
        sum_tr = len(find_tr)
        return sum_tr

    def do_cancel_leave(self):
        # self.click_student_link()
        self.click_take_leave_link()
        time.sleep(5)
        get_attr=self.get_first_line_info()
        self.click_cancel_leave_btn()
        time.sleep(5)
        self.accept_alert()
        self.driver.refresh()
        return get_attr
