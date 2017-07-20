package cn.IBeauty.po;

import java.io.Serializable;

public class myOrder implements Serializable{     //ordertable表对应实体类

	private int id;
	private int order_id;
	private int user_id;
	private int product_id;
	private int status;
	private String product_pic;
	private int number;
	private double total_price;
	private String receive_name;
	private String full_address;
	private String postal_code;
	private String mobile;
	private int re_status;
	private int ping_status;
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getProduct_pic() {
		return product_pic;
	}
	public void setProduct_pic(String product_pic) {
		this.product_pic = product_pic;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}
	public String getReceive_name() {
		return receive_name;
	}
	public void setReceive_name(String receive_name) {
		this.receive_name = receive_name;
	}
	public String getFull_address() {
		return full_address;
	}
	public void setFull_address(String full_address) {
		this.full_address = full_address;
	}
	public String getPostal_code() {
		return postal_code;
	}
	public void setPostal_code(String postal_code) {
		this.postal_code = postal_code;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public int getRe_status() {
		return re_status;
	}
	public void setRe_status(int re_status) {
		this.re_status = re_status;
	}
	public int getPing_status() {
		return ping_status;
	}
	public void setPing_status(int ping_status) {
		this.ping_status = ping_status;
	}
	
	
}
