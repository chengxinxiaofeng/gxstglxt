/**
 * 
 */
package com.zyf.ssm.mapper;

import java.util.List;

/**
 * @ClassName ActivityMapper
 * @Description TODO
 * @Date 2018年3月26日
 */
public interface ActivityMapper {
	
	List getAllActivityPreviewData(String page);
	String getActiviyPreviewCount();
	List getGivenActivityData(String activity_id);
	//浏览量+1
	int updateActivityCount(String activity_id);
	
	
	List getAllActivityHistoryData(String page);
	String getActiviyHistoryCount();

}
