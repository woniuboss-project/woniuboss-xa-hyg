import unittest
from woniuboss.lib.woniuboss_api.student_manage.course_manage import CourseManage
from parameterized import parameterized
from woniuboss.tools.woniuboss_api.utility import Utility
import time
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_api\\testdata_stu_manage.conf')

add_course_schedule_info=Utility.get_excel_to_tuple(test_config_info[20])
add_user_info = Utility.get_excel_to_user(test_config_info[20])
modify_course_schedule_info=Utility.get_excel_to_tuple(test_config_info[21])


class TestCourseManage(unittest.TestCase):
    @parameterized.expand(add_course_schedule_info)
    def test_add_course_schedule(self,url,post,data,status_code,expect):
        sql1='select count(*) from curriculum_schedule'
        db_result1=Utility.query_one(add_user_info,sql1)
        add_course_schedule_resp=CourseManage(add_user_info).add_course_schedule(url,data)
        time.sleep(2)
        sql2 = 'select count(*) from curriculum_schedule'
        db_result2=Utility.query_one(add_user_info,sql2)
        db_result=db_result2[0]-db_result1[0]
        result=add_course_schedule_resp.text
        if result=='success' and db_result==1:
            actual='test add course schedule pass'
        elif result=='保存失败.':
            actual = 'test add course schedule fail'
        else:
            actual = 'test add course schedule fail'
        self.assertEqual(expect,actual)

    @parameterized.expand(modify_course_schedule_info)
    def test_modify_course_schedule(self,url,post,data,status_code,expect):
        modify_course_schedule_resp=CourseManage(add_user_info).modify_course_schedule(url,data)
        result=modify_course_schedule_resp.text
        if result == 'success':
            actual='test modify course schedule pass'
        elif result == 'no-class':
            actual='test modify course schedule fail'
        else:
            actual = 'test modify course schedule fail'
        self.assertEqual(expect,actual)

if __name__ == '__main__':
    if __name__ == '__main__':
        unittest.main(verbosity=2)
