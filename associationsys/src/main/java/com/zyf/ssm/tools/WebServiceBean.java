package com.zyf.ssm.tools;

import java.io.Serializable;
/**
 * 
 * @ClassName WebServiceBean
 * @Description TODO  获取公开URL配置文件信息Bean
 * @Date 2018年3月20日
 */
public class WebServiceBean implements Serializable {

    public String wsdlUrl;
    public String systemKey;
    public String nameSpace;

    public String getWsdlUrl() {
        return wsdlUrl;
    }

    public void setWsdlUrl(String wsdlUrl) {
        this.wsdlUrl = wsdlUrl;
    }

    public String getSystemKey() {
        return systemKey;
    }

    public void setSystemKey(String systemKey) {
        this.systemKey = systemKey;
    }

    public String getNameSpace() {
        return nameSpace;
    }

    public void setNameSpace(String nameSpace) {
        this.nameSpace = nameSpace;
    }
}
