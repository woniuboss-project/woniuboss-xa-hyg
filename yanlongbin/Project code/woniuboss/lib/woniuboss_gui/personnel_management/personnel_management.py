
import requests
from woniuboss.tools.woniuboss_gui.service import Service
from selenium.webdriver.support.select import Select


class PersonnelManagement:

    def __init__(self, driver):
        self.driver = driver

    # 员工管理
    # 界面
    def pm_employees_interface(self):
        Service.click_text(self.driver, '员工管理')

    # 区域
    def pm_area(self):
        Service.box_content_id(self.driver, 'regionSel')

    # 部门
    def pm_department(self):
        Service.box_content_css(self.driver, 'select.sel-text:nth-child(2)')

    # 状态
    def pm_state(self):
        Service.box_content_css(self.driver, 'select.emp_status:nth-child(3)')

    # 姓名输入
    def pm_name_input(self, input_name):
        pm_name_input = Service.click_css(self.driver, '.col-lg-12 > input:nth-child(4)')
        Service.send_input(pm_name_input, input_name)

    # 查询

    # 点击查询按钮
    def pm_click_query(self):
        Service.click_css(self.driver, '.col-lg-12 > button:nth-child(5)')

    # 区域查询
    def pm_area_query(self, region):
        Service.box_id_click(self.driver, 'regionSel', region)
        self.pm_click_query()

    # 部门查询
    def pm_department_query(self, region, department):
        Service.box_id_click(self.driver, 'regionSel', region)
        Service.box_css_click(self.driver, 'select.sel-text:nth-child(2)', department)
        self.pm_click_query()

    # 状态查询
    def pm_state_query(self, region, department, state):
        Service.box_id_click(self.driver, 'regionSel', region)
        Service.box_css_click(self.driver, 'select.sel-text:nth-child(2)', department)
        Service.box_css_click(self.driver, 'select.emp_status:nth-child(3)', state)
        self.pm_click_query()

    # 姓名输入查询
    def pm_name_input_query(self, uname):
        self.pm_name_input(uname)
        self.pm_click_query()

    # 新增
    def pm_new_input(self, area, department, uname, number, position, gender, phone, email, qq):
        Service.click_css(self.driver, 'button.btn-padding:nth-child(1)')
        # 区域
        Service.box_css_click(self.driver, '#addEmp-form > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > '
                                           'select:nth-child(2)', area)

        # 部门
        Service.box_css_click(self.driver, '#addEmp-form > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > '
                                           'select:nth-child(2)', department)
        # 姓名
        the_name = self.driver.find_element_by_css('#addEmp-form > div:nth-child(1) > div:nth-child(2) > '
                                                   'div:nth-child(1) > input:nth-child(2)')
        Service.send_input(the_name, uname)

        # 工号
        work_number = self.driver.find_element_by_css('#addEmp-form > div:nth-child(1) > div:nth-child(2) > '
                                                      'div:nth-child(2) > input:nth-child(2)')
        Service.send_input(work_number, number)

        # 职位
        work_position = self.driver.find_element_by_css('#addEmp-form > div:nth-child(1) > div:nth-child(3) > '
                                                        'div:nth-child(1) > input:nth-child(2)')
        Service.send_input(work_position, position)

        # 性别
        Service.box_css_click(self.driver, '#addEmp-form > div:nth-child(1) > div:nth-child(3) > div:nth-child(2) > '
                                           'select:nth-child(2)', gender)

        # 电话
        work_phone = self.driver.find_element_by_css('#addEmp-form > div:nth-child(1) > div:nth-child(4) > '
                                                     'div:nth-child(1) > input:nth-child(2)')
        Service.send_input(work_phone, phone)

        # 邮箱
        work_email = self.driver.find_element_by_css('#addEmp-form > div:nth-child(1) > div:nth-child(4) > '
                                                     'div:nth-child(2) > input:nth-child(2)')
        Service.send_input(work_email, email)


        # QQ
        work_qq = self.driver.find_element_by_css('#addEmp-form > div:nth-child(1) > div:nth-child(5) > '
                                                  'div:nth-child(1) > input:nth-child(2)')
        Service.send_input(work_qq, qq)

        # 保存
        Service.click_id(self.driver, 'addEmpBtn')

    # 修改
    def pm_modify_input(self, area, department, uname, number, position, gender, phone, email, qq, state):
        self.pm_name_input_query(uname)
        Service.click_css(self.driver, '#employee-table > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(9) > '
                                       'button:nth-child(1)')
        # 区域
        Service.box_css_click(self.driver, '#modifyEmp-form > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > '
                                           'select:nth-child(2)', area)

        # 部门
        Service.box_css_click(self.driver, '#modifyEmp-form > div:nth-child(2) > div:nth-child(1) > div:nth-child(2) > '
                                           'select:nth-child(2)', department)
        # 姓名
        the_name = self.driver.find_element_by_css('#modifyEmp-form > div:nth-child(2) > div:nth-child(2) > '
                                                   'div:nth-child(1) > input:nth-child(2)')
        Service.send_input(the_name, uname)

        # 工号
        work_number = self.driver.find_element_by_css('#modifyEmp-form > div:nth-child(2) > div:nth-child(2) > '
                                                      'div:nth-child(2) > input:nth-child(2)')
        Service.send_input(work_number, number)

        # 职位
        work_position = self.driver.find_element_by_css('#modifyEmp-form > div:nth-child(2) > div:nth-child(3) > '
                                                        'div:nth-child(1) > input:nth-child(2)')
        Service.send_input(work_position, position)

        # 性别
        Service.box_css_click(self.driver, '#modifyEmp-form > div:nth-child(2) > div:nth-child(3) > div:nth-child(2) > '
                                           'select:nth-child(2)', gender)

        # 电话
        work_phone = self.driver.find_element_by_css('#modifyEmp-form > div:nth-child(2) > div:nth-child(4) > '
                                                     'div:nth-child(1) > input:nth-child(2)')
        Service.send_input(work_phone, phone)

        # 邮箱
        work_email = self.driver.find_element_by_css('#modifyEmp-form > div:nth-child(2) > div:nth-child(4) > '
                                                     'div:nth-child(2) > input:nth-child(2)')
        Service.send_input(work_email, email)

        # QQ
        work_qq = self.driver.find_element_by_css('#modifyEmp-form > div:nth-child(2) > div:nth-child(5) > '
                                                  'div:nth-child(1) > input:nth-child(2)')
        Service.send_input(work_qq, qq)

        # 状态
        Service.box_css_click(self.driver, 'select.emp_status:nth-child(2)', state)

        # 保存
        Service.click_id(self.driver, 'modifyEmpBtn')







    # 部门管理
    # # 界面
    # def pm_department_interface(self):
    # 	Service.click_text(self.driver, '部门管理')

