package lab;

import org.springframework.stereotype.Repository;

@Repository("customerdao") 
public class CustomerAnnotationDAO implements CustomerService {

	public String getCustName(String id) {
		return id+" eGovFrame Annotation";
	}

	public String getCustGrade(String id) {
		return id + " S Annotation";
	}
}
