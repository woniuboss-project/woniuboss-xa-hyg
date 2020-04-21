import time

from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

from woniuboss.tools.woniuboss_gui.service import Service

class CorporateCustomers:

    def __init__(self, driver):
        self.driver = driver

    def click_link_text(self):
        self.driver.find_element_by_link_text('企业客户').click()

    def input_query_name(self,name):
        Service.wait_until_element_is_visible(self.driver,By.CSS_SELECTOR,'#content > div.row.con-margin.con-body-header > div > '
                                                       'input[type=text]')
        ele = self.driver.find_element_by_css_selector('#content > div.row.con-margin.con-body-header > div > '
                                                       'input[type=text]')
        Service.send_input(ele,name)

    def click_query_btn(self):
        self.driver.find_element_by_css_selector('#content > div.row.con-margin.con-body-header > '
                                                 'div > button:nth-child(3)').click()

    def count_td(self):
        find_td = self.driver.find_element_by_css_selector("#enterpriseTb > tbody > tr:nth-child(1)")\
            .find_elements_by_tag_name("td")
        sum_td = len(find_td)
        return sum_td

    def do_query_ent_info(self,name):
        self.click_link_text()
        self.input_query_name(name)
        time.sleep(5)
        self.click_query_btn()
        time.sleep(2)
        return self.count_td()

    def click_add_enterprise_button(self):
        Service.wait_until_element_is_visible(self.driver,By.CSS_SELECTOR,"button[class='btn btn-primary btn-padding']"
                                                                          ":nth-child(1)")
        self.driver.find_element_by_css_selector("button[class='btn btn-primary btn-padding']:nth-child(1)").click()

    def input_enterprise_name(self,enter_name):
        ele = self.driver.find_element_by_id('newentname')
        Service.send_input(ele,enter_name)
        ele.send_keys(Keys.ENTER)

    def input_enterprise_industry(self,ent_industry):
        ele = self.driver.find_element_by_id('newentcate')
        Service.send_input(ele,ent_industry)

    def input_enterprise_address(self,enter_address):
        ele = self.driver.find_element_by_id('newentaddr')
        Service.send_input(ele,enter_address)

    def input_enterprise_contact_person(self,enter_person):
        ele = self.driver.find_element_by_id('newentheader')
        Service.send_input(ele,enter_person)

    def input_enterprise_contact_tel(self,enter_tel):
        ele = self.driver.find_element_by_id('newtel')
        Service.send_input(ele,enter_tel)

    def input_enterprise_email(self,email):
        ele = self.driver.find_element_by_id('newemail')
        Service.send_input(ele,email)

    def input_enterprise_qq(self,qq):
        ele = self.driver.find_element_by_css_selector('#enterprise_form > div:nth-child(7) > input')
        Service.send_input(ele,qq)

    def click_add_button(self):
        self.driver.find_element_by_css_selector('#company-add > div > div > div.modal-footer').click()

    def do_add_enterprise(self,enter_name,ent_industry,enter_address,enter_person,enter_tel,email,qq):
        self.click_link_text()
        self.click_add_enterprise_button()
        self.input_enterprise_name(enter_name)
        self.input_enterprise_industry(ent_industry)
        self.input_enterprise_address(enter_address)
        self.input_enterprise_contact_person(enter_person)
        self.input_enterprise_contact_tel(enter_tel)
        self.input_enterprise_email(email)
        self.input_enterprise_qq(qq)
        self.click_add_button()
        time.sleep(2)
        content = self.driver.switch_to.alert.text
        self.driver.switch_to.alert.accept()
        return content

    def click_close_btn(self):
        self.driver.find_element_by_css_selector('#company-add > div > div > div.modal-header > '
                                                 'button > span:nth-child(1)').click()

    def click_modify_btn(self):
        Service.wait_until_element_is_visible(self.driver, By.CSS_SELECTOR,
                                              "button[class='btn btn-primary btn-padding']"
                                              ":nth-child(1)")
        self.driver.find_element_by_css_selector('#enterpriseTb > tbody > tr:nth-child(1) > '
                                                 'td:nth-child(7) > button').click()

    def input_modify_name(self,name):
        ele = self.driver.find_element_by_id('entName')
        Service.send_input(ele,name)
        ele.send_keys(Keys.ENTER)

    def input_modify_industry(self,industry):
        ele = self.driver.find_element_by_id('entCate')
        Service.send_input(ele,industry)

    def input_modify_address(self,address):
        ele = self.driver.find_element_by_id('entAddr')
        Service.send_input(ele, address)


    def input_modify_person(self,person):
        ele = self.driver.find_element_by_id('entHeader')
        Service.send_input(ele, person)

    def input_modify_tel(self,tel):
        ele = self.driver.find_element_by_id('entTel')
        Service.send_input(ele, tel)

    def input_modify_email(self,email):
        ele = self.driver.find_element_by_id('entEmail')
        Service.send_input(ele, email)

    def input_modify_qq(self,qq):
        ele = self.driver.find_element_by_id('entQq')
        Service.send_input(ele, qq)

    def click_modify_save_btn(self):
        self.driver.find_element_by_css_selector('#company-modif > div > div > div.modal-footer > button').click()

    def do_modify_enterprise_info(self,name,industry,address,person,tel,email,qq):
        self.click_link_text()
        self.click_modify_btn()
        self.input_modify_name(name)
        self.input_modify_industry(industry)
        self.input_modify_address(address)
        self.input_modify_person(person)
        self.input_modify_tel(tel)
        self.input_modify_email(email)
        self.input_modify_qq(qq)
        self.click_modify_save_btn()

    def click_modify_close_btn(self):
        self.driver.find_element_by_css_selector('#company-modif > div > div > div.modal-header > '
                                                 'button > span:nth-child(1)').click()