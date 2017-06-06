package lab.ex;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloWorldApp {

	public static void main(String[] args) throws Exception {
		String configLocation = "context-*.xml"; 
		ApplicationContext context = new ClassPathXmlApplicationContext(configLocation);
		HelloWorldService helloworld = (HelloWorldService)context.getBean("helloworld");
		
		System.out.println("RESULT="+helloworld.sayHello());
//		helloworld.sayError();
	}
}
