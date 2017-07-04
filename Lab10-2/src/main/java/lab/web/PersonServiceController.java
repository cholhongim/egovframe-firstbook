package lab.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lab.web.model.person;

@Controller
public class PersonServiceController {
	
	private String formView = "person/personForm";
	private String successView = "person/personSuccess";

	@RequestMapping(value = "/person.do", method=RequestMethod.GET)
	protected String idInput(ModelMap model) throws Exception{
		model.addAttribute("personinfo",new person());
		return formView;
	}
	
	@RequestMapping(value = "/person.do", method=RequestMethod.POST)
	protected String regist(@ModelAttribute("personinfo") person command, BindingResult errors, ModelMap model)
	        throws Exception {

		if (errors.hasErrors()) {
			return formView;
		}
		model.addAttribute("pinfo",command);
		return successView;
	}

}
