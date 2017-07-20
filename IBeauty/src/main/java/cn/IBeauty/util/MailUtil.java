package cn.IBeauty.util;

import java.util.UUID;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;


public class MailUtil {
	
	public static String sendEmail(String email) throws Exception{
		SimpleEmail mailUtil = new SimpleEmail();
        UUID a = UUID.randomUUID();
        mailUtil.setHostName("smtp.163.com");
		mailUtil.setAuthentication("18392427646@163.com", "lc6690536");
		mailUtil.setCharset("utf-8");
		mailUtil.addTo(email, String.valueOf(a));
		mailUtil.setFrom("18392427646@163.com");
		mailUtil.setSubject("邮箱验证码");
		String msg="欢迎您注册IBeauty，您的验证码为："+String.valueOf(a);
		mailUtil.setMsg(msg);
		mailUtil.send();
        return  String.valueOf(a);
	}
	
//	public static String randomUUID(){
////		return a.toString();
//	}

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		sendEmail("976457283@qq.com");
	}

}
