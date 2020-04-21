import unittest
from woniuboss.lib.woniuboss_api.student_manage.class_manage import ClassManage
from parameterized import parameterized
from woniuboss.tools.woniuboss_api.utility import Utility
test_config_info=Utility.get_json('..\\..\\conf\\woniuboss_api\\testdata_stu_manage.conf')
click_class_manage_info=Utility.get_excel_to_tuple(test_config_info[18])
add_user_info = Utility.get_excel_to_user(test_config_info[18])
separate_class_info=Utility.get_excel_to_tuple(test_config_info[19])


class TestClassManage(unittest.TestCase):
    @parameterized.expand(click_class_manage_info)
    def test_click_class_manage(self,url,post,data,status_code,expect):
        click_class_manage_resp=ClassManage(add_user_info).click_class_manage(url,data)
        if click_class_manage_resp.json()['totalRow']==19:
            actual='test query class manage pass'
        else:
            actual = 'test query class manage fail'
        self.assertEqual(expect,actual)
    @parameterized.expand(separate_class_info)
    def test_separate_class(self,url,post,data,status_code,expect):
        separate_class_resp=ClassManage(add_user_info).separate_class(url,data)
        if separate_class_resp.text == '处理完毕.':
            actual='test separate class pass'
        else:
            actual='test separate class fail'
        self.assertEqual(expect,actual)
if __name__ == '__main__':
    unittest.main(verbosity=2)