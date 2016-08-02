package cn.me.tpoff.order.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.me.tpoff.address.service.AddressService;
import cn.me.tpoff.address.vo.Address;
import cn.me.tpoff.cart.service.CartService;
import cn.me.tpoff.cart.vo.Cart;
import cn.me.tpoff.category.service.CategoryService;
import cn.me.tpoff.category.vo.Category;
import cn.me.tpoff.order.service.OrderService;
import cn.me.tpoff.order.vo.Order;
import cn.me.tpoff.user.vo.User;
import cn.me.tpoff.utils.PageBean;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 订单确认Action
 * @author 严杨鸿
 *
 */

public class OrderAction extends ActionSupport {
	private OrderService orderService;
	private CartService cartService;
	private AddressService addressService;
	private Integer aid;	//地址id
	private Integer isPost; //是否包邮
	private Integer page;	
	private CategoryService categoryService;
	private Integer pid;
	private Integer subcount;
	private Integer oid;
	private String content;
	private Integer omid;

	public Integer getOmid() {
		return omid;
	}
	public void setOmid(Integer omid) {
		this.omid = omid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public Integer getSubcount() {
		return subcount;
	}
	public void setSubcount(Integer subcount) {
		this.subcount = subcount;
	}
	public CategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getIsPost() {
		return isPost;
	}
	public void setIsPost(Integer isPost) {
		this.isPost = isPost;
	}
	public AddressService getAddressService() {
		return addressService;
	}
	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}
	public CartService getCartService() {
		return cartService;
	}
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	//跳转到订单确认页面
	public String orderFormPage() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		Cart cart = cartService.findCartByUid(user);
		ActionContext.getContext().getValueStack().set("cart", cart);
		List<Address> alist = addressService.findAddrByUid(user.getUid());
		ActionContext.getContext().getValueStack().set("alist", alist);
		return "orderForm";
	}
	
	//提交订单
	public String submitOrder() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		oid = orderService.submitOrder(user, aid, isPost);
		return "submitOrder";
	}
	
	//查看所有订单
	public String orderPage() {
		if(page==null) {
			page = 1;
		}
		//查询购物车数量
		User user = (User) ActionContext.getContext().getSession().get("user");
		if(user!=null) {
			Cart cart = cartService.findCartByUid(user);
			if (cart!=null) {
				ActionContext.getContext().getValueStack().set("count", cart.getCount());
			}
		}	
		//查询所有一级分类
		List<Category> clist = categoryService.findAll();		
		ActionContext.getContext().getValueStack().set("clist", clist);
		//页面名称
		String route = "我的订单";
		ActionContext.getContext().getValueStack().set("route", route);
		//查询分页数据
		PageBean<Order> pageBean = orderService.findOrderByUid(user, page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		
		return "orderPage";
	}
	
	//支付页面
	public String payPage() {
		Order order = orderService.findOrderByOid(oid);
		ActionContext.getContext().getValueStack().set("order", order);
		
		return "payPage";
	}
	
	//从具体商品页面加入到购物车
	public String addToCart() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		cartService.addToCart(pid, subcount, user);
		
		return "addToCart";
	}
	
	//确认收货
	public String confirmGet() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		orderService.confirmGet(oid);
		
		out.print("yes");
		out.flush();
		out.close();
		
		return NONE;
	}
	
	//列表显示订单详情并进行评论
	public String goComment() {
		Order order = orderService.findOrderByOid(oid);
		ActionContext.getContext().getValueStack().set("order", order);
		
		return "commentPage";
	}
	
	//提交评论
	public String submitComment() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		User user = (User) ActionContext.getContext().getSession().get("user");
		String username = user.getUsername();
		
		orderService.submitComment(pid, username, content, omid, oid);
		
		
		out.print("yes");
		out.flush();
		out.close();
		return NONE;
	}
}
