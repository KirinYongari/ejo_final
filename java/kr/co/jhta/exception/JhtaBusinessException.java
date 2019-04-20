package kr.co.jhta.exception;

public class JhtaBusinessException extends RuntimeException{

	private String errorCode;
	
	public JhtaBusinessException(String errorCode, String message){
		super(message);
		this.errorCode = errorCode;
		
	}

	public String getErrorCode() {
		return errorCode;
	}	
}

