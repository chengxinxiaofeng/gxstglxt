package com.zyf.ssm.controller;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zyf.ssm.mapper.ActivityMapper;
import com.zyf.ssm.mapper.AssociationMapper;
import com.zyf.ssm.service.AssociationService;

/**
 * 
 * @ClassName AssociationController
 * @Description TODO
 * @Date 2018年3月31日
 */
@Controller
@RequestMapping("/association")
public class AssociationController {
		@Autowired
		private AssociationService associationService ;
		@Autowired
		private AssociationMapper associationMapper ;
		/**
		 * 
		 * @Title:openAddAssociation
		 * @Description  打开社团申请页面
		 * @param @return 
		 * @return String
		 * @Date 2018年4月1日
		 */
		@RequestMapping(value = "/openAddAssociation",method = RequestMethod.GET)
	    public String openAddAssociation(){
	        return "front/association/addAssociation";
	    }
		/**
		 * 
		 * @Title:openSearchAssociation
		 * @Description 打开社团检索页面
		 * @param @return 
		 * @return String
		 * @Date 2018年4月1日
		 */
		@RequestMapping(value = "/openSearchAssociation",method = RequestMethod.GET)
	    public String openSearchAssociation(){
	        return "front/association/searchAssociationIndex";
	    }
		/**
		 * 
		 * @Title:openAddCommonUserWin
		 * @Description 打开加入社团页面
		 * @param @return 
		 * @return String
		 * @Date 2018年4月1日
		 */
		@RequestMapping(value = "/openAddCommonUserWin",method = RequestMethod.GET)
	    public String openAddCommonUserWin(){
	        return "front/association/applyJoinAssociaton";
	    }
		/**
		 * 
		 * @Title:upLoadFiles
		 * @Description  社团申请简介文件上传
		 * @param @param file
		 * @param @param req
		 * @param @return
		 * @param @throws Exception 
		 * @return Map
		 * @Date 2018年4月1日
		 */
		
		@RequestMapping(value = "/upLoadFiles",method = RequestMethod.POST)
		@ResponseBody
		public Map  upLoadFiles(MultipartFile file,HttpServletRequest req) throws Exception{
		    	HttpSession session  = req.getSession();		    
		    	Map map = new HashMap();
		    	Map  prameterMap = new HashMap(); 
		    	String path = "E:\\bysj\\files";
		        String fileName = file.getOriginalFilename(); 
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
		        //		      Mu1ltipartFile自带的解析方法  
		        file.transferTo(dir);
		        fullPath = path+"\\"+dirName;
		 
		        prameterMap.put("file_name", file.getOriginalFilename());
		        prameterMap.put("file_url", fullPath);
		        prameterMap.put("parent_id", uuid);
		        map.put("parent_id", uuid);
		        map.put("code", associationService.insertAssociationFile(prameterMap));
		      //  return associationService.insertAssociationFile(prameterMap);
		        return map;
		    		
		    }
			/**
			 * 
			 * @Title:addAssociation
			 * @Description  保存社团申请信息
			 * @param @param map
			 * @param @return
			 * @param @throws Exception 
			 * @return String
			 * @Date 2018年4月1日
			 */
			@RequestMapping(value = "/addAssociation",method = RequestMethod.POST)
		    @ResponseBody
		    public String  addAssociation(@RequestBody Map<String,String> map) throws Exception{
		    	//社团已存在？
		    	if(associationMapper.selectGivenAssociationCount(map.get("association_name"))!=0){
		    		return "0";
		    	//该社长已拥有一个社团且为社长
		    	}else if(associationMapper.selectGivenUserCount(map.get("student_id"))!=0){
		    		return "1";
		    	}
		    	//加入社团总数超过3个
		    	else if(associationMapper.selectGivenUserCount2(map.get("student_id"))>3){
		    		return "4";
		    	}
		    	return associationService.insertAssociationInfo(map);
				//return backService.addCommonUser(map);    	

		    }
			/**
			 * 
			 * @Title:getAllAssociationInfo
			 * @Description 查询所有社团信息
			 * @param @param req
			 * @param @return
			 * @param @throws Exception 
			 * @return Map
			 * @Date 2018年4月1日
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
				List list  = associationMapper.getAllAssociationInfo(map);
				String count = associationMapper.getAllAssociationCount(map);
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
			 * @Description 更改用户标识为1，改为无效
			 * @param @param req
			 * @param @return
			 * @param @throws Exception 
			 * @return Map
			 * @Date 2018年4月1日
			 */
			@RequestMapping(value = "/changeUserFlag",method = RequestMethod.GET)
			@ResponseBody
			public String   changeUserFlag(HttpServletRequest req) throws Exception{
				String student_id = new String(req.getParameter("student_id").getBytes("iso-8859-1"), "utf-8");
				String association_id = req.getParameter("association_id");
				Map map = new HashMap();
				map.put("student_id", student_id);
				map.put("association_id", association_id);
				try{
					associationMapper.changeUserFlag(map);
				}catch(Exception e){
					return "0";
				}
				return "1";
				
			}
		
			
}
