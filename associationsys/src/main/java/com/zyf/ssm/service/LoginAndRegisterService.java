/**
 * 
 */
package com.zyf.ssm.service;

import java.util.List;
import java.util.Map;

/**
 * @ClassName LoginAndRegisterImpl
 * @Description TODO
 * @Date 2018年3月6日
 */
public interface LoginAndRegisterService {
	/**
	 * 
	 * @Title:findRegisterPhone
	 * @Description 找回密码——查询手机号是否已注册
	 * @param @param map
	 * @param @return
	 * @param @throws Exception 
	 * @return Map
	 * @Date 2018年3月8日
	 */
	public Map findRegisterPhone(Map map) throws Exception;
	/**
	 * 
	 * @Title:updateFindPwd
	 * @Description 找回密码——更新密码
	 * @param @param map
	 * @param @throws Exception 
	 * @return void
	 * @Date 2018年3月8日
	 */
	public int updateFindPwd(Map map) throws Exception;
	/**
	 * 
	 * @Title:userNameLogin
	 * @Description 账号密码登录
	 * @param @param map
	 * @param @throws Exception 
	 * @return void
	 * @Date 2018年3月8日
	 */
	public Map userNameLogin(Map map) throws Exception;
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
	public Map qqLogin(Map map) throws Exception;
}
