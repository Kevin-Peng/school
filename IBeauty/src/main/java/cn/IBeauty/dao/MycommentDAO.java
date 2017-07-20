package cn.IBeauty.dao;
import cn.IBeauty.po.MyComment;
import cn.IBeauty.po.MyCommentt;
import cn.IBeauty.po.Product;

import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;

import java.sql.Date;
import java.util.List;
public interface MycommentDAO {
	public List<MyComment> findMycomment();
	public boolean delete(int id);
	public MyComment findById(int id);
}
