package org.pg.data;

public class CommunicationMessage
{
	public static final String connect="connect"; //연결 요청
	public static final String keySend="keySend"; //암호화 키 전송
	public static final String payment="payment"; // 데이터 전송
	public static final String paymentWayCheck="paymentWayCheck"; // 데이터 전송
	public static final String disconnect="disConnect"; // 연결 종료
	public static final String reject="reject"; //연결 거부
	public static final String error="error"; //오류 발생
	public static final String fail="fail"; // 거래 실패
	public static final String success="success"; //데이터 처리 완료.
}
