package cn.IBeauty.service;

import java.sql.Date;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import cn.IBeauty.po.MyComment;
import cn.IBeauty.po.MyCommentt;
import cn.IBeauty.po.myOrder;
import cn.IBeauty.po.myOrderr;
import cn.IBeauty.po.Product;
import cn.IBeauty.po.User;
import cn.IBeauty.dao.MycommentDAO;
import cn.IBeauty.dao.orderDAO;
import cn.IBeauty.dao.ProductDAO;
import cn.IBeauty.dao.UserDAO;
import cn.IBeauty.po.Admin;
import cn.IBeauty.dao.AdminDAO;

@Service("adminservice")
public class AdminService {
	@Resource	
	private AdminDAO  admindao;
	public Admin checkLogin(String admname,String pwd) {
        //根据用户名实例化用户对象
        Admin admin = admindao.getAdminByName(admname);
        if (admin != null && admin.getPwd().equals(pwd)) {
            return admin;
        }
        return null;
    }
       
	

	@Resource
	private  ProductDAO productDAO;
	public List<Product> search() {
		List<Product> list = productDAO.findProduct();
        if (list != null) {
            return list;
        }
        return list;
	}
	public boolean delete(int id){
		return productDAO.delete(id);
	}
	public boolean update(Product product){
		return productDAO.update(product);
	}
	public void insert(Product product) {  
	        productDAO.insert(product);  
	    }  
	@Resource
	private orderDAO orderDAO;
	public List<myOrder> searchall() {
		List<myOrder> list = orderDAO.findOrder();
        if (list != null) {
            return list;
        }
        return list;
	}
	
	public boolean deleted(int id){
		return orderDAO.delete(id);
	}
	
	@Resource
	private  UserDAO userDAO;
	public List<User> searcha() {
		List<User> list = userDAO.findUser();
        if (list != null) {
            return list;
        }
        return list;
	}
	
	public boolean deletet(int id){
		return userDAO.delete(id);
	}
	
	

	
	@Resource
	private MycommentDAO mycommentDAO;
	public List<MyComment> searchal() {
		List<MyComment> list = mycommentDAO.findMycomment();
        if (list != null) {
            return list;
        }
        return list;
	}
	
	public boolean delet(int id){
		return mycommentDAO.delete(id);
	}
	
	//查找
	
	public Product findById(int id){
		   Product product = productDAO.findById(id);  
	       return product; 
	}
}
