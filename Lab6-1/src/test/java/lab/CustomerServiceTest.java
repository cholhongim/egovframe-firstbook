package lab;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {	"classpath*:META-INF/spring/context-*.xml"})
public class CustomerServiceTest {
	
	@Resource(name="customerXML") //xml
	CustomerXMLServiceImpl xmlcustomer; 

	@Resource(name="customer") //Annotation
	CustomerAnnotationServiceImpl customer;
	
	@Test
	public void testMain() {
		
		assertEquals(customer.getCustName("1"),"1 eGovFrame Annotation");
		assertEquals(customer.getCustGrade("1"),"1 S Annotation");
		
		assertEquals(xmlcustomer.getCustName("1"),"1 eGovFrame XML");
		assertEquals(xmlcustomer.getCustGrade("1"),"1 S XML");
	}
}
