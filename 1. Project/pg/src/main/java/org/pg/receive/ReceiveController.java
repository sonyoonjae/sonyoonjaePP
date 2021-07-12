package org.pg.receive;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.pg.data.CommunicationMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RestController
public class ReceiveController
{

	@Autowired
	private ReceiveService service;

	@RequestMapping( "/connect" )
	@ResponseBody
	public Map<String, Object> connect( HttpSession session,
			@RequestBody Map<String, Object> input )
	{
//		HttpSession session = request.getSession( true );
		Map<String, Object> result = service.connectionCheck( input );

		return result;
	}

	@RequestMapping( "/disconnect" )
	@ResponseBody
	public String disconnect( @RequestBody Map<String, Object> input, HttpSession session )
	{
		session.invalidate();

		return CommunicationMessage.success;
	}

}
