import unittest
from woniuboss.lib.woniuboss_api.corporate_customers.corporate_customers import CorporateCustomers
from parameterized import parameterized
from woniuboss.tools.woniuboss_api.utility import Utility
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_api\\testdata_corporate_customers.conf')
query_enterprise_info=Utility.get_excel_to_tuple(test_config_info[0])
print(query_enterprise_info)
add_enterprise_info=Utility.get_excel_to_tuple(test_config_info[1])
modify_enterprise_info=Utility.get_excel_to_tuple(test_config_info[2])
add_user_info = Utility.get_excel_to_user(test_config_info[1])


class TestCorporateCustomers(unittest.TestCase):
    @parameterized.expand(query_enterprise_info)
    def test_query_cor_cus(self,url,post,data,status_code,expect):
        sql='select count(enterprise_id) from enterprise_info'
        query_cor_cus_resp=CorporateCustomers(add_user_info).query_corporate_customer(url,data)
        db_result = Utility.query_one(add_user_info, sql)
        if db_result[0] == query_cor_cus_resp.json()['totalRow']:
            actual='test query corporate customers pass'
        else:
            actual='test query corporate customers fail'
        self.assertEqual(expect,actual)

    @parameterized.expand(add_enterprise_info)
    def test_add_cor_cus(self,url,post,data,status_code,expect):
        sql='select count(enterprise_id) from enterprise_info'
        db_result1=Utility.query_one(add_user_info,sql)
        add_cor_cus_resp=CorporateCustomers(add_user_info).add_corporate_customer(url,data)
        db_result2=Utility.query_one(add_user_info,sql)
        if db_result2[0]-db_result1[0] == 1 and add_cor_cus_resp.text == '新增成功.':
            actual='test add corporate customer pass'
        else:
            actual='test add corporate customer fail'
        self.assertEqual(expect,actual)
    @parameterized.expand(modify_enterprise_info)
    def test_modify_cor_cus(self,url,post,data,status_code,expect):
        modify_cor_cus_resp=CorporateCustomers(add_user_info).modify_corporate_customer(url,data)
        if modify_cor_cus_resp.text == '修改成功.':
            actual='test modify corporate customer pass'
        else:
            actual = 'test modify corporate customer fail'
        self.assertEqual(expect,actual)

if __name__ == '__main__':
    unittest.main(verbosity=2)





