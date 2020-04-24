import time
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from woniuboss.tools.woniuboss_gui.service import Service

class OverTimeApplication:

    def __init__(self, driver):
        self.driver = driver

    def click_teaching_manage_link(self):
        self.driver.find_element_by_link_text('教学管理').click()

    def click_overtime_appliaction_link(self):
        Service.wait_until_element_is_visible(self.driver, By.LINK_TEXT, '加班申请')
        self.driver.find_element_by_link_text('加班申请').click()

    def select_approval_status(self,status):
        Service.wait_until_element_is_visible(self.driver,By.NAME,'status')
        Service.box_css_click(self.driver,'#queryPara > div.col-lg-12.col-md-12.col-xs-12.con-body-padding.'
                                          'text-left > select',status)

    def input_code(self,code):
        ele = self.driver.find_element_by_css_selector('#queryPara > div.col-lg-12.col-md-12.col-xs-12.con-body-padding'
                                                       '.text-left > input:nth-child(2)')
        Service.send_input(ele,code)

    def input_s_time(self,s_time):
        ele = self.driver.find_element_by_name('s_time')
        Service.send_input(ele,s_time)

    def input_e_time(self,e_time):
        ele = self.driver.find_element_by_name('e_time')
        Service.send_input(ele,e_time)

    def click_query_btn(self):
        self.driver.find_element_by_css_selector('#queryPara > div.col-lg-12.col-md-12.col-xs-12.con-body-padding.'
                                                 'text-left > button.btn.btn-info.btn-padding').click()

    def do_query_overtime_application(self,status,code,s_time,e_time):
        self.click_teaching_manage_link()
        self.click_overtime_appliaction_link()
        self.select_approval_status(status)
        self.input_code(code)
        self.input_s_time(s_time)
        self.input_e_time(e_time)
        self.click_query_btn()
        Service.wait_until_element_is_visible(self.driver,By.XPATH,'//*[@id="queryPara"]/div[2]/div[2]/div[4]/'
                                                                   'div[1]/span[1]')
        ele_text = self.driver.find_element_by_xpath('//*[@id="queryPara"]/div[2]/div[2]/div[4]/div[1]/span[1]').text
        return ele_text

    def click_add_btn(self):
        self.driver.find_element_by_css_selector('#queryPara > div.col-lg-12.col-md-12.col-xs-12.con-body-padding.text'
                                                 '-left > button.btn.btn-primary.btn-padding.pull-right').click()

    def input_add_s_time(self,s_time):
        js1 = f'document.querySelector("#addApply-form > div > div > div:nth-child(2) > div:nth-child(1) > input").value="{s_time}";'
        js2 = 'document.querySelector("body > div:nth-child(23)").style = "display: none;"'
        self.driver.execute_script(js2)
        self.driver.execute_script(js1)

    def input_add_e_time(self,e_time):
        js1 = f'document.querySelector("#addApply-form > div > div > div:nth-child(2) > div:nth-child(2) > input").value="{e_time}";'
        js2 = 'document.querySelector("body > div:nth-child(24)").style = "display: none;"'
        self.driver.execute_script(js2)
        self.driver.execute_script(js1)

    def select_pay_way(self,way):
        Service.box_name_click(self.driver,'apply.accounting_way',way)

    def select_add_hours(self,hours):
        Service.box_name_click(self.driver,'apply.hours',hours)

    def select_add_region(self,region):
        Service.box_name_click(self.driver,'apply.region_id',region)

    def input_add_reason(self,reason):
        ele = self.driver.find_element_by_name('apply.reason')
        Service.send_input(ele,reason)

    def click_add_commit_btn(self):
        self.driver.find_element_by_id('addApplyBtn').click()

    def do_add_overtime_application(self,s_time,e_time,way,hours,region,reason):
        self.click_teaching_manage_link()
        self.click_overtime_appliaction_link()
        self.click_add_btn()
        self.input_add_s_time(s_time)
        self.input_add_e_time(e_time)
        self.select_pay_way(way)
        self.select_add_hours(hours)
        self.select_add_region(region)
        self.input_add_reason(reason)
        self.click_add_commit_btn()
        Service.wait_until_element_is_visible(self.driver,By.CSS_SELECTOR,'body > div.bootbox.modal.fade.mydialog.in >'
                                                                          ' div > div')
        ele_text = self.driver.find_element_by_css_selector('body > div.bootbox.modal.fade.mydialog.in > div > div >'
                                                            ' div.modal-body > div').text
        return ele_text

    def click_undo_btn(self):
        Service.wait_until_element_is_visible(self.driver,By.CSS_SELECTOR,'#apply-table > tbody > tr:nth-child(1) > '
                                                                          'td:nth-child(12) > button')
        self.driver.find_element_by_css_selector('#apply-table > tbody > tr:nth-child(1) > td:nth-child(12) > button').\
            click()

    def do_undo_action(self):
        self.click_teaching_manage_link()
        self.click_overtime_appliaction_link()
        attr1 = self.driver.find_element_by_css_selector('#apply-table > tbody > tr:nth-child(1) > td:nth-child(12) > '
                                                        'button').get_attribute('onclick')
        self.click_undo_btn()
        Service.wait_until_element_is_visible(self.driver,By.CSS_SELECTOR,'body > div.bootbox.modal.fade.mydialog.in'
                                                                          ' > div > div')
        self.driver.find_element_by_css_selector('body > div.bootbox.modal.fade.mydialog.in > div > div > div.modal-'
                                                 'footer > button.btn.btn-primary').click()
        self.driver.refresh()
        Service.wait_until_element_is_visible(self.driver, By.CSS_SELECTOR, '#apply-table > tbody > tr:nth-child(1) > '
                                                                            'td:nth-child(12) > button')
        attr2 = self.driver.find_element_by_css_selector('#apply-table > tbody > tr:nth-child(1) > td:nth-child(12) '
                                                         '> button').get_attribute('disabled')

        return attr1,attr2

    def get_line1_status(self):
        count_text = self.driver.find_element_by_css_selector('#apply-table > tbody > tr:nth-child(1) > td:nth-child(9)').text
        return count_text


