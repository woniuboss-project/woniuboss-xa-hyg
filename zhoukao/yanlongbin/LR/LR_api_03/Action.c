Action()
{
//会员注册
//服务器繁忙

			lr_start_transaction("start");
	
			//传递cookie，调试无效
			web_add_cookie("CNZZDATA1260458171=490601326-1585324258-https%3A%2F%2Fsnailpet.com%2F|1585324258;domain=snailpet.com");
			web_add_cookie("isHighUser=1;domain=snailpet.com");
			web_add_cookie("printNum=0;domain=snailpet.com");
			web_add_cookie("snailLoginPhone=15093267272;domain=snailpet.com");
			web_add_cookie("snailNowUserId=27360;domain=snailpet.com");
			web_add_cookie("snailPowers=1;domain=snailpet.com");
			web_add_cookie("snailPrint=;domain=snailpet.com");
			web_add_cookie("snailServerTimeC=0;domain=snailpet.com");
			web_add_cookie("snailShopId=17543;domain=snailpet.com");
			web_add_cookie("snailStoreNum=29408;domain=snailpet.com");
			web_add_cookie("snailToken=636ada1ebd3b359d6939e44e1f57bbfc;domain=snailpet.com");
			web_add_cookie("UM_distinctid=1711ae0a5e120-0ab15bba782df7-4c312c7c-144000-1711ae0a5e2295;domain=snailpet.com");
			web_add_cookie("version=3.7;domain=snailpet.com");
			
			
			
			
			//获取响应信息
		web_save_header(RESPONSE, "Response");
		
		web_reg_save_param("ResponseBody", "LB=", "RB=", "Search=Body", LAST);
	
		web_submit_data("Sales_of_outbound",
		"Action=https://snailpet.com/v2/Members/add",
		"Method=POST",
		"RecContentType=text/html",
		"TargetFrame=",
		"Referer=",                   
		"Mode=HTML",
		ITEMDATA,
		"Name=addr", "Value={addr}", ENDITEM,
		"Name=cardNumber", "Value={cardNumber}", ENDITEM,
		"Name=is_open_upgrade", "Value={is_open_upgrade}", ENDITEM,
		"Name=is_spending_msg", "Value={is_spending_msg}", ENDITEM,
		"Name=mark", "Value={mark}", ENDITEM,
		"Name=member_tags", "Value={member_tags}", ENDITEM,
		"Name=name", "Value={name}", ENDITEM,
		"Name=pets", "Value={pets}", ENDITEM,
		"Name=phone", "Value={phone}", ENDITEM,
		"Name=sex", "Value={sex}", ENDITEM,
		"Name=shop_id", "Value={shop_id}", ENDITEM,
		"Name=shopId", "Value={shopId}", ENDITEM,
		"Name=spare_phone", "Value={spare_phone}", ENDITEM,
		LAST);	

			//字符转码
		lr_convert_string_encoding(lr_eval_string("{ResponseBody}"),LR_ENC_UTF8 ,LR_ENC_SYSTEM_LOCALE,"ResponseBodyUTF8");
	
		lr_log_message("response=%s",lr_eval_string("{Response}"));
		
		lr_log_message("res=%s",lr_eval_string("{ResponseBodyUTF8}"));	
	
	if(strcmp(lr_eval_string("{ResponseBodyUTF8}"),"{\"error\":0,\"data\":586492,\"code\":0,\"message\":\"\"}")==0){
		lr_log_message("response test success");
		lr_end_transaction("start", LR_PASS);
	}else{
		lr_log_message("response test fail");
		lr_end_transaction("start", LR_FAIL);
	};
	
	return 0;
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
