package lab;

public class CustomerXMLServiceImpl implements CustomerService {
	 
	private CustomerXMLDAO xmlDAO;
	
	public void setCustXMLDAO(CustomerXMLDAO cxmlDAO) {
	        this.xmlDAO = cxmlDAO;
	}

	public String getCustName(String id){
		return xmlDAO.getCustName(id);
	}

	public String getCustGrade(String id) {
		return xmlDAO.getCustGrade(id);
	}
}
