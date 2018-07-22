/**
 * 
 */
package com.zyf.ssm.mapper;

import java.util.List;
import java.util.Map;
/**
 * @ClassName BackMapper
 * @Description TODO
 * @Date 2018年3月16日
 */
public interface BackMapper {
	/**
	 * 
	 * @Title:getCommonUserInfo
	 * @Description  获得普通会员信息列表
	 * @param @param map
	 * @param @return 
	 * @return List
	 * @Date 2018年3月16日
	 */
	  List getCommonUserInfo(Map map);
	  /**
	   * 
	   * @Title:getCommonUserCount
	   * @Description 查询普通会员信息条数
	   * @param @return 
	   * @return String
	   * @Date 2018年3月16日
	   */
	  String getCommonUserCount(Map map);
	  /**
	   * 
	   * @Title:getGivenUser
	   * @Description  会员信息查询
	   * @param @param map
	   * @param @return 
	   * @return List
	   * @Date 2018年3月16日
	   */
	  List getGivenUser(Map map);
	  String getGivenUserCount(Map map);
	  List getVerifyGivenUser(Map map);
	  String getVerifyGivenUserCount(Map map);  
	  List getGoodsInfo(Map map);
	  String getGoodsCount(Map map);
	  int delCommonUser(Map map);
	  int delBatchCommonUser(Map map);
	  int delGoods(Map map);
	  int delBatchGoods(Map map);
	  String checkStudetId(Map map);
	  List getSelectData();
	  int addCommonUser(Map map);
	  int addGoods(Map map);
	  int editCommonUser(Map map);
	  int editGoods(Map map);
	  List getVerifyCommonUserInfo(Map map);
	  String getVerifyCommonUserCount(Map map);
	  List getAllNewsInfo(Map map);
	  String getAllNewsCount(Map map);
	  int updateValidFlag(Map map);
	  List getCommonUserBarData(String association_id);
	  //新闻页面下拉选选中后查询
	  List getSelectNewsInfo(Map map);
	  //新闻页面下拉选选中后查询
	  String getSelectNewsCount(Map map);
	  List searchNewInfo1(Map map);
	  String searchNewCount1(Map map);
	  List searchNewInfo2(Map map);
	  String searchNewCount2(Map map);
	  /**
	   * 
	   * @Title:insertFiles
	   * @Description 插入文件信息
	   * @param @param map
	   * @param @return 
	   * @return int
	   * @Date 2018年3月23日
	   */
	  int insertFiles(Map map);
	  /**
	   * 
	   * @Title:reportNews
	   * @Description  插入新闻信息 --没有上传附件时
	   * @param @param map
	   * @param @return 
	   * @return int
	   * @Date 2018年3月23日
	   */
	  int reportNews1(Map map);
	  /**
	   * 
	   * @Title:reportNews2
	   * @Description 插入新闻信息 --上传了附件时
	   * @param @param map
	   * @param @return 
	   * @return int
	   * @Date 2018年3月23日
	   */
	  int reportNews2(Map map);
	  /**
	   * 
	   * @Title:updateFileFlag
	   * @Description  更新文件有效标识为1（改为有效）
	   * @param @param map
	   * @param @return 
	   * @return int
	   * @Date 2018年3月23日
	   */
	  int updateFilesFlag(String parent_id);
	  /**
	   * 
	   * @Title:delNews
	   * @Description  删除新闻
	   * @param @param news_id
	   * @param @return 
	   * @return int
	   * @Date 2018年3月23日
	   */
	  int delNews(String news_id);
	  /**
	   * 
	   * @Title:selectFiles
	   * @Description 查询新闻对应的文件信息
	   * @param @param news_id 新闻ID
	   * @param @return 
	   * @return List
	   * @Date 2018年3月23日
	   */
	  List selectFiles(String news_id);
	  /**
	   * 
	   * @Title:delFiles
	   * @Description  删除文件信息
	   * @param @param news_id
	   * @param @return 
	   * @return int
	   * @Date 2018年3月23日
	   */
	  int delFiles(String news_id);
	  /**
	   * 
	   * @Title:addActivity
	   * @Description 添加活动
	   * @param @param map
	   * @param @return 
	   * @return int
	   * @Date 2018年3月24日
	   */
	  int addActivity(Map map);
	  /**
	   * 
	   * @Title:getAllActivityInfo
	   * @Description 查询所有活动信息
	   * @param @param map
	   * @param @return 
	   * @return List
	   * @Date 2018年3月24日
	   */
	  List getAllActivityInfo(Map map);
	  String getAllActivityCount(Map map);
	  //getSelectActivityInfo
	  List getSelectActivityInfo(Map map);
	  String getSelectActivityCount(Map map);
	  int delActivity(String activity_id);
	  List getGivenGoods(Map map);
	  String getGivenGoodsCount(Map map);
}
