package cn.IBeauty.web;

import cn.IBeauty.dao.AddressDAO;
import cn.IBeauty.dao.ProductDAO;
import cn.IBeauty.dao.UserDAO;
import cn.IBeauty.dao.cartDAO;
import cn.IBeauty.dao.orderDAO;
import cn.IBeauty.po.Admin;
import cn.IBeauty.po.Cart;
import cn.IBeauty.po.CartCount;
import cn.IBeauty.po.Collect;
import cn.IBeauty.po.Comment;
import cn.IBeauty.po.MyComment;
import cn.IBeauty.po.MyCommentt;
import cn.IBeauty.po.Order;
import cn.IBeauty.po.Pay;
import cn.IBeauty.po.Product;
import cn.IBeauty.po.Receive_address;
import cn.IBeauty.po.User;
import cn.IBeauty.po.checkOrder;
import cn.IBeauty.po.myOrder;
import cn.IBeauty.po.myOrderr;
import cn.IBeauty.po.productComment;
import cn.IBeauty.service.AdminService;
import cn.IBeauty.service.PayService;
import cn.IBeauty.service.ProductService;
import cn.IBeauty.service.UserService;
import cn.IBeauty.service.cartService;
import cn.IBeauty.service.cartrefreshService;
import cn.IBeauty.service.collectService;
import cn.IBeauty.service.orderService;
import cn.IBeauty.util.EncrypUtil;
import cn.IBeauty.util.MailUtil;
import cn.IBeauty.util.PaymentUtil;
import cn.IBeauty.util.RSA;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import sun.applet.Main;

import java.io.UnsupportedEncodingException;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 * Created by Administrator on 2017/6/3 0003.
 */
// 标识这是控制层必须写
@Controller
// 这是路径，类上可以不加
public class Controllerone {
	// 这里将dao层注入给控制层
	@Autowired
	private UserService userService;
	@Autowired
	private ProductService productservice;
	@Autowired
	private orderService orderservice;
	@Autowired
	private collectService collectservice;
	@Autowired
	private cartService cartservice;
	@Autowired
	private PayService payservice;
	@Autowired
	private AdminService adminService;

	/*
	 * @Autowired private cartrefreshService cartservice;
	 */
	@Autowired
	cartDAO cartdao;
	@Autowired
	ProductDAO productDAO;
	@Autowired
	AddressDAO addressDAO;
	@Autowired
	orderDAO orderDAO;

	private CartCount cartcount;
	private User user;
	private Receive_address radd;
	private Product p;
	private Pay pay;
	private Order order;
	private Admin admin;
	private String ecode = "";

	// 雷鹏飞
	// 登录功能&&购物袋展示
	@RequestMapping("login")
	public String login(String email, String pwd, HttpSession session,
			String code) throws Exception {
		// ModelAndView mav=new ModelAndView("hello");
		String rcode = (String) session.getAttribute("rCode");
		user = userService.checkLogin(email);
		session.removeAttribute("imgerror");
		session.removeAttribute("pwderror");
		session.removeAttribute("emailerror");
		if (code.equals(rcode) && user != null) {
			if (user.getPwd().equals(EncrypUtil.md5Encryp(pwd))) {
				List<Cart> cartList = cartservice.refresh(user.getId());
				cartcount = cartservice.count(cartList);
				if (cartList.size() >= 1) {
					session.setAttribute("list1", cartList);
					session.setAttribute("cartcount", cartcount);
				}
				session.setAttribute("user", user.getNickname());
				session.setAttribute("userpicc", user.getUser_pic());
				System.out.println(user.getUser_pic() + " "
						+ user.getNickname());
				session.setAttribute("userid", user.getId());
				session.setAttribute("useremail", user.getEmail());
				return "redirect:/tz.jsp";
			}
			session.setAttribute("pwderror", "密码错误");
			return "login";
		} else if (user == null) {
			session.setAttribute("emailerror", "用户名错误");
			return "login";
		}
		session.removeAttribute("rcode");
		session.setAttribute("imgerror", "验证码错误");
		return "login";
	}

	// 注册功能
	@RequestMapping(value = "regist", produces = "text/html;charset=UTF-8")
	public String regist(String email, String nickname, String valild,
			String pwd, String spwd, HttpSession session) {
		// System.out.println(nickname);
		if (ecode.equals("")) {
			return "regist";
		} else {
			if (ecode.equals(valild)) {
				if (pwd.equals(spwd)) {
					userService.add(email, nickname, EncrypUtil.md5Encryp(pwd));
					return "redirect:/login.jsp";
				}
			}
			session.setAttribute("error", "验证码错误");
			return "regist";
		}
	}

	// 发送邮箱验证码
	// 调用ajax返回邮箱验证码
	@RequestMapping("sendEmail")
	@ResponseBody
	public void sendEmail(String email) throws Exception {
		// 拿到email地址调用发送请求
		if (email.equals("")) {
		} else {
			String emailCode = MailUtil.sendEmail(email);
			ecode = emailCode;
		}
	}

	// 判断邮箱是否被注册
	@RequestMapping("checkEmail")
	@ResponseBody
	public Object checkemail(String email, HttpSession session) {
		session.removeAttribute("emailOK");
		if (userService.checkemail(email)) {
			return "Y";
		}
		session.setAttribute("emailOK", "1");
		return "N";
	}

	// 判断用户名是否唯一
	@RequestMapping("checkName")
	@ResponseBody
	public Object checkname(String nickname, HttpSession session) {
		session.removeAttribute("NameOK");
		if (userService.checkName(nickname)) {
			return "Y";
		}
		session.setAttribute("NameOK", "1");
		return "N";
	}

	// 搜索功能
	@RequestMapping("search")
	public String Search(String keyword, HttpSession session) {
		// System.out.println(keyword);
		List<Product> list = productservice.Search(keyword);
		List<Product> mylist = new ArrayList<Product>();
		int temp = 0;
		if (list != null) {
			// System.out.println(list);
			for (Product lt : list) {
				if (temp >= 0 && temp < 12) {
					if (lt != null) {
						mylist.add(lt);
					}
				}
				temp++;
			}
		}
		List<Product> BrandList = productservice.GroupByBrand_Search(keyword);
		List<Product> ConditionList = productservice
				.GroupByConditionn_Search(keyword);
		/*
		 * System.out.println(list); for(Product lt:list){
		 * System.out.println(lt.getProduct_brand()); }
		 */
		session.setAttribute("List", list);
		session.setAttribute("mylist", mylist);
		session.setAttribute("BrandList", BrandList);
		session.setAttribute("ConditionList", ConditionList);
		return "redirect:product/secondcaizhuang.jsp";
	}

	// 加载更多功能
	@RequestMapping(value = "setParam", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public Object setParam(String a, String b, HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		int i = 0;
		int s = 0;
		int x = 0;
		String html = "";
		Random random = new Random();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		List<Product> list = productservice.findAllProduct();
		for (Product lt : list) {
			i++;
			if (i >= Integer.parseInt(a) && i <= Integer.parseInt(b)) {
				// System.out.println(lt.getAlt());
				html = html
						+ "<li>"
						+ "<a href='toDetail.do?productid="
						+ lt.getId()
						+ "' target='_blank'>"
						+ "<div class='pic'><img class='lazy' src='static/"
						+ lt.getSrc()
						+ "' alt='"
						+ lt.getAlt()
						+ "' style='display: inline;'></div>"
						+ "<div class='tit'>"
						+ lt.getAlt()
						+ "'</div>'"
						+ "<div class='price_tuan'><div class='price'>￥<strong>"
						+ lt.getPrice() + "</strong></div></div>" + "</a>"
						+ "</li>";
			}
		}
		// System.out.println(html);
		if ("".equals(html)) {
			i = 1;
			s = random.nextInt(list.size() - 3) + 1;
			x = s + 5;
			for (Product lt : list) {
				if (i >= s && i <= x) {
					html = html
							+ "<li>"
							+ "<a href='toDetail.do?productid="
							+ lt.getId()
							+ "' target='_blank'>"
							+ "<div class='pic'><img class='lazy' src='static/"
							+ lt.getSrc()
							+ "' alt='"
							+ lt.getAlt()
							+ "' style='display: inline;'></div>"
							+ "<div class='tit'>"
							+ lt.getAlt()
							+ "'</div>'"
							+ "<div class='price_tuan'><div class='price'>￥<strong>"
							+ lt.getPrice() + "</strong></div></div>" + "</a>"
							+ "</li>";
				}
				i++;
				// System.out.println(i);
			}
		}
		return html;
	}

	// 添加商品list
	@RequestMapping("toIndex")
	public String SetProductList(HttpSession session) {
		List<Product> list = productservice.findAllProduct();
		session.setAttribute("ProductList", list);
		/*
		 * for(Product lt:list){ }
		 */
		return "redirect:./index.jsp";
	}

	// 跳转二级页面
	@RequestMapping("toSecondPage")
	public String toSecondPage(int id, HttpSession session) {
		session.removeAttribute("mylist");
		session.removeAttribute("categoryy");
		String categoryy = "";
		List<Product> list;
		List<Product> BrandList = productservice.GroupByBrand(id);
		List<Product> ConditionList = productservice.GroupByCondition(id);
		if (id < 200) {
			list = productservice.findFirstProduct(id);
		} else {
			list = productservice.findsecondProduct(id);
		}
		List<Product> mylist = new ArrayList<Product>();
		int temp = 0;
		if (list != null) {
			// System.out.println(list);
			for (Product lt : list) {
				if (temp >= 0 && temp < 12) {
					if (lt != null) {
						mylist.add(lt);
					}
				}
				temp++;
			}
			if (!list.isEmpty()) {
				categoryy += list.get(0).getCategoryy();
			}
			session.setAttribute("mylist", mylist);
			session.setAttribute("List", list);
			session.setAttribute("categoryy", categoryy);
			session.setAttribute("BrandList", BrandList);
			session.setAttribute("ConditionList", ConditionList);
			return "redirect:product/secondcaizhuang.jsp";
		}
		return "index";
	}

	// 根据详细分类到二级页面
	@RequestMapping("toSecondPageBytexture")
	public String toSecondPageBytexture(String texture, HttpSession session) {
		// System.out.println(texture);
		List<Product> mylist = productservice.findProductBytexture(texture);
		session.setAttribute("mylist", mylist);
		return "redirect:product/secondcaizhuang.jsp";

	}

	// 跳转到商品详情页
	@RequestMapping("toDetail")
	public String toDetail(int productid, HttpSession session) {
		System.out.println(productid);
		Product product = productservice.findProduct(productid);
		Product SameBrandProduct = productservice.SameBrandProduct(product
				.getProduct_brand());
		Product SameProduct = productservice.SameProduct(product.getTexture());
		session.setAttribute("SameBrandProduct", SameBrandProduct);
		// System.out.println(SameBrandProduct.getProduct_name()+SameProduct.getProduct_name());
		session.setAttribute("SameProduct", SameProduct);
		session.setAttribute("productDetail", product);

		// 王天慧 动态加载商品详情页面的评价信息
		List<MyComment> commentList = orderservice.findComByPid(productid); // 从评价表查询与该商品有关的评价信息
		// System.out.println(commentList==null);

		if (commentList == null) {
			session.setAttribute("comerror", "该商品暂时没有评价~~~");
		} else {
			MyComment mycomment = new MyComment(); // 与评价表对应的评价类
			List<Comment> commlist = new ArrayList<Comment>();
			int length = 0;
			for (int i = 0; i < commentList.size(); i++) {
				Comment comment = new Comment(); // 在前端页面显示的评价类
				mycomment = commentList.get(i);

				// 获取评价内容，评价图片，评价的用户id
				int userid = mycomment.getUserid();
				String content = mycomment.getContent();
				String comment_pic = mycomment.getComment_pic();
				String pic[] = comment_pic.split(",");
				length += pic.length;

				// 根据评价的用户id，在user表查询用户的昵称和头像等信息
				user = orderservice.findUserById(userid);
				String nickname = user.getNickname();
				String user_pic = user.getUser_pic();

				// 将取到的用户昵称，头像，评论，评论图片绑定到session上
				comment.setProduct_id(productid);
				comment.setUserid(userid);
				comment.setNickname(nickname);
				comment.setUser_pic(user_pic);
				comment.setPic(pic);
				comment.setComment_pic(comment_pic);
				comment.setLength(length);
				comment.setContent(content);
				commlist.add(comment);

			}
			session.setAttribute("commlist", commlist);
		}

		return "redirect:product/detail.jsp";
	}

	// 王春培
	@RequestMapping(value = "groundtime")
	public String groundtime(String categoryy, int flag, HttpSession session) {
		// 方法等于1时，降序排列，即把最新的东西先显示
		System.out.println(categoryy);
		List<Product> mylist;
		if (flag == 1) {
			mylist = productservice.groundtime(categoryy);
		} else {
			mylist = productservice.dgroundtime(categoryy);
		}
		// session.removeAttribute("mylist");
		session.setAttribute("mylist", mylist);
		session.setAttribute("prolist", mylist);
		return "redirect:/product/secondcaizhuang.jsp";
	}

	@RequestMapping(value = "listProduct", produces = "text/html;charset=utf-8")
	public String listxuanze(String brand, int flag, HttpSession session) {
		// System.out.println(brand);
		session.removeAttribute("prolist");
		session.removeAttribute("brand");
		session.removeAttribute("conditionn");
		List<Product> pro = productservice.listProduct(brand);
		/*
		 * Iterator it = pro.iterator();
		 * 
		 * while (it.hasNext()) { Product stu = (Product) it.next(); String name
		 * = stu.getProduct_name();// 得到了里面的元素的属性了 System.out.println(name); }
		 */
		if (flag == 1) {
			session.setAttribute("brand", brand);
		}

		session.setAttribute("prolist", pro);
		return "redirect:/product/hufuxuanze.jsp";
	}

	@RequestMapping(value = "listcondition")
	public String listcondition(String condition, HttpSession session) {
		// System.out.println(brand);
		session.removeAttribute("prolist");
		session.removeAttribute("brand");
		session.removeAttribute("conditionn");
		List<Product> pro = productservice.listcondition(condition);
		session.setAttribute("conditionn", condition);
		session.setAttribute("prolist", pro);
		return "redirect:/product/hufuxuanze.jsp";
	}

	@RequestMapping(value = "listcal")
	public String listcal(String brand, String conditionn, HttpSession session) {
		/*
		 * System.out.println(brand); System.out.println(conditionn);
		 */
		session.removeAttribute("prolist");
		// session.removeAttribute("brand");
		// session.removeAttribute("conditionn");
		List<Product> pro = productservice.listcal(brand, conditionn);
		session.setAttribute("conditionn", conditionn);
		session.setAttribute("brand", brand);
		session.setAttribute("prolist", pro);
		return "redirect:/product/hufuxuanze.jsp";
	}

	// 重复
	/*
	 * @RequestMapping(value = "detailshow") public String detailshow(int
	 * productId, HttpSession session) { // System.out.println("id是" +
	 * productId); session.removeAttribute("productDetail"); List<Product>
	 * productDetail = productservice.listDetail(productId); for (Product lt :
	 * productDetail) { System.out.println(lt.getId()); }
	 * session.setAttribute("productDetail", productDetail); return
	 * "redirect:/product/detail.jsp"; }
	 */

	@RequestMapping(value = "changeprice")
	public String changeprice(String xiaprice, String shangprice,
			HttpSession session) {
		// System.out.println(1);
		// session.removeAttribute("prolist");
		// session.removeAttribute(arg0);
		if (xiaprice == "" || shangprice == "") {
			List<Product> pro = (List<Product>) session.getAttribute("mylist");
			session.setAttribute("prolist", pro);
		} else {
			int l = Integer.parseInt(xiaprice);
			int h = Integer.parseInt(shangprice);
			List<Product> pro = productservice.changeprice(l, h);
			List<Product> mylist = new ArrayList<Product>();
			int temp = 0;
			if (pro != null) {
				// System.out.println(list);
				for (Product lt : pro) {
					if (temp >= 0 && temp < 12) {
						if (lt != null) {
							mylist.add(lt);
						}
					}
					temp++;
				}
				// session.setAttribute("mylist", mylist);
			}
			session.setAttribute("prolist", mylist);
		}
		return "redirect:/product/hufuxuanze.jsp";
	}

	@RequestMapping(value = "choosepage")
	public String choosepage(int pagId, HttpSession session) {
		/* System.out.println("传入的pagId是" + pagId); */
		int b = (pagId - 1) * 12;
		int e = b + 12;
		session.removeAttribute("mylist");
		List<Product> l = (List<Product>) session.getAttribute("List");
		List<Product> mylist = new ArrayList<Product>();
		int temp = 0;
		for (Product lt : l) {

			if (temp >= b && temp < e) {

				if (lt != null) {
					mylist.add(lt);
					// System.out.println(lt.getId());
				} else
					break;
			}
			temp++;
		}
		session.setAttribute("mylist", mylist);
		return "redirect:/product/secondcaizhuang.jsp";
	}

	// 张京京
	@RequestMapping("addShoppingCart")
	@ResponseBody
	public String addShoppingCart(HttpServletRequest request,
			HttpSession session, Integer productId) {
		// System.out.println(productId);
		session.removeAttribute("cartcount");
		session.removeAttribute("list1");
		Map<String, Object> map = new HashMap<>();
		String userName = (String) request.getSession().getAttribute("user");
		// 判断是否登陆
		if (userName != null && userName.length() > 0) {
			// 根据userName查询userId
			int userId = userService.getUserId(userName);
			// 查询到userId 将userId和productId封装到map参数里
			map.put("userId", userId);
			map.put("productId", productId);
			// 查询这个用户的这个商品是否已经添加了购物车
			// System.out.println(cartdao);
			int flag = cartdao.ifexitsShoppingCart(map);
			if (flag != 0) {
				// flag!=0说明添加了购物车则拿出购物车ID
				int shoppingCartId = cartdao.getShoppingCartId(map);
				if (shoppingCartId != 0) {
					// 将此购物车的数量+1
					cartdao.updateShoppingCartNum(shoppingCartId);
					List<Cart> result = cartservice.refresh(userId);
					cartcount = cartservice.count(result);
					if (result.size() >= 1) {
						session.setAttribute("list1", result);
						session.setAttribute("cartcount", cartcount);
					}
					return "1";
				}
			} else {
				// 说明此购物车没有这个货品则新添加 写一个方法查询货品的详细信息
				Product product = productDAO.queryProductDetailById(productId);
				map.put("productImg", product.getSrc());
				map.put("productPrice", product.getPrice());
				map.put("productName", product.getProduct_name());
				map.put("productNum", 1);
				map.put("productCount", product.getPrice());
				int insertFlag = cartdao.addShoppringCart(map);
				List<Cart> result = cartservice.refresh(userId);
				cartcount = cartservice.count(result);
				if (result.size() >= 1) {
					session.setAttribute("list1", result);
					session.setAttribute("cartcount", cartcount);
				}
				return "1";
			}
		} else {
			// 没有成功 跳到登录页面
			request.getSession().setAttribute("url", "product/detail.jsp");
			return "0";
		}
		return "0";
	}

	@RequestMapping(value = "addAddress")
	public String addAddress(@ModelAttribute Receive_address address,
			HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		String userName = (String) request.getSession().getAttribute("user");
		if (userName != null) {
			address.setFlag(1);
			int userId = userService.getUserId(userName);
			addressDAO.addAddress(address);

			return "redirect:/address/queryAllAddress.do?id=" + userId;
		}
		modelAndView.setViewName("login");
		return "login";
	}

	@RequestMapping(value = "updateAddress")
	public void updateAddress(@ModelAttribute Receive_address address) {
		addressDAO.updateAddress(address);

	}

	@RequestMapping(value = "updateAddressData")
	public ModelAndView updateAddressData(Integer id) {
		Receive_address address = addressDAO.quereyAddressDetail(id);
		ModelAndView modelAndView = new ModelAndView("editAddress");
		modelAndView.addObject("address", address);
		return modelAndView;
	}

	@RequestMapping(value = "queryAllAddress")
	public ModelAndView queryAllAddress(Integer id) {
		List<Receive_address> receive_addressList = addressDAO
				.getAddressList(id);
		ModelAndView modelAndView = new ModelAndView("addressList");
		modelAndView.addObject("addressList", receive_addressList);
		return modelAndView;
	}

	// 王天慧
	// 点击立即购买，从product表获取商品信息，进入订单页
	@RequestMapping("buy")
	public String buy(HttpServletRequest req, HttpSession session)
			throws Exception {
		String num = req.getParameter("num");
		String pid = req.getParameter("productid");
		int pId = Integer.parseInt(pid);
		System.out.println(num);
		System.out.println(pId);
		int number = Integer.parseInt(num);
		if (session.getAttribute("userid") == null) {
			return "redirect:/login.jsp";
		} else {
			int userid = (int) session.getAttribute("userid"); // 从会话层获取用户id，根据用户id查询用户的收货地址等信息
			// System.out.println(userid);

			p = collectservice.find(pId); // 根据id从数据库中查询商品信息

			int id = p.getId();
			double price = p.getPrice();
			String product_pic = p.getSrc(); // 获取商品信息

			radd = orderservice.findAddress(userid); // 选取用户收货地址信息

			// 获取radd里面存储的用户收货信息
			if (radd != null) {
				String receive_name = radd.getReceive_name();
				String full_address = radd.getFull_address();
				String postal_code = radd.getPostal_code();
				String mobile = radd.getMobile();
				int status = 0;
				String order_time = "2017/6/23";
				String order_desc = "order";

				double total_price = number * price;

				Order order = new Order();
				order.setUser_id(userid);
				order.setStatus(status);
				order.setOrder_time(order_time);
				order.setOrder_desc(order_desc);
				order.setTotal_price(total_price);
				order.setReceive_name(receive_name);
				order.setFull_address(full_address);
				order.setPostal_code(postal_code);
				order.setMobile(mobile);
				orderDAO.produceOrder(order); // 将本条订单插入到myorder表
				int order_id = order.getId();
				System.out.println(order_id);
				session.setAttribute("orderid", order_id);
				int re_status = 0;
				int ping_status = 0;
				orderservice.add(order_id, userid, id, status, product_pic,
						number, total_price, receive_name, full_address,
						postal_code, mobile, re_status, ping_status); // 将本条订单的商品信息插入到ordertable表中
				// 生成checkorder类，放入list，绑定session,将订单信息显示在页面上
				checkOrder corder = new checkOrder();
				corder.setId(id); // 商品id
				corder.setUser_id(userid);
				corder.setOrder_id(order_id);
				corder.setProduct_pic(product_pic);
				corder.setPrice(price);
				corder.setNumber(number);
				corder.setTotal_price(total_price);
				List<checkOrder> list = new ArrayList();
				list.add(corder);
				session.setAttribute("list", list);
				return "redirect:/usr/checkorder.jsp";
			} else {
				JOptionPane.showMessageDialog(null, "地址为空，请先设置地址", "提示",
						JOptionPane.PLAIN_MESSAGE);
				return "redirect:/usr/addAddress.jsp";
			}
		}
	}

	// 点击我的订单，查看所有类型订单 点击不同类型，对应展示不同页面
	@RequestMapping("order")
	public String order(HttpSession session, int click) throws Exception {
		if (session.getAttribute("userid") == null) {
			return "redirect:/login.jsp";
		} else {
			int userid = (int) session.getAttribute("userid");

			if (click == 1) { // 显示全部订单
				List<myOrder> list = orderservice.findAllOrder(userid); // 从数据库中读取myorder表的全部信息
				session.setAttribute("orderlist", list);
				return "redirect:/usr/myorder.jsp";
			} else if (click == 2) { // 显示待付款订单
				List<myOrder> list = orderservice.findUnPay(userid); // 从数据库中读取myorder表的未付款订单信息
				session.setAttribute("orderlist", list);
				return "redirect:/usr/myorder.jsp";
			} else if (click == 3) { // 显示待收货订单
				List<myOrder> list = orderservice.findUnReceive(userid); // 从数据库中读取myorder表的待收货订单信息
				session.setAttribute("orderlist", list);
				return "redirect:/usr/myorder.jsp";
			} else if (click == 4) { // 显示待评价订单
				List<myOrder> list = orderservice.findUnPing(userid); // 从数据库中读取myorder表的待评价订单信息
				session.setAttribute("orderlist", list);
				return "redirect:/usr/myorder.jsp";
			} else {

			}

			return "redirect:/usr/myorder.jsp";
		}
	}

	// 点击我的订单，查看所有订单
	@RequestMapping("myorder")
	public String myorder(HttpSession session) throws Exception {
		if (session.getAttribute("userid") == null) {
			return "redirect:/login.jsp";
		} else {
			int userid = (int) session.getAttribute("userid");
			List<myOrder> list = orderservice.findAllOrder(userid); // 从数据库中读取ordertable表的全部信息
			session.setAttribute("orderlist", list);
			List<myOrder> mylist = new ArrayList<myOrder>();
			int temp = 0;
			if (list != null) {
				for (myOrder myorder : list) {
					if (temp >= 0 && temp < 4) {
						if (myorder != null) {
							mylist.add(myorder);
						}
					}
					temp++;
				}
				session.setAttribute("myorderlist", mylist);
			}
			return "redirect:/usr/myorder.jsp";
		}
	}

	@RequestMapping("unpay")
	public String unpay(HttpSession session) throws Exception {
		int userid = (int) session.getAttribute("userid");
		List<myOrder> list = orderservice.findUnPay(userid); // 从数据库中读取myorder表的未付款订单信息
		session.setAttribute("orderlist", list);
		return "redirect:/usr/myorder.jsp";
	}

	@RequestMapping("unreceive")
	public String unreceive(HttpSession session) throws Exception {
		int userid = (int) session.getAttribute("userid");
		List<myOrder> list = orderservice.findUnReceive(userid); // 从数据库中读取myorder表的待收货订单信息
		session.setAttribute("orderlist", list);
		return "redirect:/usr/myorder.jsp";
	}

	@RequestMapping("unping")
	public String unping(HttpSession session) throws Exception {
		int userid = (int) session.getAttribute("userid");
		List<myOrder> list = orderservice.findUnPing(userid); // 从数据库中读取myorder表的待评价订单信息
		session.setAttribute("orderlist", list);
		return "redirect:/usr/myorder.jsp";
	}

	// 点击“去付款”，获取商品信息，跳转到付款页面
	@RequestMapping("gobuy")
	public String gobuy(HttpSession session, int product_id, int num, int id,
			int order_id) throws Exception {

		System.out.println(product_id + " " + num + " " + id + " " + order_id);
		session.setAttribute("orderid", order_id);

		if (session.getAttribute("userid") == null) {
			return "redirect:/login.jsp";
		} else {
			int userid = (int) session.getAttribute("userid"); // 从会话层获取用户id，根据用户id查询用户的收货地址等信息
			// System.out.println(userid);

			p = collectservice.find(product_id); // 根据id从数据库中查询商品信息

			int pid = p.getId();
			double price = p.getPrice();
			String product_pic = p.getSrc(); // 获取商品信息

			double total_price = num * price;

			// 生成checkorder类，放入list，绑定session,将订单信息显示在页面上
			checkOrder corder = new checkOrder();
			corder.setId(product_id); // 商品id
			corder.setUser_id(userid);
			corder.setOrder_id(order_id);
			corder.setProduct_pic(product_pic);
			corder.setPrice(price);
			corder.setNumber(num);
			corder.setTotal_price(total_price);
			List<checkOrder> list = new ArrayList();
			list.add(corder);
			session.setAttribute("list", list);

			// 修改数据库中该条订单的状态
			orderservice.updatePay(id);
		}

		return "redirect:/usr/checkorder.jsp";
	}

	// 点击“确认收货”，更新数据库的收货状态，刷新订单页面
	@RequestMapping("receive")
	public String receive(HttpSession session, int id) throws Exception {

		System.out.println(id);

		orderservice.updateReceive(id);

		if (session.getAttribute("userid") == null) {
			return "redirect:/login.jsp";
		} else {
			int userid = (int) session.getAttribute("userid");
			List<myOrder> list = orderservice.findAllOrder(userid); // 从数据库中读取ordertable表的全部信息
			session.setAttribute("orderlist", list);
			return "redirect:/usr/myorder.jsp";
		}

	}

	// 点击“去评价”,获取商品信息，跳转到评价页面评价
	@RequestMapping("comment")
	public String comment(HttpSession session, int id) throws Exception {
		p = collectservice.find(id);
		System.out.println(id);
		String product_pic = p.getSrc();
		String product_name = p.getProduct_name();
		// System.out.println(product_pic+" "+product_name);
		session.setAttribute("commentProduct", p);

		// System.out.println(id);
		return "redirect:/usr/Comment.jsp";
	}

	// 点击提交评价，获取评价信息，显示评价已提交
	@RequestMapping("mycomment")
	@ResponseBody
	public Object mycomment(HttpSession session, String content,
			String comment_pic) throws Exception {
		// String content=req.getParameter("Content");
		session.setAttribute("content", content);
		if (content == "") {
			return "N";
		} else {
			p = (Product) session.getAttribute("commentProduct");
			int pid = p.getId();
			int userid = (int) session.getAttribute("userid"); // 从会话层获取用户id，根据用户id查询用户的收货地址等信息
			comment_pic = "jii1.jpg,jii2.jpg,jii3.jpg,jii4.jpg"; // 评价的图片信息应该从jsp页面获取，这里先赋值
			orderservice.insertCom(pid, userid, comment_pic, content); // 将该用户的评价信息插入数据库

			orderservice.updatePing(pid); // 在数据库中修改该商品的评价状态

			return "Y";

		}

	}

	// 点击“我的评价”，查看评价
	@RequestMapping("findComment")
	public String findComment(HttpSession session) throws Exception {
		if (session.getAttribute("userid") == null) {
			return "redirect:/login.jsp";
		} else {
			int userid = (int) session.getAttribute("userid");
			System.out.println(userid);
			List<MyComment> commentList = orderservice.findCom(userid); // 联合查询，从商品表和评价表查询该用户相关评价信息
			if (commentList == null) {
				session.setAttribute("mycommenterror", "亲，暂时没有评价信息哦~~~");
			} else {
				MyComment mycomment = new MyComment(); // 与评价表对应的评价类
				// 在前端页面显示的评价类
				List<Comment> comlist = new ArrayList<Comment>();
				for (int i = 0; i < commentList.size(); i++) {
					Comment comment = new Comment();
					mycomment = commentList.get(i);
					int id = mycomment.getProduct_id();
					System.out.println(id);
					String content = mycomment.getContent();
					p = collectservice.find(id); // 根据id从数据库中查询商品信息
					System.out.println(p == null);
					if (p == null) {
						session.setAttribute("mycommenterror", "亲，暂时没有评价信息哦~~~");
					} else {
						String src = p.getSrc();
						String name = p.getProduct_name();
						comment.setProduct_id(id);
						comment.setContent(content);
						comment.setSrc(src);
						comment.setProduct_name(name);
						comlist.add(comment);
					}
				}
				session.setAttribute("comlist", comlist);
			}

			return "redirect:/usr/MyComment.jsp";
		}
	}

	// 收藏,点击收藏，从数据库表product中取出部分商品信息，将这些信息插入数据库表collect中
	@RequestMapping("collect")
	public String collect(int id, HttpSession session) throws Exception {
		// int productId=(int) session.getAttribute("productId"); //从会话层获取商品ID
		int userId = (int) session.getAttribute("userid");

		int pid = id;
		System.out.println(pid);
		List<Collect> cartcollectlist = cartservice.cartcollect(pid, userId);
		p = collectservice.find(pid); // 从数据库表product中查询部分商品信息
		if (!cartcollectlist.isEmpty()) {
			for (Collect collect : cartcollectlist) {
				String ppic = collect.getPpic();
				String pname = collect.getPname();
				System.out.println(" " + ppic + " " + pname + " ");
			}
			JOptionPane.showMessageDialog(null, "该商品已在收藏夹，不可重复收藏", "提示",
					JOptionPane.PLAIN_MESSAGE);
		} else if (p != null) {
			String ppic = p.getSrc();
			String pname = p.getProduct_name();
			double pprice = p.getPrice();
			int pnumber = p.getProduct_num();
			collectservice.add(pid, ppic, pname, pprice, pnumber, userId); // 将这些信息插入数据库表collect中
			JOptionPane.showMessageDialog(null, "收藏成功", "提示",
					JOptionPane.PLAIN_MESSAGE);
		}

		return "redirect:/product/detail.jsp";
	}

	// 点击我的收藏 触发事件，从数据库中读取收藏商品信息
	@RequestMapping("mycollect")
	public String mycollect(HttpSession session) throws Exception {
		int userId = (int) session.getAttribute("userid");
		List<Collect> list = collectservice.mycollect(userId); // 从数据库中读取收藏商品信息
		session.setAttribute("collectlist", list);
		List<Collect> mycollectlist = new ArrayList<Collect>();
		int temp = 0;
		if (list != null) {
			for (Collect collect : list) {
				// int pid=collect.getProductId();
				String ppic = collect.getPpic();
				String pname = collect.getPname();
				System.out.println(" " + ppic + " " + pname + " ");
				if (temp >= 0 && temp < 4) {
					if (collect != null) {
						mycollectlist.add(collect);
					}
				}
				temp++;
			}
			session.setAttribute("mycollectlist", mycollectlist);
		} else {
			System.out.println("查询失败");
		}

		return "redirect:/usr/collect.jsp";
	}

	// 商品评价页面动态显示
	@RequestMapping("productcomment")
	public String productcomment(HttpSession session, int id, String user_pic,
			String nickname, String content, String pic) throws Exception {
		// 从商品表读取商品信息，需要在页面上显示
		p = collectservice.find(id); // 这里参数应该为商品详情页获取的商品id
		String pname = p.getProduct_name();
		String psrc = p.getSrc();
		double price = p.getPrice();
		String texture = p.getTexture();

		// 从评价表获取该商品的评论条数
		List<MyComment> commentList = orderservice.findComByPid(id); // 从评价表查询与该商品有关的评价信息
		int comNumber = commentList.size();

		String picc[] = pic.split(",");
		int length = picc.length;
		System.out.println(picc[0]);

		productComment pc = new productComment();
		pc.setPname(pname);
		pc.setPpic(psrc);
		pc.setPrice(price);
		pc.setComNumber(comNumber);
		pc.setTexture(texture);
		pc.setProductId(id);
		pc.setUser_pic(user_pic);
		pc.setNickname(nickname);
		pc.setContent(content);
		pc.setPic1(picc[0]);
		pc.setPic2(picc[1]);
		pc.setPic3(picc[2]);
		pc.setPic4(picc[3]);
		pc.setPic(picc);
		pc.setPic_len(length);

		session.setAttribute("pcomment", pc);
		return "redirect:/product/productcomment.jsp";
	}

	// 点击个人首页，从数据库中查询个人信息并显示
	@RequestMapping("personal")
	public String personal(HttpSession session) throws Exception {
		if (session.getAttribute("userid") == null) {
			return "redirect:/login.jsp";
		} else {
			int userid = (int) session.getAttribute("userid");
			user = orderservice.findUserById(userid);
			System.out.println(user == null);
			session.setAttribute("usr", user);
			return "redirect:/usr/personal.jsp";
		}
	}

	// 实现上传个人头像的功能
	@RequestMapping("shangchuan")
	@ResponseBody
	public Object shangchuan(HttpSession session, String filename) {

		int userid = (int) session.getAttribute("userid");
		System.out.println(filename);
		orderservice.updateUser(userid, filename); // 更改用户的头像

		user = orderservice.findUserById(userid);
		System.out.println(user.getUser_pic());
		session.setAttribute("usr", user);
		return "redirect:/personal.do";
		// return "Y";
	}

	// 李丹阳
	@RequestMapping("collectpage")
	public String collectpage(String pagid, HttpSession session) {
		int pagId = Integer.parseInt(pagid);
		System.out.println("传入的pagId是" + pagId);// 文本框传入的页数
		int b = (pagId - 1) * 4;
		int e = b + 4;
		session.removeAttribute("mycollectlist");
		List<Collect> l = (List<Collect>) session.getAttribute("collectlist");
		List<Collect> mycollectlist = new ArrayList<Collect>();
		int temp = 0;
		for (Collect lt : l) {

			if (temp >= b && temp < e) {

				if (lt != null) {
					mycollectlist.add(lt);
					// System.out.println(lt.getId());
				} else
					break;
			}
			temp++;
		}
		session.setAttribute("mycollectlist", mycollectlist);
		return "redirect:/usr/collect.jsp";
	}

	@RequestMapping("delete")
	public String delete(int productId, int userId, HttpSession session) {
		/*
		 * System.out.println(productId); System.out.println(userId);
		 */
		session.removeAttribute("cartcount");
		session.removeAttribute("list1");
		cartservice.delete(productId, userId);
		List<Cart> result = cartservice.refresh(userId);
		cartcount = cartservice.count(result);
		if (result.size() >= 1) {
			session.setAttribute("list1", result);
			session.setAttribute("cartcount", cartcount);
		}

		for (Cart cart : result) {
			int uid = cart.getUserId();
			int pid = cart.getProductId();
			String pimg = cart.getProductImg();
			String pname = cart.getProductName();
			double price = cart.getProductPrice();
			int pnum = cart.getProductNum();
			double pcount = cart.getProductCount();
			System.out.println("用户" + uid + "\n商品ID:" + pid + "\n路径：" + pimg
					+ "\n商品名称：" + pname + "\n单价：" + price + "\n数量：" + pnum
					+ "\n总价：" + pcount);

		}

		return "redirect:/usr/cart.jsp";
	}

	// 购物车商品收藏,从product表中取出部分商品信息，将这些信息插入数据库表collect中
	@RequestMapping("cartcollect")
	public String cartcollect(int productId, int userId, HttpSession session)
			throws Exception {
		p = collectservice.find(productId); // 从数据库表product中查询部分商品信息
		List<Collect> cartcollectlist = cartservice.cartcollect(productId,
				userId);

		if (!cartcollectlist.isEmpty()) {
			for (Collect collect : cartcollectlist) {
				String ppic = collect.getPpic();
				String pname = collect.getPname();
				System.out.println(" " + ppic + " " + pname + " ");
			}
			JOptionPane.showMessageDialog(null, "该商品已在收藏夹，不可重复收藏", "提示",
					JOptionPane.PLAIN_MESSAGE);
		} else if (p != null) {
			String ppic = p.getSrc();
			String pname = p.getProduct_name();
			double pprice = p.getPrice();
			int pnumber = p.getProduct_num();
			collectservice.add(productId, ppic, pname, pprice, pnumber, userId); // 将这些信息插入数据库表collect中
			JOptionPane.showMessageDialog(null, "收藏成功", "提示",
					JOptionPane.PLAIN_MESSAGE);
		}
		return "redirect:/usr/cart.jsp";
	}

	@RequestMapping("nocollect")
	public String nocollect(int pid, int userId, HttpSession session) {
		System.out.println(pid);
		System.out.println(userId);
		collectservice.nocollect(pid, userId);
		List<Collect> list = collectservice.mycollect(userId); // 从数据库中读取收藏商品信息
		session.setAttribute("collectlist", list);
		List<Collect> mycollectlist = new ArrayList<Collect>();
		int temp = 0;
		if (list != null) {
			for (Collect collect : list) {
				// int pid=collect.getProductId();
				String ppic = collect.getPpic();
				String pname = collect.getPname();
				System.out.println(" " + ppic + " " + pname + " ");
				if (temp >= 0 && temp < 4) {
					if (collect != null) {
						mycollectlist.add(collect);
					}
				}
				temp++;
			}
			session.setAttribute("mycollectlist", mycollectlist);
		} else {
			System.out.println("查询失败");
		}

		return "redirect:/usr/collect.jsp";
	}

	@RequestMapping("collecttocart")
	public String collecttocart(int pid, int userId, HttpSession session) {
		session.removeAttribute("cartcount");
		session.removeAttribute("list1");
		List<Cart> result = cartservice.refresh(userId);
		cartcount = cartservice.count(result);
		if (result.size() >= 1) {
			session.setAttribute("list1", result);
			session.setAttribute("cartcount", cartcount);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("productId", pid);
		int flag = cartdao.ifexitsShoppingCart(map);
		p = collectservice.find(pid);
		if (flag != 0 && p != null) {
			// flag!=0说明添加了购物车则拿出购物车ID
			int shoppingCartId = cartdao.getShoppingCartId(map);
			System.out.println(shoppingCartId);
			if (shoppingCartId != 0) {
				// 将此购物车的数量+1
				cartdao.updateShoppingCartNum(shoppingCartId);
				List<Cart> result1 = cartservice.refresh(userId);
				cartcount = cartservice.count(result1);
				if (result1.size() >= 1) {
					session.setAttribute("list1", result1);
					session.setAttribute("cartcount", cartcount);
				}
			}
		}
		if (flag == 0 && p != null) {
			String productImg = p.getSrc();
			String productName = p.getProduct_name();
			double productPrice = p.getPrice();
			double productCount = productPrice;
			int productNum = 1;
			collectservice.collecttocart(pid, userId, productPrice, productImg,
					productNum, productCount, productName);
		}
		return "redirect:/usr/collect.jsp";
	}

	@RequestMapping("refresh")
	public String refresh(HttpSession session, HttpServletRequest request)
			throws SQLException {
		session.removeAttribute("list1");
		String userName = (String) request.getSession().getAttribute("user");
		// 判断是否登陆
		if (userName != null && userName.length() > 0) {
			int userId = (int) session.getAttribute("userid");
			List<Cart> result = cartservice.refresh(userId);
			if (result.size() >= 1) {
				session.setAttribute("list1", result);
			}
			for (Cart cart : result) {
				int uid = cart.getUserId();
				int pid = cart.getProductId();
				String pimg = cart.getProductImg();
				String pname = cart.getProductName();
				double price = cart.getProductPrice();
				int pnum = cart.getProductNum();
				double pcount = cart.getProductCount();
				System.out.println("用户" + uid + "\n商品ID:" + pid + "\n路径："
						+ pimg + "\n商品名称：" + pname + "\n单价：" + price + "\n数量："
						+ pnum + "\n总价：" + pcount);

			}
			return "redirect:/usr/cart.jsp";
		} else {
			return "redirect:/login.jsp";
		}

	}

	@RequestMapping("change")
	@ResponseBody
	public String change(int productNum, double productCount, int productId,
			HttpSession session) {
		int userId = (int) session.getAttribute("userid");// 获取当前用户的userId
		cartservice.change(productNum, productCount, productId, userId);
		return "redirect:/usr/cart.jsp";
	}

	@RequestMapping("lotdelete")
	@ResponseBody
	public String lotdelete(int[] deletes, int zongshu, HttpSession session) {
		int userId = (int) session.getAttribute("userid");
		session.removeAttribute("cartcount");
		session.removeAttribute("list1");

		// 获取当前用户的userId
		for (int i = 0; i < zongshu; i++) {
			int productId = deletes[i];
			cartservice.delete(productId, userId);
			System.out.println(productId);
		}
		List<Cart> result = cartservice.refresh(userId);
		cartcount = cartservice.count(result);
		if (result.size() >= 1) {
			session.setAttribute("list1", result);
			session.setAttribute("cartcount", cartcount);
		}
		return "redirect:/usr/cart.jsp";

	}

	@RequestMapping("topay")
	public String topay(double zongjia, int zongshu, int[] topayid,
			HttpSession session) {
		System.out.println(zongjia);
		double jiage = 0;
		session.setAttribute("jiage", zongjia);
		// System.out.println(jiage);
		System.out.println(session.getAttribute("jiage"));
		int userId = (int) session.getAttribute("userid");// 获取当前用户的userId
		radd = orderservice.findAddress(userId);
		if (radd != null) {
			List<checkOrder> list = new ArrayList();

			int status = 0;
			int re_status = 0;
			int ping_status = 0;
			String order_time = "2017/6/29";
			String order_desc = "order";
			String receive_name = radd.getReceive_name();
			String full_address = radd.getFull_address();
			String postal_code = radd.getPostal_code();
			String mobile = radd.getMobile();

			Order order = new Order();
			order.setUser_id(userId);
			order.setStatus(status);
			order.setOrder_time(order_time);
			order.setOrder_desc(order_desc);
			order.setTotal_price(zongjia);
			order.setReceive_name(receive_name);
			order.setFull_address(full_address);
			order.setPostal_code(postal_code);
			order.setMobile(mobile);
			orderDAO.produceOrder(order); // 将本条订单插入到myorder表
			System.out.println("aa");
			int order_id = order.getId();
			System.out.println(order_id);
			session.setAttribute("orderid", order_id);
			for (int i = 0; i < zongshu; i++) {
				int topayId = topayid[i];
				Cart cart = cartservice.topay(topayId,userId);
				String pimg = cart.getProductImg();
				double price = cart.getProductPrice();
				int pnum = cart.getProductNum();
				double pcount = cart.getProductCount();
				int pid = cart.getProductId();

				orderservice.add(order_id, userId, pid, status, pimg, pnum,
						pcount, receive_name, full_address, postal_code,
						mobile, re_status, ping_status); // 将本条订单的商品信息插入到ordertable表中
				// 生成checkorder类，放入list，绑定session,将订单信息显示在页面上
				checkOrder corder = new checkOrder();
				corder.setId(pid); // 商品id
				corder.setUser_id(userId);
				corder.setOrder_id(order_id); // 应该从订单表里读取该订单的id
				corder.setProduct_pic(pimg);
				corder.setPrice(price);
				corder.setNumber(pnum);
				corder.setTotal_price(pcount);
				list.add(corder);
				System.out.println("路径：" + pimg + "\t单价：" + price + "\t数量："
						+ pnum + "\t总价：");
			}
			session.setAttribute("list", list);
			for (int i = 0; i < zongshu; i++) {
				int productId = topayid[i];
				cartservice.delete(productId, userId);
				System.out.println(productId);
			}
			return "redirect:/usr/checkorder.jsp";
		} else {
			JOptionPane.showMessageDialog(null, "地址为空，请先设置地址", "提示",
					JOptionPane.PLAIN_MESSAGE);
			return "redirect:/usr/addAddress.jsp";
		}

	}

	// 彭刚
	// 余额支付控制
	@RequestMapping("payibeauty")
	public String payibeauty(HttpSession session) {
		session.removeAttribute("ipayerror");
		session.removeAttribute("repeatpay");
		int order_id = (int) session.getAttribute("orderid");
		order = payservice.findorder(order_id);
		int product_id = payservice.finditemById(order_id).get(0)
				.getProduct_id();
		String product_name = productservice.findProduct(product_id)
				.getProduct_name();
		session.setAttribute("orderproname", product_name);
		if (order != null) {
			session.setAttribute("order", order);
			return "redirect:/usr/payibeauty.jsp";
		} else {
			session.setAttribute("payerror", "订单提交出错，请重新提交");
			return "redirect:/usr/payibeauty.jsp";
		}

	}

	@RequestMapping("alipay")
	public String alipay(HttpSession session) {
		session.removeAttribute("ipayerror");
		session.removeAttribute("repeatpay");
		int order_id = (int) session.getAttribute("orderid");
		order = payservice.findorder(order_id);
		int product_id = payservice.finditemById(order_id).get(0)
				.getProduct_id();
		String product_name = productservice.findProduct(product_id)
				.getProduct_name();
		session.setAttribute("orderproname", product_name);
		if (order != null) {
			session.setAttribute("order", order);
			return "redirect:/usr/alipay.jsp";
		} else {
			session.setAttribute("payerror", "订单提交出错，请重新提交");
			return "redirect:/usr/alipay.jsp";
		}
	}

	@RequestMapping("paybaidu")
	public String paybaidu(HttpSession session) {
		session.removeAttribute("ipayerror");
		session.removeAttribute("repeatpay");
		int order_id = (int) session.getAttribute("orderid");
		order = payservice.findorder(order_id);
		int product_id = payservice.finditemById(order_id).get(0)
				.getProduct_id();
		String product_name = productservice.findProduct(product_id)
				.getProduct_name();
		session.setAttribute("orderproname", product_name);
		if (order != null) {
			session.setAttribute("order", order);
			return "redirect:/usr/paybaidu.jsp";
		} else {
			session.setAttribute("payerror", "订单提交出错，请重新提交");
			return "redirect:/usr/paybaidu.jsp";
		}
	}

	@RequestMapping("paywx")
	public String paywx(HttpSession session) {
		session.removeAttribute("ipayerror");
		session.removeAttribute("repeatpay");
		int order_id = (int) session.getAttribute("orderid");
		order = payservice.findorder(order_id);
		int product_id = payservice.finditemById(order_id).get(0)
				.getProduct_id();
		String product_name = productservice.findProduct(product_id)
				.getProduct_name();
		session.setAttribute("orderproname", product_name);
		if (order != null) {
			session.setAttribute("order", order);
			return "redirect:/usr/paywx.jsp";
		} else {
			session.setAttribute("payerror", "订单提交出错，请重新提交");
			return "redirect:/usr/paywx.jsp";
		}
	}

	@RequestMapping("toyibaopay")
	public String toyibaopay(HttpSession session) {
		session.removeAttribute("ipayerror");
		session.removeAttribute("repeatpay");
		int order_id = (int) session.getAttribute("orderid");
		order = payservice.findorder(order_id);
		int product_id = payservice.finditemById(order_id).get(0)
				.getProduct_id();
		String product_name = productservice.findProduct(product_id)
				.getProduct_name();
		session.setAttribute("orderproname", product_name);
		if (order != null) {
			session.setAttribute("order", order);
			return "redirect:/usr/payyibao.jsp";
		} else {
			session.setAttribute("payerror", "订单提交出错，请重新提交");
			return "redirect:/usr/payyibao.jsp";
		}
	}

	@RequestMapping("yibaopay")
	public String yibaopay(String pd_FrpId, HttpSession session) {
		order = (Order) session.getAttribute("order");
		String order_id = String.valueOf((int) session.getAttribute("orderid"));// sure.jsp转入易宝支付进行支付
		String money = String.valueOf(order.getTotal_price());
		// String
		// pd_FrpId=session.getParameter("pd_FrpId");//银行编码(payWay.jsp提交的)
		String p0_Cmd = "Buy";// 业务类型(买东西)
		String p1_MerId = "10001126856";// 商户编号
		String p2_Order = order_id;// 订单号
		String p3_Amt = money;// 订单金额
		String p4_Cur = "CNY";// 交易币种(ChiNa Yuan)
		String p5_Pid = "books"; // 商品名称(后期换成真是的商品名称<例如"JavaEE实践">)
		String p6_Pcat = "unknown";// 商品种类(后期换成真是的商品种类<小说，散文等>)
		String p7_Pdesc = "descrition";// 订单描述(后期换成真是的订单描述信息)
		// p8_Url:处理支付完成的地址
		String p8_Url = "http://localhost:8088/IBeauty/responsePay.do";
		String p9_SAF = "1";// 送货地址(后期换成选择的收货地址)
		String pa_MP = "unknown";// 商户扩展信息
		String pr_NeedResponse = "1"; // 应答机制
		String pr_key = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";// 商户密钥
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
				p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
				pd_FrpId, pr_NeedResponse, pr_key);

		session.setAttribute("p0_Cmd", p0_Cmd);
		session.setAttribute("p1_MerId", p1_MerId);
		session.setAttribute("p2_Order", p2_Order);
		session.setAttribute("p3_Amt", p3_Amt);
		session.setAttribute("p4_Cur", p4_Cur);
		session.setAttribute("p5_Pid", p5_Pid);
		session.setAttribute("p6_Pcat", p6_Pcat);
		session.setAttribute("p7_Pdesc", p7_Pdesc);
		session.setAttribute("p8_Url", p8_Url);
		session.setAttribute("pa_MP", pa_MP);
		session.setAttribute("pr_NeedResponse", pr_NeedResponse);
		session.setAttribute("hmac", hmac);
		session.setAttribute("p9_SAF", p9_SAF);
		session.setAttribute("pd_FrpId", pd_FrpId);

		return "redirect:/usr/sure.jsp";
	}

	@RequestMapping("responsePay")
	public String responsePay(HttpSession session) {
		int order_id=(int)session.getAttribute("orderid");
		String p1_MerId = (String) session.getAttribute("p1_MerId");
		String r0_Cmd = (String) session.getAttribute("r0_Cmd");
		String r1_Code = (String) session.getAttribute("r1_Code");// 支付结果。1代表成功
		String r2_TrxId = (String) session.getAttribute("r2_TrxId");
		String r3_Amt = (String) session.getAttribute("r3_Amt");
		String r4_Cur = (String) session.getAttribute("r4_Cur");
		String r5_Pid = (String) session.getAttribute("r5_Pid");
		String r6_Order = (String) session.getAttribute("r6_Order");// 订单编号
		String r7_Uid = (String) session.getAttribute("r7_Uid");
		String r8_MP = (String) session.getAttribute("r8_MP");
		String r9_BType = (String) session.getAttribute("r9_BType");// 1浏览器访问的。2点对点
		String hmac = (String) session.getAttribute("hmac");

		// 数据校验
		boolean ok = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd,
				r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid,
				r8_MP, r9_BType,
				"69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl");
		if (!ok) {
			session.setAttribute("ipayerror", "数据有可能被篡改，请联系网站");
			return "redirect:/usr/payresult.jsp";
		} else {
			if ("1".equals(r1_Code)) {
				// 支付成功：根据订单号更改订单状态。 点卡或充值时注意表单的重复提交问题。
				payservice.updateordertablestatus(order_id);
				order.setStatus(1);
				session.setAttribute("order", order);
				return "redirect:/usr/payresult.jsp";
			}
			return "redirect:/usr/payresult.jsp";
		}
	}

	// 支付登录
	@RequestMapping("paylogin")
	public String paylogin(String email, String pwd, String code,
			HttpSession session) {
		String rcode = (String) session.getAttribute("rCode");
		int plat_id = 1;
		order = (Order) session.getAttribute("order");
		// int user_id = (int) session.getAttribute("userid");
		double totalprice = order.getTotal_price();
		// double totalprice = 1;
		int order_id = order.getId();
		pay = payservice.findpay(email);
		int user_id = pay.getUser_id();
		session.removeAttribute("imgerror");
		session.removeAttribute("pwderror");
		session.removeAttribute("emailerror");
		session.removeAttribute("ipayerror");
		session.removeAttribute("repeatpay");
		session.removeAttribute("payenough");
		payservice.getkey();
		if (payservice.verify(
				RSA.Encryp("123456789", (RSAPublicKey) RSA.getPubkey()),
				(RSAPrivateKey) RSA.getPrikey())) {

		} else {
			session.setAttribute("ipayerror", "支付失败，请重新支付！！");
			return "redirect:/usr/payibeauty.jsp";
		}
		if (code.equals(rcode) && pay != null) {
			if (pay.getPay_pwd().equals(EncrypUtil.md5Encryp(pwd))) {
				if (payservice.findstatus(order_id) == 0) {
					if (payservice.isenough(user_id, totalprice)) {
						if (payservice.trade(user_id, plat_id, totalprice,
								order_id)) {
							payservice.updateordertablestatus(order_id);
							order.setStatus(1);
							session.setAttribute("order", order);
							return "redirect:/usr/payresult.jsp";
						} else {
							return "redirect:/usr/payresult.jsp";
						}
					} else {
						session.setAttribute("payenough", "您的账户余额不足，无法进行支付！！");
						return "redirect:/usr/payresult.jsp";
					}
				} else {
					session.setAttribute("repeatpay", "您已支付订单，请勿重复提交！！");
					return "redirect:/usr/payibeauty.jsp";
				}
			}
			session.setAttribute("pwderror", "密码错误");
			return "redirect:/usr/payibeauty.jsp";
		} else if (pay == null) {
			session.setAttribute("emailerror", "用户名错误");
			return "redirect:/usr/payibeauty.jsp";
		}
		session.removeAttribute("rcode");
		session.setAttribute("imgerror", "验证码错误");
		return "redirect:/usr/payibeauty.jsp";
	}

	@RequestMapping("payresult")
	public String payreult(HttpSession session) {
		int order_id = (int) session.getAttribute("orderid");
		order = payservice.findorder(order_id);
		session.setAttribute("order", order);
		return "redirect:/usr/payresult.jsp";
	}

	@RequestMapping("payregist")
	public String payregist(String oldpwd, String newpwd, String repwd,
			HttpSession session) {
		int user_id = (int) session.getAttribute("userid");
		String email = (String) session.getAttribute("useremail");
		pay = payservice.findpayById(user_id);
		session.removeAttribute("oldpwderror");
		session.removeAttribute("repwderror");
		session.removeAttribute("paypwdstatus");
		if (pay == null) {
			payservice.insertpay(user_id, email);
			if (newpwd.equals(repwd)) {
				payservice.updatepaypwd(user_id, EncrypUtil.md5Encryp(newpwd));
				session.setAttribute("paypwdstatus", 1);
				return "redirect:/usr/payregist.jsp";
			} else {
				session.setAttribute("repwderror", "重复密码错误！！");
				return "redirect:/usr/payregist.jsp";
			}
		} else {
			pay = payservice.findpayById(user_id);
			if (pay.getPay_pwd().equals("") && newpwd.equals(repwd)) {
				payservice.updatepaypwd(user_id, EncrypUtil.md5Encryp(newpwd));
				session.setAttribute("paypwdstatus", 1);
				return "redirect:/usr/payregist.jsp";
			} else if (EncrypUtil.md5Encryp(oldpwd).equals(pay.getPay_pwd())
					&& newpwd.equals(repwd)) {
				payservice.updatepaypwd(user_id, EncrypUtil.md5Encryp(newpwd));
				session.setAttribute("paypwdstatus", 1);
				return "redirect:/usr/payregist.jsp";
			} else if (!EncrypUtil.md5Encryp(oldpwd).equals(pay.getPay_pwd())) {
				session.setAttribute("oldpwderror", "旧密码输入错误！！");
				return "redirect:/usr/payregist.jsp";
			} else {
				session.setAttribute("repwderror", "重复密码错误！！");
				return "redirect:/usr/payregist.jsp";
			}
		}
	}

	@RequestMapping("topayregist")
	public String topayregist(HttpSession session) {
		session.removeAttribute("oldpwderror");
		session.removeAttribute("repwderror");
		session.removeAttribute("paypwdstatus");
		int user_id = (int) session.getAttribute("userid");
		pay = payservice.findpayById(user_id);
		if (pay != null && !pay.getPay_pwd().equals("")) {
			session.setAttribute("paypwdstatus", 1);
		}
		return "redirect:/usr/payregist.jsp";
	}

	// 刘意聪
	@RequestMapping("blogin")
	public String blogin(Admin admin, Model model, HttpSession session)
			throws Exception {
		session.removeAttribute("pwderror");
		session.removeAttribute("success");
		admin = adminService.checkLogin(admin.getAdmname(), admin.getPwd());
		if (admin != null) {
			model.addAttribute(admin);
			session.setAttribute("success", "登录成功！");
			return "redirect:/admin/sale.jsp";
		}
		session.setAttribute("pwderror", "用户名或密码错误！");
		return "blogin";
	}

	@RequestMapping("Iproduct")
	public String search(HttpSession session) {
		List<Product> productList = adminService.search();
		/*
		 * for(Product lt:productList){
		 * System.out.println(lt.getProduct_name()); }
		 */
		session.setAttribute("productList", productList);
		return "redirect:/admin/product.jsp";
	}

	@RequestMapping("delpro")
	public String delPro(String productid, HttpServletRequest request,
			HttpServletResponse response) {

		adminService.delete(Integer.parseInt(productid));
		return "redirect:/Iproduct.do";

	}

	@RequestMapping("update")
	public String updateProduct(Product product, HttpSession session) {
		System.out.println(product.toString());
		// product = adminService.findById(Integer.parseInt(productid));
		adminService.update(product);
		session.setAttribute("product", product);
		// System.out.println(Integer.parseInt(productid));
		return "redirect:/Iproduct.do";

	}

	@RequestMapping("toupdate")
	public String toUpdate(String productid, HttpSession session) {
		System.out.println(Integer.parseInt(productid));
		p = adminService.findById(Integer.parseInt(productid));
		session.setAttribute("product", p);
		return "redirect:admin/tianjia.jsp";
	}

	@RequestMapping("add")
	public String add(String id, String product_brand, String product_name,
			String detail, String volum, String product_country,
			String guarantee, String add_time, String product_num,
			String conditionn, String texture, String fixed_price,
			String price, String color, HttpSession session) {

		System.out.println(id);
		int liu = Integer.parseInt(id);
		System.out.println(liu);
		Product product1 = new Product();
		product1.setId(liu);
		System.out.println("jhyrthgb");
		product1.setProduct_brand(product_brand);
		product1.setProduct_name(product_name);
		product1.setDetail(detail);
		product1.setVolum(volum);
		product1.setProduct_country(product_country);
		product1.setGuarantee(guarantee);
		product1.setAdd_time(add_time);
		product1.setProduct_num(Integer.parseInt(product_num));
		product1.setConditionn(conditionn);
		product1.setTexture(texture);
		product1.setFixed_price(Double.parseDouble(fixed_price));
		product1.setPrice(Double.parseDouble(price));
		product1.setColor(color);

		System.out.println("jhyrthgb");
		adminService.insert(product1);

		session.setAttribute("product", product1);
		return "redirect:/Iproduct.do";

	}

	@RequestMapping("Ordered")
	public String searchall(HttpSession session) {
		List<myOrder> orderList = adminService.searchall();
		/*
		 * for(myOrder lt:orderList){ System.out.println(lt.getOrder_time()); }
		 */
		session.setAttribute("orderList", orderList);
		return "redirect:/admin/order.jsp";
	}

	@RequestMapping("delorder")
	public String delOrder(String orderid, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("nhnh");

		adminService.deleted(Integer.parseInt(orderid));
		return "redirect:/Ordered.do";

	}

	@RequestMapping("Users")
	public String searcha(HttpSession session) {
		List<User> userList = adminService.searcha();
		/*
		 * for(Product lt:productList){
		 * System.out.println(lt.getProduct_name()); }
		 */
		session.setAttribute("userList", userList);
		return "redirect:/admin/customer.jsp";
	}

	@RequestMapping("deluser")
	public String delUser(String userid, HttpServletRequest request,
			HttpServletResponse response) {

		adminService.deletet(Integer.parseInt(userid));
		return "redirect:/Users.do";

	}

	@RequestMapping("Mycomment")
	public String searchal(HttpSession session) {
		List<MyComment> mycommentList = adminService.searchal();
		for (MyComment lt : mycommentList) {
			System.out.println(lt.getProduct_id());
		}
		session.setAttribute("mycommentList", mycommentList);
		return "redirect:/admin/feedback.jsp";
	}

	@RequestMapping("delmycomment")
	public String delMycomment(String mycommentid, HttpServletRequest request,
			HttpServletResponse response) {
		adminService.delet(Integer.parseInt(mycommentid));
		return "redirect:/Mycomment.do";

	}
}