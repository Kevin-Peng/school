package cn.IBeauty.po;

import java.io.Serializable;

public class Collect implements Serializable{

	private int pid;
	private String ppic;
	private String pname;
	private double pprice;
	private int pnumber;
	private int userId;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPpic() {
		return ppic;
	}
	public void setPpic(String ppic) {
		this.ppic = ppic;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public double getPprice() {
		return pprice;
	}
	public void setPprice(double pprice) {
		this.pprice = pprice;
	}
	public int getPnumber() {
		return pnumber;
	}
	public void setPnumber(int pnumber) {
		this.pnumber = pnumber;
	}
	
}
