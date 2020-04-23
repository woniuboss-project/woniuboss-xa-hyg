
import requests


class PersonnelManagement:

	def __init__(self):
		self.session = requests.session()

	def do_pm_query(self,pm_query_url, pm_query_data):
		# PM_001
		return self.session.post(pm_query_url, pm_query_data)

	def do_pm_new(self,pm_new_url, pm_new_data):
		# PM_002
		return self.session.post(pm_new_url, pm_new_data)

	def do_pm_modify(self,pm_modify_url, pm_modify_data):
		# PM_003
		return self.session.post(pm_modify_url, pm_modify_data)