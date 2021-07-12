package org.pg.data;

public class PGException extends Throwable
{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7485830040406461457L;

	public PGException()
	{
		super();
		// TODO 자동 생성된 생성자 스텁
	}

	public PGException( String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace )
	{
		super( message, cause, enableSuppression, writableStackTrace );
	}

	public PGException( String message, Throwable cause )
	{
		super( message, cause );
	}

	public PGException( String message )
	{
		super( message );
	}

	public PGException( Throwable cause )
	{
		super( cause );
	}
}
