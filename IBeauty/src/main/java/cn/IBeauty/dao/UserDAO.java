package cn.IBeauty.dao;

import cn.IBeauty.po.User;
import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;
import java.util.List;


/**
* User数据访问接口
*/
public interface UserDAO {
	/**
	* 找到某一个用户，验证登录
	*/
	public User findUserByEmail(String email);
	
	//找到一个用户名是否被占用
	public User findUserByName(String nickname);
	
	/* 
	* 判断用户邮箱是否经过验证
	*/
	public boolean isEmailVerify();
	/**
	* 更新用户最后一次的登录信息
	*/
	public void updateIpTime(User user);
	/**
	* 更新用户的修改信息——密码
	*/
	public void updatePwd(String pwd);
	/**
	* 注册成功后，数据库新增一条数据库记录
	*/
	public void insertNew(@Param("email")String email,@Param("nickname")String nickname,@Param("pwd")String  pwd);
	//刘意聪
	public List<User> findUser();
	public boolean delete(int id);
	public User findById(int id);
   }