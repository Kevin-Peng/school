package cn.IBeauty.service;

import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.IBeauty.dao.PayDAO;
import cn.IBeauty.po.Order;
import cn.IBeauty.po.Pay;
import cn.IBeauty.po.myOrder;
import cn.IBeauty.util.RSA;

@Service("payService")
public class PayService {
	@Resource
	private PayDAO paydao;

	public Order findorder(int order_id) {
		Order order = paydao.findOrderById(order_id);
		if (order != null) {
			return order;
		}
		return null;
	}

	public Pay findpay(String email) {
		Pay pay = paydao.findPayByEmail(email);
		if (pay != null) {
			return pay;
		}
		return null;
	}
	
	public Pay findpayById(int user_id) {
		Pay pay = paydao.findPayById(user_id);
		if (pay != null) {
			return pay;
		}
		return null;
	}

	public void getkey() {
		RSA.getkey();
	}

	public boolean verify(String cipher,RSAPrivateKey prikey) {
		String message = RSA.Decryp(cipher, prikey);
		if (message.equals("123456789")) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean isenough(int user_id,double totalprice){
		double useraccount=paydao.findUseraccountById(user_id).getAccount();
		if(useraccount-totalprice>=0){
			return true;
		}else{
			return false;
		}
	}



	public boolean trade(int user_id, int plat_id, double totalprice,int order_id) {
		double useraccount = paydao.findUseraccountById(user_id).getAccount();
		double businessaccount = paydao.findPlataccountById(plat_id)
				.getAccount();
		paydao.updateUseraccountById(user_id, useraccount - totalprice);
		paydao.updatePlataccountById(plat_id, businessaccount + totalprice);
		double updateusercount = paydao.findUseraccountById(user_id)
				.getAccount();
		double updatebusinesscount = paydao.findPlataccountById(plat_id)
				.getAccount();
		if (useraccount - totalprice == updateusercount
				&& businessaccount + totalprice == updatebusinesscount) {
			paydao.updatestatus(order_id);
			return true;
		} else {
			paydao.updateUseraccountById(user_id, useraccount);
			paydao.updatePlataccountById(plat_id, businessaccount);
			return false;
		}
	}
	
	public void updateordertablestatus(int order_id){
		paydao.updateordertablestatus(order_id);
	}
	
	public int findstatus(int order_id){
		Order order=paydao.findOrderById(order_id);
		return order.getStatus();
	}
	
	public void updatepaypwd(int user_id,String pay_pwd){
		paydao.updatepaypwd(user_id, pay_pwd);
	}
	
	public void insertpay(int user_id,String email){
		paydao.insertpay(user_id, email);
	}
	
	public List<myOrder> finditemById(int order_id){
		return paydao.finditemById(order_id);
	}
}
