Action()
{
	
//	添加会员卡 
//	服务器繁忙，错误 6001	

		lr_start_transaction("start");
	
			//获取响应信息
		web_save_header(RESPONSE, "Response");
		
		web_reg_save_param("ResponseBody", "LB=", "RB=", "Search=Body", LAST);
	
		web_custom_request("web_cashiert",
		"URL=https://snailpet.com/v2/Shop/setMemberLevel",
		"Method=POST",
		"Resource=0",
		"RecContentType=application/json",
		"Referer=",
		"Mode=HTTP",
		"EncType=application/json",
		"Body={\"background\":{background},\"discount\":{discount},\"discount_for_combination\":{discount_for_combination},\"discountForService\":{discountForService},\"enablePlus\":1,\"minPrice\":{minPrice},\"name\":\"{name}\",\"shop_id\"{shop_id}:,\"shopId\":{shopId}}",
		LAST);		

	//字符转码
		lr_convert_string_encoding(lr_eval_string("{ResponseBody}"),LR_ENC_UTF8 ,LR_ENC_SYSTEM_LOCALE,"ResponseBodyUTF8");
		
		
		lr_log_message("response=%s",lr_eval_string("{Response}"));
			
		lr_log_message("res=%s",lr_eval_string("{ResponseBodyUTF8}"));	
		
	
	if(strcmp(lr_eval_string("{ResponseBodyUTF8}"),"{\"error\":0,\"data\":23306,\"code\":0,\"message\":\"\"}")==0){
		lr_log_message("response test success");
		lr_end_transaction("start", LR_PASS);
	}else{
		lr_log_message("response test fail");
		lr_end_transaction("start", LR_FAIL);
	};
	
	
	
	return 0;
}