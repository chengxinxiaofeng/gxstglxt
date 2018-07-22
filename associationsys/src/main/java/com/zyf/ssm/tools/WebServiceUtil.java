package com.zyf.ssm.tools;
import java.io.FileInputStream;
import java.util.Properties;
/**
 * 
 * @ClassName WebServiceUtil
 * @Description TODO  获取配置文件种公开url——做登录拦截
 * @Date 2018年3月20日
 */
public class WebServiceUtil {
    private static WebServiceUtil webServiceUtil = null;
    public static WebServiceUtil getInstance() {
        if(webServiceUtil == null) {
            synchronized(WebServiceUtil.class) {
                if(webServiceUtil == null) {
                    webServiceUtil = new WebServiceUtil();
                }
            }
        }
        return webServiceUtil;
    }

    /**
     * 获取webservice配置对象
     * @return
     */
    public static WebServiceBean getWebService() {
        WebServiceBean webServiceBean = new WebServiceBean();
        String path = WebServiceUtil.class.getClassLoader().getResource("open-url.properties").getPath();
        try {
            FileInputStream in = new FileInputStream(path);
            Properties prop = new Properties();
            prop.load(in);
            webServiceBean.setWsdlUrl(prop.getProperty("url"));
       /*     webServiceBean.setSystemKey(prop.getProperty("systemKey"));
            webServiceBean.setNameSpace(prop.getProperty("nameSpace"))*/;
            in.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return webServiceBean;
    }
}
