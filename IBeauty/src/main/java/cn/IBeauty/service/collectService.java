package cn.IBeauty.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.IBeauty.dao.collectDAO;
import cn.IBeauty.po.Collect;
import cn.IBeauty.po.Receive_address;
import cn.IBeauty.po.Product;

@Service("collectService")
public class collectService {
	@Resource
	private collectDAO collectdao;
	 
	public Receive_address findAddress(int productId){
		Receive_address receive_address=collectdao.findAddressById(productId);
		if(receive_address!=null){
			return receive_address;
		}
		else{
			//System.out.println("service");
			return null;	
		}
		
	}
	
	public Product find(int productId){
		Product p=collectdao.findProductById(productId);
		if(p!=null){
			return p;
		}
		else{
			//System.out.println("service");
			return null;	
		}
		
	}
	
	public void add(int pid,String ppic,String pname,double pprice,int pnumber,int userId){
		collectdao.insertCollect(pid,ppic,pname,pprice,pnumber,userId);
	}
	
	public List<Collect> mycollect(int userId){
		List<Collect> list=collectdao.findCollect(userId);
		//System.out.println(list+"255");
		if(list!=null){
			return list;
		}
		else{
			//System.out.println("service");
			return null;
		}
	}
	public void nocollect(int pid,int userId){
		collectdao.nocollect(pid,userId);
	}
	public void collecttocart(int pid,int userId,double productPrice,String productImg,int productNum,double productCount,String productName){
		collectdao.collecttocart(pid,userId,productPrice,productImg,productNum,productCount,productName);
	}
	
	
}
