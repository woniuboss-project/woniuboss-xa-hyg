import time
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from woniuboss.tools.woniuboss_gui.service import Service

class CourseSchedule:
    def __init__(self, driver):
        self.driver = driver

    def click_teaching_manage_link(self):
        self.driver.find_element_by_link_text('教学管理').click()

    def click_course_schedule_link(self):
        Service.wait_until_element_is_visible(self.driver, By.LINK_TEXT, '课程安排')
        self.driver.find_element_by_link_text('课程安排').click()

    def select_region(self,region):
        Service.wait_until_element_is_visible(self.driver,By.NAME,'region_id')
        Service.box_name_click(self.driver,'region_id',region)

    def select_teacher(self,teacher):
        Service.box_name_click(self.driver,'courseTeacher',teacher)

    def select_orientation(self,orientation):
        Service.box_name_click(self.driver,'orientation',orientation)

    def input_start_time(self,s_time):
        ele = self.driver.find_element_by_name('s_time')
        Service.send_input(ele,s_time)

    def input_end_time(self,e_time):
        ele = self.driver.find_element_by_name('e_time')
        Service.send_input(ele,e_time)
        ele.send_keys(Keys.ENTER)

    def click_query_btn(self):
        self.driver.find_element_by_css_selector('#course > div.col-lg-12.col-md-12.col-sm-12.col-xs-12.'
                                                 'con-body-padding.text-left > button.btn.btn-info.btn-padding').click()

    def count_td(self):
        find_td = self.driver.find_element_by_css_selector("#course_table > tbody > tr:nth-child(1)"). \
            find_elements_by_tag_name("td")
        sum_td = len(find_td)
        return sum_td

    def do_query_curriculum(self,region,teacher,orientation,s_time,e_time):
        self.click_teaching_manage_link()
        self.click_course_schedule_link()
        self.select_region(region)
        self.select_teacher(teacher)
        self.select_orientation(orientation)
        self.input_start_time(s_time)
        self.input_end_time(e_time)
        self.click_query_btn()

    def click_add_course_btn(self):
        ele = self.driver.find_element_by_css_selector('#course > div.col-lg-12.col-md-12.col-sm-12.col-xs-12.con-body-'
                                                 'padding.text-left > button.btn.btn-primary.btn-padding.pull-right')
        ele.click()

    def input_add_start_time(self,s_time):
        js1 = f'document.querySelector("#addcourse > div.row > div:nth-child(1) > input").value="{s_time}";'
        js2 = 'document.querySelector("body > div:nth-child(23) > div.datetimepicker-days").style="display: none;"'
        js3 = 'document.querySelector("body > div:nth-child(23)").style = "display: none;"'
        self.driver.execute_script(js2)
        self.driver.execute_script(js3)
        self.driver.execute_script(js1)


    def input_add_end_time(self,e_time):
        js1 = f'document.querySelector("#addcourse > div.row > div:nth-child(2) > input").value="{e_time}";'
        js2 = 'document.querySelector("body > div:nth-child(24) > div.datetimepicker-days").style="display: none;"'
        js3 = 'document.querySelector("body > div:nth-child(24)").style = "display: none;"'
        self.driver.execute_script(js2)
        self.driver.execute_script(js3)
        self.driver.execute_script(js1)

    def select_add_teacher(self,teacher):
        Service.box_css_click(self.driver,'#addCourse-table > tr > td:nth-child(1) > select',teacher)

    def select_add_classroom(self,classroom):
        Service.box_css_click(self.driver,'#addCourse-table > tr > td:nth-child(2) > select',classroom)

    def select_add_class_number(self,class_num):
        Service.box_css_click(self.driver,'#addCourse-table > tr > td:nth-child(3) > select',class_num)

    def select_add_course(self,course):
        Service.box_css_click(self.driver,'#addCourse-table > tr > td:nth-child(4) > select',course)

    def click_add_save_btn(self):
        self.driver.find_element_by_css_selector('#course-add > div > div > div.modal-footer > button').click()

    def do_add_curriculum(self,s_time,e_time,teacher,classroom,class_num,course):
        self.click_teaching_manage_link()
        self.click_course_schedule_link()
        self.click_add_course_btn()
        self.input_add_start_time(s_time)
        self.input_add_end_time(e_time)
        self.select_add_teacher(teacher)
        self.select_add_classroom(classroom)
        self.select_add_class_number(class_num)
        self.select_add_course(course)
        self.click_add_save_btn()

    def click_modify_course_btn(self):
        self.driver.find_element_by_css_selector('#course_table > tbody > tr:nth-child(2) > td:nth-child(9) > button').click()

    def input_modify_start_time(self,s_time):
        js1 = f'document.querySelector("#modifyCourseForm > div > div > div:nth-child(1) > input").value="{s_time}";'
        js2 = 'document.querySelector("body > div:nth-child(25) > div.datetimepicker-days").style="display: none;"'
        js3 = 'document.querySelector("body > div:nth-child(25)").style = "display: none;"'
        self.driver.execute_script(js2)
        self.driver.execute_script(js3)
        self.driver.execute_script(js1)

    def input_modify_end_time(self,e_time):
        js1 = f'document.querySelector("#modifyCourseForm > div > div > div:nth-child(2) > input").value="{e_time}";'
        js2 = 'document.querySelector("body > div:nth-child(26) > div.datetimepicker-days").style="display: none;"'
        js3 = 'document.querySelector("body > div:nth-child(26)").style = "display: none;"'
        self.driver.execute_script(js2)
        self.driver.execute_script(js3)
        self.driver.execute_script(js1)

    def select_modify_teacher(self,teacher):
        Service.box_css_click(self.driver,'#modifyCourseForm > div > div > div.col-md-6.col-sm-8.col-xs-8.'
                                          'form-group > select',teacher)

    def select_modify_classroom(self,classroom):
        Service.box_css_click(self.driver,'#modifyCourseForm > div > div > div:nth-child(4) > select',classroom)

    def select_modify_class_num(self,class_num):
        Service.box_css_click(self.driver,'#modifyCourseForm > div > div > div:nth-child(5) > select',class_num)

    def select_modify_course(self,course):
        Service.box_css_click(self.driver,'#modifyCourseForm > div > div > div:nth-child(6) > select',course)

    def click_modify_save_btn(self):
        self.driver.find_element_by_css_selector('#modifyCourse > div > div > div.modal-footer > button').click()

    def do_modify_curriculum(self,s_time,e_time,teacher,classroom,class_num,course):
        self.click_teaching_manage_link()
        self.click_course_schedule_link()
        self.click_modify_course_btn()
        self.input_modify_start_time(s_time)
        self.input_modify_end_time(e_time)
        self.select_modify_teacher(teacher)
        self.select_modify_classroom(classroom)
        self.select_modify_class_num(class_num)
        self.select_modify_course(course)
        self.click_modify_save_btn()