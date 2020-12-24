package home.model.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

// AOP 어노테이션
@Aspect
public class MemberLoggingAdvice {
	
	private static Logger logger = LoggerFactory.getLogger(MemberLoggingAdvice.class);
	
    public void logBefore(JoinPoint joinPoint) {
        logger.debug("logBefore()");
	}

    public void logAfter(JoinPoint joinPoint) {
        logger.debug("logAfter()");
    }

	@Around("execution(public * home.model.bean..*(..))")
	public Object around(ProceedingJoinPoint jp) throws Throwable {
		Object thisObj = jp.getTarget();
		String className = thisObj.getClass().getName();
		Object[] args = jp.getArgs();
		long currentTime = System.currentTimeMillis();

		// Request 객체 사용
		RequestAttributes  ra = RequestContextHolder.currentRequestAttributes();
		ServletRequestAttributes sra = (ServletRequestAttributes)ra;
		
		HttpServletRequest request = sra.getRequest();
		HttpSession session = request.getSession();
		
		String ip = request.getRemoteAddr();
		String id = (String) session.getAttribute("sessionId");
		if(id == null) {
			id = "guest";
		}
		
		logger.debug("=================================================");
		logger.debug(">>>>>>>>> LOGGING START >>>>>>>>>>");
		logger.debug("[id]:" + id);
		logger.debug("[ip]:" + ip);
   		logger.debug("[class]:" + className);
   		logger.debug("[method]:" + jp.getSignature().getName() + "()");

        Object returnObj = jp.proceed();
        logger.debug("[소요시간]: {}ms", new Object[]{(System.currentTimeMillis()-currentTime)});
        logger.debug(">>>>>>>>>> LOGGING END >>>>>>>>>>");
        logger.debug("=================================================");

        return returnObj;
	}
}
