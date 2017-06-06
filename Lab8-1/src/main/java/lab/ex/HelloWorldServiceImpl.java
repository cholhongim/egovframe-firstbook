package lab.ex;

import org.apache.log4j.Level;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;


public class HelloWorldServiceImpl implements HelloWorldService{

    Logger logger1 = LogManager.getLogger(HelloWorldServiceImpl.class.getName());

	private String name;
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String sayHello(String message) {
		logger1.debug("sayHello executed");
		return "Hello " + name + " "+message ;
	}
	
	public void sayError() {
        double i = 100/0;
	}
}
