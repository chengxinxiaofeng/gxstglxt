/**
 * 
 */
package com.zyf.ssm.service.impl;


import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.zyf.ssm.mapper.BackMapper;
import com.zyf.ssm.mapper.LoginAndRegisterMapper;
import com.zyf.ssm.service.BackService;
/**
 * @ClassName BackServiceImpl
 * @Description TODO
 * @Date 2018年3月16日
 */
public class BackServiceImpl  implements BackService {
	@Autowired
	private BackMapper backMapper;
	/**
	 * 
	 * getCommonUserInfo
	 * @Description  查询普通会员信息
	 * @param @return
	 * @param @throws Exception 
	 * @return List
	 * @Date 2018年3月15日
	 */
	public List getCommonUserInfo(Map map) throws Exception{
		List list  = backMapper.getCommonUserInfo(map);
		return list;
	}
	/**
	 * 
	 * @Title:getCommonUserCount
	 * @Description 普通会员总数， 用于表格分页
	 * @param @return
	 * @param @throws Exception 
	 * @return String
	 * @Date 2018年3月15日
	 */
	public String getCommonUserCount(Map map) throws Exception{
		String count = backMapper.getCommonUserCount(map);
		return count;
	}
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
	public int delCommonUser(Map map) throws Exception{
		int count = backMapper.delCommonUser(map);
		return count;
		
	}
	/**
	 * 
	 * @Title:delBatchCommonUser
	 * @Description   批量删除普通会员
	 * @param @param list
	 * @param @return 
	 * @return String
	 * @Date 2018年3月17日
	 */
	public String delBatchCommonUser(List list) {
		for(int i = 0; i<list.size(); i++){
			try{
				backMapper.delBatchCommonUser((Map)list.get(i));
			}catch(Exception e){
				return "0";
				
			}
		}
		return "1";	
	}
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
	public String addCommonUser(Map map) throws Exception{
		try{
				backMapper.addCommonUser(map);
			}catch(Exception e){
				return "0";
			}
			return "1";
	}
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
	public String editCommonUser(Map map) throws Exception{
		try{
			backMapper.editCommonUser(map);
		}catch(Exception e){
			return "0";
		}
		return "1";
		
	}
	/**
	 * 
	 * @Title:updateValidFlag
	 * @Description  更新validflag
	 * @param @param map
	 * @param @return
	 * @param @throws Exception 
	 * @return int
	 * @Date 2018年3月20日
	 */
	public  String updateValidFlag(Map map) throws Exception{
			try{
				backMapper.updateValidFlag(map);
			}catch(Exception e){
				return "0";
			}
			return "1";
	}
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
	public  String updateBatchValidFlag(List list) throws Exception{
		for(int i = 0; i<list.size(); i++){
			try{
				//backMapper.delBatchCommonUser((Map)list.get(i));
				backMapper.delBatchCommonUser((Map)list.get(i));
			}catch(Exception e){
				return "0";
				
			}
		}
		return "1";
		
	}
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
	public String delBatchGoods(List list) throws Exception{
		for(int i = 0; i<list.size(); i++){
			try{
			//	backMapper.delBatchCommonUser((Map)list.get(i));
				backMapper.delBatchGoods((Map)list.get(i));
			}catch(Exception e){
				return "0";
				
			}
		}
		return "1";	
	}
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
	public String addGoods(Map map) throws Exception{
		try{
			backMapper.addGoods(map);
		}catch(Exception e){
			return "0";
		}
		return "1";
	}
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
	public String editGoods(Map map) throws Exception{
		try{
			backMapper.editGoods(map);
		}catch(Exception e){
			return "0";
		}
		return "1";
	}
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
	public String insertFiles(Map map) throws Exception{
		try{
			backMapper.insertFiles(map);
		}catch(Exception e){
			return "0";
		}
		return "1";
	}
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
	public String reportNews(Map map) throws Exception{
		//当没有上传附件时
		if("" == map.get("news_id")){
			try{
				backMapper.reportNews2(map);
			}catch(Exception e){
				return "0";
			}
			//上传了附件时
		}else{	
			String parent_id = (String)map.get("news_id");
			try{
				backMapper.reportNews1(map);			
				backMapper.updateFilesFlag(parent_id);
			}catch(Exception e){
				return "0";
			}
		}
		return "1";
		
	}
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
	public String delNews(String news_id) throws Exception{
		try{
			backMapper.delNews(news_id);
			String filePath;
			List list = backMapper.selectFiles(news_id);
			for(int i = 0; i < list.size(); i++){
				filePath = (String)((Map)list.get(i)).get("FILE_URL");
				  File file = new File(filePath);
			        if (!file.exists()) {
			            return "0";
			        } else {
			                delFiles(filePath);			     
			        }
			}			
			backMapper.delFiles(news_id);
		}catch(Exception e){
			return "0";
		}
		return "1";		
	}
	/**
	 * 
	 * @Title:delFiles
	 * @Description  删除磁盘文件
	 * @param @param filePath
	 * @param @return 
	 * @return boolean
	 * @Date 2018年3月23日
	 */
	public boolean delFiles(String filePath ){
        File file = new File(filePath);
        // 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
        if (file.exists() && file.isFile()) {
            if (file.delete()) {
                return true;
            }
	}
		return false;
	}
	 /* 
	 * @Title:addActivity
	 * @Description 添加活动
	 * @param @param map
	 * @param @return
	 * @param @throws Exception 
	 * @return String
	 * @Date 2018年3月24日
	 */
	public String addActivity(Map map)throws Exception{
		try{
			backMapper.addActivity(map);
		}catch(Exception e){
			return "0";
		}
		return "1";
	}
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
	public String delActivity(String activity_id) throws Exception{
	/*	try{*/
			backMapper.delActivity(activity_id);
	/*	}catch(Exception e){
			return "0";
		}*/
		return "1";		
	}
}
