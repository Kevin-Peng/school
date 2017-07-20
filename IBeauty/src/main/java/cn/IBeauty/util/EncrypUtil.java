package cn.IBeauty.util;

import java.security.MessageDigest;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class EncrypUtil {

	public static String md5Encryp(String pwd){
		try {
			MessageDigest digest=MessageDigest.getInstance("MD5");
			byte [] bytes=digest.digest(pwd.getBytes());
			BASE64Encoder base64=new BASE64Encoder();
			return base64.encode(bytes);
		} catch (Exception e) {
			return "";
			}
	}
	public static byte[] base64Decryp(String s){
		BASE64Decoder base64=new BASE64Decoder();
		try {
			byte [] bs=base64.decodeBuffer(s);
			return bs;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/*
	public static void main(String[] args) {
		String pwd="123456";
		String digestpwd=md5Encryp(pwd);
		System.out.println(digestpwd);
//		byte [] bs=base64Decryp("4QrcOUm6Wau+VuBX8g+IPg==");
//		System.out.println(new String(bs));
	}*/

}
