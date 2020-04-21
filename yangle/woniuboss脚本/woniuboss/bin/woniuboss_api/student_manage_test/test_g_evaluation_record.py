import unittest
from woniuboss.lib.woniuboss_api.student_manage.evaluation_record import EvaluationRecord
from parameterized import parameterized
from woniuboss.tools.woniuboss_api.utility import Utility
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_api\\testdata_stu_manage.conf')
query_eval_record_info=Utility.get_excel_to_tuple(test_config_info[17])
add_user_info = Utility.get_excel_to_user(test_config_info[17])

class TestEvaluationRecord(unittest.TestCase):
    @parameterized.expand(query_eval_record_info)
    def test_query_eval_record(self,url,post,data,status_code,expect):
        teacherid=add_user_info['USERNAME']
        sql=f'select count(*) from phase_exam where operator_id="{teacherid}"'
        db_result=Utility.query_one(add_user_info,sql)
        eval_record_resp=EvaluationRecord(add_user_info).query_record_num(url,data)
        page_totalrow=eval_record_resp.json()['totalRow']
        if db_result[0]==page_totalrow:
            actual='test query evaluation record pass'
        else:
            actual = 'test query evaluation record fail'
        self.assertEqual(expect,actual)

if __name__ == '__main__':
    unittest.main(verbosity=2)

