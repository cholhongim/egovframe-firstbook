package lab;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CustomerServiceApp {
	public static void main(String[] args) {
		String configLocation = "classpath*:META-INF/spring/context-*.xml";
		ApplicationContext context = new ClassPathXmlApplicationContext(configLocation);
		
		CustomerService CustomerXML=(CustomerService)context.getBean("customerXML");
		System.out.println("[XML]");
		System.out.println("NAME="+CustomerXML.getCustName("1"));
		System.out.println("GRADE="+CustomerXML.getCustGrade("1"));
		
		CustomerService CustomerAnnotation = (CustomerService)context.getBean("customer");
		
		System.out.println("[Annotation]");
		System.out.println("NAME="+CustomerAnnotation.getCustName("2"));
		System.out.println("GRADE="+CustomerAnnotation.getCustGrade("2"));
	}
}
