import unittest
from woniuboss.lib.woniuboss_api.student_manage.take_leave import TakeLeave
from parameterized import parameterized
from woniuboss.tools.woniuboss_api.utility import Utility
test_config_info=Utility.get_json('..\\..\\..\\conf\\woniuboss_api\\testdata_stu_manage.conf')
query_take_leave_info=Utility.get_excel_to_tuple(test_config_info[8])
add_user_info = Utility.get_excel_to_user(test_config_info[8])
add_take_leave_info=Utility.get_excel_to_tuple(test_config_info[9])
modify_take_leave_info=Utility.get_excel_to_tuple(test_config_info[10])
upload_leave_permit_info=Utility.get_excel_to_tuple(test_config_info[11])
# write_off_info=Utility.get_excel_to_tuple(test_config_info[12])
class TestTakeLeave(unittest.TestCase):
    # @parameterized.expand(query_take_leave_info)
    # def test_query_take_leave(self,url,post,data,status_code,expect):
    #     sql='select count(*) from student_leave where create_time >"2020-03-01" and leave_status="请假中"'
    #     db_result=Utility.query_one(add_user_info,sql)
    #     query_take_leave_resp=TakeLeave(add_user_info).query_take_leave_student(url,data)
    #     resp_totalrow=query_take_leave_resp.json()['totalRow']
    #     if db_result[0] == resp_totalrow:
    #         actual='query take leave pass'
    #     else:
    #         actual='query take leave fail'
    #     self.assertEqual(expect,actual)
    #
    # @parameterized.expand(add_take_leave_info)
    # def test_add_take_leave(self,url,post,data,status_code,expect):
    #     add_take_leave_resp=TakeLeave(add_user_info).add_take_leave(url,data)
    #     actual=add_take_leave_resp.text
    #     print(actual)
    #     self.assertEqual(expect,actual)
    #
    # @parameterized.expand(modify_take_leave_info)
    # def test_modify_take_leave(self,url,post,data,status_code,expect):
    #     modify_take_leave_resp=TakeLeave(add_user_info).modify_take_leave(url,data)
    #     actual=modify_take_leave_resp.text
    #     self.assertEqual(expect,actual)

    @parameterized.expand(upload_leave_permit_info)
    def test_upload_permit(self,url,post,data,status_code,expect):
        files={'path': open("F:\\tmp\\leave.png","rb"),
               'Content-Disposition': 'form-data',
               'Content-Type':' image/png',
               'filename':'leave.png'}
        upload_permit_resp=TakeLeave(add_user_info).upload_leave_permit(url,data,files)
        print(upload_permit_resp.content)

if __name__ == '__main__':
    unittest.main(verbosity=2)
