package cn.IBeauty.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.IBeauty.dao.UserDAO;
import cn.IBeauty.po.User;

@Service("UserService")
public class UserService {
	@Autowired
	UserDAO userdao;

	// 雷鹏飞
	public User checkLogin(String email) {
		// 根据用户名实例化用户对象
		User user = userdao.findUserByEmail(email);
		if (user != null) {
			return user;
		}
		return null;
	}

	public void add(String email, String nickname, String pwd) {
		userdao.insertNew(email, nickname, pwd);
	}

	public boolean checkemail(String email) {
		User user = userdao.findUserByEmail(email);
		if (user != null) {
			return false;
		}
		return true;
	}

	public boolean checkName(String nickname) {
		User user = userdao.findUserByName(nickname);
		if (user != null) {
			return false;
		}
		return true;
	}

	// 张京京
	public int getUserId(String nicekName) {
		User user = userdao.findUserByName(nicekName);
		if (user != null) {
			return user.getId();
		}
		return 0;
	}
}
