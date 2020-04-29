import time
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from woniuboss.tools.woniuboss_gui.service import Service

class TeacherOnDuty:
    def __init__(self, driver):
        self.driver = driver

    def click_teaching_manage_link(self):
        self.driver.find_element_by_link_text('教学管理').click()

    def click_teacher_duty_link(self):
        Service.wait_until_element_is_visible(self.driver, By.LINK_TEXT, '教师值班')
        self.driver.find_element_by_link_text('教师值班').click()

    def select_log_status(self,log_statuas):
        Service.wait_until_element_is_visible(self.driver,By.CSS_SELECTOR,'#queryAera > div > select')
        Service.box_css_click(self.driver,'#queryAera > div > select',log_statuas)

    def input_id(self,id):
        ele = self.driver.find_element_by_css_selector('#queryAera > div > input:nth-child(2)')
        Service.send_input(ele,id)

    def input_query_s_time(self,s_time):
        ele = self.driver.find_element_by_css_selector('#queryAera > div > input:nth-child(3)')
        Service.send_input(ele,s_time)

    def input_query_e_time(self,e_time):
        ele = self.driver.find_element_by_css_selector('#queryAera > div > input:nth-child(4)')
        Service.send_input(ele,e_time)

    def click_query_btn(self):
        self.driver.find_element_by_css_selector('#queryAera > div > button.btn.btn-info.btn-padding').click()

    def do_query_duty_info(self,status,id,s_time,e_time):
        self.click_teaching_manage_link()
        self.click_teacher_duty_link()
        self.select_log_status(status)
        self.input_id(id)
        self.input_query_s_time(s_time)
        self.input_query_e_time(e_time)
        self.click_query_btn()
        time.sleep(3)
        ele_text = self.driver.find_element_by_css_selector('#content > div.row.con-margin.con-body-con > div.'
                                                            'bootstrap-table > div.fixed-table-container > div.fixed-'
                                                            'table-pagination > div.pull-left.pagination-detail > span.'
                                                            'pagination-info').text
        return ele_text

    def click_refer_to_duty(self):
        self.driver.find_element_by_xpath('//*[@id="queryAera"]/div/button[2]').click()

    def select_who_on_duty(self,who):
        Service.wait_until_element_is_visible(self.driver,By.CSS_SELECTOR,'#addDuty-table > tr > td:nth-child(1) > '
                                                                          'select')
        Service.box_css_click(self.driver,'#addDuty-table > tr > td:nth-child(1) > select',who)

    def input_duty_date(self,date):
        js1 = f'document.querySelector("#addDuty-table > tr > td:nth-child(2) > input").value="{date}";'
        js3 = 'document.querySelector("body > div:nth-child(26)").style = "display: none;"'
        self.driver.execute_script(js3)
        self.driver.execute_script(js1)

    def click_save_btn(self):
        self.driver.find_element_by_css_selector('#addDuty-modal > div > div > div.modal-footer > button').click()

    def do_refer_to_duty(self,who,date):
        self.click_teaching_manage_link()
        self.click_teacher_duty_link()
        self.click_refer_to_duty()
        self.select_who_on_duty(who)
        self.input_duty_date(date)
        self.click_save_btn()
        Service.wait_until_element_is_visible(self.driver,By.CSS_SELECTOR,'body > div.bootbox.modal.fade.mydialog.in > '
                                                                          'div > div > div.modal-body > div')

    def click_logs_btn(self):
        self.driver.find_element_by_css_selector('#duty_table > tbody > tr:nth-child(1) > td:nth-child(10) '
                                                 '> button:nth-child(1)').click()

    def input_start_time(self,s_time):
        js1 = f'document.querySelector("#log-form > div:nth-child(7) > div:nth-child(1) > input").value="{s_time}";'
        js3 = 'document.querySelector("body > div:nth-child(23)").style = "display: none;"'
        self.driver.execute_script(js3)
        self.driver.execute_script(js1)

    def input_end_time(self,e_time):
        js1 = f'document.querySelector("#log-form > div:nth-child(7) > div:nth-child(2) > input").value="{e_time}";'
        js3 = 'document.querySelector("body > div:nth-child(24)").style = "display: none;"'
        self.driver.execute_script(js3)
        self.driver.execute_script(js1)

    def select_hour(self,hour):
        Service.box_css_click(self.driver,'#log-form > div:nth-child(8) > div:nth-child(1) > select',hour)

    def select_pay_way(self,way):
        Service.box_css_click(self.driver,'#log-form > div:nth-child(8) > div:nth-child(2) > select',way)

    def input_logs(self,logs):
        ele = self.driver.find_element_by_css_selector('#log-form > div:nth-child(10) > div > textarea')
        Service.send_input(ele,logs)

    def click_logs_submit_btn(self):
        self.driver.find_element_by_id('saveLogBtn').click()

    def do_add_logs(self,s_time,e_time,hour,way,logs):
        self.click_teaching_manage_link()
        self.click_teacher_duty_link()
        self.click_logs_btn()
        self.input_start_time(s_time)
        self.input_end_time(e_time)
        self.select_hour(hour)
        self.select_pay_way(way)
        self.input_logs(logs)
        self.click_logs_submit_btn()
        time.sleep(2)
        ele = self.driver.find_element_by_css_selector('#duty_table > tbody > tr:nth-child(1) >'
                                                       ' td:nth-child(10) > button:nth-child(1)')
        return ele.get_attribute('onclick')
    #body > div.bootbox.modal.fade.mydialog.in > div > div > div.modal-body > div 日志填写成功，已通知您的上级确认

    def click_modify_btn(self):
        self.driver.find_element_by_css_selector('#duty_table > tbody > tr:nth-child(1) > td:nth-child(10) >'
                                                 ' button:nth-child(2)').click()

    def select_modify_duty_person(self,person):
        Service.box_css_click(self.driver,'#editDuty-form > div > div:nth-child(2) > select',person)

    def input_modify_date(self,date):
        js1 = f'document.querySelector("#editDuty-form > div > div:nth-child(3) > input").value="{date}";'
        js2 = 'document.querySelector("body > div:nth-child(22) > div.datetimepicker-days").style="display: none;"'
        js3 = 'document.querySelector("body > div:nth-child(22)").style = "display: none;"'
        self.driver.execute_script(js2)
        self.driver.execute_script(js3)
        self.driver.execute_script(js1)

    def click_modify_save_btn(self):
        self.driver.find_element_by_css_selector('#editDuty-modal > div > div > div.modal-footer > button').click()

    def do_modify_duty(self,person,date):
        self.click_teaching_manage_link()
        self.click_teacher_duty_link()
        self.click_modify_btn()
        self.select_modify_duty_person(person)
        self.input_modify_date(date)
        self.click_modify_save_btn()
        time.sleep(2)
