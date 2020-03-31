Action()
{
	//����һ�����ķ���
	web_reg_find("SaveCount=homepage_checkpoint",
		"TextPfx=<title>",
		"TextSfx=</title>",
		LAST);
	
	lr_think_time(2);
	lr_start_transaction("login");
	//����һ��get����
	web_url("open homepage",
		"URL=https://snailpet.com/index",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		LAST);
	
	web_reg_save_param_json(
		"ParamName=login_checkpoint",
		"QueryString=$.error",
		"SelectAll=No",
		SEARCH_FILTERS,
		"Scope=BODY",
		LAST);

	
	//����һ����¼post����ķ���
//	web_custom_request("login",
//		"URL=https://snailpet.com/v2/Passport/login",
//		"Method=POST",
//		"TargetFrame=",
//		"Resource=0",
//		"Referer=",
//		"EncType=application/json",
//		"Body={\"phone\":\"18392075713\",\"password\":\"y123456\",\"shop_id\":\"null\"}",
//		LAST);
   web_submit_data("login",
		"Action=https://snailpet.com/v2/Passport/login",
		"Method=POST",
		"TargetFrame=",
		"RecContentType=application/json",
		"Referer=",
		ITEMDATA,
		"Name=phone", "Value={phone}", ENDITEM,
		"Name=password", "Value={password}", ENDITEM,
		"Name=shop_id", "Value=null", ENDITEM,
		LAST);
	
	
	lr_output_message(lr_eval_string("{login_checkpoint}"));
	if (atoi(lr_eval_string("{login_checkpoint}")) == 0){
//		lr_output_message("test login success");
		lr_end_transaction("login",LR_PASS);
	}else{
//		lr_output_message("test login fail");
		lr_end_transaction("login",LR_FAIL);
	}
	
	//�������ӻ�Ա�ļ�鷽��
	web_reg_save_param_json(
		"ParamName=add_cus_checkpoint",
		"QueryString=$.error",
		"SelectAll=No",
		SEARCH_FILTERS,
		"Scope=BODY",
		LAST);
	
	//���ӻ�Ա
	web_custom_request("add_customer",
		"URL=https://snailpet.com/v2/Members/add",
		"Method=POST",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		"EncType=application/json",
		"Body={\"addr\":\"\",\"cardNumber\":\"\",\"is_open_upgrade\":1,\"is_spending_msg\":1,\"mark\":\"\",\"member_tags\":\"\",\"name\":\"����\",\"pets\":[{\"birthday\":\"\",\"color\":\"\",\"mark\":\"\",\"name\":\"����\",\"sex\":\"\",\"speciesId\":\"\",\"weight_new\":0}],\"phone\":\"15869693637\",\"sex\":\"\",\"shop_id\":17548,\"shopId\":\"17548\",\"spare_phone\":\"\"}",
		LAST);
	
	
	if (atoi(lr_eval_string("{add_cus_checkpoint}")) == 0){
		lr_output_message("test add cus success");
//		lr_end_transaction("login",LR_PASS);
	}else{
		lr_output_message("test add cus fail");
//		lr_end_transaction("login",LR_FAIL);
	}
	
	//�����Ա��ѯ�ļ�鷽��
	web_reg_save_param_json(
		"ParamName=query_cus_checkpoint",
		"QueryString=$.error",
		"SelectAll=No",
		SEARCH_FILTERS,
		"Scope=BODY",
		LAST);
	
	//��Ա��ѯ
	 web_submit_data("login",
		"Action=https://snailpet.com/v2/analysis_es/action",
		"Method=POST",
		"TargetFrame=",
		"RecContentType=application/json",
		"Referer=",
		ITEMDATA,
		"Name=ex_current_page", "Value=��ҳ", ENDITEM,
		"Name=ex_kind", "Value=���", ENDITEM,
		"Name=ex_next_page", "Value=��Ա", ENDITEM,
		"Name=ex_title", "Value=��Ա", ENDITEM,
		"Name=shop_id", "Value=17548", ENDITEM,
		LAST);
	
	lr_output_message(lr_eval_string("{query_cus_checkpoint}"));
	if (atoi(lr_eval_string("{query_cus_checkpoint}")) == 0){
		lr_output_message("test query cus success");
	}else{
		lr_output_message("test query cus fail");
	}
	
	//ɾ����Ա����
	web_reg_save_param_json(
		"ParamName=delete_checkpoint",
		"QueryString=$.error",
		"SelectAll=No",
		SEARCH_FILTERS,
		"Scope=BODY",
		LAST);
	
	//ɾ����Ա����
	web_custom_request("web_custom_request",
		"URL=https://snailpet.com/v2/Members/del",
		"Method=post",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		"Mode=HTTP",
		"EncType=application/json",
		"Body={\"shopId\": \"17548\",\"memberId\": 586484,\"shop_id\": 17548}",
		LAST);
	
	//ɾ����Ա����
	if(atoi(lr_eval_string("{delete_checkpoint}"))==0){
		lr_log_message("test delete customer success");
	}else{
		lr_log_message("test delete customer fail");
	}
	//�ŵ�֧������
	web_reg_save_param_json(
		"ParamName=payout_checkpoint",
		"QueryString=$.error",
		"SelectAll=No",
		SEARCH_FILTERS,
		"Scope=BODY",
		LAST);
	
	//�ŵ�֧������
	web_submit_data("web_submit_data",
		"Action=https://snailpet.com/v2/Shop/addSpending",
		"Method=POST",
		"EncType=application/x-www-form-urlencoded",
		"TargetFrame=",
		"Referer=",
		"Mode=HTTP",
		ITEMDATA,
		"Name=actionTime", "Value=${time}", ENDITEM,
		"Name=type", "Value={type}", ENDITEM,
		"Name=mark", "Value=", ENDITEM,
		"Name=amount", "Value=${cash}", ENDITEM,
		"Name=shopid", "Value=17548", ENDITEM,
		"Name=shop_id", "Value=17548", ENDITEM,
		LAST);

	//�ŵ�֧������
	if(atoi(lr_eval_string("{payout_checkpoint}"))==0){
		lr_log_message("test pay out success");
	}else{
		lr_log_message("test pay out fail");
	}
	
	
	return 0;
}
