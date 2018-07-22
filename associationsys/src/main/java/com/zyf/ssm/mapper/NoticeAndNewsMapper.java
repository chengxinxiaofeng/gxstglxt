/**
 * 
 */
package com.zyf.ssm.mapper;

import java.util.List;
import java.util.Map;

/**
 * @ClassName NoticeMapper
 * @Description TODO
 * @Date 2018年3月26日
 */
public interface NoticeAndNewsMapper {
	
		List getAllNoticeData(String page);
		String getAllNoticeCount();
		List getAllNewsData(String page);
		String getAllNewsCount();
		List getGivenNoticeData(String news_id);
		List getGivenNoticeData2(String news_id);
		List getNoticeFileInfo(String news_id);
		//新闻浏览量+1
		int updateNewsCount(String news_id);

}
