package lab.ex;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;


public class AdviceUsingXML {
	
	private static final Logger LOGGER  = LogManager.getLogger(AdviceUsingXML.class);

	public void beforeTargetMethod(JoinPoint thisJoinPoint) {

//        @SuppressWarnings("unused")
//		Class<? extends Object> clazz = thisJoinPoint.getTarget().getClass();
        String className = thisJoinPoint.getTarget().getClass().getSimpleName();
        String methodName = thisJoinPoint.getSignature().getName();

        StringBuffer buf = new StringBuffer();
        buf.append("AdviceUsingXML.beforeTargetMethod : [" + className
            + "." + methodName + "()]");
        Object[] arguments = thisJoinPoint.getArgs();
        int argCount = 0;
        for (Object obj : arguments) {
            buf.append("\n - arg ");
            buf.append(argCount++);
            buf.append(" : ");
            buf.append(ToStringBuilder.reflectionToString(obj));
        }
        LOGGER.debug(buf.toString());
    }

    public void afterTargetMethod(JoinPoint thisJoinPoint) {
    	LOGGER.debug("AdviceUsingXML.afterTargetMethod executed.");
    }

	public void afterReturningTargetMethod(JoinPoint thisJoinPoint,
            Object retVal) {

        @SuppressWarnings("unused")
		Class<? extends Object> clazz = thisJoinPoint.getTarget().getClass();
        String className = thisJoinPoint.getTarget().getClass().getSimpleName();
        String methodName = thisJoinPoint.getSignature().getName();

        // 현재 class, method 정보 및 method arguments 로깅
        StringBuffer buf = new StringBuffer();
        buf.append("AdviceUsingXML.afterReturningTargetMethod : ["
            + className + "." + methodName + "()]");

        buf.append("\n");

        if (retVal instanceof List) {
            List<?> resultList = (List<?>) retVal;
            buf.append("resultList size : " + resultList.size() + "\n");
            for (Object oneRow : resultList) {
                buf.append(ToStringBuilder.reflectionToString(oneRow));
                buf.append("\n");
            }
        } else {
            buf.append(ToStringBuilder.reflectionToString(retVal));
        }
        LOGGER.debug(buf.toString());
    }

    public void afterThrowingTargetMethod(JoinPoint thisJoinPoint,
            Exception exception) throws Exception {
    	LOGGER.debug("AdviceUsingXML.afterThrowingTargetMethod executed.");
    	LOGGER.error("에러가 발생했습니다. {}", exception);

        throw new Exception("에러가 발생했습니다.", exception);
    }

    public Object aroundTargetMethod(ProceedingJoinPoint thisJoinPoint)
            throws Throwable {
    	LOGGER.debug("AdviceUsingXML.aroundTargetMethod start.");

        Object retVal = thisJoinPoint.proceed();

        LOGGER.debug("AdviceUsingXML.aroundTargetMethod end.");
        return retVal;
    }

}
