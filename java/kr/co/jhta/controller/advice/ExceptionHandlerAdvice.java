package kr.co.jhta.controller.advice;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import kr.co.jhta.exception.LoginFailureException;

@ControllerAdvice
public class ExceptionHandlerAdvice {
	//모든 에러을 이쪽에 작성한다,
	
	//에러가 발생하면 에러페이지로 이동한다.
	
	/*@ExceptionHandler(LoginFailureException.class)
	public String loginError(){
			return "error/login-error";
	
	}
	
	@ExceptionHandler(Exception.class)
	public String error(){
		return "error/server-error";
	}*/
	
}
