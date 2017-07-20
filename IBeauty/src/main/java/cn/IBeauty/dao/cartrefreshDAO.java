package cn.IBeauty.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.IBeauty.po.Cart;
//李丹阳购物车
public interface cartrefreshDAO {
	//public Cart refresh(@Param("id")int id);
	public List<Cart> refresh(@Param("id")int id);
}
