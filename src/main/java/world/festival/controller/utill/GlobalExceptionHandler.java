package world.festival.controller.utill;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(NullPointerException.class)
	public String nullpointHandler(Model model, NullPointerException ex){
		model.addAttribute("msg", "情報の転送に問題がありました。お手数ですがやり直してください。");
		model.addAttribute("ex", ex);
		return "/exception/exception";
	}
	
	@ExceptionHandler(Exception.class)
	public String Exception(Model model, Exception ex){
		model.addAttribute("msg", "ページを開くのに問題がありました。お手数ですがやり直してください。");
		model.addAttribute("ex", ex);
		return "/exception/exception";
	}
	
	
	
}
