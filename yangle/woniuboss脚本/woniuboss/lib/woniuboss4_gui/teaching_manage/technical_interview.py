import time
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from woniuboss.tools.woniuboss_gui.service import Service

class TechnicalInterview:

    def __init__(self, driver):
        self.driver = driver

    def click_teaching_manage_link(self):
        self.driver.find_element_by_link_text('教学管理').click()

    def click_technical_interview_link(self):
        Service.wait_until_element_is_visible(self.driver, By.LINK_TEXT, '技术面试')
        self.driver.find_element_by_link_text('技术面试').click()

    def select_level(self,level):
        Service.wait_until_element_is_visible(self.driver,By.ID,'studentSelect')
        Service.box_id_click(self.driver,'studentSelect',level)

    def select_class(self,class_name):
        Service.box_id_click(self.driver,'semesterSelect',class_name)

    def input_stu_name(self,name):
        ele = self.driver.find_element_by_name('stuName')
        Service.send_input(ele,name)

    def input_stu_no(self,no):
        ele = self.driver.find_element_by_name('stuNo')
        Service.send_input(ele,no)

    def click_search_btn(self):
        self.driver.find_element_by_css_selector('#skills > div.col-lg-12.col-md-12.col-xs-12.con-body-padding.'
                                                 'text-left > button').click()

    def count_td(self):
        find_td = self.driver.find_element_by_css_selector("#stuInfo_table > tbody > tr:nth-child(1)"). \
            find_elements_by_tag_name("td")
        sum_td = len(find_td)
        return sum_td

    def do_search_info(self,level,class_name,name,no):
        self.click_teaching_manage_link()
        self.click_technical_interview_link()
        self.select_level(level)
        self.select_class(class_name)
        self.input_stu_name(name)
        self.input_stu_no(no)
        time.sleep(2)
        self.click_search_btn()
        time.sleep(5)
        return self.count_td()

    def random_click_interview_btn(self):
        Service.wait_until_element_is_visible(self.driver,By.CSS_SELECTOR,'#stuInfo_table > tbody')
        find_tr = self.driver.find_element_by_css_selector("#stuInfo_table > tbody").find_elements_by_tag_name("tr")
        sum_tr = len(find_tr)
        import random
        self.driver.find_element_by_css_selector('#stuInfo_table > tbody > tr:nth-child(%d) > '
                                                 'td:nth-child(9) > button' % (random.randint(1, sum_tr - 1))).click()

    def select_interview_result(self,result):
        Service.box_id_click(self.driver,'isPassSkill',result)

    def input_interview_comment(self,comment):
        ele = self.driver.find_element_by_id('sval')
        Service.send_input(ele,comment)

    def click_save_btn(self):
        self.driver.find_element_by_id('saveSkillbtn').click()

    def do_interview(self,result,comment):
        self.click_teaching_manage_link()
        self.click_technical_interview_link()
        time.sleep(3)
        self.random_click_interview_btn()
        self.select_interview_result(result)
        self.input_interview_comment(comment)
        self.click_save_btn()
        time.sleep(2)
        ele_text = self.driver.find_element_by_css_selector('body > div.bootbox.modal.fade.mydialog.in > '
                                                            'div > div > div.modal-body > div').text
        return ele_text

