import time
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

from woniuboss.tools.woniuboss_gui.service import Service

class WeekExamResult:

    def __init__(self, driver):
        self.driver = driver

    def click_student_manage_link(self):
        self.driver.find_element_by_link_text('学员管理').click()

    def click_week_exam_link(self):
        Service.wait_until_element_is_visible(self.driver, By.LINK_TEXT, '周考成绩')
        self.driver.find_element_by_link_text('周考成绩').click()

    def select_class(self,class_name):
        Service.wait_until_element_is_visible(self.driver,By.ID,'pe-result')
        Service.box_css_click(self.driver,'#stagetest > div.col-lg-12.col-md-12.col-sm-12.col-xs-12.con-body-padding.'
                                          'text-left > select',class_name)

    def input_stu_name(self,name):
        Service.wait_until_element_is_visible(self.driver, By.ID, 'pe-result')
        ele = self.driver.find_element_by_css_selector('#stagetest > div.col-lg-12.col-md-12.col-sm-12.col-xs-12.'
                                                       'con-body-padding.text-left > input[type=text]')
        Service.send_input(ele,name)

    def click_query_btn(self):
        Service.wait_until_element_is_visible(self.driver, By.ID, 'pe-result')
        self.driver.find_element_by_css_selector('#stagetest > div.col-lg-12.col-md-12.col-sm-12.col-xs-12.'
                                                 'con-body-padding.text-left > button').click()

    def do_query_week_exam_info(self,class_name,name):
        self.click_student_manage_link()
        self.click_week_exam_link()
        self.select_class(class_name)
        self.input_stu_name(name)
        self.click_query_btn()

    def click_entry_btn(self):
        ele = self.driver.find_element_by_css_selector('#pe-result > tbody > tr:nth-child(1) > '
                                                 'td:nth-child(9) > button')
        ele.click()
        return ele.get_attribute('onclick')

    def select_box_class(self,class_name):
        Service.box_id_click(self.driver,'we_cl',class_name)

    def select_box_phase(self,phase):
        Service.box_id_click(self.driver,'we_phase',phase)

    def select_box_week(self,week):
        Service.box_id_click(self.driver,'we_week',week)

    def input_box_score(self,score):
        ele = self.driver.find_element_by_css_selector('#weekExam-form > div:nth-child(2) > div:nth-child(4) > input')
        Service.send_input(ele,score)

    def click_box_save_btn(self):
        self.driver.find_element_by_css_selector('#weekExam-modal > div > div > div.modal-footer > button').click()

    def do_entry_sigle_score(self,class_name,phase,week,score):
        self.click_student_manage_link()
        self.click_week_exam_link()
        attr = self.click_entry_btn()
        time.sleep(2)
        self.select_box_class(class_name)
        self.select_box_phase(phase)
        self.select_box_week(week)
        self.input_box_score(score)
        self.click_box_save_btn()
        return attr

    def click_week_exam_import_btn(self):
        self.driver.find_element_by_css_selector('#stagetest > div.col-lg-12.col-md-12.col-sm-12.col-xs-12.'
                                                 'con-body-padding.text-left > div > button:nth-child(2)').click()

    def select_upload_class(self,class_name):
        Service.box_id_click(self.driver,'import_cl',class_name)

    def select_upload_phase(self,phase):
        Service.box_id_click(self.driver,'import_ph',phase)

    def select_upload_week(self,week):
        Service.box_id_click(self.driver,'import_we',week)

    def select_upload_file(self,file_path):
        ele = self.driver.find_element_by_css_selector('#files')
        ele.send_keys(file_path)

    # body > div.bootbox.modal.fade.mydialog. in > div > div
    def click_upload_save_btn(self):
        self.driver.find_element_by_css_selector('#upRes-modal > div > div > div.modal-footer > button').xlixk()

    def do_upload_week_exam(self,class_name,phase,week,file_path):
        self.click_student_manage_link()
        self.click_week_exam_link()
        self.click_week_exam_import_btn()
        self.select_upload_class(class_name)
        self.select_upload_phase(phase)
        self.select_upload_week(week)
        self.select_upload_file(file_path)