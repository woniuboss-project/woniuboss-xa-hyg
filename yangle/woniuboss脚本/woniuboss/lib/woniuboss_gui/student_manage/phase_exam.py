from woniuboss.tools.woniuboss_gui.service import Service
import time
from selenium.webdriver.common.by import By

class PhaseExam:

    def __init__(self, driver):
        self.driver = driver

    def click_student_link(self):
        self.driver.find_element_by_link_text('学员管理').click()

    def click_phase_exam_link(self):
        Service.wait_until_element_is_visible(self.driver, By.LINK_TEXT, '阶段测评')
        self.driver.find_element_by_link_text('阶段测评').click()

    def select_class(self,class_name):
        Service.wait_until_element_is_visible(self.driver,By.CSS_SELECTOR,'#exam-table > tbody')
        Service.box_css_click(self.driver,'#examination > div.col-lg-8.col-md-8.col-sm-12.col-xs-12.con-body-padding.'
                                          'text-left > select.sel-text.stu-class',class_name)

    def select_orientation(self,orientation):
        Service.box_css_click(self.driver,'#examination > div.col-lg-8.col-md-8.col-sm-12.col-xs-12.con-body-padding.'
                                          'text-left > select.sel-text.stu-orientation',orientation)

    def input_name(self,name):
        ele = self.driver.find_element_by_css_selector('#examination > div.col-lg-8.col-md-8.col-sm-12.col-xs-12.'
                                                       'con-body-padding.text-left > input[type=text]')
        Service.send_input(ele,name)

    def click_query_btn(self):
        self.driver.find_element_by_xpath('//*[@id="examination"]/div[1]/button').click()

    def do_query_info(self,class_name,orientation,name):
        self.click_student_link()
        self.click_phase_exam_link()
        time.sleep(5)
        self.select_class(class_name)
        self.select_orientation(orientation)
        time.sleep(5)
        self.input_name(name)
        self.click_query_btn()
        time.sleep(5)
        return self.get_text()

    def click_random_test_btn(self):
        Service.wait_until_element_is_visible(self.driver, By.CSS_SELECTOR, '#exam-table > tbody')
        find_tr = self.driver.find_element_by_css_selector("#exam-table > tbody").find_elements_by_tag_name("tr")
        sum_tr = len(find_tr)
        import random
        ram_num = random.randint(1, sum_tr - 1)
        self.driver.find_element_by_css_selector('#exam-table > tbody > tr:nth-child(%d) > '
                                                 'td:nth-child(6) > button:nth-child(1)' % ram_num).click()

    def select_phase(self,phase):
        Service.wait_until_element_is_visible(self.driver,By.CSS_SELECTOR,'#score-modal > div > div')
        Service.box_name_click(self.driver,'pe.phase',phase)


    def input_score(self,score):
        ele = self.driver.find_element_by_name('pe.score')
        Service.send_input(ele,score)

    def input_comment(self,comment):
        ele = self.driver.find_element_by_name('pe.comment')
        Service.send_input(ele,comment)

    def click_save_btn(self):
        self.driver.find_element_by_id('saveStageBtn').click()

    def do_phase_test(self,phase,score,comment):
        self.click_student_link()
        self.click_phase_exam_link()
        time.sleep(8)
        self.click_random_test_btn()
        self.select_phase(phase)
        self.input_score(score)
        self.input_comment(comment)
        self.click_save_btn()

    def click_random_down_btn(self):
        Service.wait_until_element_is_visible(self.driver, By.CSS_SELECTOR, '#exam-table > tbody')
        find_tr = self.driver.find_element_by_css_selector("#exam-table > tbody").find_elements_by_tag_name("tr")
        sum_tr = len(find_tr)
        import random
        ram_num = random.randint(1, sum_tr - 1)
        self.driver.find_element_by_css_selector('#exam-table > tbody > tr:nth-child(%d) > td:nth-child(6) >'
                                                 ' button:nth-child(2)' % ram_num).click()

    def select_down_orientation(self,orientation):
        Service.box_css_click(self.driver,'#repeat-form > div > div:nth-child(2) > div:nth-child(2) > select'
                              ,orientation)

    def select_down_class(self,class_name):
        Service.box_css_click(self.driver,'#repeat-form > div > div:nth-child(2) > div:nth-child(3) > select',
                              class_name)

    def click_down_save_btn(self):
        self.driver.find_element_by_id('saveRepeatBtn').click()

    def do_down_grade(self,orientation,class_name):
        # self.click_student_link()
        self.click_phase_exam_link()
        time.sleep(5)
        ele_text1 = self.get_text()
        self.click_random_down_btn()
        self.select_down_orientation(orientation)
        self.select_down_class(class_name)
        self.click_down_save_btn()
        time.sleep(5)
        ele_text2 = self.get_text()
        return ele_text1,ele_text2

    def get_text(self):
        ele_text = self.driver.find_element_by_xpath('//*[@id="examination"]/div[2]/div[2]/div[4]/div[1]/span[1]').text
        return ele_text
