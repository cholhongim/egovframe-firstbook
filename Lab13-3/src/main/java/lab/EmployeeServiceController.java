package lab;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import lab.Employee;

@Controller
public class EmployeeServiceController {
	@Resource(name="employeeService")
	EmployeeService employeeservice;
	
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	@RequestMapping(value = "/validator.do")
	protected String getValidator() throws Exception{
		return "validator";
	}
	
	@RequestMapping(value = "/employeeAdd.do", method=RequestMethod.GET)
	protected String employeeAddForm(ModelMap model) throws Exception{
		model.addAttribute("employee",new Employee());
		return "employee/employeeAddForm";
	}
	
	@RequestMapping(value = "/employeeAdd.do", method=RequestMethod.POST)
	protected String employeeAdd(@ModelAttribute("employee") Employee command, 
			  BindingResult errors, ModelMap model) throws Exception {
	    beanValidator.validate(command, errors);
		if (errors.hasErrors()) {
			return "employee/employeeAddForm";
		}
		employeeservice.insertEmployee(command);
		return "redirect:/employeeList.do";
	}

	@RequestMapping(value = "/employeeList.do")
	protected String employList(ModelMap model) throws Exception{
		Employee vo = new Employee();
		List<Employee> employeelist = employeeservice.selectEmployeeList(vo);
		model.addAttribute("employeelist",employeelist);
		return "employee/employeeList";
	}

	@RequestMapping(value = "/employeeView.do")
	protected String employeeAdd(@RequestParam String id, ModelMap model) throws Exception {
		Employee vo = new Employee();
		vo.setId(id);
		Employee command = employeeservice.selectEmployee(vo);
		model.addAttribute("employeeinfo",command);
		return "employee/employeeView";
	}

	@RequestMapping(value = "/employeeModify.do", method=RequestMethod.GET)
	protected String employeeModifyForm(@RequestParam String id,ModelMap model) throws Exception{
		Employee vo = new Employee();
		vo.setId(id);
		Employee command = employeeservice.selectEmployee(vo);
		model.addAttribute("employee",command);
		return "employee/employeeModifyForm";
	}
	
	@RequestMapping(value = "/employeeModify.do", method=RequestMethod.POST)
	protected String employeeModify(@ModelAttribute("employee") Employee command, 
			  BindingResult errors, ModelMap model) throws Exception {
	    beanValidator.validate(command, errors);
		if (errors.hasErrors()) {
			return "employee/employeeModifyForm";
		}
		employeeservice.updateEmployee(command);
		return "redirect:/employeeView.do?id="+command.getId();
	}
	
	@RequestMapping(value = "/employeeRemove.do")
	protected String employeeRemove(@RequestParam String id) throws Exception {
		Employee vo = new Employee();
		vo.setId(id);
		employeeservice.deleteEmployee(vo);
		return "redirect:/employeeList.do";
	}
}
