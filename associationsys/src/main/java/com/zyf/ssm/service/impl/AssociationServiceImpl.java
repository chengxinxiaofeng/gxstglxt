/**
 * 
 */
package com.zyf.ssm.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.zyf.ssm.mapper.AssociationMapper;
import com.zyf.ssm.mapper.LoginAndRegisterMapper;
import com.zyf.ssm.service.AssociationService;

/**
 * @ClassName AssociationServiceImpl
 * @Description TODO
 * @Date 2018年3月31日
 */
public class AssociationServiceImpl implements AssociationService {

	@Autowired
	private AssociationMapper associationMapper;

	/**
	 * 
	 * @Title:insertAssociationFile
	 * @Description   插入申请社团文件信息
	 * @param @param map
	 * @param @return
	 * @param @throws Exception 
	 * @return String
	 * @Date 2018年3月31日
	 */
	public String insertAssociationFile(Map map) throws Exception{
		 try {
			 	associationMapper.insertAssociationFile(map);
		 } catch (Exception e) {
			 return "0";
		 }
		 	return "1";
						
	}
	public String insertAssociationInfo(Map map) throws Exception{
		try {
			//插入社团信息
		 	associationMapper.insertAssociationInfo(map);
		 	//插入社长信息
		 	associationMapper.insertUserInfo(map);
		 	//更改社团简介文件为有效
		 	associationMapper.updateValidFlag((String)map.get("association_id"));
		} catch (Exception e) {
			 return "2";
		 }
			 return "3";
		}
}
