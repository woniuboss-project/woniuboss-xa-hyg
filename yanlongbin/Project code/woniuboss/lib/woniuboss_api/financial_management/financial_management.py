
import requests


class FinancialManagement:

	def __init__(self):
		self.session = requests.session()

	def do_fm_page(self, fm_page_url, fm_page_data):
		# FM_001
		return self.session.post(fm_page_url, fm_page_data)

	def do_fm_last(self, fm_last_url, fm_last_data):
		# FM_002
		return self.session.post(fm_last_url, fm_last_data)

	def do_fm_this(self, fm_this_url, fm_this_data):
		# FM_003
		return self.session.post(fm_this_url, fm_this_data)

	def do_fm_new(self, fm_new_url, fm_new_data):
		# FM_004
		return self.session.post(fm_new_url, fm_new_data)

	def do_fm_modify(self, fm_modify_url, fm_modify_data):
		# FM_005
		return self.session.post(fm_modify_url, fm_modify_data)

	def do_fm_pay(self, fm_pay_url, fm_pay_data):
		# FM_006
		return self.session.post(fm_pay_url, fm_pay_data)

	def do_fm_refund(self, fm_refund_url, fm_refund_data):
		# FM_007
		return self.session.post(fm_refund_url, fm_refund_data)

