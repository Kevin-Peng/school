package cn.IBeauty.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.IBeauty.dao.cartrefreshDAO;
import cn.IBeauty.po.Cart;
import cn.IBeauty.po.CartCount;

@Service("cartrefreshService")
public class cartrefreshService {
	@Autowired	
	cartrefreshDAO  cartrefreshdao;
	CartCount count=new CartCount();
	/*
	public Cart refresh(int id){
		
		Cart cart = cartrefreshdao.refresh(id);
		if(cart!=null){
			return cart;
		}
		else{
			return null;
		}
	}
	*/
	public List<Cart> refresh(int id){
		List<Cart> list=cartrefreshdao.refresh(id);
		return list;
	}
	/*public CartCount count(List<Cart> cartList){
		int num=0;
		float price=(float) 0.00;
		for(Cart lt:cartList){
		   num=num+1;
		   price=price+lt.getProductPrice()*lt.getProductNo();
		}
		count.setNum(num);
		count.setPrice(price);
		return count;
	}*/
}
