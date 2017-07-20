package cn.IBeauty.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.IBeauty.po.Collect;
import cn.IBeauty.po.Receive_address;
import cn.IBeauty.po.Product;

public interface collectDAO {

	public Receive_address findAddressById(int productId);
	public Product findProductById(int productId);
	public void insertCollect(@Param("pid")int pid,@Param("ppic")String ppic,@Param("pname")String pname,
			@Param("pprice")double pprice,@Param("pnumber")int pnumber,@Param("userId")int userId);
	public List<Collect> findCollect(int userId);
	public void nocollect(@Param("pid")int pid,@Param("userId")int userId);
	public void collecttocart(@Param("pid")int pid,@Param("userId")int userId,@Param("productPrice")double productPrice,@Param("productImg")String productImg,@Param("productNum")int productNum,@Param("productCount")double productCount,@Param("productName")String productName);

}
