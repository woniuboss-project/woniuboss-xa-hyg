#!/usr/bin/env python
# -*- coding: utf-8 -*-

import requests


class AdministrativeManagement:

    def __init__(self):
        self.session = requests.session()

    def do_am_page(self, am_page_url):
        # AM_001
        return self.session.get(am_page_url)
