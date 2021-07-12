package org.pg.receive;

import java.util.*;


import org.pg.data.CommunicationMessage;
import org.pg.data.MallVO;
import org.pg.data.PGException;
import org.pg.process.ProcessMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReceiveServiceImpl implements ReceiveService
{

	@Autowired
	private ProcessMapper mapper;

	@Override
	public Map<String, Object> connectionCheck( Map<String, Object> input)
	{
		Map<String, Object> result = new HashMap<>();
		PGException exception = null;
		String mall_code = null;

		try
		{
			if ( input == null || input.size() == 0 )
			{
				exception = new PGException( "No Input Data" );
				throw exception;
			}
			String message = input.get( "messageType" ).toString();

			if ( message.equals( CommunicationMessage.connect ) == false )
			{
				exception = new PGException( "Invalid Access." );
				throw exception;
			}

			mall_code = input.get( "mall_code" ).toString();

			if ( mall_code == null )
			{
				exception = new PGException( "No Mall Code" );
				throw exception;
			}
			MallVO mallInfo = mapper.getMall( mall_code );

			if ( mallInfo == null )
			{
				exception = new PGException( "Unregistrated Mall" );
				throw exception;
			}

			result.put( "messageType", CommunicationMessage.success );
		}
		catch( PGException e )
		{
			result.put( "messageType", CommunicationMessage.fail );
			result.put( "message", e.getMessage() );
			return result;
		}
		catch( Exception e )
		{
			result.put( "messageType", CommunicationMessage.error );
			result.put( "message", "Unexpected error.: " + e.getMessage() );
			e.printStackTrace();
			return result;
		}

		return result;
	}

}
