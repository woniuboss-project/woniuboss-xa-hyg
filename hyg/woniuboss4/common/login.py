from selenium import webdriver
class Login:
    #输入用户名
    def username(self,driver,value):
        user = driver.find_element_by_css_selector('div.row:nth-child(1) > input:nth-child(1)')
        user.click()
        user.clear()
        user.send_keys(value)
    #输入密码
    def password(self,driver,value):
        password = driver.find_element_by_css_selector('div.row:nth-child(2) > input:nth-child(1)')
        password.click()
        password.clear()
        password.send_keys(value)
    #输入验证码
    def Verification(self,driver,value):
        ver = driver.find_element_by_css_selector('input.col-md-6')
        ver.click()
        ver.clear()
        ver.send_keys(value)
    #点击对勾
    def passd(self,driver):
        ps = driver.find_element_by_css_selector('div.row:nth-child(4) > input:nth-child(1)')
        ps.click()
    #点击登陆按钮
    def button_login(self,driver):
        lg = driver.find_element_by_css_selector('.btn')
        lg.click()
    #点击注销按钮
    def login_out(self,driver):
        driver.find_element_by_xpath('/html/body/div[2]/div[2]/ul/li[2]/a').click()
    def do_login(self,driver,value):
        self.username(driver,value[0][0])
        self.password(driver,value[0][1])
        self.Verification(driver,value[0][2])
        self.passd(driver)
        self.button_login(driver)
        # self.login_out(driver)





