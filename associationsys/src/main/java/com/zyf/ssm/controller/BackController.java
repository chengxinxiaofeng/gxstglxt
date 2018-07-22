/**
 * 
 */
package com.zyf.ssm.controller;

import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zyf.ssm.mapper.BackMapper;
import com.zyf.ssm.service.AdminService;
import com.zyf.ssm.service.BackService;
import com.zyf.ssm.tools.WebServiceUtil;
/**
 * @ClassName BackController
 * @Description TODO 后台管理 类
 * @Date 2018年3月9日
 */
@Controller
@RequestMapping("/back")
public class BackController {
	@Autowired
	private BackService backService;
	@Autowired
	private BackMapper backMapper;
	@Autowired
	private AdminService adminService;
	
	/**
	 * 
	 * @Title:back
	 * @Description  打开后台管理首页
	 * @param @return 
	 * @return String
	 * @Date 2018年3月9日
	 */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(){
        return "back/backIndex";
    }
    /**
     * 
     * getCommonUserInfo
     * @Description 打开社团成员管理iframe
     * @param @return 
     * @return String
     * @Date 2018年3月15日
     */
    @RequestMapping(value = "/openCommonUserIframe",method = RequestMethod.GET)
    public String openCommonUserIframe(){
        return "back/commonUser";
    }
    /**
     * 
     * @Title:openUeditorTest
     * @Description  编辑器测试
     * @param @return 
     * @return String
     * @Date 2018年3月22日
     */
    @RequestMapping(value = "/openUeditorTest",method = RequestMethod.GET)
    public String openUeditorTest(){
        return "back/ueditorTest";
    }
    /**
     * 
     * @Title:openAddCommonUserWin
     * @Description  打开新增用户窗口
     * @param @return 
     * @return String
     * @Date 2018年3月18日
     */
    @RequestMapping(value = "/openAddCommonUserWin",method = RequestMethod.GET)
    public String openAddCommonUserWin(){
        return "back/commonUserAdd";
    }
    /**
     * 
     * @Title:openEditCommonUserWin
     * @Description 打开编辑普通用户窗口
     * @param @return 
     * @return String
     * @Date 2018年3月19日
     */
    @RequestMapping(value = "/openEditCommonUserWin",method = RequestMethod.GET)
    public String openEditCommonUserWin(){
    	  return "back/commonUserEdit";
    }
    /**
     * 
     * @Title:openCommonUserVerifyIframe
     * @Description  打开审批窗口
     * @param @return 
     * @return String
     * @Date 2018年3月20日
     */
    @RequestMapping(value = "/openCommonUserVerifyIframe",method = RequestMethod.GET)
    public String openCommonUserVerifyIframe(){
    	  return "back/commonUserVerify";
    }
    /**
     * 
     * @Title:opeNewsAddIframe
     * @Description  打开发布新闻窗体 测试
     * @param @return 
     * @return String
     * @Date 2018年3月23日
     */
    @RequestMapping(value = "/opeNewsAddIframe",method = RequestMethod.GET)
    public String opeNewsAddIframe(){
    	  return "back/ueditorTest";
    }
    /**
     * 
     * @Title:openStartActivityIframe
     * @Description 打开发起活动页面
     * @param @return 
     * @return String
     * @Date 2018年3月24日
     */
    @RequestMapping(value = "/openStartActivityIframe",method = RequestMethod.GET)
    public String openStartActivityIframe(){
    	  return "back/startActivity";
    }
    /**
     * 
     * @Title:openHistoryActivityIframe
     * @Description  打开历史活动页面
     * @param @return 
     * @return String
     * @Date 2018年3月24日
     */
    @RequestMapping(value = "/openHistoryActivityIframe",method = RequestMethod.GET)
    public String openHistoryActivityIframe(){
    	  return "back/historyActivity";
    }
    /**
     * 
     * @Title:announceNews
     * @Description 新闻发布
     * @param @return 
     * @return String
     * @Date 2018年3月23日
     */
    @RequestMapping(value = "/announceNews",method = RequestMethod.GET)
    public String announceNews(){
    	  return "back/announceNews";
    }
    /**
     * 
     * @Title:openCommonUserBarIframe
     * @Description 打开成员分布窗体
     * @param @return 
     * @return String
     * @Date 2018年3月20日
     */
    @RequestMapping(value = "/openCommonUserBarIframe",method = RequestMethod.GET)
    public String openCommonUserBarIframe(){
    	  return "back/commonUserBar";
    }
    /**
     * 
     * @Title:openEditGoodsWin
     * @Description 打开物资编辑窗体
     * @param @return 
     * @return String
     * @Date 2018年3月22日
     */
    @RequestMapping(value = "/openEditGoodsWin",method = RequestMethod.GET)
    public String openEditGoodsWin(){
    	  return "back/editGoods";
    }
    /**
     * 
     * @Title:openEditGoodsWin
     * @Description 打开新闻管理主页
     * @param @return 
     * @return String
     * @Date 2018年3月22日
     */
    @RequestMapping(value = "/opeNewsIframe",method = RequestMethod.GET)
    public String opeNewsIframe(){
    	  return "back/newsAddIndex";
    }
    /**
     * 
     * @Title:opeGoodsIframe
     * @Description 打开物资管理窗体
     * @param @return 
     * @return String
     * @Date 2018年3月22日
     */
    @RequestMapping(value = "/opeGoodsIframe",method = RequestMethod.GET)
    public String opeGoodsIframe(){
        return "back/goods";
    }
    /**
     * 
     * @Title:openAddGoodsWin
     * @Description  打开新增物资弹窗
     * @param @return 
     * @return String
     * @Date 2018年3月22日
     */
    @RequestMapping(value = "/openAddGoodsWin",method = RequestMethod.GET)
    public String openAddGoodsWin(){
    	  return "back/addGoods";
    }
    /**
     * 
     * @Title:openMasterInfo
     * @Description  打开个人信息窗体
     * @param @return 
     * @return String
     * @Date 2018年4月5日
     */
    @RequestMapping(value = "/openMasterInfo",method = RequestMethod.GET)
    public String openMasterInfo(){
    	  return "back/masterInfo";
    }
    //openRePwd
    /**
     * 
     * @Title:openRePwd
     * @Description 打开修改面窗口
     * @param @return 
     * @return String
     * @Date 2018年4月5日
     */
    @RequestMapping(value = "/openRePwd",method = RequestMethod.GET)
    public String openRePwd(){
    	  return "back/administrator/rePwd";
    }
    /**
     * 
     * @Title:openMasterFirst
     * @Description 社长后台首页
     * @param @return 
     * @return String
     * @Date 2018年4月5日
     */
    @RequestMapping(value = "/openMasterFirst",method = RequestMethod.GET)
    public String openMasterFirst(){
    	  return "back/firstMaster";
    }
       
    /**
     * 
     * @Title:getCommonUserInfo
     * @Description   查询成员信息
     * @param @param req
     * @param @throws Exception 
     * @return Map
     * @Date 2018年3月16日
     */
    @RequestMapping(value = "/getCommonUserInfo",method = RequestMethod.GET)
    @ResponseBody
    public Map  getCommonUserInfo(HttpServletRequest req) throws Exception{
    	//返回查询数据Map
    	Map map1 = new HashMap();
    	//查询参数Map
    	Map map =  new HashMap();
    	//得到session
    	HttpSession session  = req.getSession();
    	//当前页数
    	map.put("page", req.getParameter("page"));
    	//每一页的记录条数
    	map.put("limit", req.getParameter("limit"));
    	//当前社团ID
    	map.put("association_id", (String)session.getAttribute("association_id"));
    	//调用Mapper接口查询成员信息
    	List list  = backService.getCommonUserInfo(map);
    	//查询成员数量，用于前台显示记录总数
    	String count  = backService.getCommonUserCount(map);
    	//200表示查询成功
    	map1.put("status", 200);
		map1.put("code", 0);
		map1.put("msg", "查询成功");
		//记录总数
		map1.put("count",count);
		//成员信息
		map1.put("data", list);
		//返回查询数据
		return map1;
    
    }
    /**
     * 
     * @Title:getAllNewsInfo
     * @Description 获取所有系新闻列表
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return Map
     * @Date 2018年3月22日
     */
    @RequestMapping(value = "/getAllNewsInfo",method = RequestMethod.GET)
    @ResponseBody
    public Map  getAllNewsInfo(HttpServletRequest req) throws Exception{
    	Map map1 = new HashMap();
    	Map map =  new HashMap();
    	map.put("page", req.getParameter("page"));
    	map.put("limit", req.getParameter("limit"));
    	HttpSession session =  req.getSession();
    	map.put("association_id", (String)session.getAttribute("association_id"));
    	List list  = backMapper.getAllNewsInfo(map);
    	String count  = backMapper.getAllNewsCount(map);
    	map1.put("status", 200);
		map1.put("code", 0);
		map1.put("msg", "查询成功");
		map1.put("count",count);
		map1.put("data", list);
		return map1;
    
    }
    /**
     * 
     * @Title:getAllActivityInfo
     * @Description 查询所有活动信息
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return Map
     * @Date 2018年3月24日
     */
    @RequestMapping(value = "/getAllActivityInfo",method = RequestMethod.GET)
    @ResponseBody
    public Map  getAllActivityInfo(HttpServletRequest req) throws Exception{
    	Map map1 = new HashMap();
    	Map map =  new HashMap();
    	map.put("page", req.getParameter("page"));
    	map.put("limit", req.getParameter("limit"));
    	HttpSession session =  req.getSession();
    	map.put("association_id", (String)session.getAttribute("association_id"));
    	List list  = backMapper.getAllActivityInfo(map);
    	String count  = backMapper.getAllActivityCount(map);
    	map1.put("status", 200);
		map1.put("code", 0);
		map1.put("msg", "查询成功");
		map1.put("count",count);
		map1.put("data", list);
		return map1;
    
    }
    /**
     * 
     * @Title:getSelectNewsInfo
     * @Description  新闻下拉选---------查询
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return Map
     * @Date 2018年3月22日
     */
    @RequestMapping(value = "/getSelectNewsInfo",method = RequestMethod.GET)
    @ResponseBody
    public Map  getSelectNesInfo(HttpServletRequest req) throws Exception{
    	Map map1 = new HashMap();
    	Map map =  new HashMap();
    	map.put("check_flag", req.getParameter("check_flag"));
    	map.put("page", req.getParameter("page"));
    	map.put("limit", req.getParameter("limit"));
    	HttpSession session =  req.getSession();
    	map.put("association_id", (String)session.getAttribute("association_id"));
    	List list  = backMapper.getSelectNewsInfo(map);
    	String count  = backMapper.getSelectNewsCount(map);
    	map1.put("status", 200);
		map1.put("code", 0);
		map1.put("msg", "查询成功");
		map1.put("count",count);
		map1.put("data", list);
		return map1;
    
    }
    /**
     * 
     * @Title:getSelectActivityInfo
     * @Description   活动下拉选----------查询
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return Map
     * @Date 2018年3月24日
     */
    @RequestMapping(value = "/getSelectActivityInfo",method = RequestMethod.GET)
    @ResponseBody
    public Map  getSelectActivityInfo(HttpServletRequest req) throws Exception{
    	Map map1 = new HashMap();
    	Map map =  new HashMap();
    	map.put("activity_state", req.getParameter("activity_state"));
    	map.put("activity_theme", new String(req.getParameter("searchWord").getBytes("iso-8859-1"), "utf-8"));
    	map.put("page", req.getParameter("page"));
    	map.put("limit", req.getParameter("limit"));
    	HttpSession session =  req.getSession();
    	map.put("association_id", (String)session.getAttribute("association_id"));
    	List list  = backMapper.getSelectActivityInfo(map);
    	String count  = backMapper.getSelectActivityCount(map);
    	map1.put("status", 200);
		map1.put("code", 0);
		map1.put("msg", "查询成功");
		map1.put("count",count);
		map1.put("data", list);
		return map1;
    
    }
    /**
     * 
     * @Title:getVerifyCommonUserInfo
     * @Description 未通过审核人员信息查询
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return Map
     * @Date 2018年3月20日
     */
    @RequestMapping(value = "/getVerifyCommonUserInfo",method = RequestMethod.GET)
    @ResponseBody
    public Map  getVerifyCommonUserInfo(HttpServletRequest req) throws Exception{
    	Map map1 = new HashMap();
    	Map map =  new HashMap();
    	map.put("page", req.getParameter("page"));
    	map.put("limit", req.getParameter("limit"));
    	HttpSession session =  req.getSession();
    	map.put("association_id", (String)session.getAttribute("association_id"));
    	//map.put("searchWord", "dasdas");
    	List list  = backMapper.getVerifyCommonUserInfo(map);
    	String count  = backMapper.getVerifyCommonUserCount(map);
    	map1.put("status", 200);
		map1.put("code", 0);
		map1.put("msg", "查询成功");
		map1.put("count",count);
		map1.put("data", list);
		return map1;
    
    }
    
    /**
     * 
     * @Title:findGivenUser
     * @Description  搜索框查询通过审核普通会员
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return Map
     * @Date 2018年3月16日
     */
    @RequestMapping(value = "/findGivenUser",method = RequestMethod.GET)
    @ResponseBody
    public Map  findGivenUser(HttpServletRequest req) throws Exception{
    	Map map1 = new HashMap();
    	HttpSession session = req.getSession();
    	String association_id = (String) session.getAttribute("association_id");
    	String searchWord =req.getParameter("searchWord");
    	searchWord = new String(req.getParameter("searchWord").getBytes("iso-8859-1"), "utf-8");
    	Map parameterMap =  new HashMap();
    	parameterMap.put("page", req.getParameter("page"));
    	parameterMap.put("limit", req.getParameter("limit"));
    	parameterMap.put("searchWord", searchWord);
    	parameterMap.put("association_id", association_id);
    	List list  = backMapper.getGivenUser(parameterMap);
    	String count  =backMapper.getGivenUserCount(parameterMap);
    	map1.put("status", 200);
		map1.put("code", 0);
		map1.put("msg", "查询成功");
		map1.put("count",count);
		map1.put("data", list);
		return map1;
    	
    }
    /**
     * 
     * @Title:searchNewInfo1
     * @Description  查询新闻信息1
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return Map
     * @Date 2018年3月22日
     */
    @RequestMapping(value = "/searchNewInfo1",method = RequestMethod.GET)
    @ResponseBody
    public Map  searchNewInfo1(HttpServletRequest req) throws Exception{
    	Map map1 = new HashMap();
    	HttpSession session = req.getSession();
    	String association_id = (String) session.getAttribute("association_id");
    	String check_flag =req.getParameter("check_flag");
    	String news_title =req.getParameter("news_title");
    	news_title = new String(req.getParameter("news_title").getBytes("iso-8859-1"), "utf-8");
    	Map parameterMap =  new HashMap();
    	parameterMap.put("page", req.getParameter("page"));
    	parameterMap.put("limit", req.getParameter("limit"));
    	parameterMap.put("news_title", news_title);
    	parameterMap.put("check_flag", check_flag);
    	parameterMap.put("association_id", association_id);
    	List list  = backMapper.searchNewInfo1(parameterMap);
    	String count  =backMapper.searchNewCount1(parameterMap);
    	map1.put("status", 200);
		map1.put("code", 0);
		map1.put("msg", "查询成功");
		map1.put("count",count);
		map1.put("data", list);
		return map1;
    	
    }
    /**
     * 
     * @Title:searchNewInfo1
     * @Description 查询新闻信息2
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return Map
     * @Date 2018年3月22日
     */
    @RequestMapping(value = "/searchNewInfo2",method = RequestMethod.GET)
    @ResponseBody
    public Map  searchNewInfo2(HttpServletRequest req) throws Exception{
    	Map map1 = new HashMap();
    	HttpSession session = req.getSession();
    	String association_id = (String) session.getAttribute("association_id");
    	String news_title =req.getParameter("news_title");
    	news_title = new String(req.getParameter("news_title").getBytes("iso-8859-1"), "utf-8");
    	Map parameterMap =  new HashMap();
    	parameterMap.put("page", req.getParameter("page"));
    	parameterMap.put("limit", req.getParameter("limit"));
    	parameterMap.put("news_title", news_title);
    	parameterMap.put("association_id", association_id);
    	List list  = backMapper.searchNewInfo2(parameterMap);
    	String count  =backMapper.searchNewCount2(parameterMap);
    	map1.put("status", 200);
		map1.put("code", 0);
		map1.put("msg", "查询成功");
		map1.put("count",count);
		map1.put("data", list);
		return map1;
    	
    }
    /**
     * 
     * @Title:findVerifyGivenUser
     * @Description  搜索框查询未通过审核会员信息
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return Map
     * @Date 2018年3月20日
     */
    @RequestMapping(value = "/findVerifyGivenUser",method = RequestMethod.GET)
    @ResponseBody
    public Map  findVerifyGivenUser(HttpServletRequest req) throws Exception{
    	Map map1 = new HashMap();
    	HttpSession session = req.getSession();
    	String association_id = (String) session.getAttribute("association_id");
    	String searchWord =req.getParameter("searchWord");
    	searchWord = new String(req.getParameter("searchWord").getBytes("iso-8859-1"), "utf-8");
    	Map parameterMap =  new HashMap();
    	parameterMap.put("page", req.getParameter("page"));
    	parameterMap.put("limit", req.getParameter("limit"));
    	parameterMap.put("searchWord", searchWord);
    	parameterMap.put("association_id", association_id);
    	List list  = backMapper.getVerifyGivenUser(parameterMap);
    	String count  =backMapper.getVerifyGivenUserCount(parameterMap);
    	map1.put("status", 200);
		map1.put("code", 0);
		map1.put("msg", "查询成功");
		map1.put("count",count);
		map1.put("data", list);
		return map1;
    	
    }
    /**
     * 
     * @Title:delCommonUser
     * @Description  删除会员信息
     * @param @param map
     * @param @return
     * @param @throws Exception 
     * @return String
     * @Date 2018年3月16日
     */
    @RequestMapping(value = "/delCommonUser",method = RequestMethod.POST)
    @ResponseBody
    public int  delCommonUser(@RequestBody Map<String,String> map) throws Exception{
		return  backMapper.delCommonUser(map);  	
    }
    /**
     * 
     * @Title:delGoods
     * @Description 单个删除物资
     * @param @param map
     * @param @return
     * @param @throws Exception 
     * @return int
     * @Date 2018年3月22日
     */
    @RequestMapping(value = "/delGoods",method = RequestMethod.POST)
    @ResponseBody
    public int  delGoods(@RequestBody Map<String,String> map) throws Exception{
    	return  backMapper.delGoods(map);
    }
    
    /**
     * 
     * @Title:delBatchCommonUsser
     * @Description  批量删除普通用户信息
     * @param @param list
     * @param @return
     * @param @throws Exception 
     * @return int
     * @Date 2018年3月17日
     */
    @RequestMapping(value = "/delBatchCommonUser",method = RequestMethod.POST)
    @ResponseBody
    public String  delBatchCommonUser( @RequestBody   List<Map<String,String>> list) throws Exception{
    		return  backService.delBatchCommonUser(list);
    }
    /**
     * 
     * @Title:delBatchGoods
     * @Description 批量删除物资
     * @param @param list
     * @param @return
     * @param @throws Exception 
     * @return String
     * @Date 2018年3月22日
     */
    @RequestMapping(value = "/delBatchGoods",method = RequestMethod.POST)
    @ResponseBody
    public String  delBatchGoods( @RequestBody   List<Map<String,String>> list) throws Exception{
    		return  backService.delBatchGoods(list);
    }
    /**
     * 
     * @Title:checkCommonStudentNumber
     * @Description  校验学号
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return String
     * @Date 2018年3月18日
     */
    @RequestMapping(value = "/checkCommonStudentNumber",method = RequestMethod.POST)
    @ResponseBody
    public String  checkCommonStudentNumber(HttpServletRequest req ) throws Exception{
    	String stuident_id = req.getParameter("STUDENT_ID");
    	Map map  = new HashMap();
    	map.put("student_id", stuident_id);
    	map.put("association_id", req.getParameter("association_id"));
    	String count =backMapper.checkStudetId(map);
    	return count;
    	
    }
    /**
     * 
     * @Title:getSelectData
     * @Description 获取新增用户学院下拉选
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return List
     * @Date 2018年3月18日
     */
    @RequestMapping(value = "/getSelectData",method = RequestMethod.POST)
    @ResponseBody
    public List  getSelectData(HttpServletRequest req ) throws Exception{
    	return backMapper.getSelectData();   	
    }
    /**
     * 
     * @Title:getAssociationId
     * @Description  获取协会ID
     * @param @return
     * @param @throws Exception 
     * @return String
     * @Date 2018年3月18日
     */
    @RequestMapping(value = "/getAssociationId",method = RequestMethod.POST)
    @ResponseBody
    public String  getAssociationId(HttpServletRequest req) throws Exception{
    	HttpSession session  = req.getSession();
		return (String) session.getAttribute("association_id");
    
    }
    /**
     * 
     * @Title:upLoadPic
     * @Description 头像上传
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return String
     * @Date 2018年3月18日
     */
    @RequestMapping(value = "/upLoadPic",method = RequestMethod.POST)
    @ResponseBody
    public Map  upLoadPic(MultipartFile file,HttpServletRequest req) throws Exception{ 
    	Map map = new HashMap();
    	//头像存在磁盘中的路径
    	String path = "E:\\bysj\\imgs";
    	//获得头像的原始名字
        String fileName = file.getOriginalFilename(); 
        //头像存在服务器中完整路径
        String fullPath;
        //存放在磁盘中的名字
        String dirName;
        //用于生成图片存盘的文件名
        String uuid = UUID.randomUUID().toString(); 
        String picSuffix [] = fileName.split("\\.");
        //拼接文件名
        dirName = uuid+"."+picSuffix[picSuffix.length-1];
        //创建文件
        File dir = new File(path, dirName);  
        //当文件目录不存在时，创建目录
        if(!dir.exists()){  
            dir.mkdirs();  
        }  
        //Mu1ltipartFile自带的解析方法  
        file.transferTo(dir);
        fullPath = path+"\\"+dirName;
        //用于头像回显
        map.put("dirName",fullPath);
		return map;   	
    }
    /**
     * 
     * @Title:upLoadFiles
     * @Description  多文件上传
     * @param @param file
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return Map
     * @Date 2018年3月23日
     */
    @RequestMapping(value = "/upLoadFiles",method = RequestMethod.POST)
    @ResponseBody
    public Map  upLoadFiles(MultipartFile[] file,HttpServletRequest req) throws Exception{
    	HttpSession session  = req.getSession();

    
    	Map map = new HashMap();
    	Map  prameterMap = new HashMap();
    	String path = "E:\\bysj\\files";
        String fileName = file[0].getOriginalFilename(); 
        String fullPath;
        //存放在磁盘中的名字
        String dirName;
        //用于生成图片存盘的文件名
        String uuid = UUID.randomUUID().toString();  
        String picSuffix [] = fileName.split("\\.");
        dirName = uuid+"."+picSuffix[picSuffix.length-1];
        File dir = new File(path, dirName);  
        if(!dir.exists()){  
            dir.mkdirs();  
        }  
//      Mu1ltipartFile自带的解析方法  
        file[0].transferTo(dir);
        fullPath = path+"\\"+dirName;
 
        prameterMap.put("file_name", file[0].getOriginalFilename());
        prameterMap.put("file_url", fullPath);
        prameterMap.put("parent_id", req.getParameter("id"));
        backService.insertFiles(prameterMap);
        map.put("code", "1");
        map.put("parent_id", req.getParameter("id"));
		return map;   
    		
    }
    /**
     * 
     * @Title:addCommonUser
     * @Description 新增普通用户
     * @param @param map
     * @param @return
     * @param @throws Exception 
     * @return String
     * @Date 2018年3月19日
     */
    @RequestMapping(value = "/editCommonUser",method = RequestMethod.POST)
    @ResponseBody
    public String  editCommonUser(@RequestBody Map<String,String> map) throws Exception{
    	return backService.editCommonUser(map);    	
    }
    /**
     * 
     * @Title:editGoods
     * @Description 编辑物资
     * @param @param map
     * @param @return
     * @param @throws Exception 
     * @return String
     * @Date 2018年3月22日
     */
    @RequestMapping(value = "/editGoods",method = RequestMethod.POST)
    @ResponseBody
    public String  editGoods(@RequestBody Map<String,String> map) throws Exception{
    	return backService.editGoods(map);    	
    }
    /**
     * 
     * @Title:addCommonUser
     * @Description 新增用户
     * @param @param map
     * @param @return
     * @param @throws Exception 
     * @return String
     * @Date 2018年3月20日
     */
    @RequestMapping(value = "/addCommonUser",method = RequestMethod.POST)
    @ResponseBody
    public String  addCommonUser(@RequestBody Map<String,String> map) throws Exception{
    	return backService.addCommonUser(map);    	
    }
    /**
     * 
     * @Title:addGoods
     * @Description 物资录入
     * @param @param map
     * @param @return
     * @param @throws Exception 
     * @return String
     * @Date 2018年3月22日
     */
    @RequestMapping(value = "/addGoods",method = RequestMethod.POST)
    @ResponseBody
    public String  addGoods(@RequestBody Map<String,String> map) throws Exception{   		
    	return backService.addGoods(map); 	
    }
    /**
     * 
     * @Title:updateValidFlag
     * @Description   更新用户为有效  validflag->0
     * @param @return
     * @param @throws Exception 
     * @return String
     * @Date 2018年3月20日
     */
    @RequestMapping(value = "/updateValidFlag",method = RequestMethod.GET)
    @ResponseBody
    public String  updateValidFlag(HttpServletRequest req) throws Exception{
    	Map map =  new HashMap();    	
    	HttpSession session = req.getSession();
       	String association_id = (String) session.getAttribute("association_id");
    	map.put("student_id",  new String(req.getParameter("student_id").getBytes("iso-8859-1"), "utf-8"));
    	map.put("association_id", association_id);
    	return backService.updateValidFlag(map);
    }
    /**
     * 
     * @Title:getCommonUserBarData
     * @Description  普通用户柱状图
     * @param @return
     * @param @throws Exception 
     * @return String
     * @Date 2018年3月20日
     */
    @RequestMapping(value = "/getCommonUserBarData",method = RequestMethod.POST)
    @ResponseBody
    public List  getCommonUserBarData(HttpServletRequest req) throws Exception{
    	HttpSession session = req.getSession();
       	String association_id = (String) session.getAttribute("association_id");
    	return backMapper.getCommonUserBarData(association_id);

    			
    }
    /**
     * 
     * @Title:updateBatchValidFlag
     * @Description 批量 通过用户
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return String
     * @Date 2018年3月20日
     */
    @RequestMapping(value = "/updateBatchValidFlag",method = RequestMethod.POST)
    @ResponseBody
    public String  updateBatchValidFlag( @RequestBody  List<Map<String,String>> list) throws Exception{   	
    	return backService.updateBatchValidFlag(list);	
    }
    /**
     * 
     * @Title:getImg
     * @Description 获得头像
     * @param @param req
     * @param @param response
     * @param @throws Exception 
     * @return void
     * @Date 2018年3月20日
     */
    @RequestMapping(value = "/getImg",method = RequestMethod.GET)
    @ResponseBody
    public void  getImg(HttpServletRequest req,HttpServletResponse response) throws Exception{    	
    	  String fileUrl=req.getParameter("imgurl");
          try {  
              File filePath = new File(fileUrl);  
              if(filePath.exists()){  
                  //读图片  
                  FileInputStream inputStream = new FileInputStream(filePath);    
                  int available = inputStream.available();  
                  byte[] data = new byte[available];  
                  inputStream.read(data);    
                  inputStream.close();    
				//写图片  
                  response.setContentType("image/"+"png");    
                  response.setCharacterEncoding("UTF-8");  
                  OutputStream stream = new BufferedOutputStream(response.getOutputStream());    
                  stream.write(data);    
                  stream.flush();    
                  stream.close();    
              }  
          } catch (Exception e) {  
              e.printStackTrace();  
          }   
    	
    }
    /**
     * 
     * @Title:getGoodsInfo
     * @Description 物资信息查询
     * @param @return
     * @param @throws Exception 
     * @return String
     * @Date 2018年3月22日
     */
    @RequestMapping(value = "/getGoodsInfo",method = RequestMethod.GET)
    @ResponseBody
    public Map  getGoodsInfo(HttpServletRequest req) throws Exception{
    	Map map1 = new HashMap();
    	Map map =  new HashMap();
    	map.put("page", req.getParameter("page"));
    	map.put("limit", req.getParameter("limit"));
    	HttpSession session = req.getSession();
    	map.put("association_id",(String)session.getAttribute("association_id"));
    	List list  = backMapper.getGoodsInfo(map);
    	String count  = backMapper.getGoodsCount(map);
    	map1.put("status", 200);
		map1.put("code", 0);
		map1.put("msg", "查询成功");
		map1.put("count",count);
		map1.put("data", list);
		return map1;
    
    }
    /**
     * r
     * @Title:reportNews
     * @Description  发布新闻
     * @param @param list
     * @param @return
     * @param @throws Exception 
     * @return String
     * @Date 2018年3月23日
     */
    @RequestMapping(value = "/reportNews",method = RequestMethod.GET)
    @ResponseBody
    public String  reportNews(HttpServletRequest req) throws Exception{ 
    	Map map = new HashMap();
    	HttpSession session  = req.getSession();
    	String association_id = (String)session.getAttribute("association_id");    	
    	String news_title = new String(req.getParameter("news_title").getBytes("iso-8859-1"), "utf-8");
    	String news_content = new String(req.getParameter("news_content").getBytes("iso-8859-1"), "utf-8");
    	map.put("news_title", news_title);
    	map.put("news_content", news_content);
    	map.put("news_id", req.getParameter("news_id")); 	
    	map.put("association_id", association_id);
      	map.put("news_type", req.getParameter("news_type"));
    	map.put("news_writer", session.getAttribute("realname"));
    	try{
    		backService.reportNews(map);  
		}catch(Exception e){
			return "0";
		}   	
		return "1";
    	
    }
    /**
     * 
     * @Title:addActivity
     * @Description 发起活动
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return String
     * @Date 2018年3月24日
     */
    @RequestMapping(value = "/addActivity",method = RequestMethod.GET)
    @ResponseBody
    public String  addActivity(HttpServletRequest req) throws Exception{
    	Map map = new HashMap();
    	HttpSession session  = req.getSession();
    	String association_id = (String)session.getAttribute("association_id");
    	map.put("association_id", association_id);
    	map.put("activity_theme", new String(req.getParameter("activity_theme").getBytes("iso-8859-1"), "utf-8"));
    	map.put("activity_time", new String(req.getParameter("activity_time").getBytes("iso-8859-1"), "utf-8"));
    	map.put("activity_place", new String(req.getParameter("activity_place").getBytes("iso-8859-1"), "utf-8"));
    	map.put("activity_master_name", new String(req.getParameter("activity_master_name").getBytes("iso-8859-1"), "utf-8"));
    	map.put("activity_master_phone", new String(req.getParameter("activity_master_phone").getBytes("iso-8859-1"), "utf-8"));
    	map.put("activity_content", new String(req.getParameter("activity_content").getBytes("iso-8859-1"), "utf-8"));
    	try{
    		backService.addActivity(map);
		}catch(Exception e){
			return "0";
		}  
    	return "1";
    	
    }

    /**
     * 
     * @Title:delNews
     * @Description 删除新闻
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return int
     * @Date 2018年3月23日
     */
    @RequestMapping(value = "/delNews",method = RequestMethod.POST)
    @ResponseBody
    public String  delNews(HttpServletRequest req ) throws Exception{
    	 return  backService.delNews(req.getParameter("news_id"));

    }
    /**
     * 
     * @Title:delActivity
     * @Description 删除活动
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return String
     * @Date 2018年4月5日
     */
    @RequestMapping(value = "/delActivity",method = RequestMethod.POST)
    @ResponseBody
    public String  delActivity(HttpServletRequest req ) throws Exception{  	
    	 return  backService.delActivity(req.getParameter("activity_id"));		
    }
    /**
     * 
     * @Title:findGivenGoods
     * @Description 搜索框查找物资
     * @param @param req
     * @param @return
     * @param @throws Exception 
     * @return Map
     * @Date 2018年5月29日
     */
    @RequestMapping(value = "/findGivenGoods",method = RequestMethod.GET)
    @ResponseBody
    public Map  findGivenGoods(HttpServletRequest req) throws Exception{
    	Map map1 = new HashMap();
    	HttpSession session = req.getSession();
    	String association_id = (String) session.getAttribute("association_id");
    	String searchWord =req.getParameter("searchWord");
    	searchWord = new String(req.getParameter("searchWord").getBytes("iso-8859-1"), "utf-8");
    	Map parameterMap =  new HashMap();
    	parameterMap.put("page", req.getParameter("page"));
    	parameterMap.put("limit", req.getParameter("limit"));
    	parameterMap.put("searchWord", searchWord);
    	parameterMap.put("association_id", association_id);
    	List list  = backMapper.getGivenGoods(parameterMap);
    	String count  =backMapper.getGivenGoodsCount(parameterMap);
    	map1.put("status", 200);
		map1.put("code", 0);
		map1.put("msg", "查询成功");
		map1.put("count",count);
		map1.put("data", list);
		return map1;
    	
    }
     
}
