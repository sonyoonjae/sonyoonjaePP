package org.pg.process;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.pg.data.BankVO;
import org.pg.data.PG_Code;
import org.pg.data.PaymentWayVO;
import org.pg.email.EmailComponent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProcessController
{
	@Autowired
	ProcessService service;

	@RequestMapping( "" )
	public String open( HttpSession session, @RequestParam long total_price,
			@RequestParam String mall_code, @RequestParam String mall_account )
	{
		service.open( session, total_price, mall_code, mall_account );
		return "redirect:/login";
	}

	// 로그인 페이지 띄우기
	@RequestMapping( "/login" )
	public String login( HttpSession session )
	{
		String id = (String)session.getAttribute( "id" );
		String email = (String)session.getAttribute( "email" );
		if ( id == null || email == null )
		{
			return "/pg/login.jsp";
		}
		else
		{
			return "/pg/payment.jsp";
		}
	}

	@RequestMapping( "/logout" )
	public String logout( HttpSession session )
	{
		session.invalidate();
		return "redirect:/login";
	}

	// 로그인 체크 결과 돌려주기
	@RequestMapping( "/loginCheck" )
	@ResponseBody
	public Map<String, Object> loginCheck( @RequestBody Map<String, Object> map,
			HttpSession session )
	{
		String id = map.get( "id" ).toString();
		String password = map.get( "pw" ).toString();
		Map<String, Object> result = service.loginCheck( id, password, session );

		return result;
	}

	// 가입 페이지 띄우기
	@RequestMapping( "/join" )
	public String join()
	{
		return "/pg/join.jsp";
	}

	// 이메일 중복 여부 확인하기
	@RequestMapping( "/joinCheck" )
	@ResponseBody
	public Map<String, Object> joinCheck( @RequestBody Map<String, Object> map,
			HttpSession session )
	{
		String email = (String)map.get( "email" );
		Map<String, Object> result = service.joinCheck( email );
		session.setAttribute( "email", result.get( "email" ) );
		return result;
	}

	// 인증용 이메일 전송 및 페이지 넘기기
	@RequestMapping( "/emailConfirm" )
	public String emailConfirm( HttpSession session, Model m )
	{
		String email = (String)session.getAttribute( "email" );

		Map<String, Object> map = service.emailConfirm( email );
		m.addAttribute( "map", map );
		return "/pg/join_email.jsp";
	}

	@RequestMapping( "/emailCheck" )
	@ResponseBody
	public Map<String, Object> emailCheck( @RequestBody Map<String, Object> input,
			HttpSession session )
	{
		Map<String, Object> result = service.emailCheck( input );

		return result;
	}

	@RequestMapping( "/join_profile" )
	public String join_profile()
	{
		return "/pg/join_profile.jsp";
	}

	// 정보 확인 및 가입 처리.
	@RequestMapping( "/joinProcess" )
	@ResponseBody
	public Map<String, Object> joinProcess( @RequestBody Map<String, Object> map,
			HttpSession session )
	{
		Map<String, Object> result = service.joinProcess( map, session );

		return result;
	}

	@RequestMapping( "/joinSuccess" )
	public String joinSuccess( HttpSession session )
	{
		session.invalidate();

		return "redirect:/login";
	}

	// 새로운 거래 수단 입력 페이지 띄우기
	@RequestMapping( "/newPaymentWay" )
	public String newPaymentWays( Model m )
	{
		List<BankVO> list = service.getBanks();
		m.addAttribute( "banks", list );
		m.addAttribute( "pg_code", PG_Code.value );
		return "/pg/join_paymethod.jsp";
	}

	@RequestMapping( "/newPaymentWayCheck" )
	@ResponseBody
	public boolean newPaymentWayCheck( @RequestBody Map<String, Object> input )
	{
		String card_or_account_number = (String)input.get( "card_or_account_number" );
		boolean result = service.newPaymentWayCheck( card_or_account_number );

		return result;
	}

	@RequestMapping( "/newPaymentWayAdd" )
	public String newPaymentWayAdd( PaymentWayVO paymentInfo )
	{
		service.newPaymentWay( paymentInfo );

		return "redirect:/payment";
	}

	@RequestMapping( "/payment" )
	public ModelAndView payment( HttpSession session )
	{
		ModelAndView mav = new ModelAndView( "/pg/payment.jsp" );

		String id = (String)session.getAttribute( "id" );
		Map<String, Object> map = service.getPaymentInfos( id );
		map.put( "pg_code", PG_Code.value );
		mav.addObject( "map", map );

		Object flag = map.get( "emptyFlag" );

		if ( flag == null || flag.equals( "false" ) )
		{
			mav.setViewName( "redirect:/newPaymentWay" );
		}

		return mav;
	}

	@RequestMapping( "/encryption" )
	@ResponseBody
	public String encryption( @RequestBody Map<String, Object> input )
	{
		String result = service.encryption( input );

		return result;
	}
	
	@RequestMapping("/getBankURL")
	@ResponseBody
	public String getBankURL(@RequestBody Map<String,Object> input) {
		String bankName=input.get( "bank_name" ).toString();
		String result=service.getBankURL(bankName);
		
		return result;
	}
}
