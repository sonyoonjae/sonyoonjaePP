package org.bank.banking;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BankController
{
	// 메인 코드
	@Autowired
	private BankService service;

	// 거래요청 처리 함수
	@RequestMapping( "" )
	@ResponseBody
	public Map<String, Object> banking( @RequestBody Map<String, Object> input,
			HttpServletRequest request )
	{
		Map<String, Object> responseData = service.operating( input, request );
		return responseData;
	}

}
