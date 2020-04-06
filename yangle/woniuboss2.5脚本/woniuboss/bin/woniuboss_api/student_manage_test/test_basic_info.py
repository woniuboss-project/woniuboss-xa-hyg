import unittest
from woniuboss.lib.woniuboss_api.student_manage.basic_info import BasicInfo
from woniuboss.tools.woniuboss_api.service import Service
from parameterized import parameterized
from woniuboss.tools.woniuboss_api.utility import Utility
test_config_info=Utility.get_json('..\\..\\..\\conf\\woniuboss_api\\testdata_stu_manage.conf')
query_all_info = Utility.get_excel_to_tuple(test_config_info[0])
add_user_info1 = Utility.get_excel_to_user(test_config_info[0])
query_one_info = Utility.get_excel_to_tuple(test_config_info[1])
add_user_info2 = Utility.get_excel_to_user(test_config_info[1])
modify_student_info = Utility.get_excel_to_tuple(test_config_info[2])
add_user_info3 = Utility.get_excel_to_user(test_config_info[2])
# print(add_user_info3)
class BasicInfoTest(unittest.TestCase):
    @parameterized.expand(query_all_info)
    def test_query_all(self,url,post,data,status_code,expect):
        sql='select count(*) from student'
        db_num=Utility.query_one(add_user_info1,sql)
        query_all_resp=BasicInfo(add_user_info1).query_all_student(url,data)
        query_all_resp_totalrow=query_all_resp.json()['totalRow']
        if db_num[0]==query_all_resp_totalrow:
            actual="query all pass"
        else:
            actual="query all fail"
        self.assertEqual(expect,actual)

    @parameterized.expand(query_one_info)
    def test_view_one_student(self, url, post, data, status_code, expect):
        view_one_student_resp=BasicInfo(add_user_info2).view_one_student(url,data)
        resp_text=view_one_student_resp.text
        # print(resp_text)
        if '智联招聘' in resp_text:
            actual='query one pass'
        else:
            actual='query one fail'
        self.assertEqual(expect,actual)

    @parameterized.expand(modify_student_info)
    def test_modify_student_info(self,url, post, data, status_code, expect):
        file = {'stu.student_id': (None, data['stu.student_id']),
                 'stu.student_name': (None, data['stu.student_name']),
                 'stu.student_no': (None, data['stu.student_no']),
                 'class_no': (None, data['class_no']),
                 'stu.tel': (None, data['stu.tel']),
                 'stu.sex': (None, data['stu.sex']),
                 'stu.status': (None, data['stu.status']),
                 'stu.email': (None, data['stu.email']),
                 'stu.QQ': (None, data['stu.QQ']),
                 'stu.source': (None, data['stu.source']),
                 'stu.emergency_person': (None, data['stu.emergency_person']),
                 'stu.emergency_tel': (None, data['stu.emergency_tel']),
                 'stu.school': (None, data['stu.school']),
                 'stu.education': (None, data['stu.education']),
                 'stu.major': (None, data['stu.major']),
                 'stu.IDnumber': (None, data['stu.IDnumber']),
                 'stu.graduation_time': (None, data['stu.graduation_time']),
                 'stu.age': (None, data['stu.age'])
                 # 'img': ()
                 }
        modify_student_resp= BasicInfo(add_user_info3).modify_student_info(url,file)
        actual=modify_student_resp.text

        self.assertEqual(expect,actual)


if __name__ == '__main__':
    unittest.main(verbosity=2)

