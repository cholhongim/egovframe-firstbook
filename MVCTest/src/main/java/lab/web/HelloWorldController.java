package lab.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloWorldController {

	private String viewName = "hello/helloworld";
	
	public String getViewName(){
		return this.viewName;
	}

	@RequestMapping(value = "/hello.do")
	public String helloworld() {
		return getViewName();
	}

	@RequestMapping(value = "/hello2.do")
	public ModelAndView helloworld2() {
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
}
