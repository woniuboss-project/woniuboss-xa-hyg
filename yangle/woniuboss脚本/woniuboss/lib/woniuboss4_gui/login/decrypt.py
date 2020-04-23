from woniuboss.tools.woniuboss_gui.service import Service
class Decrypt:
    def __init__(self, driver):
        self.driver = driver

    def click_decrypt_btn(self):
        self.driver.find_element_by_id('btn-decrypt').click()

    def input_decrypt_pwd(self, decrypt_value):
        ele = self.driver.find_element_by_name('secondPass')
        Service.send_input(ele, decrypt_value)

    def click_decrypt_confirm(self):
        self.driver.find_element_by_css_selector('#secondPass-modal > div > div > div.modal-footer > button').click()

    def do_decrypt(self,decrypt_value):
        self.click_decrypt_btn()
        self.input_decrypt_pwd(decrypt_value)
        self.click_decrypt_confirm()