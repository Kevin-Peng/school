package cn.IBeauty.po;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Comment implements Serializable{

	private int product_id;
	private int userid;
	private String nickname;
	private String user_pic;
	private String content;
	private String pic[];
	private String comment_pic;
	private String src;
	private String product_name;
	private int length;
	
	
	public String getComment_pic() {
		return comment_pic;
	}
	public void setComment_pic(String comment_pic) {
		this.comment_pic = comment_pic;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getUser_pic() {
		return user_pic;
	}
	public void setUser_pic(String user_pic) {
		this.user_pic = user_pic;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String[] getPic() {
		return pic;
	}
	public void setPic(String[] pic) {
		this.pic = pic;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	
	
}