package lab;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CustomerApp {
	public static void main(String[] args) {
		String configLocation = "classpath*:META-INF/spring/context-*.xml";
		ApplicationContext context = new ClassPathXmlApplicationContext(configLocation);
		
		CustomerService customer=(CustomerService)context.getBean("customerService");
		List<CustomerVO> resultList;
		CustomerVO vo = new CustomerVO();
		try {
		customer.deleteCustomer(vo);
		
		vo.id = "1";
		vo.name = "KIM";
		vo.address = "SEOUL";
		customer.insertCustomer(vo);
		
		resultList= customer.selectCustomerList(vo);
		printResult(resultList);
		
		vo.id = "1";
		vo.name = "KIM";
		vo.address = "PUSAN";
		customer.updateCustomer(vo);

		} catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				resultList= customer.selectCustomerList(vo);
				printResult(resultList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void printResult(List<CustomerVO> resultList) {
		int num = resultList.size();
		for (int i=0; i<num; i++) {
			CustomerVO resultvo = resultList.get(i);
			System.out.println("id="+resultvo.id);
			System.out.println("name="+resultvo.name);
			System.out.println("address="+resultvo.address);
		}
	}
}
