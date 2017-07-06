package lab.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lab.web.model.person;

@Controller
public class PersonServiceController {
	
	private String formView = "person/personForm";
	private String successView = "person/personSuccess";

	@RequestMapping(value = "/person.do", method=RequestMethod.GET)
	protected String personInput(ModelMap model) throws Exception{
		model.addAttribute("personinfo",new person());
		return formView;
	}
	
	@RequestMapping(value = "/person.do", method=RequestMethod.POST)
	protected String regist(@ModelAttribute("personinfo") person command, 
			  BindingResult errors, ModelMap model) throws Exception {
		if (errors.hasErrors()) {
			return formView;
		}
		model.addAttribute("pinfo",command);
		return successView;
	}

	@RequestMapping(value = "/person2.do", method=RequestMethod.GET)
	protected String personInput2(ModelMap model) throws Exception{
		model.addAttribute("personinfo",new person());
		return formView;
	}
	
	@RequestMapping(value = "/person2.do", method=RequestMethod.POST)
	protected String regist2(@RequestParam("name") String name, 
		 	  @RequestParam(value="company", required=false) String company,
	          @RequestParam(value="phone", required=false) String phone,
              @RequestParam(value="email", required=false) String email,
              ModelMap model) throws Exception {
		person personinfo = new person();
		personinfo.setName(name);
		personinfo.setCompany(company);
		personinfo.setPhone(phone);
		personinfo.setEmail(email);
		
		model.addAttribute("pinfo",personinfo);
		return successView;
	}
	
	@RequestMapping(value = "/person3.do", method=RequestMethod.GET)
	protected String personInput3(ModelMap model) throws Exception{
		person pobject = new person();
		pobject.setName("KIM");
		pobject.setCompany("company");
		pobject.setPhone("02-1234-5948");
		pobject.setEmail("abc@email.com");
		model.addAttribute("personinfo",pobject);
		return formView;
	}
	
	@RequestMapping(value = "/person3.do", method=RequestMethod.POST)
	protected String regist3(@ModelAttribute("personinfo") person command, 
			   BindingResult errors, ModelMap model) throws Exception {
		if (errors.hasErrors()) {
			return formView;
		}
		model.addAttribute("pinfo",command);
		return successView;
	}
}
