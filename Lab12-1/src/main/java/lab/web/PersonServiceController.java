package lab.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springmodules.validation.commons.DefaultBeanValidator;

import lab.web.model.Person;

@Controller
public class PersonServiceController {
	
	private String formView = "person/personForm";
	private String successView = "person/personSuccess";
	
	@Autowired
	private DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/validator.do")
	protected String getValidator() throws Exception{
		return "validator";
	}

	@RequestMapping(value = "/person.do", method=RequestMethod.GET)
	protected String personInput(ModelMap model) throws Exception{
		model.addAttribute("person",new Person());
		return formView;
	}
	
	@RequestMapping(value = "/person.do", method=RequestMethod.POST)
	protected String regist(@ModelAttribute("person") Person person, 
			  BindingResult errors, ModelMap model) throws Exception {

	    beanValidator.validate(person, errors);
		if (errors.hasErrors()) {
			return formView;
		}

		model.addAttribute("pinfo",person);
		return successView;
	}

}
