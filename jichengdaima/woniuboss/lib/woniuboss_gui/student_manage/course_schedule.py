from selenium.webdriver.common.keys import Keys

from woniuboss.tools.woniuboss_gui.service import Service
import time
from selenium.webdriver.common.by import By

class CourseSchedule:
    def __init__(self, driver):
        self.driver = driver

    def click_student_link(self):
        self.driver.find_element_by_link_text('学员管理').click()

    def click_course_schedule_link(self):
        Service.wait_until_element_is_visible(self.driver, By.LINK_TEXT, '课程安排')
        self.driver.find_element_by_link_text('课程安排').click()

    def select_teacher(self,teacher):
        Service.box_css_click(self.driver,'#course > div.col-lg-12.col-md-12.col-sm-12.'
                                          'col-xs-12.con-body-padding.text-left > select',teacher)

    def get_sum_record(self):
        ele_text = self.driver.find_element_by_css_selector('#course > div.bootstrap-table > div.fixed-table-container '
                                                            '> div.fixed-table-pagination > div.pull-left.'
                                                            'pagination-detail > span.pagination-info').text
        return ele_text

    def do_query_teacher_info(self,teacher):
        self.click_student_link()
        self.click_course_schedule_link()
        time.sleep(8)
        self.select_teacher(teacher)
        time.sleep(5)
        return self.get_sum_record()

    def click_add_curriculum(self):
        self.driver.find_element_by_css_selector('#course > div.col-lg-12.col-md-12.col-sm-12.col-xs-12.'
                                                 'con-body-padding.text-left > button').click()

    def input_start_time(self,s_time):
        ele = self.driver.find_element_by_css_selector('#addcourse > div > div:nth-child(1) > input')
        js = 'document.querySelector("#addcourse > div > div:nth-child(1) > input").value="";'
        ele.click()
        self.driver.execute_script(js)
        Service.send_input(ele, s_time)
        ele.send_keys(Keys.ENTER)

    def input_end_time(self,e_timr):
        ele = self.driver.find_element_by_css_selector('#addcourse > div > div:nth-child(2) > input')
        js = 'document.querySelector("#addcourse > div > div:nth-child(2) > input").value="";'
        ele.click()
        self.driver.execute_script(js)
        Service.send_input(ele, e_timr)
        ele.send_keys(Keys.ENTER)

    def select_status_1(self,status1):
        Service.box_css_click(self.driver,'#addCourse-table > tr:nth-child(1) > td:nth-child(3) > select',status1)

    def select_classroom_1(self,classroom1):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(1) > td:nth-child(4) > select', classroom1)

    def select_class_1(self,class1):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(1) > td:nth-child(5) > select', class1)

    def select_orientation_1(self,orientation1):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(1) > td:nth-child(6) > select', orientation1)

    def select_course_1(self,course1):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(1) > td:nth-child(7) > select',course1)

    def do_one_line(self,status1,classroom1,class1,orientation1,course1):
        self.select_status_1(status1)
        self.select_classroom_1(classroom1)
        self.select_class_1(class1)
        self.select_orientation_1(orientation1)
        self.select_course_1(course1)

    def select_status_2(self,status2):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(2) > td:nth-child(3) > select', status2)

    def select_classroom_2(self, classroom2):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(2) > td:nth-child(4) > select', classroom2)

    def select_class_2(self, class2):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(2) > td:nth-child(5) > select', class2)

    def select_orientation_2(self, orientation2):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(2) > td:nth-child(6) > select',
                              orientation2)

    def select_course_2(self, course2):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(2) > td:nth-child(7) > select', course2)

    def do_two_line(self,status2,classroom2,class2,orientation2,course2):
        self.select_status_2(status2)
        self.select_classroom_2(classroom2)
        self.select_class_2(class2)
        self.select_orientation_2(orientation2)
        self.select_course_2(course2)

    def select_status_3(self,status3):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(3) > td:nth-child(3) > select', status3)

    def select_classroom_3(self, classroom3):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(3) > td:nth-child(4) > select', classroom3)

    def select_class_3(self, class3):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(3) > td:nth-child(5) > select', class3)

    def select_orientation_3(self, orientation3):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(3) > td:nth-child(6) > select',
                              orientation3)

    def select_course_3(self, course3):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(3) > td:nth-child(7) > select', course3)

    def do_three_line(self,status3,classroom3,class3,orientation3,course3):
        self.select_status_3(status3)
        self.select_classroom_3(classroom3)
        self.select_class_3(class3)
        self.select_orientation_3(orientation3)
        self.select_course_3(course3)

    def select_status_4(self, status4):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(4) > td:nth-child(3) > select', status4)

    def select_classroom_4(self, classroom4):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(4) > td:nth-child(4) > select', classroom4)

    def select_class_4(self, class4):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(4) > td:nth-child(5) > select', class4)

    def select_orientation_4(self, orientation4):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(4) > td:nth-child(6) > select',
                              orientation4)

    def select_course_4(self, course4):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(4) > td:nth-child(7) > select', course4)

    def do_four_line(self,status4,classroom4,class4,orientation4,course4):
        self.select_status_4(status4)
        self.select_classroom_4(classroom4)
        self.select_class_4(class4)
        self.select_orientation_4(orientation4)
        self.select_course_4(course4)

    def select_status_5(self, status5):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(5) > td:nth-child(3) > select', status5)

    def select_classroom_5(self, classroom5):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(5) > td:nth-child(4) > select', classroom5)

    def select_class_5(self, class5):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(5) > td:nth-child(5) > select', class5)

    def select_orientation_5(self, orientation5):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(5) > td:nth-child(6) > select',
                              orientation5)

    def select_course_5(self, course5):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(5) > td:nth-child(7) > select', course5)

    def do_five_line(self,status5,classroom5,class5,orientation5,course5):
        self.select_status_5(status5)
        self.select_classroom_5(classroom5)
        self.select_class_5(class5)
        self.select_orientation_5(orientation5)
        self.select_course_5(course5)

    def select_status_6(self, status6):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(6) > td:nth-child(3) > select', status6)

    def select_classroom_6(self, classroom6):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(6) > td:nth-child(4) > select', classroom6)

    def select_class_6(self, class6):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(6) > td:nth-child(5) > select', class6)

    def select_orientation_6(self, orientation6):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(6) > td:nth-child(6) > select',
                              orientation6)

    def select_course_6(self, course6):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(6) > td:nth-child(7) > select', course6)

    def do_six_line(self,status6,classroom6,class6,orientation6,course6):
        self.select_status_6(status6)
        self.select_classroom_6(classroom6)
        self.select_class_6(class6)
        self.select_orientation_6(orientation6)
        self.select_course_6(course6)

    def select_status_7(self, status7):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(7) > td:nth-child(3) > select', status7)

    def select_classroom_7(self, classroom7):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(7) > td:nth-child(4) > select', classroom7)

    def select_class_7(self, class7):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(7) > td:nth-child(5) > select', class7)

    def select_orientation_7(self, orientation7):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(7) > td:nth-child(6) > select',
                              orientation7)

    def select_course_7(self, course7):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(7) > td:nth-child(7) > select', course7)

    def do_seven_line(self,status7,classroom7,class7,orientation7,course7):
        self.select_status_7(status7)
        self.select_classroom_7(classroom7)
        self.select_class_7(class7)
        self.select_orientation_7(orientation7)
        self.select_course_7(course7)

    def select_status_8(self, status8):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(8) > td:nth-child(3) > select', status8)

    def select_classroom_8(self, classroom8):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(8) > td:nth-child(4) > select', classroom8)

    def select_class_8(self, class8):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(8) > td:nth-child(5) > select', class8)

    def select_orientation_8(self, orientation8):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(8) > td:nth-child(6) > select',
                              orientation8)

    def select_course_8(self, course8):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(8) > td:nth-child(7) > select', course8)

    def do_eight_line(self,status8,classroom8,class8,orientation8,course8):
        self.select_status_8(status8)
        self.select_classroom_8(classroom8)
        self.select_class_8(class8)
        self.select_orientation_8(orientation8)
        self.select_course_8(course8)

    def select_status_9(self, status9):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(9) > td:nth-child(3) > select', status9)

    def select_classroom_9(self, classroom9):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(9) > td:nth-child(4) > select', classroom9)

    def select_class_9(self, class9):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(9) > td:nth-child(5) > select', class9)

    def select_orientation_9(self, orientation9):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(9) > td:nth-child(6) > select',
                              orientation9)

    def select_course_9(self, course9):
        Service.box_css_click(self.driver, '#addCourse-table > tr:nth-child(9) > td:nth-child(7) > select', course9)

    def do_nine_line(self,status9,classroom9,class9,orientation9,course9):
        self.select_status_9(status9)
        self.select_classroom_9(classroom9)
        self.select_class_9(class9)
        self.select_orientation_9(orientation9)
        self.select_course_9(course9)

    def click_save_and_close_btn(self):
        self.driver.find_element_by_css_selector('#course-add > div > div > div.modal-footer > '
                                                 'button:nth-child(2)').click()

    def get_add_attr(self):
        attr = self.driver.find_element_by_id('course-add').get_attribute('style')
        return attr

    def do_add_curriculum(self,s_time,e_time,status1,classroom1,class1,orientation1,course1,
                          status2,classroom2,class2,orientation2,course2,
                          status3,classroom3,class3,orientation3,course3,
                          status4,classroom4,class4,orientation4,course4,
                          status5,classroom5,class5,orientation5,course5,
                          status6,classroom6,class6,orientation6,course6,
                          status7,classroom7,class7,orientation7,course7,
                          status8,classroom8,class8,orientation8,course8,
                          status9,classroom9,class9,orientation9,course9):
        # self.click_student_link()
        self.click_course_schedule_link()
        time.sleep(5)
        self.click_add_curriculum()
        self.input_start_time(s_time)
        self.input_end_time(e_time)
        self.do_one_line(status1,classroom1,class1,orientation1,course1)
        self.do_two_line(status2,classroom2,class2,orientation2,course2)
        self.do_three_line(status3,classroom3,class3,orientation3,course3)
        self.do_four_line(status4,classroom4,class4,orientation4,course4)
        self.do_five_line(status5,classroom5,class5,orientation5,course5)
        self.do_six_line(status6,classroom6,class6,orientation6,course6)
        self.do_seven_line(status7,classroom7,class7,orientation7,course7)
        self.do_eight_line(status8,classroom8,class8,orientation8,course8)
        self.do_nine_line(status9,classroom9,class9,orientation9,course9)
        self.click_save_and_close_btn()
        time.sleep(5)
        return self.get_add_attr()

    def click_modify_btn(self):
        self.driver.find_element_by_css_selector('#course_table > tbody > tr:nth-child(1) > '
                                                 'td:nth-child(10) > button').click()

    def input_modify_start_time(self,s_time):
        ele = self.driver.find_element_by_xpath('//*[@id="course_table"]/tbody/tr[1]/td[10]/button')
        js1 = 'document.querySelector("#modifyCourseForm > div > div > div:nth-child(1) > input").value="";'
        self.driver.execute_script(js1)
        js2 = 'document.querySelector("#modifyCourseForm > div > div > div:nth-child(1) > input").value="%s";'%s_time
        self.driver.execute_script(js2)
        # ele.click()
        # Service.send_input(ele, s_time)
        # ele.send_keys(Keys.ENTER)

    def input_modify_end_time(self,e_time):
        ele = self.driver.find_element_by_xpath('//*[@id="modifyCourseForm"]/div/div/div[2]/input')
        js1 = 'document.querySelector("#modifyCourseForm > div > div > div:nth-child(2) > input").value="";'
        self.driver.execute_script(js1)
        js2 = 'document.querySelector("#modifyCourseForm > div > div > div:nth-child(2) > input").value="%s";'%e_time
        self.driver.execute_script(js2)
        # ele.click()
        # Service.send_input(ele, e_time)
        ele.send_keys(Keys.ENTER)

    def select_modify_status(self,status):
        Service.box_css_click(self.driver,'#modifyCourseForm > div > div > div:nth-child(4) > select',status)

    def select_modify_orientation(self,orientation):
        Service.box_css_click(self.driver,'#modifyCourseForm > div > div > div:nth-child(5) > select',orientation)

    def select_modify_curriculum(self,course):
        Service.box_css_click(self.driver,'#modifyCourseForm > div > div > div:nth-child(6) > select',course)

    def select_modify_class(self,class_num):
        Service.box_css_click(self.driver,'#modifyCourseForm > div > div > div:nth-child(7) > select',class_num)

    def select_modify_classroom(self,classroom):
        Service.box_css_click(self.driver,'#modifyCourseForm > div > div > div:nth-child(8) > select',classroom)

    def click_save_btn(self):
        self.driver.find_element_by_xpath('//*[@id="modifyCourse"]/div/div/div[2]/button').click()

    def get_modify_attr(self):
        attr = self.driver.find_element_by_id('modifyCourse').get_attribute('style')
        return attr

    def do_modify_curriculum(self,s_time,e_time,status,orientation,course,class_num,classroom):
        # self.click_student_link()
        self.click_course_schedule_link()
        time.sleep(5)
        self.click_modify_btn()
        time.sleep(5)
        self.input_modify_start_time(s_time)
        self.input_modify_end_time(e_time)
        self.select_modify_status(status)
        self.select_modify_orientation(orientation)
        self.select_modify_curriculum(course)
        self.select_modify_class(class_num)
        self.select_modify_classroom(classroom)
        self.click_save_btn()
        time.sleep(5)
        return self.get_modify_attr()