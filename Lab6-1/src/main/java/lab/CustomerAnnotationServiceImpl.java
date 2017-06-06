package lab;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("customer")
public class CustomerAnnotationServiceImpl implements CustomerService {

	@Resource(name="customerdao")
	private CustomerAnnotationDAO customerdao;

	public String getCustName(String id) {			
		return customerdao.getCustName(id);
	}

	public String getCustGrade(String id) {
		return customerdao.getCustGrade(id);
	}
}