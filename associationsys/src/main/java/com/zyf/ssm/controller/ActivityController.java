package com.zyf.ssm.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zyf.ssm.mapper.ActivityMapper;

/**
 * @ClassName AcivityController
 * @Description TODO
 * @Date 2018年3月28日
 */
@Controller
@RequestMapping("/activity")
public class ActivityController {
		@Autowired
		private ActivityMapper activityMapper ;
		@RequestMapping(value = "/openActivity",method = RequestMethod.GET)
	    public String first(){
	        return "front/activity/activity";
	    }
		/**
		 * 
		 * @Title:getAllActivityPreviewData
		 * @Description 近期活动列表
		 * @param @param req
		 * @param @return
		 * @param @throws Exception 
		 * @return Map
		 * @Date 2018年3月29日
		 */
		 @RequestMapping(value = "/getAllActivityPreviewData",method = RequestMethod.GET)
		 @ResponseBody
		 public Map  getAllActivityPreviewData(HttpServletRequest req) throws Exception{
			 Map map  = new HashMap();
			 //近期活动
			 if("0".equals(req.getParameter("type"))){
				 map.put("list", activityMapper.getAllActivityPreviewData(req.getParameter("page")));
				 map.put("count", activityMapper.getActiviyPreviewCount()); 
				//历史活动
			 }else if("1".equals(req.getParameter("type"))){
				 map.put("list", activityMapper.getAllActivityHistoryData(req.getParameter("page")));
				 map.put("count", activityMapper.getActiviyHistoryCount()); 
			 }
			 return map;
		    	
		 }
		 @RequestMapping(value = "/getGivenActivityPreviewData",method = RequestMethod.GET)
		 @ResponseBody
		 public List  getGivenActivityPreviewData(HttpServletRequest req) throws Exception{
			 Map map  = new HashMap();
			 try{
				 	activityMapper.updateActivityCount(req.getParameter("activity_id"));
			 }catch(Exception e){
				 	System.out.println("更新活动浏览量失败...");
			 }
			 return  activityMapper.getGivenActivityData(req.getParameter("activity_id"));
		 }
}
