/**
 * 
 */
package com.zyf.ssm.service;

import java.util.Map;

/**
 * @ClassName IndexService
 * @Description TODO
 * @Date 2018年3月26日
 */
public interface AdminService {
	/**
	 * 
	 * @Title:updateAssociationAndUserValidFlag
	 * @Description 更新协会/用户为有效
	 * @param @param student_id
	 * @param @return 
	 * @return String
	 * @Date 2018年4月2日
	 */
	public String updateAssociationAndUserValidFlag(String student_id);
	/**
	 * 
	 * @Title:updateAssociationAndUserValidFlag
	 * @Description  通过 或 打回 申请
	 * @param @param map
	 * @param @return 
	 * @return String
	 * @Date 2018年4月3日
	 */
	public String updateActivityState(Map map);
	/**
	 * 
	 * @Title:updateNewsCheckFlag
	 * @Description 打回或通过新闻
	 * @param @param map
	 * @param @return 
	 * @return String
	 * @Date 2018年4月3日
	 */
	public String updateNewsCheckFlag(Map map);
	/**
	 * 
	 * @Title:updatePwd
	 * @Description 修改密码
	 * @param @param map
	 * @param @return 
	 * @return String
	 * @Date 2018年4月4日
	 */
	public String updatePwd(Map map);

}
