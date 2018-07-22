/**
 * 
 */
package com.zyf.ssm.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.zyf.ssm.mapper.AdminMapper;
import com.zyf.ssm.service.AdminService;

/**
 * @ClassName AdminServiceImpl
 * @Description TODO
 * @Date 2018年4月1日
 */
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper adminMapper;
	/**
	 * 
	 * @Title:updateAssociationAndUserValidFlag
	 * @Description 更新协会/用户为有效
	 * @param @param student_id
	 * @param @return 
	 * @return String
	 * @Date 2018年4月2日
	 */
	public String updateAssociationAndUserValidFlag(String student_id){
		try{
		adminMapper.updateAssociationValidFlag(student_id);
		adminMapper.updateUserValidFlag(student_id);
		}catch(Exception e){
			return "0";
		}
		return "1";		
	}
	/**
	 * 
	 * @Title:updateAssociationAndUserValidFlag
	 * @Description  通过 或 打回 申请
	 * @param @param map
	 * @param @return 
	 * @return String
	 * @Date 2018年4月3日
	 */
	public String updateActivityState(Map map){
		try{
			adminMapper.updateActivityState(map);
			}catch(Exception e){
				return "0";
		}
			return "1";		
	}
	/**
	 * 
	 * @Title:updateNewsCheckFlag
	 * @Description 打回或通过新闻
	 * @param @param map
	 * @param @return 
	 * @return String
	 * @Date 2018年4月3日
	 */
	public String updateNewsCheckFlag(Map map){
		try{
			adminMapper.updateNewsCheckFlag(map);
			}catch(Exception e){
				return "0";
		}
			return "1";
		
	}
	/**
	 * 
	 * @Title:updatePwd
	 * @Description 修改密码
	 * @param @param map
	 * @param @return 
	 * @return String
	 * @Date 2018年4月4日
	 */
	public String updatePwd(Map map){
		try{
			adminMapper.updatePwd(map);
			}catch(Exception e){
	
			return "0";
		}
			return "1";
	}

}
