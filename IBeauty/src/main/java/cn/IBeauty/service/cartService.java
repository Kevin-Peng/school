package cn.IBeauty.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.IBeauty.dao.cartDAO;
import cn.IBeauty.po.Cart;
import cn.IBeauty.po.CartCount;
import cn.IBeauty.po.Collect;

@Service("cartService")
public class cartService {
	@Autowired	
	cartDAO  cartdao;
	CartCount count=new CartCount();
	public List<Cart> refresh(int userId){
		List<Cart> list=cartdao.refresh(userId);
		return list;
	}
	public void delete(int productId,int userId){
		cartdao.delete(productId,userId);
	}
	public void change(int productNum,double productCount,int productId,int userId){
		cartdao.change(productNum,productCount,productId,userId);
	}
	public Cart topay(int topayId,int userId){
		Cart topaylist = cartdao.topay(topayId,userId);
		return topaylist;
	}
	public CartCount count(List<Cart> cartList){
		int num=0;
		float price=(float) 0.00;
		for(Cart lt:cartList){
		   num=num+1;
		   price=(float) (price+lt.getProductPrice()*lt.getProductNum());
		}
		count.setNum(num);
		count.setPrice(price);
		return count;
	}
	public List<Collect> cartcollect(int productId,int userId){
		List<Collect> cartcollectlist = cartdao.cartcollect(productId,userId);;
		return cartcollectlist;
	}
}
