/**
 * 
 */
package com.zyf.ssm.service;

import java.util.List;
import java.util.Map;

/**
 * @ClassName BackService
 * @Description TODO
 * @Date 2018年3月6日
 */
public interface BackService {
	/**
	 * 
	 * getCommonUserInfo
	 * @Description  查询普通会员信息
	 * @param @return
	 * @param @throws Exception 
	 * @return List
	 * @Date 2018年3月15日
	 */
	public List getCommonUserInfo(Map map) throws Exception;
	/**
	 * 
	 * @Title:getCommonUserCount
	 * @Description 普通会员总数， 用于表格分页
	 * @param @return
	 * @param @throws Exception 
	 * @return String
	 * @Date 2018年3月15日
	 */
	public String getCommonUserCount(Map map) throws Exception;
	/**
	 * 
	 * @Title:delCommonUser
	 * @Description  删除会员信息
	 * @param @param map
	 * @param @return
	 * @param @throws Exception 
	 * @return int
	 * @Date 2018年3月16日
	 */
	public int  delCommonUser(Map map) throws Exception;
	/**
	 * 
	 * @Title:delBatchCommonUser
	 * @Description   批量删除普通会员
	 * @param @param list
	 * @param @return 
	 * @return String
	 * @Date 2018年3月17日
	 */
	public String delBatchCommonUser(List list) throws Exception;
	/**
	 * 
	 * @Title:addCommonUser
	 * @Description 新增用户
	 * @param @param map
	 * @param @return
	 * @param @throws Exception 
	 * @return int
	 * @Date 2018年3月19日
	 */
	public String addCommonUser(Map map) throws Exception;
	/**
	 * 
	 * @Title:editCommonUser
	 * @Description 修改用户
	 * @param @param map
	 * @param @return
	 * @param @throws Exception 
	 * @return String
	 * @Date 2018年3月19日
	 */
	public String editCommonUser(Map map) throws Exception;
	/**
	 * 
	 * @Title:updateValidFlag
	 * @Description  单一更新validflag
	 * @param @param map
	 * @param @return
	 * @param @throws Exception 
	 * @return int
	 * @Date 2018年3月20日
	 */
	public  String updateValidFlag(Map map) throws Exception;
	/**
	 * 
	 * @Title:updateBatchValidFlag
	 * @Description 批量更新validflag
	 * @param @param map
	 * @param @return
	 * @param @throws Exception 
	 * @return String
	 * @Date 2018年3月20日
	 */
	public  String updateBatchValidFlag(List list) throws Exception;
	/**
	 * 
	 * @Title:delBatchCommonUser
	 * @Description 
	 * @param @param list
	 * @param @return
	 * @param @throws Exception 
	 * @return String
	 * @Date 2018年3月22日
	 */
	public String delBatchGoods(List list) throws Exception;
	/**
	 * 
	 * @Title:addGoods
	 * @Description  物资录入
	 * @param @param map
	 * @param @return
	 * @param @throws Exception 
	 * @return String
	 * @Date 2018年3月22日
	 */
	public String addGoods(Map map) throws Exception;
	/**
	 * 
	 * @Title:editGoods
	 * @Description  物资编辑
	 * @param @param map
	 * @param @return
	 * @param @throws Exception 
	 * @return String
	 * @Date 2018年3月22日
	 */
	public String editGoods(Map map) throws Exception;
	/**
	 * 
	 * @Title:insertFiles
	 * @Description 插入文件信息
	 * @param @param map
	 * @param @return
	 * @param @throws Exception 
	 * @return String
	 * @Date 2018年3月23日
	 */
	public String insertFiles(Map map) throws Exception;
	/**
	 * 
	 * @Title:reportNews
	 * @Description 插入新闻
	 * @param @param map
	 * @param @return
	 * @param @throws Exception 
	 * @return String
	 * @Date 2018年3月23日
	 */
	public String reportNews(Map map) throws Exception;
	/**
	 * 
	 * @Title:delNews
	 * @Description  删除新闻
	 * @param @param news_id
	 * @param @return
	 * @param @throws Exception 
	 * @return String
	 * @Date 2018年3月23日
	 */
	public String delNews(String news_id) throws Exception;
	/**
	 * 
	 * @Title:addActivity
	 * @Description 添加活动
	 * @param @param map
	 * @param @return
	 * @param @throws Exception 
	 * @return String
	 * @Date 2018年3月24日
	 */
	public String addActivity(Map map)throws Exception;
	/**
	 * 
	 * @Title:delActivity
	 * @Description  删除活动
	 * @param @param activity_id
	 * @param @return
	 * @param @throws Exception 
	 * @return String
	 * @Date 2018年4月5日
	 */
	public String delActivity(String activity_id) throws Exception;
	
}
