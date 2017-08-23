package lab;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {
	
    @Resource(name = "employeeDAO")
    public EmployeeDAO employeeDAO;
	      	
	public void insertEmployee(Employee employeeVO) throws Exception {
		employeeDAO.insertEmployee(employeeVO);
	}

	public void updateEmployee(Employee employeeVO) throws Exception {
		employeeDAO.updateEmployee(employeeVO);
	}
	
	public void deleteEmployee(Employee employeeVO) throws Exception {
		employeeDAO.deleteEmployee(employeeVO);
	}

	public List<Employee> selectEmployeeList(Map<?, ?> param) throws Exception {
		return employeeDAO.selectEmployeeList(param);
	}
	
	public Employee selectEmployee(Employee employeeVO) throws Exception {
		return employeeDAO.selectEmployee(employeeVO);
	}
	
	public int getEmployeeCount(Map<?, ?> param) {
		return employeeDAO.getEmployeeCount(param);
	}
}
