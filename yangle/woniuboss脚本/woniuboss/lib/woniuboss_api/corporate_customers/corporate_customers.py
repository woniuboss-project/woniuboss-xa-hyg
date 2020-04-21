from woniuboss.tools.woniuboss_api.service import Service
class CorporateCustomers:
    def __init__(self,base_info):
        self.session = Service.get_session(base_info)

    def query_corporate_customer(self,url,data):
        return self.session.post(url,data)

    def add_corporate_customer(self,url,data):
        return self.session.post(url,data)

    def modify_corporate_customer(self,url,data):
        return self.session.post(url,data)