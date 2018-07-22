package com.zyf.ssm.controller;


  
import java.awt.Color;  
import java.awt.Font;  
import java.awt.Graphics2D;  
import java.awt.image.BufferedImage;  
import java.io.IOException;  
import java.util.Random;  
  

import javax.imageio.ImageIO;  
import javax.servlet.ServletException;  
import javax.servlet.ServletOutputStream;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  
  

import org.springframework.context.annotation.Scope;  
import org.springframework.stereotype.Controller;  
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;  
import org.springframework.web.bind.annotation.ResponseBody;  
/**
 * 
 * @ClassName SignCodeController
 * @Description 验证码生成类
 * @Date 2018年3月11日
 */
@Controller   
@RequestMapping("/adminLogin")  
public class SignCodeController {  
  
    /** 检查验证码 
     * 用户登录的时候避免暴力破解加上图片验证码 
     * @param request 
     * @param signcode 传入的验证码 
     * @return true 验证通过，输入的验证码和生成的一致 
     *         false 验证不过，输入的验证码和后台生成的不一致 
     * @see [类、类#方法、类#成员] 
     */  
   /* @RequestMapping("/check")  
    @ResponseBody  
    public boolean checkSignCode(HttpServletRequest request,String signcode)  
    {  
        HttpSession session = request.getSession();  
        String signcodeSession=(String)session.getAttribute("signcode");  
          
        if(StringTools.isNull(signcode))  
        {  
            return false;  
        }  
          
        if(StringTools.isNull(signcodeSession))  
        {  
            return false;  
        }  
          
        //验证的时候不区分大小写  
        signcode=signcode.toUpperCase();  
        signcodeSession=signcodeSession.toUpperCase();  
        if(signcode.equals(signcodeSession))  
        {  
            return true;  
        }  
        return false;  
    }  */
      
/**
 * 
 * @Title:imgcheck
 * @Description  生成验证码 ,生成验证码直接从内存中写入输出流；,图片文件不存盘 
 * @param @return 
 * @return String
 * @Date 2018年3月11日
 */
    @RequestMapping(value = "/imgcheck",method = RequestMethod.GET)
    public String imgcheck(){
        return "items/imgCheck";
    }
    @RequestMapping(value = "/get", method = RequestMethod.GET)  
    public void service(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
        // 验证码图片的宽度。  
        int width = 70;  
        // 验证码图片的高度。  
        int height = 30;  
        BufferedImage buffImg = new BufferedImage(width, height,  
                BufferedImage.TYPE_INT_RGB);  
        Graphics2D g = buffImg.createGraphics();  
  
        // 创建一个随机数生成器类。  
        Random random = new Random();  
  
        // 设定图像背景色(因为是做背景，所以偏淡)  
        g.setColor(getRandColor(200, 250));  
        g.fillRect(0, 0, width, height);  
        // 创建字体，字体的大小应该根据图片的高度来定。  
        //Font font = new Font("Times New Roman", Font.HANGING_BASELINE, 28);  
        Font font = new Font("Arial", Font.HANGING_BASELINE, 28);  
        // 设置字体。  
        g.setFont(font);  
  
        // 画边框。  
        g.setColor(Color.BLACK);  
        g.drawRect(0, 0, width - 1, height - 1);  
        // 随机产生155条干扰线，使图象中的认证码不易被其它程序探测到。  
        g.setColor(getRandColor(160, 200));  
        for (int i = 0; i < 155; i++) {  
            int x = random.nextInt(width);  
            int y = random.nextInt(height);  
            int xl = random.nextInt(12);  
            int yl = random.nextInt(12);  
            g.drawLine(x, y, x + xl, y + yl);  
        }  
  
        // randomCode用于保存随机产生的验证码，以便用户登录后进行验证。  
        StringBuffer randomCode = new StringBuffer();  
  
        // 设置默认生成4个验证码  
        int length = 4;  
        // 设置备选验证码:包括"a-z"和数字"0-9"  
        String base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";  
  
        int size = base.length();  
  
        // 随机产生4位数字的验证码。  
        for (int i = 0; i < length; i++) {  
            // 得到随机产生的验证码数字。  
            int start = random.nextInt(size);  
            String strRand = base.substring(start, start + 1);  
              
            // 调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成  
            g.setColor(new Color(20 + random.nextInt(110), 20 + random  
                    .nextInt(110), 20 + random.nextInt(110)));  
  
            g.drawString(strRand, 15 * i + 6, 24);  
  
            // 将产生的四个随机数组合在一起。  
            randomCode.append(strRand);  
        }  
  
        // 将四位数字的验证码保存到Session中。  
        HttpSession session = request.getSession();  
        session.setAttribute("signcode", randomCode.toString());    
        // 图象生效  
        g.dispose();   
        // 禁止图像缓存。  
        response.setHeader("Pragma", "no-cache");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setDateHeader("Expires", 0);  
        response.setContentType("image/jpeg");  
  
        // 将图像输出到Servlet输出流中。  
        ServletOutputStream sos = response.getOutputStream();  
        ImageIO.write(buffImg, "jpeg", sos);  
        sos.flush();  
        sos.close();  
  
    }  
  
    // 给定范围获得随机颜色  
    Color getRandColor(int fc, int bc) {  
        Random random = new Random();  
        if (fc > 255) {  
            fc = 255;  
        }  
  
        if (bc > 255) {  
            bc = 255;  
        }  
  
        int r = fc + random.nextInt(bc - fc);  
        int g = fc + random.nextInt(bc - fc);  
        int b = fc + random.nextInt(bc - fc);  
        return new Color(r, g, b);  
    }  
  
}  