Action()
{

//修改"一笔记账"
// 服务器繁忙
		lr_start_transaction("start");
	
			//获取响应信息
		web_save_header(RESPONSE, "Response");
		
		web_reg_save_param("ResponseBody", "LB=", "RB=", "Search=Body", LAST);
	
		web_submit_data("Modify_of_outbound",
		"Action=https://snailpet.com/v2/Shop/addSpending",
		"Method=POST",
		"RecContentType=text/html",
		"Referer=",                   
		"Mode=HTML",
		ITEMDATA,
		"Name=spending_id", "Value={spending_id}", ENDITEM,
		"Name=store_id", "Value={store_id}", ENDITEM,
		"Name=shop_id", "Value={shop_id}", ENDITEM,
		"Name=type", "Value={type}", ENDITEM,
		"Name=amount", "Value={amount}", ENDITEM,
		"Name=opt_user_id", "Value={opt_user_id}", ENDITEM,
		"Name=action_time", "Value={action_time}", ENDITEM,
		"Name=mark", "Value={mark}", ENDITEM,
		"Name=created", "Value={created}", ENDITEM,
		"Name=images", "Value={images}", ENDITEM,
		"Name=begin_time", "Value={begin_time}", ENDITEM,
		"Name=end_time", "Value={end_time}", ENDITEM,
		"Name=user_id", "Value={user_id}", ENDITEM,
		"Name=user_name", "Value={user_name}", ENDITEM,
		"Name=extendName", "Value={extendName}", ENDITEM,
		"Name=shopId", "Value={shopId}", ENDITEM,
		"Name=actionTime", "Value={actionTime}", ENDITEM,
		"Name=spendingId", "Value={actionTime}", ENDITEM,
		LAST);	
	
			//字符转码
		lr_convert_string_encoding(lr_eval_string("{ResponseBody}"),LR_ENC_UTF8 ,LR_ENC_SYSTEM_LOCALE,"ResponseBodyUTF8");
	
		lr_log_message("response=%s",lr_eval_string("{Response}"));
		
		lr_log_message("res=%s",lr_eval_string("{ResponseBodyUTF8}"));	
	
	if(strcmp(lr_eval_string("{ResponseBodyUTF8}"),"{\"error\":0,\"data\":282948,\"code\":0,\"message\":\"\"}")==0){
		lr_log_message("response test success");
		lr_end_transaction("start", LR_PASS);
	}else{
		lr_log_message("response test fail");
		lr_end_transaction("start", LR_FAIL);
	};
	
	
	return 0;
}