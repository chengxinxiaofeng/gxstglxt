/**
 * 
 */
package com.zyf.ssm.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zyf.ssm.mapper.BackMapper;
import com.zyf.ssm.mapper.IndexMapper;
import com.zyf.ssm.mapper.NoticeAndNewsMapper;

/**
 * @ClassName NoticeAndNewsController
 * @Description 公告&新闻
 * @Date 2018年3月26日
 */
@Controller
@RequestMapping("/notice")
public class NoticeAndNewsController {
	@Autowired
	private NoticeAndNewsMapper noticeAndNewsMapper ;
	/**
	 * 
	 * @Title:openFirst
	 * @Description 打开公告列表页面
	 * @param @return 
	 * @return String
	 * @Date 2018年3月27日
	 */
	@RequestMapping(value = "/openNotice",method = RequestMethod.GET)
    public String openFirst(){
        return "front/notice/noticeList";
	}	
	/**
	 * 
	 * @Title:getAllNoticeData
	 * @Description  获取公告列表
	 * @param @return
	 * @param @throws Exception 
	 * @return List
	 * @Date 2018年3月27日
	 */
	 @RequestMapping(value = "/getAllNoticeData",method = RequestMethod.GET)
	 @ResponseBody
	 public Map  getAllNoticeData(HttpServletRequest req) throws Exception{
		 Map map  = new HashMap();
		 map.put("list", noticeAndNewsMapper.getAllNoticeData(req.getParameter("page")));
		 map.put("count", noticeAndNewsMapper.getAllNoticeCount());
		return map;
	    	
	 }
	 /**
	  * 
	  * @Title:openNews
	  * @Description 打开新闻列表页面
	  * @param @return 
	  * @return String
	  * @Date 2018年3月27日
	  */
	 @RequestMapping(value = "/openNews",method = RequestMethod.GET)
	 public String openNews(){
	        return "front/news/newsList";
	 }
	 /**
	  * 
	  * @Title:getAllNoticeData
	  * @Description 获取新闻列表
	  * @param @param req
	  * @param @return
	  * @param @throws Exception 
	  * @return Map
	  * @Date 2018年3月27日
	  */
	 @RequestMapping(value = "/getAllNewsData",method = RequestMethod.GET)
	 @ResponseBody
	 public Map  getAllNewsData(HttpServletRequest req) throws Exception{
		 Map map  = new HashMap();
		 map.put("list", noticeAndNewsMapper.getAllNewsData(req.getParameter("page")));
		 map.put("count", noticeAndNewsMapper.getAllNewsCount());
		 return map;
	    	
	 }
	 /**
	  * 
	  * @Title:getGivenNoticeData
	  * @Description 获取指定公告&新闻信息
	  * @param @param req
	  * @param @return
	  * @param @throws Exception 
	  * @return Map
	  * @Date 2018年3月27日
	  */
	 @RequestMapping(value = "/getGivenNoticeData",method = RequestMethod.GET)
	 @ResponseBody
	 public Map  getGivenNoticeData(HttpServletRequest req) throws Exception{
		 Map map  = new HashMap();
		 try{
			 noticeAndNewsMapper.updateNewsCount(req.getParameter("news_id"));
		 }catch(Exception e){
			 System.out.println("更新新闻浏览量失败...");
		 }
		 List fileList  = noticeAndNewsMapper.getNoticeFileInfo(req.getParameter("news_id"));
		 List newsList  = noticeAndNewsMapper.getGivenNoticeData(req.getParameter("news_id"));
		 map.put("fileList",fileList);
		 map.put("newsList",newsList);
		 return map;	
	 }
	 @RequestMapping(value = "/getGivenNoticeData2",method = RequestMethod.GET)
	 @ResponseBody
	 public Map  getGivenNoticeData2(HttpServletRequest req) throws Exception{
		 Map map  = new HashMap();
		 try{
			 noticeAndNewsMapper.updateNewsCount(req.getParameter("news_id"));
		 }catch(Exception e){
			 System.out.println("更新新闻浏览量失败...");
		 }
		 List fileList  = noticeAndNewsMapper.getNoticeFileInfo(req.getParameter("news_id"));
		 List newsList  = noticeAndNewsMapper.getGivenNoticeData2(req.getParameter("news_id"));
		 map.put("fileList",fileList);
		 map.put("newsList",newsList);
		 return map;	
	 }
	 /**
	  * 
	  * @Title:getNoticeFileInfo
	  * @Description 下载公告&新闻附件
	  * @param @param req
	  * @param @param response
	  * @param @throws Exception 
	  * @return void
	  * @Date 2018年3月28日
	  */
	 @RequestMapping(value = "/getFile",method = RequestMethod.GET)
	 @ResponseBody
	 public void  getFile(HttpServletRequest req,HttpServletResponse response) throws Exception{    	
	    	  String fileUrl=req.getParameter("fileUrl");
	    	  String name = req.getParameter("fileName");
	    	  name = new String(name.getBytes("iso-8859-1"), "utf-8");
	    	  name = StringUtils.replace(name, "+", "%20"); 
	          try {  
	              File filePath = new File(fileUrl);  
	              if(filePath.exists()){  
	                  //读图片  
	                  FileInputStream inputStream = new FileInputStream(filePath);    
	                  int available = inputStream.available();  
	                  byte[] data = new byte[available];  
	                  inputStream.read(data);    
	                  inputStream.close();    
				    	//写文件 
	                  response.setContentType("application/force-download"); 
	                  //response.setCharacterEncoding("UTF-8");  
	                  name = URLEncoder.encode(name, "UTF-8");
	                  name =  new String( name.getBytes("utf-8"), "ISO8859-1" );
	                  response.setHeader("Content-Disposition", "attachment;filename="+name); 
	                  OutputStream stream = new BufferedOutputStream(response.getOutputStream());    
	                  stream.write(data);    
	                  stream.flush();    
	                  stream.close();    
	              }  
	          } catch (Exception e) {  
	              e.printStackTrace();  
	          }   
	    	
	    }

}
