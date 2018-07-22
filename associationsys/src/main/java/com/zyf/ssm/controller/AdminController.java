/**
 * 
 */
package com.zyf.ssm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zyf.ssm.mapper.AdminMapper;
import com.zyf.ssm.mapper.AssociationMapper;
import com.zyf.ssm.service.AdminService;

/**
 * @ClassName AdminController
 * @Description TODO
 * @Date 2018年4月1日
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private AdminService adminService;
	/**
	 * 
	 * @Title:AdminIndex
	 * @Description   超级管理员主页
	 * @param @return 
	 * @return String
	 * @Date 2018年4月2日
	 */
	@RequestMapping(value = "/AdminIndex",method = RequestMethod.GET)
    public String AdminIndex(){
        return "back/administrator/adminIndex";
    }
	/**
	 * 
	 * @Title:openAdminFirst
	 * @Description  打开管理员home
	 * @param @return 
	 * @return String
	 * @Date 2018年4月4日
	 */
	@RequestMapping(value = "/openAdminFirst",method = RequestMethod.GET)
    public String openAdminFirst(){
        return "back/administrator/firstAdmin";
    }
	/**
	 * 
	 * @Title:opencheckAssociationIframe
	 * @Description 社团审批主页
	 * @param @return 
	 * @return String
	 * @Date 2018年4月2日
	 */
	@RequestMapping(value = "/opencheckAssociationIframe",method = RequestMethod.GET)
    public String opencheckAssociationIframe(){
        return "back/administrator/checkAssociation";
    }
	/**
	 * 
	 * @Title:openCountNewsIframe
	 * @Description 打开新闻统计页面 
	 * @param @return 
	 * @return String
	 * @Date 2018年4月3日
	 */
	@RequestMapping(value = "/openCountNewsIframe",method = RequestMethod.GET)
    public String openCountNewsIframe(){
        return "back/administrator/countNews";
    }
	/**
	 * 
	 * @Title:openCountAssociationIframe
	 * @Description 打开社团统计页面
	 * @param @return 
	 * @return String
	 * @Date 2018年4月3日
	 */
	@RequestMapping(value = "/openCountAssociationIframe",method = RequestMethod.GET)
    public String openCountAssociationIframe(){
        return "back/administrator/countAssociation";
    }
	/**
	 * 
	 * @Title:openCountActivityIframe
	 * @Description  打开活动统计页面
	 * @param @return 
	 * @return String
	 * @Date 2018年4月3日
	 */
	@RequestMapping(value = "/openCountActivityIframe",method = RequestMethod.GET)
    public String openCountActivityIframe(){
        return "back/administrator/countActivity";
    }
	//openNewsDetailIframe
	/**
	 * 
	 * @Title:openNewsDetailIframe
	 * @Description  打开新闻详情页面
	 * @param @return 
	 * @return String
	 * @Date 2018年4月3日
	 */
	@RequestMapping(value = "/openNewsDetailIframe",method = RequestMethod.GET)
    public String openNewsDetailIframe(){
        return "back/administrator/newsDetail";
    }
	/**
	 * 
	 * @Title:opencheckActivityIframe
	 * @Description 活动审批
	 * @param @return 
	 * @return String
	 * @Date 2018年4月3日
	 */
	@RequestMapping(value = "/opencheckActivityIframe",method = RequestMethod.GET)
    public String opencheckActivityIframe(){
        return "back/administrator/checkActivity";
    }
	/**
	 * s
	 * @Title:opencheckNewsIframe
	 * @Description 打开新闻审批页面
	 * @param @return 
	 * @return String
	 * @Date 2018年4月3日
	 */
	@RequestMapping(value = "/opencheckNewsIframe",method = RequestMethod.GET)
    public String opencheckNewsIframe(){
        return "back/administrator/checkNews";
    }
	//openPersonInfo
	/**
	 * 
	 * @Title:openPersonInfo
	 * @Description  个人资料
	 * @param @return 
	 * @return String
	 * @Date 2018年4月4日
	 */
	@RequestMapping(value = "/openPersonInfo",method = RequestMethod.GET)
    public String openPersonInfo(){
        return "back/administrator/myInfo";
    }
	/**
	 * 
	 * @Title:openRePwd
	 * @Description  修改密码
	 * @param @return 
	 * @return String
	 * @Date 2018年4月4日
	 */
	@RequestMapping(value = "/openRePwd",method = RequestMethod.GET)
    public String openRePwd(){
        return "back/administrator/rePwd";
    }
	/**
	 * 
	 * @Title:getAssociationBarData
	 * @Description  查询3D柱状图数据
	 * @param @return 
	 * @return String
	 * @Date 2018年4月3日
	 */
	@RequestMapping(value = "/getAssociationBarData",method = RequestMethod.GET)
	@ResponseBody
    public Map getAssociationBarData(){
		Map map  = new HashMap();
		List associationNameList = adminMapper.getAllAssociationName();
		List instituteNameList = adminMapper.getAllInstituteName();
		List listData = adminMapper.getAssociationBarData();
		map.put("associationNameList", associationNameList);
		map.put("instituteNameList", instituteNameList);
		map.put("listData", listData);
		return map;
			
    }

	/**
	 * 
	 * @Title:getAllAssociationInfo
	 * @Description  查询待审批社团列表
	 * @param @param req
	 * @param @return
	 * @param @throws Exception 
	 * @return Map
	 * @Date 2018年4月2日
	 */
	@RequestMapping(value = "/getAllAssociationInfo",method = RequestMethod.GET)
	@ResponseBody
	public Map  getAllAssociationInfo(HttpServletRequest req) throws Exception{
		Map map = new HashMap();
		Map map1 = new HashMap();
		map.put("page", req.getParameter("page"));
		map.put("limit", req.getParameter("limit"));
		//association_type
		map.put("association_type",req.getParameter("association_type"));
		map.put("association_type",req.getParameter("association_type"));
		map.put("institute_id",req.getParameter("institute_id"));
		String association_name = new String(req.getParameter("association_name").getBytes("iso-8859-1"), "utf-8");
		map.put("association_name",association_name);
		List list  = adminMapper.getAllAssociationInfo(map);
		String count = adminMapper.getAllAssociationCount(map);
		map1.put("status", 200);
		map1.put("code", 0);
		map1.put("msg", "查询成功");
		map1.put("count",count);
		map1.put("data", list);
		return map1;
		
	}
	/**
	 * 
	 * @Title:changeUserFlag
	 * @Description 审核通过社团
	 * @param @param req
	 * @param @return
	 * @param @throws Exception 
	 * @return String
	 * @Date 2018年4月2日
	 */
	@RequestMapping(value = "/updateAssociationAndUserValidFlag",method = RequestMethod.GET)
	@ResponseBody
	public String  updateAssociationAndUserValidFlag(HttpServletRequest req) throws Exception{
		String student_id = new String(req.getParameter("student_id").getBytes("iso-8859-1"), "utf-8");
		return  adminService.updateAssociationAndUserValidFlag(student_id);
		
	}
	
	/**
	 * 
	 * @Title:getcheckActivityInfo
	 * @Description  查询待审批活动信息
	 * @param @param req
	 * @param @return
	 * @param @throws Exception 
	 * @return Map
	 * @Date 2018年4月3日
	 */
	@RequestMapping(value = "/getcheckActivityInfo",method = RequestMethod.GET)
	@ResponseBody
	public Map  getcheckActivityInfo(HttpServletRequest req) throws Exception{
		Map map = new HashMap();
		Map map1 = new HashMap();
		map.put("page", req.getParameter("page"));
		map.put("limit", req.getParameter("limit"));
		String activity_theme = new String(req.getParameter("activity_theme").getBytes("iso-8859-1"), "utf-8");
		map.put("activity_theme",activity_theme);
		List list  = adminMapper.getcheckActivityInfo(map);
		String count = adminMapper.getcheckActivityCount(map);
		map1.put("status", 200);
		map1.put("code", 0);
		map1.put("msg", "查询成功");
		map1.put("count",count);
		map1.put("data", list);
		return map1;	
	}
	/**
	 * 
	 * @Title:updateActivityState
	 * @Description  通过 或 打回 申请
	 * @param @return 
	 * @return String
	 * @Date 2018年4月3日
	 */
	@RequestMapping(value = "/updateActivityState",method = RequestMethod.POST)
	@ResponseBody
    public int updateActivityState(HttpServletRequest req){
		Map map = new HashMap();
		map.put("activity_id", req.getParameter("activity_id"));
		map.put("ACTIVITY_STATE", req.getParameter("type"));
		return adminMapper.updateActivityState(map);
       
    }
	/**
	 * 
	 * @Title:getActivityBarData
	 * @Description 活动浏览量前十统计柱状图
	 * @param @param req
	 * @param @return 
	 * @return int
	 * @Date 2018年4月3日
	 */
	@RequestMapping(value = "/getActivityBarData",method = RequestMethod.POST)
	@ResponseBody
    public List getActivityBarData(HttpServletRequest req){
		return adminMapper.getActivityBarData();		
	}
	/**
	 * 
	 * @Title:getNewsBarData
	 * @Description 新闻浏览量前十统计柱状图
	 * @param @param req
	 * @param @return 
	 * @return List
	 * @Date 2018年4月3日
	 */
	@RequestMapping(value = "/getNewsBarData",method = RequestMethod.POST)
	@ResponseBody
    public List getNewsBarData(HttpServletRequest req){
		return adminMapper.getNewsBarData();	
	}
	/**
	 * 
	 * @Title:getcheckedNewsInfo
	 * @Description  获取待审批新闻列表
	 * @param @param req
	 * @param @return
	 * @param @throws Exception 
	 * @return Map
	 * @Date 2018年4月3日
	 */
	@RequestMapping(value = "/getcheckedNewsInfo",method = RequestMethod.GET)
	@ResponseBody
	public Map  getcheckedNewsInfo(HttpServletRequest req) throws Exception{
		Map map = new HashMap();
		Map map1 = new HashMap();
		map.put("page", req.getParameter("page"));
		map.put("limit", req.getParameter("limit"));
		String news_title = new String(req.getParameter("news_title").getBytes("iso-8859-1"), "utf-8");
		map.put("news_title",news_title);
		map.put("news_type",req.getParameter("news_type"));
		List list  = adminMapper.getcheckedNewsInfo(map);
		String count = adminMapper.getcheckedNewsCount(map);
		map1.put("status", 200);
		map1.put("code", 0);
		map1.put("msg", "查询成功");
		map1.put("count",count);
		map1.put("data", list);
		return map1;	
	}
	/**
	 * 
	 * @Title:updateNewsCheckFlag
	 * @Description  打回或通过新闻
	 * @param @param req
	 * @param @return 
	 * @return int
	 * @Date 2018年4月3日
	 */
	@RequestMapping(value = "/updateNewsCheckFlag",method = RequestMethod.POST)
	@ResponseBody
	public int  updateNewsCheckFlag(HttpServletRequest req) throws Exception{
		Map map = new HashMap();
		map.put("check_flag", req.getParameter("check_flag"));
		map.put("news_id", req.getParameter("news_id"));
		return adminMapper.updateNewsCheckFlag(map);
	}
	//updatePwd
	/**
	 * 
	 * @Title:updatePwd
	 * @Description 修改密码
	 * @param @param req
	 * @param @return
	 * @param @throws Exception 
	 * @return int
	 * @Date 2018年4月4日
	 */
	@RequestMapping(value = "/updatePwd",method = RequestMethod.POST)
	@ResponseBody
	public String  updatePwd(@RequestBody Map<String,String> map) throws Exception{
		return adminService.updatePwd(map);
				
	}
	@RequestMapping(value = "/loginOut",method = RequestMethod.POST)
	@ResponseBody
	public String  loginOut(HttpServletRequest req,HttpServletResponse response) throws Exception{
		HttpSession session = req.getSession();
		session.invalidate();	
		return "1";		
	}

}
