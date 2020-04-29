import time

from selenium.webdriver.common.by import By

from woniuboss.tools.woniuboss_gui.service import Service

class BasicInfo:
    def __init__(self, driver):
        self.driver = driver

    def click_navigate_link(self):
        self.driver.find_element_by_link_text('学员管理').click()

    def select_class_options(self,class_name):
        Service.wait_until_element_is_visible(self.driver,By.NAME,'stuClass')
        Service.box_name_click(self.driver,'stuClass',class_name)

    def select_orientation_option(self,orien_name):
        Service.box_name_click(self.driver, 'orientation', orien_name)

    def select_status_option(self,status_name):
        Service.box_name_click(self.driver, 'stuStatus', status_name)

    def input_stu_name(self,stu_name):
        ele = self.driver.find_element_by_name('stuName')
        Service.send_input(ele,stu_name)

    def input_stu_no(self,stu_no):
        ele = self.driver.find_element_by_name('stuNo')
        Service.send_input(ele,stu_no)

    def click_search_btn(self):
        self.driver.find_element_by_css_selector('#stuInfo > div.col-lg-6.col-md-6.col-xs-12.'
                                                 'con-body-padding.text-left > button').click()

    def count_td(self):
        find_td = self.driver.find_element_by_css_selector("#stuInfo_table > tbody > tr:nth-child(1)")\
            .find_elements_by_tag_name("td")
        sum_td = len(find_td)
        return sum_td

    def do_search_student(self,class_name,orien_name,status_name,stu_name,stu_no):
        self.click_navigate_link()
        time.sleep(5)
        self.select_class_options(class_name)
        self.select_orientation_option(orien_name)
        self.select_status_option(status_name)
        self.input_stu_name(stu_name)
        self.input_stu_no(stu_no)
        self.click_search_btn()
        time.sleep(5)



    def random_select_click_modify(self):
        find_tr = self.driver.find_element_by_css_selector("#stuInfo_table > tbody").find_elements_by_tag_name("tr")
        sum_tr = len(find_tr)
        # import random
        # self.driver.find_element_by_css_selector('#stuInfo_table>tbody>tr:nth-child(%d)>td:nth-child(12) > '
        #                                          'button:nth-child(2)' % (random.randint(1, sum_tr - 1))).click()
        self.driver.find_element_by_css_selector('#stuInfo_table>tbody>tr:nth-child(1)>td:nth-child(12) > '
                                                 'button:nth-child(2)').click()

    def input_box_stu_name(self,name):
        ele = self.driver.find_element_by_name('stu.student_name')
        Service.send_input(ele, name)

    def input_box_stu_no(self,stu_no):
        ele = self.driver.find_element_by_name('stu.student_no')
        Service.send_input(ele, stu_no)

    def input_box_stu_tel(self,stu_tel):
        ele = self.driver.find_element_by_name('stu.tel')
        Service.send_input(ele, stu_tel)

    def input_box_stu_mail(self,stu_mail):
        ele = self.driver.find_element_by_name('stu.email')
        Service.send_input(ele, stu_mail)

    def input_box_stu_qq(self,stu_qq):
        ele = self.driver.find_element_by_name('stu.QQ')
        Service.send_input(ele, stu_qq)

    def input_box_stu_school(self,school):
        ele = self.driver.find_element_by_name('stu.QQ')
        Service.send_input(ele, school)

    def input_box_stu_major(self,major):
        ele = self.driver.find_element_by_name('stu.major')
        Service.send_input(ele, major)

    def input_box_id_num(self,id_num):
        ele = self.driver.find_element_by_name('stu.IDnumber')
        Service.send_input(ele, id_num)

    def input_box_stu_age(self,age):
        ele = self.driver.find_element_by_name('stu.age')
        Service.send_input(ele, age)

    def input_box_pacture(self,pacture_path):
        ele = self.driver.find_element_by_id('stuPicture')
        ele.send_keys(pacture_path)

    def click_save_btn(self):
        self.driver.find_element_by_css_selector('#form-modify > div > div > div.modal-footer > button').click()

    def do_modify_stu_info(self,name,stu_no,stu_tel,stu_mail,stu_qq,school,major,id_num,age,pacture_path):
        self.click_navigate_link()
        time.sleep(5)
        self.random_select_click_modify()
        self.input_box_stu_name(name)
        self.input_box_stu_no(stu_no)
        self.input_box_stu_tel(stu_tel)
        self.input_box_stu_mail(stu_mail)
        self.input_box_stu_qq(stu_qq)
        self.input_box_stu_school(school)
        self.input_box_stu_major(major)
        self.input_box_id_num(id_num)
        self.input_box_stu_age(age)
        time.sleep(2)
        self.input_box_pacture(pacture_path)
        self.click_save_btn()

