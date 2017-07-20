package cn.IBeauty.po;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.Serializable;


public class myOrderr implements Serializable{
	
	
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getOrder_time() {
		return order_time;
	}



	public String getOrder_desc() {
		return order_desc;
	}

	public void setOrder_desc(String order_desc) {
		this.order_desc = order_desc;
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

	private int id;
    
    private int user_id;
    
    private int status;
    
    private String order_time;
    
    private String order_desc;
    
    private double total_price;
    
    private String receive_name;
    
    private String full_address;
    
	public void setOrder_time(String order_time) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		// System.out.println(df.format(new Date()));
		// this.ddate = ddate;
		this.order_time = order_time;
	}
    
	@Override
	public String toString() {
		return "Order [id=" + id + ", user_id=" + user_id
				+ ", status=" + status + ", order_time=" + order_time
				+ ", order_desc=" + order_desc + ", total_price=" + total_price
				+ ", receive_name=" + receive_name + ", full_address=" + full_address
			 + "]";
	}
	

	
   

		
         
         
}