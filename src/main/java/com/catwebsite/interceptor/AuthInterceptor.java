package com.catwebsite.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//public class AuthInterceptor implements HandlerInterceptor // interface 援ы쁽
public class AuthInterceptor extends HandlerInterceptorAdapter { // class �긽�냽

	//而⑦듃濡ㅻ윭瑜� �샇異쒗븯湲� �쟾�뿉 �샇異쒗븯�뒗 硫붿꽌�뱶
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
		
		String uri = req.getRequestURI();
		
		if (uri.contains("/re-upload/")||uri.contains("/qa-upload")||uri.contains("/cat-upload")||uri.contains("/pr-upload")||uri.contains("/market")) {
			HttpSession session = req.getSession();
			if (session.getAttribute("loginuser") == null) {//濡쒓렇�씤�븯吏� �븡�� 寃쎌슦				
				resp.sendRedirect("/catopia/account/login");
				return false; //而⑦듃濡ㅻ윭 �샇異� 痍⑥냼
			}
		}
		
		return true; // �젙�긽�쟻�쑝濡� 而⑦듃濡ㅻ윭 �샇異�
	}

	//而⑦듃濡ㅻ윭瑜� �샇異쒗븳 �썑�뿉 �샇異쒗븯�뒗 硫붿꽌�뱶
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {		
	}
	//�솕硫�(酉�) 泥섎━媛� �걹�궃 �썑�뿉 �샇異쒕릺�뒗 硫붿꽌�뱶
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {		
	} 

}
