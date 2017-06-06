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
	      	
	// insert Emp
    //@Transactional(value="txManager", propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
//    @Transactional(value="txManager", propagation=Propagation.REQUIRES_NEW, rollbackFor=Exception.class)
	public void insertCustomer(CustomerVO customerVO) throws Exception {
		customerDAO.insertCustomer(customerVO);
	}

	// delete Emp
	public void deleteCustomer(CustomerVO customerVO) throws Exception {
		customerDAO.deleteCustomer(customerVO);
	}

	// list Emp
	public List<CustomerVO> selectCustomerList(CustomerVO customerVO) throws Exception {
		return customerDAO.selectCustomerList(customerVO);
	}
}
