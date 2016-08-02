package cn.me.tpoff.cart.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import cn.me.tpoff.cart.service.CartService;
import cn.me.tpoff.cart.vo.Cart;
import cn.me.tpoff.cartitem.vo.CartItem;
import cn.me.tpoff.user.vo.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 购物车Action
 * @author 严杨鸿
 *
 */

public class CartAction extends ActionSupport implements ModelDriven<CartItem> {
	private CartItem cartItem = new CartItem();
	private CartService cartService;
	private Integer pid;
	private String receiver;
	private String phone;
	private String addr;

	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public CartService getCartService() {
		return cartService;
	}
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}
	@Override
	public CartItem getModel() {
		return cartItem;
	}
	
	//加入购物车
	public String addToCart() throws IOException {
		User user = (User) ActionContext.getContext().getSession().get("user");
		Integer count = cartService.addToCart(pid, cartItem.getSubcount(), user);
		Map<String, String> map = new HashMap<String, String>();
		map.put("flag", "yes");
		map.put("count", count.toString());
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		JSONObject json = JSONObject.fromObject(map);
		String str = json.toString();
		out.print(str);
		out.flush();
		out.close();
		return NONE;
	}
	
	//跳转到购物车页面
	public String cartPage() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		Cart cart = cartService.findCartByUid(user);
		ActionContext.getContext().getValueStack().set("cart", cart);
		return "cartPage";
	}
	
	//购物车中数量添加
	public String add() throws IOException {
		User user = (User) ActionContext.getContext().getSession().get("user");
		cartService.add(user, pid);
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("yes");
		out.flush();
		out.close();
		return NONE;
	}
	
	//购物车中数量减少
	public String less() throws IOException {
		User user = (User) ActionContext.getContext().getSession().get("user");
		cartService.less(user, pid);
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("yes");
		out.flush();
		out.close();
		return NONE;
	}
	
	//删除购物车中的指定商品
	public String deleteProductFromCart() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		cartService.deleteProductFromCart(user, pid);
		return "deleteProduct";
	}
	
	//添加地址
	public String addAddr() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		cartService.addAddr(user, receiver, phone, addr);
		
		return "addAddr";
	}
	
	
}
