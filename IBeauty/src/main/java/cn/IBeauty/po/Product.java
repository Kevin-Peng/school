package cn.IBeauty.po;

import java.io.Serializable;
import java.sql.Date;
import java.text.SimpleDateFormat;

public class Product implements Serializable{
     private  int id;
     private  String product_brand;
     private  String product_name;
     private  String detail;
     private  String volum;
     private  String product_country;
     private  String guarantee;
     private  String add_time;
     private  int    product_num;
     private  String conditionn;
     private  String texture;
     private  double fixed_price;
     private  double price;
     private  String color;
     private  String src;
     private  String alt;
     private  String categoryy;
     public String getCategoryy() {
		return categoryy;
	}

	public void setCategoryy(String categoryy) {
		this.categoryy = categoryy;
	}
     public int getId() {
		return id;
	}
	
	public String getAlt() {
		return alt;
	}

	public void setAlt(String alt) {
		this.alt = alt;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getProduct_brand() {
		return product_brand;
	}
	public void setProduct_brand(String product_brand) {
		this.product_brand = product_brand;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getVolum() {
		return volum;
	}
	public void setVolum(String volum) {
		this.volum = volum;
	}
	public String getProduct_country() {
		return product_country;
	}
	public void setProduct_country(String product_country) {
		this.product_country = product_country;
	}
	public String getGuarantee() {
		return guarantee;
	}
	public void setGuarantee(String guarantee) {
		this.guarantee = guarantee;
	}

	public String getAdd_time() {
		return add_time;
	}

	public void setAdd_time(String add_time) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		// System.out.println(df.format(new Date()));
		// this.ddate = ddate;
		this.add_time = add_time;
	}

	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getConditionn() {
		return conditionn;
	}
	public void setConditionn(String conditionn) {
		this.conditionn = conditionn;
	}
	public String getTexture() {
		return texture;
	}
	public void setTexture(String texture) {
		this.texture = texture;
	}
	public double getFixed_price() {
		return fixed_price;
	}
	public void setFixed_price(double fixed_price) {
		this.fixed_price = fixed_price;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}		

}
