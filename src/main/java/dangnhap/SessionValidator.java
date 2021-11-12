package dangnhap;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SessionValidator extends HandlerInterceptorAdapter {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {

            Object handlerMethod =  ((HandlerMethod)handler).getBean();

            if(internalService(handlerMethod, request.getCookies()) ){
                return true;
            }
        }
        return true;
    }

    private Boolean internalService(Object handerMethod, Cookie[] cookies){
        if(cookies == null || cookies.length == 0) return false;
        if(!handerMethod.getClass().getPackage().getName().contains("vn.vnpthis.mobile")){
            return false;
        }
        return false;
    }


}
