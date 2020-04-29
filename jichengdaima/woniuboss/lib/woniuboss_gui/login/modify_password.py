from woniuboss.tools.woniuboss_gui.service import Service

class ModifyPassword:
    def __init__(self, driver):
        self.driver = driver

    def click_modify_passwd_button(self):
        self.driver.find_element_by_css_selector("div[class='navbar navbar-default']>"
                                                 "div:nth-child(2)>ul>li:nth-child(1)").click()

    def input_old_passwd1(self,old_pd):
        old_passwd = self.driver.find_element_by_name("oldPw")
        Service.send_input(old_passwd,old_pd)

    def input_new_passwd_lst1(self,new_pd_lst):
        new_passwd_lst = self.driver.find_element_by_name("newPw1")
        Service.send_input(new_passwd_lst,new_pd_lst)

    def input_new_passwd_2st1(self,new_pd_2st):
        new_passwd_2st = self.driver.find_element_by_name("newPw2")
        Service.send_input(new_passwd_2st,new_pd_2st)

    def click_confirm_button2(self):
        self.driver.find_element_by_xpath('//*[@id="panel-password2"]/div[2]/button').click()

    def click_confirm_button1(self):
        self.driver.find_element_by_xpath('//*[@id="panel-password"]/div[2]/button').click()

    def click_2st_passwd(self):
        self.driver.find_element_by_id("password2").click()

    def input_old_pwd2(self,old):
        old_2=self.driver.find_element_by_css_selector('#pass2Form > div:nth-child(1) > input')
        Service.send_input(old_2,old)

    def input_new_pwd_lst2(self,new_1):
        new_2st1=self.driver.find_element_by_css_selector('#pass2Form > div:nth-child(2) > input')
        Service.send_input(new_2st1,new_1)

    def input_new_pwd_2st2(self,new2):
        new_2st2=self.driver.find_element_by_css_selector('#pass2Form > div:nth-child(3) > input')
        Service.send_input(new_2st2,new2)

    def modify_2st_passwd(self,old_pd,new_pd1,new_pd2):
        self.click_modify_passwd_button()
        self.click_2st_passwd()
        self.input_old_pwd2(old_pd)
        self.input_new_pwd_lst2(new_pd1)
        self.input_new_pwd_2st2(new_pd2)
        self.click_confirm_button2()
        import time
        time.sleep(5)

    def modify_login_pqsswd(self,old_pd,new_pd1,new_pd2):
        self.click_modify_passwd_button()
        self.input_old_passwd1(old_pd)
        self.input_new_passwd_lst1(new_pd1)
        self.input_new_passwd_2st1(new_pd2)
        self.click_confirm_button1()
        import time
        time.sleep(5)


