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
public interface AssociationService {

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
	public String insertAssociationFile(Map map) throws Exception;
	/**
	 * 
	 * @Title:insertAssociationInfo
	 * @Description  新增社团信息
	 * @param @param map
	 * @param @return
	 * @param @throws Exception 
	 * @return String
	 * @Date 2018年4月1日
	 */
	public String insertAssociationInfo(Map map) throws Exception;
	
}
