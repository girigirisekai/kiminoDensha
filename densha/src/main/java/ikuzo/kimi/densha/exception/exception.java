package ikuzo.kimi.densha.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
@ControllerAdvice
public class exception {
	
/*	웹 어플리케이션의 공통 예외터리 클래스 */
	@ExceptionHandler(Exception.class)
	public String exception() {
		
		return "/error";
		// TODO Auto-generated constructor stub
	
	}
	
}
