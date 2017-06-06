package lab.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lab.web.model.IdInfo;

@Controller
public class IdServiceController {
	
	private String formView = "id/idForm";
	private String successView = "id/idSuccess";

	@RequestMapping(value = "/idservice.do", method=RequestMethod.GET)
	protected String idInput(ModelMap model) throws Exception{
		model.addAttribute("idInfo",new IdInfo());
		return formView;
	}
	
	@RequestMapping(value = "/idservice.do", method=RequestMethod.POST)
	protected String regist(@ModelAttribute("idInfo") IdInfo command, BindingResult errors, ModelMap model)
	        throws Exception {
			System.out.println(command.getName());
		if (errors.hasErrors()) {
			return formView;
		}
		model.addAttribute("idInfo",command);
		return successView;
	}

}
