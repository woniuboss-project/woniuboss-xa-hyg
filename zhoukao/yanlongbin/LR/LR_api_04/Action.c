Action()
{
	
//	收银 
//	服务器繁忙，错误 6001	

		lr_start_transaction("start");
	
			//获取响应信息
		web_save_header(RESPONSE, "Response");
		
		web_reg_save_param("ResponseBody", "LB=", "RB=", "Search=Body", LAST);
	
		web_custom_request("web_cashiert",
		"URL=https://snailpet.com/v2/carts/build_order_new",
		"Method=POST",
		"Resource=0",
		"RecContentType=application/json",
		"Referer=",
		"Mode=HTTP",
		"EncType=application/json",
		"Body={\"cart_type\":0,\"is_spending_msg\":0,\"mark\":,\"order_time\":0,\"out_id\":0,\"pay_ways\":[0:{\"price\":{price},\"way\":{way}},\"price\":{price},\"shop_id\":{shop_id}]}",
		LAST);		

	//字符转码
		lr_convert_string_encoding(lr_eval_string("{ResponseBody}"),LR_ENC_UTF8 ,LR_ENC_SYSTEM_LOCALE,"ResponseBodyUTF8");
		
		
		lr_log_message("response=%s",lr_eval_string("{Response}"));
			
		lr_log_message("res=%s",lr_eval_string("{ResponseBodyUTF8}"));	
		
	
	if(strcmp(lr_eval_string("{ResponseBodyUTF8}"),"{\"error\":0,\"data\":282949,\"code\":0,\"message\":\"\"}")==0){
		lr_log_message("response test success");
		lr_end_transaction("start", LR_PASS);
	}else{
		lr_log_message("response test fail");
		lr_end_transaction("start", LR_FAIL);
	};
	
	
	
	return 0;
}
