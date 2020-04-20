
import requests


class EmploymentManagement:

	def __init__(self):
		self.session = requests.session()

	def do_em_page(self, em_page_url):
		return self.session.get(em_page_url)

	def do_em_all(self, em_all_url, em_all_data):
		return self.session.post(em_all_url, em_all_data)

	def do_em_through(self, em_through_url, em_through_data):
		return self.session.post(em_through_url, em_through_data)

	def do_em_not_through(self, em__through_url, em__through_data):
		return self.session.post(em__through_url, em__through_data)

	def do_em_search(self, em_search_url, em_search_data):
		return self.session.post(em_search_url, em_search_data)

	def do_em_real(self, em_real_url, em_real_data):
		return self.session.post(em_real_url, em_real_data)

	def do_em_induction(self, em_induction_url, em_induction_data):
		return self.session.post(em_induction_url, em_induction_data)

	def do_em_technology(self, em_technology_url):
		return self.session.get(em_technology_url)

	def do_em_submit(self, em_submit_url):
		return self.session.get(em_submit_url)

	def do_em_simulation(self, em_simulation_url):
		return self.session.get(em_simulation_url)