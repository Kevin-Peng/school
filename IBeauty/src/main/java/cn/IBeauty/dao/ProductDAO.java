package cn.IBeauty.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.IBeauty.po.Product;


public interface ProductDAO {
    //雷鹏飞部分
	//查询所有商品
	public List<Product>  findAll();	
	//根据一级分类id查询商品
	public List<Product>  findProductByfirstId(int id);	
	//根据二级分类id查询商品
	public List<Product>  findProductBysecondId(int secondid);
	//根据texture查询商品
	public List<Product> findProductBytexture(String texture);
	//查询商品
	public Product findProductById(int id);
	//根据品牌分类
	public List<Product> GroupBybrand(int id);	
	public List<Product> GroupBybrand_Search(String keyword);
	//根据肤质分类
	public List<Product> GroupByConditionn(int id);
	public List<Product> GroupByConditionn_Search(String keyword);
	//模糊搜索
	public List<Product> Search(String keyword);
	//同品牌查詢
	public Product SameBrandProduct(String productBrand);
	//同类型查询
	public Product SameProduct(String texture);
	
	//王春培部分
    public List<Product> listProduct(@Param("brand")String brand);
	
	public List<Product> listgongxiao(String gongxiao);
	
	public List<Product> listcondition(String condition);
	
	public List<Product> changeprice(int xiaprice, int shangprice);
	
	public List<Product> listcal(String brand, String condition);
	
	public List<Product> listDetail(int productId);
	
	public List<Product> groundtime(String categoryy);
	
	public List<Product> dgroundtime(String categoryy);
	
	   //张京京
	 public  Product queryProductDetailById(Integer productId);
	    //刘毅聪
		public List<Product> findProduct();		
		public void  insert(Product product);		
		public boolean delete(int id);		
		public boolean update(Product product);		
		public Product findById(int id);
		
		
}
