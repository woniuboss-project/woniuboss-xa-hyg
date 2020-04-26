#!/usr/bin/env python
# -*- coding: utf-8 -*-

import requests

from woniuboss.tools.woniuboss_4_gui.service import Service


class AdministrativeManagement:

    def __init__(self, driver):
        self.driver = driver

    # 采购登记模块

    # 界面
    def am_management_interface(self):
        Service.click_text(self.driver, '采购登记')

    # 登记模块

    # 界面
    def am_recipients_interface(self):
        Service.click_text(self.driver, '领用登记')

    # 归还记录模块

    # 界面
    def am_return_interface(self):
        Service.click_text(self.driver, '归还记录')

