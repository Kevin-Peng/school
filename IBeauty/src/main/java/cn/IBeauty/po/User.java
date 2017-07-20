package cn.IBeauty.po;

import java.util.Date;
import java.io.Serializable;

/**
 * 用户实体
 */
public class User implements Serializable{
    /**
     * 用户编号 
     */
    private int id;
    /**
     * 用户邮箱
     */
    private String email;
    /**
     * 用户名
     */
    private String nickname;
    /**
     * 密码
     */
    private String pwd;
    /**
     * 用户等级
     */
    private int user_integral;
    /**
     * 是否经过邮箱验证
     */
    private int is_email_verify;
    /**
     * 邮箱验证码
     */
    private String email_verify_code;
    /**
     * 最后登录时间
     */
    private Date last_login_time;
    /**
     * 最后登录IP
     */
    private String last_login_ip;
    private String user_pic;
    
    
	public String getUser_pic() {
		return user_pic;
	}


	public void setUser_pic(String user_pic) {
		this.user_pic = user_pic;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public int getUser_integral() {
		return user_integral;
	}


	public void setUser_integral(int user_integral) {
		this.user_integral = user_integral;
	}


	public int getIs_email_verify() {
		return is_email_verify;
	}


	public void setIs_email_verify(int is_email_verify) {
		this.is_email_verify = is_email_verify;
	}


	public String getEmail_verify_code() {
		return email_verify_code;
	}


	public void setEmail_verify_code(String email_verify_code) {
		this.email_verify_code = email_verify_code;
	}


	public Date getLast_login_time() {
		return last_login_time;
	}


	public void setLast_login_time(Date last_login_time) {
		this.last_login_time = last_login_time;
	}


	public String getLast_login_ip() {
		return last_login_ip;
	}


	public void setLast_login_ip(String last_login_ip) {
		this.last_login_ip = last_login_ip;
	}


	public String toString() {
		return this.getNickname()+"---"+this.getEmail()+"---"+this.getPwd()+"---";
	}
}