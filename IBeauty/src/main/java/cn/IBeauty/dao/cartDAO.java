package cn.IBeauty.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.IBeauty.po.Cart;
import cn.IBeauty.po.Collect;

public interface cartDAO {
	public List<Cart> refresh(@Param("userId")int userId);
	
	public void delete(@Param("productId")int productId,@Param("userId")int userId);
	public Integer addShoppringCart(Map map);
     //根据货品和用户id判断此货品是不是已存在于购物车里
    public Integer ifexitsShoppingCart(Map map);
    //如果存在就更新数量
    public Integer updateShoppingCartNum(int id);
    //查询购物车Id
    public  Integer getShoppingCartId(Map map);
	public List<Collect> cartcollect(@Param("productId")int productId,@Param("userId")int userId);
	public void change(@Param("productNum")int productNum,@Param("productCount")double productCount,@Param("productId")int productId,@Param("userId")int userId);
	public Cart topay(@Param("topayId")int topayId,@Param("userId")int userId);
}
