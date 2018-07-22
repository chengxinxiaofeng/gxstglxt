package com.zyf.ssm.controller;


  
import java.awt.Color;  
import java.awt.Font;  
import java.awt.Graphics2D;  
import java.awt.image.BufferedImage;  
import java.io.IOException;  
import java.util.HashMap;
import java.util.Map;
import java.util.Random;  
  





import javax.imageio.ImageIO;  
import javax.servlet.ServletException;  
import javax.servlet.ServletOutputStream;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  
  





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;  
import org.springframework.stereotype.Controller;  
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;  
import org.springframework.web.bind.annotation.ResponseBody;  

import com.zyf.ssm.mapper.AdminMapper;
/**
 * 
 * @ClassName GetMyInfoController
 * @Description TODO 获取个人信息
 * @Date 2018年4月4日
 */
@Controller   
@RequestMapping("/common")  
public class GetMyInfoController {  
	@Autowired
	private AdminMapper adminMapper;
	/**
	 * 
	 * @Title:getMyInfo
	 * @Description  获取管理员和个人信息
	 * @param @return 
	 * @return String
	 * @Date 2018年4月4日
	 */
    @RequestMapping(value = "/getMyInfo",method = RequestMethod.GET)
    @ResponseBody
    public Map getMyInfo(HttpServletRequest req){
    	Map map = new HashMap();
       	HttpSession session =  req.getSession();   
       	map.put("associationInfoMap", adminMapper.getAssociationInfo((String)session.getAttribute("association_id")));
     	map.put("userInfoMap", (Map)session.getAttribute("userInfoMap"));
        return map;
    }

  
}  