# -*- coding: utf-8 -*-#
# -------------------------------------------------------------------------------
# Name:         service
# Description:  
# Author:       Administrator
# Date:         2020/2/11
# -------------------------------------------------------------------------------
# 对代码的重构（对代码及代码结构的优化）
from woniuboss.tools.woniuboss_gui.utility import Utility
from selenium import webdriver
import json
import unittest
import xlrd
class Service:

    # 点击查新 (使用xpath，text)
    @classmethod
    def box_xpath_click(cls, driver,location,content):
        # 导入select工具，它专用于处理页面上的下拉框，通过传入下拉框里的值进行操作
        from selenium.webdriver.support.select import Select
        Select(driver.find_element_by_xpath(location)).select_by_visible_text(content)

    @classmethod
    def box_id_click(cls, driver,location,content):
        # 导入select工具，它专用于处理页面上的下拉框，通过传入下拉框里的值进行操作
        from selenium.webdriver.support.select import Select
        Select(driver.find_element_id_xpath(location)).select_by_visible_text(content)

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