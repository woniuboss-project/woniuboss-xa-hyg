Action()
{
	//定义一个检查的方法
	web_reg_find("SaveCount=homepage_checkpoint",
		"TextPfx=<title>",
		"TextSfx=</title>",
		LAST);
	
	lr_think_time(2);
	lr_start_transaction("login");
	//定义一个get请求
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

	
	//定义一个登录post请求的方法
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
	
	//定义增加会员的检查方法
	web_reg_save_param_json(
		"ParamName=add_cus_checkpoint",
		"QueryString=$.error",
		"SelectAll=No",
		SEARCH_FILTERS,
		"Scope=BODY",
		LAST);
	
	//增加会员
	web_custom_request("add_customer",
		"URL=https://snailpet.com/v2/Members/add",
		"Method=POST",
		"TargetFrame=",
		"Resource=0",
		"Referer=",
		"EncType=application/json",
		"Body={\"addr\":\"\",\"cardNumber\":\"\",\"is_open_upgrade\":1,\"is_spending_msg\":1,\"mark\":\"\",\"member_tags\":\"\",\"name\":\"李娜\",\"pets\":[{\"birthday\":\"\",\"color\":\"\",\"mark\":\"\",\"name\":\"玉玉\",\"sex\":\"\",\"speciesId\":\"\",\"weight_new\":0}],\"phone\":\"15869693637\",\"sex\":\"\",\"shop_id\":17548,\"shopId\":\"17548\",\"spare_phone\":\"\"}",
		LAST);
	
	
	if (atoi(lr_eval_string("{add_cus_checkpoint}")) == 0){
		lr_output_message("test add cus success");
//		lr_end_transaction("login",LR_PASS);
	}else{
		lr_output_message("test add cus fail");
//		lr_end_transaction("login",LR_FAIL);
	}
	
	//定义会员查询的检查方法
	web_reg_save_param_json(
		"ParamName=query_cus_checkpoint",
		"QueryString=$.error",
		"SelectAll=No",
		SEARCH_FILTERS,
		"Scope=BODY",
		LAST);
	
	//会员查询
	 web_submit_data("login",
		"Action=https://snailpet.com/v2/analysis_es/action",
		"Method=POST",
		"TargetFrame=",
		"RecContentType=application/json",
		"Referer=",
		ITEMDATA,
		"Name=ex_current_page", "Value=首页", ENDITEM,
		"Name=ex_kind", "Value=点击", ENDITEM,
		"Name=ex_next_page", "Value=会员", ENDITEM,
		"Name=ex_title", "Value=会员", ENDITEM,
		"Name=shop_id", "Value=17548", ENDITEM,
		LAST);
	
	lr_output_message(lr_eval_string("{query_cus_checkpoint}"));
	if (atoi(lr_eval_string("{query_cus_checkpoint}")) == 0){
		lr_output_message("test query cus success");
	}else{
		lr_output_message("test query cus fail");
	}
	
	//删除会员检查点
	web_reg_save_param_json(
		"ParamName=delete_checkpoint",
		"QueryString=$.error",
		"SelectAll=No",
		SEARCH_FILTERS,
		"Scope=BODY",
		LAST);
	
	//删除会员请求
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
	
	//删除会员断言
	if(atoi(lr_eval_string("{delete_checkpoint}"))==0){
		lr_log_message("test delete customer success");
	}else{
		lr_log_message("test delete customer fail");
	}
	//门店支出检查点
	web_reg_save_param_json(
		"ParamName=payout_checkpoint",
		"QueryString=$.error",
		"SelectAll=No",
		SEARCH_FILTERS,
		"Scope=BODY",
		LAST);
	
	//门店支出请求
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

	//门店支出断言
	if(atoi(lr_eval_string("{payout_checkpoint}"))==0){
		lr_log_message("test pay out success");
	}else{
		lr_log_message("test pay out fail");
	}
	
	
	return 0;
}
