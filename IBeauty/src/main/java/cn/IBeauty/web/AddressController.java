package cn.IBeauty.web;

import cn.IBeauty.dao.AddressDAO;
import cn.IBeauty.po.Receive_address;
import cn.IBeauty.service.UserService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2017/6/28 0028.
 */
@Controller
@RequestMapping("address")
public class AddressController {

    @Autowired
    AddressDAO addressDAO;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "addAddress")
    public String addAddress(@ModelAttribute Receive_address address, HttpServletRequest request) {
        Integer userid = (Integer) request.getSession().getAttribute("userid");
        if (userid != null&&userid!=0) {
            address.setUser_id(userid);
            address.setFlag(0);
            addressDAO.addAddress(address);

            return "redirect:/address/queryAllAddress.do?id="+userid;
        }
        return  "login" ;
    }

    @RequestMapping(value ="updateAddress")
    public String updateAddress(@ModelAttribute Receive_address address,HttpServletRequest request){
        Integer userid = (Integer) request.getSession().getAttribute("userid");
        if (userid != null&&userid!=0) {
            addressDAO.updateAddress(address);
            return "redirect:/address/queryAllAddress.do?id="+userid;
        }
        return  "login" ;

    }
    @RequestMapping(value ="updateAddressData")
    public ModelAndView updateAddressData(Integer id){
       Receive_address address= addressDAO.quereyAddressDetail(id);
         ModelAndView modelAndView=new ModelAndView("usr/editAddress");
         modelAndView.addObject("address",address);
         return modelAndView;
    }
    @RequestMapping(value="queryAllAddress")
        public ModelAndView queryAllAddress(Integer id){
               List<Receive_address> receive_addressList= addressDAO.getAddressList(id);
                   ModelAndView modelAndView=new ModelAndView("usr/addressList");
                   modelAndView.addObject("addressList",receive_addressList);
                   return  modelAndView;
    }
    @RequestMapping(value="deleteAddress")
    public void deleteAddress(Integer id){
           addressDAO.deleteAddress(id);

    }
    @RequestMapping(value="setDefaultAddress")
    public void setDefaultAddress(Integer id){
        addressDAO.setDefault(id);

    }
}
