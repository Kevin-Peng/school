package cn.IBeauty.po;

public class Pay {
	private int id;
	private String email;
	private int user_id;
	private double account;
	private String pay_pwd;

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

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public double getAccount() {
		return account;
	}

	public void setAccount(double account) {
		this.account = account;
	}

	public String getPay_pwd() {
		return pay_pwd;
	}

	public void setPay_pwd(String pay_pwd) {
		this.pay_pwd = pay_pwd;
	}

}
