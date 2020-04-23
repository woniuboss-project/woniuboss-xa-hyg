#!/usr/bin/env python
# -*- coding: utf-8 -*-

import requests

from woniuboss.tools.woniuboss_gui.service import Service


class AdministrativeManagement:

    def __init__(self, driver):
        self.driver = driver

    # 固定资产管理模块

    # 界面
    def am_management_interface(self):
        Service.click_text(self.driver, '固定资产管理')

    # 固定资产领用登记模块

    # 界面
    def am_recipients_interface(self):
        Service.click_text(self.driver, '固定资产领用登记')

    # 固定资产归还模块

    # 界面
    def am_return_interface(self):
        Service.click_text(self.driver, '固定资产归还')

