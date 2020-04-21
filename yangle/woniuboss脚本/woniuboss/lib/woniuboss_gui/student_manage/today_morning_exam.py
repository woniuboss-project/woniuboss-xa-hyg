
from selenium.webdriver.common.by import By

from woniuboss.tools.woniuboss_gui.service import Service
import time

class TodayMorningExam:

    def __init__(self, driver):
        self.driver = driver

    def click_student_link(self):
        self.driver.find_element_by_link_text('学员管理').click()

    def click_morning_exam_link(self):
        Service.wait_until_element_is_visible(self.driver, By.LINK_TEXT, '今日晨考')
        self.driver.find_element_by_link_text('今日晨考').click()

    def click_morning_exam_btn(self):
        Service.wait_until_element_is_visible(self.driver, By.CSS_SELECTOR, '#mornExam-table > tbody')
        find_tr = self.driver.find_element_by_css_selector("#mornExam-table > tbody").find_elements_by_tag_name("tr")
        sum_tr = len(find_tr)
        import random
        ram_num = random.randint(1, sum_tr - 1)
        self.driver.find_element_by_css_selector('#mornExam-table > tbody > tr:nth-child(%d) '
                                                 '> td:nth-child(7) > button' % ram_num).click()
        return ram_num
    def cycle_click_morning_btn(self):
        Service.wait_until_element_is_visible(self.driver, By.CSS_SELECTOR, '#mornExam-table > tbody')
        find_tr = self.driver.find_element_by_css_selector("#mornExam-table > tbody").find_elements_by_tag_name("tr")
        sum_tr = len(find_tr)
        count = 1
        while count<=sum_tr:
            self.driver.find_element_by_css_selector('#mornExam-table > tbody > tr:nth-child(%d) '
                                                     '> td:nth-child(7) > button' % count).click()
            count +=1

    def select_method(self,method):
        Service.wait_until_element_is_visible(self.driver,By.ID,'mornExam-form')
        Service.box_css_click(self.driver,'#mornExam-form > div > div:nth-child(1) > select',method)

    def input_score(self,score):
        ele = self.driver.find_element_by_name('me.score')
        Service.send_input(ele,score)

    def input_question(self,question):
        ele = self.driver.find_element_by_name('me.question')
        Service.send_input(ele,question)

    def clic_save_btn(self):
        self.driver.find_element_by_css_selector('#mornExam-modal > div > div > div.modal-footer > button').click()

    def do_morning_exam(self,method,score,question):
        self.click_student_link()
        self.click_morning_exam_link()
        time.sleep(5)
        self.click_morning_exam_btn()
        self.select_method(method)
        self.input_score(score)
        self.input_question(question)
        self.clic_save_btn()
        time.sleep(5)