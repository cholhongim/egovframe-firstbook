package lab;

import java.util.List;

public interface EmployeeService  {
	
	public void insertEmployee(Employee employeeVO) throws Exception;

	public void updateEmployee(Employee employeeVO) throws Exception;
	
	public void deleteEmployee(Employee employeeVO) throws Exception;

	public List<Employee> selectEmployeeList(Employee employeeVO) throws Exception;
	
	public Employee selectEmployee(Employee employeeVO) throws Exception;

}
