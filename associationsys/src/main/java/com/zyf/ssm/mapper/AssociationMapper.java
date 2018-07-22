/**
 * 
 */
package com.zyf.ssm.mapper;

import java.util.List;
import java.util.Map;

/**
 * @ClassName ActivityMapper
 * @Description TODO
 * @Date 2018年3月26日
 */
public interface AssociationMapper {
	 int insertAssociationFile(Map map);
	 /**
	  * 
	  * @Title:selectGivenAssociationCount
	  * @Description  查询是否已存在社团
	  * @param @param association_name
	  * @param @return 
	  * @return int
	  * @Date 2018年4月1日
	  */
	 int selectGivenAssociationCount(String association_name);
	 /**
	  * 
	  * @Title:selectGivenUserCount
	  * @Description  查询申请社团人是否已经拥有社团，且为社团的社长
	  * @param @param student_id
	  * @param @return 
	  * @return int
	  * @Date 2018年4月1日
	  */
	 int selectGivenUserCount(String student_id);
	 /**
	  * 
	  * @Title:selectGivenUserCount2
	  * @Description  加入社团总数不能超过三个
	  * @param @param student_id
	  * @param @return 
	  * @return int
	  * @Date 2018年4月1日
	  */
	 int selectGivenUserCount2(String student_id);

	 /**
	  * 
	  * @Title:insertAssociationInfo
	  * @Description  插入社团信息
	  * @param @param map
	  * @param @return 
	  * @return int
	  * @Date 2018年4月1日
	  */
	 int insertAssociationInfo(Map map);
	 /**
	  * 
	  * @Title:insertUserInfo
	  * @Description  插入社长信息
	  * @param @param map
	  * @param @return 
	  * @return int
	  * @Date 2018年4月1日
	  */
	 int insertUserInfo(Map map);
	 /**
	  * 
	  * @Title:updateValidFlag
	  * @Description  更改社团简介文件标志为有效
	  * @param @param parent_id
	  * @param @return 
	  * @return int
	  * @Date 2018年4月1日
	  */
	 
	 int updateValidFlag(String parent_id);
	 /**
	  * 
	  * @Title:getAllAssociationInfo
	  * @Description  查询所有社团信息
	  * @param @param map
	  * @param @return 
	  * @return List
	  * @Date 2018年4月1日
	  */
	 List getAllAssociationInfo(Map map);
	 /**
	  * 
	  * @Title:getAllAssociationCount
	  * @Description  查询社团数量
	  * @param @param map
	  * @param @return 
	  * @return String
	  * @Date 2018年4月1日
	  */
	 String getAllAssociationCount(Map map);
	 /**
	  * 
	  * @Title:changeUserFlag
	  * @Description  更改用户标志
	  * @param @param map
	  * @param @return 
	  * @return int
	  * @Date 2018年4月1日
	  */
	 int changeUserFlag(Map map);

		
}
