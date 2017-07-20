package cn.IBeauty.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.IBeauty.po.MyComment;
import cn.IBeauty.po.Order;
import cn.IBeauty.po.Receive_address;
import cn.IBeauty.po.User;
import cn.IBeauty.po.myOrder;
import cn.IBeauty.po.myOrderr;

public interface orderDAO {

	public Receive_address findAddressById(@Param("userid")int userid);
	public void add(@Param("order_id")int order_id,@Param("user_id")int user_id,@Param("product_id")int product_id,@Param("status")int status,@Param("product_pic")String product_pic,
			@Param("number")int number,@Param("total_price")double total_price,@Param("receive_name")String receive_name,
			@Param("full_address")String full_address,@Param("postal_code")String postal_code,@Param("mobile")String mobile,
			@Param("re_status")int re_status,@Param("ping_status")int ping_status);
	public List<myOrder> findAllOrder(@Param("userid")int userid);
	public List<myOrder> findUnPay(@Param("userid")int userid);
	public List<myOrder> findUnReceive(@Param("userid")int userid);
	public List<myOrder> findUnPing(@Param("userid")int userid);
	public void insertCom(@Param("product_id")int product_id,@Param("userid")int userid,@Param("comment_pic")String comment_pic,
			@Param("content")String content);
	public List<MyComment> findCom(@Param("userid")int userid);

	
	public int produceOrder(Order order);
	public void updatePing(@Param("pid")int pid);
	
	public List<MyComment> findComByPid(@Param("productId")int productId);
	public User findUserById(@Param("userid")int userid);
	public void updateUser(@Param("userid")int userid,@Param("filename")String filename);
	//public void insertUser(@Param("userid")int userid,@Param("filename")String filename);
	public void updateReceive(@Param("order_id")int order_id);
	public void updatePay(@Param("order_id")int order_id);
	//刘意聪
	public List<myOrder> findOrder();
	
	public boolean delete(int id);
	
	public myOrder findById(int id);

	
}
