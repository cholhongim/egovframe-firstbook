package lab;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {
	
    @Resource(name = "customerDAO")
    public CustomerDAO customerDAO;
    
    @Resource(name = "employeeDAO")
    public EmployeeDAO employeeDAO;
	      	
	public void insertCustomer(CustomerVO customerVO) throws Exception {
		customerDAO.insertCustomer(customerVO);
		employeeDAO.insertEmployee(customerVO);
	}


	public void deleteCustomer(CustomerVO customerVO) throws Exception {
		customerDAO.deleteCustomer(customerVO);
		employeeDAO.deleteEmployee(customerVO);
	}

//	@Transactional
	public void updateCustomer(CustomerVO customerVO) throws Exception {
		customerDAO.updateCustomer(customerVO);
		CustomerVO vo = new CustomerVO();
		vo.id = "1";
		vo.name = "KIMKIMKIMKIMKIM";
		vo.address = "SEOUL";	
		employeeDAO.updateEmployee(vo);
	}

	public List<CustomerVO> selectCustomerList(CustomerVO customerVO) throws Exception {
		return customerDAO.selectCustomerList(customerVO);
	}
	
	public List<CustomerVO> selectEmployeeList(CustomerVO customerVO) throws Exception {
		return employeeDAO.selectEmployeeList(customerVO);
	}
}
