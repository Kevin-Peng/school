package cn.IBeauty.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.IBeauty.po.myOrder;

import com.sun.tools.hat.internal.server.PlatformClasses;

import cn.IBeauty.po.Order;
import cn.IBeauty.po.Pay;
import cn.IBeauty.po.Platformpay;

public interface PayDAO {

	public Order findOrderById(int order_id);

	public Pay findPayByEmail(String email);
	
	public Pay findPayById(int user_id);

	public Pay findUseraccountById(int user_id);

	public Platformpay findPlataccountById(int Plat_id);

	public void updateUseraccountById(@Param("user_id") int user_id,
			@Param("account") double account);

	public void updatePlataccountById(@Param("plat_id") int plat_id,
			@Param("account") double account);
	
	public void updatestatus(int order_id);
	
	public void updateordertablestatus(int order_id);
	
	public void updatepaypwd(@Param("user_id")int user_id,@Param("pay_pwd")String pay_pwd);
	
	public void insertpay(@Param("user_id")int user_id,@Param("email") String email);
	
	public List<myOrder> finditemById(int order_id);
}
