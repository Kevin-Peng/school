package cn.IBeauty.po;

import java.io.Serializable;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class MyCommentt implements Serializable{
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getComment_pic() {
		return comment_pic;
	}
	public void setComment_pic(String comment_pic) {
		this.comment_pic = comment_pic;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	private int id;
	private int product_id;
	private int userid;
	private String comment_pic;
	private String content;
	
	@Override
	public String toString() {
		return "Mycomment [id=" + id + ", product_id=" + product_id
				+ ", userid=" + userid + ", comment_pic="+comment_pic+",content=" + content
				 +",]";
	}

}
