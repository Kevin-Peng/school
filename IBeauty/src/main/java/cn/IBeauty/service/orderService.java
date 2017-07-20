package cn.IBeauty.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.IBeauty.dao.orderDAO;
import cn.IBeauty.po.MyComment;
import cn.IBeauty.po.Receive_address;
import cn.IBeauty.po.User;
import cn.IBeauty.po.myOrder;

@Service("orderService")
public class orderService {
	@Resource
	private orderDAO orderdao;
	
	public Receive_address findAddress(int userid){
		Receive_address radd=orderdao.findAddressById(userid);
		if(radd!=null){
			return radd;
		}
		else{
			System.out.println("service");
			return null;	
		}
	}
	
	public void add(int order_id,int user_id,int product_id,int status,String product_pic,
			int number,double total_price,String receive_name,
			String full_address,String postal_code,String mobile,int re_status,int ping_status){
		orderdao.add(order_id,user_id,product_id,status,product_pic,number,total_price,receive_name,full_address,postal_code,mobile,re_status,ping_status);
	}
	
	public List<myOrder> findAllOrder(int  userid){
		List<myOrder> list=orderdao.findAllOrder(userid);
		if(list!=null){
			return list;
		}
		else{
			//System.out.println("service");
			return null;
		}
	}
	
	public List<myOrder> findUnPay(int  userid){
		List<myOrder> list=orderdao.findUnPay(userid);
		if(list!=null){
			return list;
		}
		else{
			//System.out.println("service");
			return null;
		}
	}
	
	public List<myOrder> findUnReceive(int  userid){
		List<myOrder> list=orderdao.findUnReceive(userid);
		if(list!=null){
			return list;
		}
		else{
			//System.out.println("service");
			return null;
		}
	}
	
	public List<myOrder> findUnPing(int  userid){
		List<myOrder> list=orderdao.findUnPing(userid);
		if(list!=null){
			return list;
		}
		else{
			//System.out.println("service");
			return null;
		}
	}
	
	public void insertCom(int product_id,int userid,String comment_pic,String content){
		orderdao.insertCom(product_id,userid,comment_pic,content);
	}
	public List<MyComment> findCom(int userid){
		List<MyComment> list=orderdao.findCom(userid);
		if(list!=null){
			return list;
		}
		else{
			//System.out.println("service");
			return null;
		}
	}

    /*
	public int produceOrder(int user_id,int status,
			String order_time,String order_desc,double total_price,String receive_name,
			String full_address,String postal_code,String mobile){
		int order_id=orderdao.produceOrder(user_id,status,order_time,order_desc,total_price,receive_name,full_address,postal_code,mobile);
		if(order_id!=0){
			System.out.println(order_id);
			return order_id;
		}
		else{
			return 0;
		}
	}
	*/
	public void updatePing(int pid){
		orderdao.updatePing(pid);
	}

	public List<MyComment> findComByPid(int productId){
		List<MyComment> list=orderdao.findComByPid(productId);
		if(list!=null){
			return list;
		}
		else{
			//System.out.println("service");
			return null;
		}
	}
	
	public User findUserById(int userid){
		User u=orderdao.findUserById(userid);
		if(u!=null){
			return u;
		}
		else{
			return null;
		}
	}
	
	public void updateUser(int userid,String filename){
		orderdao.updateUser(userid,filename);
	}
	
	public void updateReceive(int order_id){
		orderdao.updateReceive(order_id);
	}
	public void updatePay(int order_id){
		orderdao.updatePay(order_id);
	}
}
