/**
 * 
 */
package com.zyf.ssm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;

import com.zyf.ssm.mapper.LoginAndRegisterMapper;
import com.zyf.ssm.service.LoginAndRegisterService;
import com.zyf.ssm.tools.HttpUtils;

/**
 * @ClassName LoginAndRegisterImpl
 * @Description TODO
 * @Date 2018年3月6日
 */
public class LoginAndRegisterServiceImpl  implements LoginAndRegisterService {
	@Autowired
	private LoginAndRegisterMapper loginAndRegisterMapper;
	public Map findRegisterPhone(Map map) throws Exception{
		Map resultMap  = new HashMap();
		
		List list = loginAndRegisterMapper.findRegisterPhone(map);
		int code = (Integer) map.get("code");
		//System.out.println("测试呀code-------"+ code);
		if(list.size() == 0){
			resultMap.put("code", 0);
			resultMap.put("msg", "该账号还未注册！");
		}else{
				String host = "https://fesms.market.alicloudapi.com";
			    String path = "/sms/";
			    String method = "POST";
			    String appcode = "883dd15da50442479186022f83875f5f";
			    Map<String, String> headers = new HashMap<String, String>();
			    //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
			    headers.put("Authorization", "APPCODE " + appcode);
			    Map<String, String> querys = new HashMap<String, String>();
			    querys.put("code",  Integer.toString(code));
			    querys.put("phone", (String) map.get("phoneNumber"));
			    querys.put("skin", "1");
			    //System.out.println("验证码、、、、、、、、、、、、、、、、"+(String) map.get("phoneNumber"));

			    try {
			    	/**
			    	* 重要提示如下:
			    	* HttpUtils请从
			    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
			    	* 下载
			    	*
			    	* 相应的依赖请参照
			    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
			    	*/
			    	@SuppressWarnings("deprecation")
					HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
			    	//获取response的body
			    	//System.out.println(EntityUtils.toString(response.getEntity()));
			    } catch (Exception e) {
			    	resultMap.put("code", 0);
					resultMap.put("msg", "该账号还未注册！");
					e.printStackTrace();
					return resultMap;
			    	
			    }
			resultMap.put("code", 1);
			resultMap.put("findPwd", (String)((Map)list.get(0)).get("pwd"));
			resultMap.put("msg", "获取验证码成功！");
		}
		return resultMap;
		
	}
	/**
	 * 
	 * @Title:updateFindPwd
	 * @Description 找回密码——更新密码
	 * @param @param map
	 * @param @throws Exception 
	 * @return void
	 * @Date 2018年3月8日
	 */
	public int updateFindPwd(Map map) throws Exception{
		return  loginAndRegisterMapper.updateFindPwd(map);		
	}
	/**
	 * 
	 * @Title:userNameLogin
	 * @Description 账号密码登录
	 * @param @param map
	 * @param @throws Exception 
	 * @return void
	 * @Date 2018年3月8日
	 */
	public Map userNameLogin(Map map) throws Exception{
		Map resultMap = new HashMap();
		List list  = loginAndRegisterMapper.userNameLogin(map);
		if(list.size() == 0){
			resultMap.put("loginFlag", "0");
		}else{
			resultMap.put("loginFlag", "1");
			resultMap.put("list", list);
		}
		return resultMap;
	}
	/**
	 * 
	 * @Title:qqLogin
	 * @Description  QQ登录
	 * @param @param map
	 * @param @return
	 * @param @throws Exception 
	 * @return Map
	 * @Date 2018年3月13日
	 */
	public Map qqLogin(Map map) throws Exception{
		Map resultMap = loginAndRegisterMapper.qqLogin(map);
		Map resultMap1 = new HashMap();
		if(resultMap == null){
			resultMap1.put("qqLoginFlag", false);
		}else{
			resultMap1.put("qqLoginFlag", true);
			resultMap1.put("resultMap", resultMap);
		}
		return resultMap1;
			
}
}
