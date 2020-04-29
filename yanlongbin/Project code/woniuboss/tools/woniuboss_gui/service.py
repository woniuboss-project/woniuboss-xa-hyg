
# 对代码的重构（对代码及代码结构的优化）
from time import sleep

from selenium.webdriver.support.select import Select

from woniuboss.tools.woniuboss_gui.utility import Utility
from selenium import webdriver
import json
import unittest

import xlrd
class Service:

    # 弹窗处理
    @classmethod
    def alert_windows(cls, driver):
        # 从页面切换至windows弹出窗口
        alert = driver.switch_to.alert()
        # 确定
        alert.accept()

        # 元素内容text
    @classmethod
    def text_css(cls, driver, text_css):
        text_css = driver.find_element_by_css(text_css).text
        return text_css

        # 元素内容xpath
    @classmethod
    def text_xpath(cls, driver, text_xpath):
        text_css = driver.find_element_by_xpath(text_xpath).text
        return text_css

    # 下拉框内容获取
    @classmethod
    def box_content_id(cls, driver, box_id):
        box = Select(driver.find_element_by_id(box_id)).options
        box_list = []
        for i in box:
            box_list.append(i.text)
        return box_list

    @classmethod
    def box_content_css(cls, driver, box_css):
        box = Select(driver.find_element_by_css(box_css)).options
        box_list = []
        for i in box:
            box_list.append(i.text)
        return box_list



    # 登录
    @classmethod
    def login_account(cls, own, user_info):
        from woniuboss.lib.woniuboss_gui.login.login import Login
        login_data = {'username': user_info['username'], 'password': user_info['password'],'code':'0000'}
        Login(own.driver).do_login(user_info, login_data)

    # 解密
    @classmethod
    def decryption(cls, driver):

        try:
            cls.click_id(driver, 'btn-decrypt')
            sleep(5)
            click = driver.find_element_by_xpath('/html/body/div[6]/div/div/div[2]/input')

            cls.send_input(click, 'woniu123')
            cls.click_xpath(driver, '/html/body/div[6]/div/div/div[3]/button')
        except Exception as e:
            print('解密失败')

    # 点击
    @classmethod
    def click_xpath(cls, driver, location):

        driver.find_element_by_xpath(location).click()

    @classmethod
    def click_id(cls, driver, location):

        driver.find_element_by_id(location).click()

    @classmethod
    def click_css(cls, driver, location):

        driver.find_element_by_css(location).click()

    @classmethod
    def click_text(cls, driver, location):

        driver.find_element_by_link_text(location).click()

    # 文件上传
    @classmethod
    def file_upload(cls, driver, location, path):

        upload = driver.find_element_by_id(location)
        upload.send_keys(path)

    # 翻页

    # 判断页面上的某个元素是否存在
    # 该方法依赖于webdriver库
    @classmethod
    def is_element_present(cls, driver, how, what):

        from selenium.common.exceptions import NoSuchElementException
        try:
            driver.find_element(by=how, value=what)
        except NoSuchElementException as e:
            # 表示没找到
            return False
        return True

    # 判断页面上的某个元素文字是否与预期一致
    @classmethod
    def expected_text_xpath(cls, driver, location):

        actual = driver.find_element_by_xpath(location).text

        return actual

    @classmethod
    def expected_text_css(cls, driver, location):

        actual = driver.find_element_by_css(location).text

        return actual

    @classmethod
    def expected_text_id(cls, driver, location):

        actual = driver.find_element_by_id(location).text

        return actual



    # 点击下拉框 (使用xpath，text)
    @classmethod
    def box_xpath_click(cls, driver,location,content):
        # 导入select工具，它专用于处理页面上的下拉框，通过传入下拉框里的值进行操作
        from selenium.webdriver.support.select import Select
        Select(driver.find_element_by_xpath(location)).select_by_visible_text(content)

    @classmethod
    def box_id_click(cls, driver,location,content):
        # 导入select工具，它专用于处理页面上的下拉框，通过传入下拉框里的值进行操作
        from selenium.webdriver.support.select import Select
        Select(driver.find_element_by_id(location)).select_by_visible_text(content)

    @classmethod
    def box_css_click(cls, driver,location,content):
        # 导入select工具，它专用于处理页面上的下拉框，通过传入下拉框里的值进行操作
        from selenium.webdriver.support.select import Select
        Select(driver.find_element_id_css(location)).select_by_visible_text(content)



    # 向一个文本输入框执行三个固定操作：点击、清理、输入
    # 依赖于webdriver
    @classmethod
    def send_input(cls, ele, value):
        ele.click()
        ele.clear()
        ele.send_keys(value)

    # 随机选择下拉框中的一项
    # 依赖于webdriver
    @classmethod
    def select_random(cls, selecter):  # selecter是传递的下拉框元素
        from selenium.webdriver.support.select import Select
        seleter_length = len(Select(selecter).options)
        import random
        random_index = random.randint(0, seleter_length - 1)
        Select(selecter).select_by_index(random_index)

    # 去掉某个元素的只读属性（id）
    # 依赖于webdriver
    @classmethod
    def remove_readonly(cls, driver, ele_id):
        driver.execute_script('document.getElementById("%s").readOnly=false' % (ele_id))

    # 具体的业务功能需要绕过登录，使用cookie
    # 与应用强相关(woniusales)，还依赖于webdriver
    @classmethod
    def miss_login(cls, driver, base_config_path):
        cls.open_page(driver, base_config_path)
        # 通过字典方式传递cookie信息
        # from guitest.woniusales_test02.tools.utility import Utility
        contents = base_config_path
        driver.add_cookie({'name': 'username', 'value': contents['username']})
        driver.add_cookie({'name': 'password', 'value': contents['password']})
        cls.open_page(driver, base_config_path)

    # 打开页面的方法
    # 既依赖于应用，也依赖于webdriver
    @classmethod
    def open_page(cls, driver, path):
        # from guitest.woniusales_test02.tools.utility import Utility
        contents = path
        URL = 'http://%s:%s/%s' % (contents['HOSTNAME'], contents['PORT'], contents['AURL'])
        driver.get(URL)

    # 截图.仅进行截图操作
    @classmethod
    def get_png(cls, driver, png_path):
        driver.get_screenshot_as_file(png_path)

    # 出现缺陷后的截图方法
    @classmethod
    def get_error_png(cls, driver):
        import time
        ctime = time.strftime('%Y-%m-%d_%H-%M-%S', time.localtime())
        png_path = '..\\bugpng\\error_%s.png' % (ctime)
        cls.get_png(driver, png_path)

    # 生成driver
    @classmethod
    def get_driver(cls, base_config_path):
        contents = base_config_path
        from selenium import webdriver
        driver = getattr(webdriver, contents['BROWSER'])()
        driver.implicitly_wait(10)
        driver.maximize_window()
        url = 'http://%s:%s/%s' % (contents['HOSTNAME'], contents['PORT'], contents['AURL'])
        driver.get(url)
        return driver