package lab.ex;

import org.apache.log4j.Level;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;


public class HelloWorldServiceImpl implements HelloWorldService{

    Logger logger = LogManager.getLogger(HelloWorldServiceImpl.class.getName());

	private String name;
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String sayHello() {
		logger.debug("[debug] sayHello executed");
		logger.info("[info] sayHello executed");
		return "Hello " + name + "!!!" ;
	}
	
	public void sayError() {
       double i = 100/0;
	}
}
