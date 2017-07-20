package cn.IBeauty.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.IBeauty.dao.ProductDAO;
import cn.IBeauty.po.Product;


@Service("ProductService")
public class ProductService {
	
	@Autowired
	ProductDAO  productdao;
	
	
	//雷鹏飞
	//查询所有商品
	public List<Product>  findAllProduct(){
		List<Product> list = productdao.findAll();
		return list;	
	}
	//查询一级分类
	public List<Product> findFirstProduct(int id){
		List<Product> list = productdao.findProductByfirstId(id);
		if(list==null){
			System.out.println("空");
		}
		return list;
	}
	
	//查询二级分类
		public List<Product> findsecondProduct(int id){
			List<Product> list = productdao.findProductBysecondId(id);
			return list;
		}
	//查询细节分类
		public List<Product> findProductBytexture(String texture){
			List<Product> list = productdao.findProductBytexture(texture);		
			return list;
		}
	//品牌分类
		public List<Product>  GroupByBrand(int id){
			List<Product> list = productdao.GroupBybrand(id);
			return list;
		}
		public List<Product> GroupByBrand_Search(String keyword){
			List<Product> list = productdao.GroupBybrand_Search(keyword);
			return list;
		}
		
	//肤质分类
		public List<Product>  GroupByCondition(int id){
			List<Product> list=productdao.GroupByConditionn(id);
			return list;
		}
		public List<Product> GroupByConditionn_Search(String keyword){
			List<Product> list = productdao.GroupByConditionn_Search(keyword);
			return list;
		}
		
	//根据id查询
	public Product findProduct(int productId){
		Product p=productdao.findProductById(productId);
		return p;			
	}
	//模糊搜索
	public List<Product> Search(String keyword){
		List<Product> list=productdao.Search(keyword);
		return list;
	}
	//查询相似品牌的商品
	public Product  SameBrandProduct(String ProductBrand){
		   Product p=productdao.SameBrandProduct(ProductBrand);
		   return p;
	}
	//查询同类商品
	public Product SameProduct(String texture) {
		Product p=productdao.SameProduct(texture);
		return p;
	}
	
	//王春培
	public List<Product> listProduct(String brand) {
		List<Product> product = productdao.listProduct(brand);
		return product;
	}
	
	//根据肤质查询结果
	public List<Product> listcondition(String condition) {
		List<Product> product = productdao.listcondition(condition);
		return product;
	}
	
	//根据肤质和品牌查询
	public List<Product> listcal(String brand, String condition) {
		List<Product> product = productdao.listcal(brand, condition);
		return product;
	}
	
	public List<Product> listDetail(int productId) {
		List<Product> product = productdao.listDetail(productId);
		return product;
	}
	
	public List<Product> changeprice(int xiaprice, int shangprice){
		List<Product> product = productdao.changeprice(xiaprice, shangprice);
		return product;
	}
	
	public List<Product> groundtime(String categoryy){
		List<Product> product = productdao.groundtime(categoryy);
		return product;
	}
	
	public List<Product> dgroundtime(String categoryy){
		List<Product> product = productdao.dgroundtime(categoryy);
		return product;
	}

	
	
}
