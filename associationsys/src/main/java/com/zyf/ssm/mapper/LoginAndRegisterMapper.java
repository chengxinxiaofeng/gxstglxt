/**
 * 
 */
package com.zyf.ssm.mapper;

import java.util.List;
import java.util.Map;
/**
 * @ClassName LoginAndRegisterMapper
 * @Description TODO
 * @Date 2018年3月6日
 */
public interface LoginAndRegisterMapper {
	  List findRegisterPhone(Map map);
	  int updateFindPwd(Map map);
	  List userNameLogin(Map map);
	  Map qqLogin(Map map);
	  Map shortMsgLogin(String phoneNumber);
}
