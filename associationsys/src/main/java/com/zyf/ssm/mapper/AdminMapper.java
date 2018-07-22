/**
 * 
 */
package com.zyf.ssm.mapper;

import java.util.List;
import java.util.Map;

/**
 * @ClassName AdminMapper
 * @Description TODO
 * @Date 2018年4月2日
 */
public interface AdminMapper {
	List getAllAssociationInfo(Map map);
	String getAllAssociationCount(Map map);
	int updateAssociationValidFlag(String student_id);
	int updateUserValidFlag(String student_id);
	List getAllAssociationName();
	List getAllInstituteName();
	List getAssociationBarData();
	List getcheckActivityInfo(Map map);
	String getcheckActivityCount(Map map);
	int  updateActivityState(Map map);
	List getActivityBarData();
	List getNewsBarData();
	List getcheckedNewsInfo(Map map);
	String getcheckedNewsCount(Map map);
	int updateNewsCheckFlag(Map map);
	int updatePwd(Map map);
	Map getAssociationInfo(String association_id);
}
