package cn.IBeauty.dao;

import cn.IBeauty.po.Admin;
import cn.IBeauty.po.Product;

import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;

import java.util.List;

public interface AdminDAO {
	
	
	public Admin getAdminByName(String admname);
	
}
