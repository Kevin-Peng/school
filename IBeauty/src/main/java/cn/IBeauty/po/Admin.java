package cn.IBeauty.po;
import java.util.Date;
import java.io.Serializable;
public class Admin {
	
	
	private int id;
    private String admname;
    private String pwd;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getAdmname() {
		return admname;
	}
	public void setAdmname(String admname) {
		this.admname = admname;
	}

	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

}
