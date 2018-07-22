/**
 * 
 */
package com.zyf.ssm.intercepter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
public class LoginIntercepter implements HandlerInterceptor {

	
	//进入 Handler方法之前执行
	//用于身份认证、身份授权
	//比如身份认证，如果认证通过表示当前用户没有登陆，需要此方法拦截不再向下执行
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		//获取请求的url
		String url = request.getRequestURI();
		String [] temp = url.split("\\/");
		//判断url是否是公开 地址（实际使用时将公开 地址配置配置文件中）
		//这里公开地址是登陆提交的地址
		if(temp[2].indexOf("qqLogin")>=0){
			return true;
		}
		//||temp[2].equals("admin")  getImg
		if(temp[2].equals("adminLogin")||temp[2].equals("activity")
		||temp[2].equals("notice")||temp[2].equals("association")
		||temp[2].equals("index")||temp[3].indexOf("getSelectData")>=0
		||temp[3].indexOf("checkCommonStudentNumber")>=0||temp[3].indexOf("upLoadPic")>=0
		||temp[3].indexOf("addCommonUser")>=0||temp[3].indexOf("getImg")>=0
		||temp[3].indexOf("updatePwd")>=0||temp[3].indexOf("loginOut")>=0
				){
			//如果进行登陆提交，放行
			return true;
		}
		
		//判断session
		HttpSession session  = request.getSession();
		//从session中取出用户身份信息
		String realname = (String) session.getAttribute("realname");

		if(realname != null&&((String)session.getAttribute("usertype")).equals("社长")&&temp[2].equals("back")){
			//身份存在，放行
			return true;
		}else 	if(realname != null&&((String)session.getAttribute("usertype")).equals("超级用户")&&temp[2].equals("admin")){
			//身份存在，放行
			return true;
		}
		
		//执行这里表示用户身份需要认证，跳转登陆页面
		response.sendRedirect("/associationsys/adminLogin/login.action");
		return false;
	}

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.HandlerInterceptor#afterCompletion(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, java.lang.Exception)
	 */
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.HandlerInterceptor#postHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, org.springframework.web.servlet.ModelAndView)
	 */
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}}