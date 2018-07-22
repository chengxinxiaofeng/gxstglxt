/**
 * 
 */
package com.zyf.ssm.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zyf.ssm.mapper.BackMapper;
import com.zyf.ssm.mapper.IndexMapper;

/**
 * @ClassName IndexController
 * @Description 首页
 * @Date 2018年3月26日
 */
@Controller
@RequestMapping("/index")
public class IndexController {
	@Autowired
	private IndexMapper indexMapper ;
	/**
	 * 
	 * first
	 * @Description   打开首页
	 * @param @return 
	 * @return String
	 * @Date 2018年3月26日
	 */
    @RequestMapping(value = "/first",method = RequestMethod.GET)
    public String first(){
        return "front/index";
    }
    /**
     * 
     * @Title:openFirst
     * @Description 打开首页中的ifame
     * @param @return 
     * @return String
     * @Date 2018年3月26日
     */
    @RequestMapping(value = "/openFirst",method = RequestMethod.GET)
    public String openFirst(){
        return "front/index/first";
    }
    /**
     * 
     * @Title:fngetActivityData
     * @Description  获取活动信息
     * @param @return
     * @param @throws Exception 
     * @return String
     * @Date 2018年3月26日
     */
    @RequestMapping(value = "/getActivityData",method = RequestMethod.POST)
    @ResponseBody
    public List  getActivityData() throws Exception{
		return indexMapper.getActivityData(); 
    	
    }
    /**
     * 
     * @Title:getNoticeData
     * @Description  获取公告信息
     * @param @return
     * @param @throws Exception 
     * @return List
     * @Date 2018年3月26日
     */
    @RequestMapping(value = "/getNoticeData",method = RequestMethod.POST)
    @ResponseBody
    public List  getNoticeData() throws Exception{ 	
		return indexMapper.getNoticeData(); 
    	
    }
    @RequestMapping(value = "/getNewsData",method = RequestMethod.POST)
    @ResponseBody
    public List  getNewsData() throws Exception{	
		return indexMapper.getNewsData();
    	
    }
}
