package lab;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CustomerApp {
	public static void main(String[] args) throws Exception {
		String configLocation = "classpath*:META-INF/spring/context-*.xml";
		ApplicationContext context = new ClassPathXmlApplicationContext(configLocation);
		
		CustomerService customer=(CustomerService)context.getBean("customerService");

		CustomerVO vo = new CustomerVO();
		customer.deleteCustomer(vo);
		
		vo.id = "1";
		vo.name = "KIM";
		vo.address = "SEOUL";
		customer.insertCustomer(vo);
		
		vo.id = "2";
		vo.name = "LEE";
		vo.address = "PUSAN";
		customer.insertCustomer(vo);
		
		List<CustomerVO> resultList= customer.selectCustomerList(vo);
		int num = resultList.size();
		for (int i=0; i<num; i++) {
			CustomerVO resultvo = resultList.get(i);
			System.out.println("id="+resultvo.id);
			System.out.println("name="+resultvo.name);
			System.out.println("address="+resultvo.address);
		}

	}
}
