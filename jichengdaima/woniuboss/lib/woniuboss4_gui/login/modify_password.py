from woniuboss.tools.woniuboss_gui.service import Service
import time

class ModifyPassWord:

    def __init__(self, driver):
        self.driver = driver

    def click_modify_passwd_button(self):
        self.driver.find_element_by_partial_link_text("修改密码").click()

    def input_old_passwd1(self,old_pd):
        old_passwd = self.driver.find_element_by_css_selector('#resetInfo > div:nth-child(1) > input')
        Service.send_input(old_passwd,old_pd)

    def input_new_passwd_lst1(self,new_pd_lst):
        new_passwd_lst = self.driver.find_element_by_css_selector('#resetInfo > div:nth-child(2) > input')
        Service.send_input(new_passwd_lst,new_pd_lst)

    def input_new_passwd_2st1(self,new_pd_2st):
        new_passwd_2st = self.driver.find_element_by_css_selector('#resetInfo > div:nth-child(3) > input')
        Service.send_input(new_passwd_2st,new_pd_2st)

    def click_confirm_button1(self):
        self.driver.find_element_by_xpath('//*[@id="panel-password"]/div[2]/button').click()

    def do_modify_login_passwd(self,old,new1,new2):
        self.click_modify_passwd_button()
        self.input_old_passwd1(old)
        self.input_new_passwd_lst1(new1)
        self.input_new_passwd_2st1(new2)
        self.click_confirm_button1()
        time.sleep(5)

    def click_second_btn(self):
        self.driver.find_element_by_id('password2').click()

    def input_old_pwd2(self,old):
        old_2=self.driver.find_element_by_css_selector('#pass2Form > div:nth-child(1) > input')
        Service.send_input(old_2,old)

    def input_new_pwd_lst2(self,new_1):
        new_2st1=self.driver.find_element_by_css_selector('#pass2Form > div:nth-child(2) > input')
        Service.send_input(new_2st1,new_1)

    def input_new_pwd_2st2(self,new2):
        new_2st2=self.driver.find_element_by_css_selector('#pass2Form > div:nth-child(3) > input')
        Service.send_input(new_2st2,new2)

    def click_confirm_button2(self):
        self.driver.find_element_by_css_selector('#panel-password2 > div.modal-footer > button').click()

    def do_modify_second_passwd(self,old,new1,new2):
        self.click_modify_passwd_button()
        self.click_second_btn()
        self.input_old_pwd2(old)
        self.input_new_pwd_lst2(new1)
        self.input_new_pwd_2st2(new2)
        self.click_confirm_button2()
        time.sleep(5)