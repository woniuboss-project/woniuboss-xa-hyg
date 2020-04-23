
import requests


class EmploymentManagement:

	def __init__(self):
		self.session = requests.session()

	def do_em_page(self, em_page_url):
		# EM_001
		return self.session.get(em_page_url)

	def do_em_all(self, em_all_url, em_all_data):
		# EM_002
		return self.session.post(em_all_url, em_all_data)

	def do_em_through(self, em_through_url, em_through_data):
		# EM_003
		return self.session.post(em_through_url, em_through_data)

	def do_em_not_through(self, em__through_url, em__through_data):
		# EM_004
		return self.session.post(em__through_url, em__through_data)

	def do_em_search(self, em_search_url, em_search_data):
		# EM_005
		return self.session.post(em_search_url, em_search_data)

	def do_em_real(self, em_real_url, em_real_data):
		# EM_006
		return self.session.post(em_real_url, em_real_data)

	def do_em_induction(self, em_induction_url, em_induction_data):
		# EM_007
		return self.session.post(em_induction_url, em_induction_data)

	def do_em_technology(self, em_technology_url):
		# EM_008
		return self.session.get(em_technology_url)

	def do_em_submit(self, em_submit_url):
		# EM_009
		return self.session.get(em_submit_url)

	def do_em_simulation(self, em_simulation_url):
		# EM_010
		return self.session.get(em_simulation_url)