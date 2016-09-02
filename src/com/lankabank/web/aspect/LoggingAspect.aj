package com.lankabank.web.aspect;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.StopWatch;

public aspect LoggingAspect {
	
	private final Log log = LogFactory.getLog(this.getClass());

    pointcut logging() :  execution(* com.lankabank.web..*.*(..));
	
	Object around () : logging() {

			StopWatch stopWatch = new StopWatch();
			stopWatch.start();
			Object retVal = proceed();
			stopWatch.stop();

			StringBuffer logMessage = new StringBuffer();
			logMessage.append(thisJoinPoint.getTarget().getClass().getName());
			logMessage.append(".");
			logMessage.append(thisJoinPoint.getSignature().getName());
			logMessage.append("(");
			Object[] args = thisJoinPoint.getArgs();
			for (int i = 0; i < args.length; i++) {
				logMessage.append(args[i]).append(",");
			}
			if (args.length > 0) {
				logMessage.deleteCharAt(logMessage.length() - 1);
			}

			logMessage.append(")");
			logMessage.append(" execution time: ");
			logMessage.append(stopWatch.getTotalTimeMillis());
			logMessage.append(" ms");
			log.info(logMessage.toString());
			return retVal;
	}
}
