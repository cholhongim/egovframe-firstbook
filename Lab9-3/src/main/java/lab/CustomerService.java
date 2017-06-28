package lab;

import java.util.List;

public interface CustomerService  {
	
	public void insertCustomer(CustomerVO customerVO) throws Exception;

	public void deleteCustomer(CustomerVO customerVO)throws Exception;
	
	public void updateCustomer(CustomerVO customerVO)throws Exception;

	public List<CustomerVO> selectCustomerList(CustomerVO customerVO)throws Exception;
}
