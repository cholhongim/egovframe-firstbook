package lab;

import java.util.List;
import java.util.Map;

public interface EmployeeService  {
	
	public void insertEmployee(Employee employeeVO) throws Exception;

	public void updateEmployee(Employee employeeVO) throws Exception;
	
	public void deleteEmployee(Employee employeeVO) throws Exception;

	public List<Employee> selectEmployeeList(Map<?, ?> param) throws Exception;
	
	public Employee selectEmployee(Employee employeeVO) throws Exception;
	
	public int getEmployeeCount(Map<?, ?> param) throws Exception;

}
