from selenium import webdriver
class Service:
    # 对文本输入框的点击、清除、输入操作
    @classmethod
    def input_ele(cls, ele, value):
        ele.click()
        ele.clear()
        ele.send_keys(value)

    @classmethod
    def select_value(cls,what,value):
        from selenium.webdriver.support.select import Select
        Select(what).select_by_visible_text(value)

    @classmethod
    def open_page(cls):
        driver = webdriver.Firefox()
        driver.get('http://192.168.1.72:8080/WoniuBoss4.0/')
        driver.maximize_window()
        driver.implicitly_wait(60)
        driver.set_page_load_timeout(120)
        return driver
 # 根据不同方式判断某个元素是否存在
    @classmethod
    def is_element_present(cls, driver,how, what):
        from selenium.common.exceptions import NoSuchElementException
        try:
            driver.find_element(by=how, value=what)
        except NoSuchElementException as e:
            return False
        return True
 # 随机获取页面上的列表中的按钮元素
    @classmethod
    def get_random_btn(cls,driver):
        #得到周考成绩记录数
        weeks=driver.find_element_by_xpath("/html/body/div[8]/div[2]/div/div/div/div[2]/div[2]/div[4]/div[1]/span[1]")
        weeks_index=weeks.text
        w=weeks_index.strip().split("，")[0]
        print(w)
        a=w.split(" ")[-2]
        print(a)
        from random import randint
        random_num = randint(0, int(a))
        print(random_num)
        # 获取页面上所有的按钮元素
        btns=driver.find_element_by_xpath(f"html/body/div[8]/div[2]/div/div/div/div[2]/div[2]/div[2]/table/tbody/tr[{random_num}]/td[9]/button")

        #
        btns.click()