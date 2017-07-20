package cn.IBeauty.dao;

import cn.IBeauty.po.Receive_address;

import java.util.List;

/**
 * Created by Administrator on 2017/6/28 0028.
 */
public interface AddressDAO {
    public Integer addAddress(Receive_address address);
    public Integer updateAddress(Receive_address address);
    public List<Receive_address> getAddressList(Integer userId);
    public void deleteAddress(Integer id);
    public Receive_address quereyAddressDetail(Integer id);
    public Integer setDefault(Integer id);
}
