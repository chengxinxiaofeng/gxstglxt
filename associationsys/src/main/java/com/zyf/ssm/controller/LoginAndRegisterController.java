/**
 * 
 */
package com.zyf.ssm.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zyf.ssm.mapper.LoginAndRegisterMapper;
import com.zyf.ssm.service.LoginAndRegisterService;


/**
 * @ClassName LoginAndRegisterController
 * @Description TODO 登录/注册/找回密码
 * @Date 2018年3月9日
 */
@Controller
@RequestMapping("/adminLogin")
public class LoginAndRegisterController {
	@Autowired
	private LoginAndRegisterService loginAndRegisterService;
	@Autowired
	private LoginAndRegisterMapper loginAndRegisterMapper;
    /**
     * 
     * @Title:openLoginPage
     * @Description  打开管理员登录页
     * @param @return 
     * @return String
     * @Date 2018年3月9日
     */
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String openLoginPage(){
        return "login/adminLogin";
    }
    /**
     * 
     * @Title:openFindPwdWin
     * @Description  打开找回密码窗口
     * @param @return 
     * @return String
     * @Date 2018年3月9日
     */
    @RequestMapping(value = "/openFindPwdWin",method = RequestMethod.GET)
    public String openFindPwdWin(){
        return "login/findPwd";
    }
    /**
     * 
     * @Title:openQqLoginWin
     * @Description  打开QQ登录回调界面
     * @param @return 
     * @return String
     * @Date 2018年3月19日
     */
    @RequestMapping(value = "/openQqLoginWin",method = RequestMethod.GET)
    public String openQqloginWin(){
        return "login/qqLogin";
    }
    /**
     * 
     * @Title:findPwdGetCode
     * @Description 找回密码 和  短信验证码登录 得到验证码  
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return Map
     * @Date 2018年3月9日
     */
    @RequestMapping(value = "/findPwdGetCode",method = RequestMethod.POST)
    @ResponseBody
    public Map findPwdGetCode(HttpServletRequest req) throws Exception{
    	HttpSession session = req.getSession();
    	//session   10分钟有效
    	session.setMaxInactiveInterval(6000);
    	String phone = req.getParameter("phoneNumber");
    	int code = (int)((Math.random()*9+1)*1000);
    	Map map1 = new HashMap();
    	map1.put("phoneNumber", req.getParameter("phoneNumber"));
    	map1.put("code",code);
    	Map map  = loginAndRegisterService.findRegisterPhone(map1);
    	//当发送验证码成功后，存放在session中。
    	if(1==(Integer)map.get("code")){
    		session.setAttribute(phone, Integer.toString(code));
    		session.setAttribute("findPhone", phone);
    		session.setAttribute("findPwd", map.get("findPwd"));
    	}
		return map;
    }
    /**
     * 
     * @Title:checkFindPwdCode
     * @Description 	找回密码模块校验验证码是否正确
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return String
     * @Date 2018年3月9日
     */
    @RequestMapping(value = "/checkFindPwdCode",method = RequestMethod.POST)
    @ResponseBody
    public String checkFindPwdCode(HttpServletRequest req) throws Exception{
		String code = req.getParameter("code");
		String phoneNumber = req.getParameter("phoneNumber");
		HttpSession session = req.getSession();
		if((code.equals((String)session.getAttribute(phoneNumber)))){		
			return "1";
			
		}else{
			return "0";
		}
    	
    }
    /**
     * 
     * @Title:checkNewPwdController
     * @Description   找回密码——新密码校验
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return String
     * @Date 2018年3月8日
     */
    @RequestMapping(value = "/checkNewPwdController",method = RequestMethod.POST)
    @ResponseBody
    public String checkNewPwdController(HttpServletRequest req) throws Exception{
    	HttpSession session = req.getSession();
    	String newpwd1 = req.getParameter("newpwd1");
    	if(newpwd1.equals(session.getAttribute("findPwd"))){
    		return "0";
    	}else{
    		return "1";
    	}
   	
    }
    /**
     * 
     * @Title:shortMsgLogin
     * @Description 短信验证码登录
     * @param @param req
     * @param @throws Exception 
     * @return String
     * @Date 2018年3月9日
     */
    @RequestMapping(value = "/shortMsgLogin",method = RequestMethod.POST)
    @ResponseBody
    public String shortMsgLogin(HttpServletRequest req) throws Exception{
    	//获取验证码
    	String code = req.getParameter("code");
    	//获取电话号码
		String phoneNumber = req.getParameter("phoneNumber");
		//得到session
		HttpSession session = req.getSession();
		Map map = new HashMap();
		map.put("phoneNumber", phoneNumber);
		//当验证码正确时
		if((code.equals((String)session.getAttribute(phoneNumber)))){
			//查询出登录手机号码的个人信息
			map  = loginAndRegisterMapper.shortMsgLogin(phoneNumber);
			//协会ID
			session.setAttribute("association_id", (String)map.get("ASSOCIATION_ID"));
			//真实姓名
    		session.setAttribute("realname", (String)map.get("REALNAME"));
    		//密码
    		session.setAttribute("pwd", (String)map.get("PWD"));
    		//用户类型
    		session.setAttribute("usertype", (String)map.get("USERTYPE"));
    		session.setAttribute("userInfoMap",map);	
    		//社团管理员登录
    		if("社长".equals((String)map.get("USERTYPE"))){
    			return "1";
    		//校级管理员登录
    		}else{
    			return "2";
    		}
    	//当验证码错误时
		}else{
			return "0";
		}
   	
    }
    /**
     * 
     * @Title:userNameLogin
     * @Description 账号密码登录
     * @param @param req
     * @param @param map
     * @param @return
     * @param @throws Exception 
     * @return String
     * @Date 2018年4月4日
     */
    @RequestMapping(value = "/userNameLogin",method = RequestMethod.POST)
    @ResponseBody
    public String userNameLogin(HttpServletRequest req,@RequestBody Map<String,String> map) throws Exception{
    	HttpSession session = req.getSession();
    	String signcode = (String) session.getAttribute("signcode");
    	String username = map.get("username");
    	loginAndRegisterService.userNameLogin(map);
    	String userpassword = map.get("userpassword");
    	String usercode = map.get("usercode");   
    	//不区分验证码大小写
    	if(signcode.toUpperCase().equals(usercode.toUpperCase())){
    		Map resultMap = loginAndRegisterService.userNameLogin(map);
    		if(resultMap.get("loginFlag").equals("0")){
    			//用户名或密码错误
    			return "0";
    		}else{
    			//登录成功身份验证通过
    			session.setAttribute("username",resultMap.get("list") );
    			List list = (List) resultMap.get("list"); 			
    			session.setAttribute("association_id", (String)((Map)list.get(0)).get("ASSOCIATION_ID"));
        		session.setAttribute("realname", (String)((Map)list.get(0)).get("REALNAME"));
        		session.setAttribute("pwd", (String)((Map)list.get(0)).get("PWD"));
        		session.setAttribute("usertype", (String)((Map)list.get(0)).get("USERTYPE"));
        		session.setAttribute("userInfoMap", (Map)list.get(0));
        		if(((String)((Map)list.get(0)).get("USERTYPE")).equals("社长")){
        			return "1";
        		}else{
        			return "2";	
        		}       		
    		}
    	}else{
    		//验证码错误
    		return "3";
    	}   	
    }
    /**
     * 
     * @Title:commitNewPwdController
     * @Description 找回密码--更新密码
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return int
     * @Date 2018年3月9日
     */
    @RequestMapping(value = "/commitNewPwdController",method = RequestMethod.POST)
    @ResponseBody
    public int  commitNewPwdController(HttpServletRequest req) throws Exception{
    	HttpSession session = req.getSession();
    	Map map = new HashMap();
    	String newpwd1 = req.getParameter("newpwd1");
    	String findPhone = (String) session.getAttribute("findPhone");
    	map.put("newpwd1", newpwd1);
    	map.put("findPhone", findPhone);
    	int flag = loginAndRegisterService.updateFindPwd(map);    	
		return flag ;
    	
    }
   /**
    * 
    * @Title:qqLogin
    * @Description  QQ登录校验
    * @param @param map
    * @param @return
    * @param @throws Exception 
    * @return int
    * @Date 2018年3月13日
    */
    @RequestMapping(value = "/qqLogin",method = RequestMethod.POST)
    @ResponseBody
    public String  qqLogin(@RequestBody Map<String,String> map,HttpServletRequest req) throws Exception{
    	Map resultMap = loginAndRegisterService.qqLogin(map);
    	HttpSession session = req.getSession();
    	if((Boolean) resultMap.get("qqLoginFlag")){
    		session.setAttribute("association_id", (String)((Map)resultMap.get("resultMap")).get("ASSOCIATION_ID"));
    		session.setAttribute("realname",  (String)((Map)resultMap.get("resultMap")).get("REALNAME"));
    		session.setAttribute("imgurl",  (String)((Map)resultMap.get("resultMap")).get("IMGURL"));
    		session.setAttribute("pwd",  (String)((Map)resultMap.get("resultMap")).get("PWD"));
    		session.setAttribute("usertype",  (String)((Map)resultMap.get("resultMap")).get("USERTYPE"));
            session.setAttribute("userInfoMap", resultMap.get("resultMap"));
    		return "1";
    	}else{
    		return "0";
    	}	
    }

}
