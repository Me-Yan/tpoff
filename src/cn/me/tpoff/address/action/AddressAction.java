package cn.me.tpoff.address.action;

import java.util.List;




import cn.me.tpoff.address.service.AddressService;
import cn.me.tpoff.address.vo.Address;
import cn.me.tpoff.cart.service.CartService;
import cn.me.tpoff.cart.vo.Cart;
import cn.me.tpoff.category.service.CategoryService;
import cn.me.tpoff.category.vo.Category;
import cn.me.tpoff.user.vo.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 用户对地址的操作Action
 * @author 严杨鸿
 *
 */

public class AddressAction extends ActionSupport implements ModelDriven<Address>{
	private Address addr = new Address();
	private AddressService addressService;
	private CategoryService categoryService;
	private CartService cartService;
	
	public CartService getCartService() {
		return cartService;
	}
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}
	public CategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public AddressService getAddressService() {
		return addressService;
	}
	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}
	@Override
	public Address getModel() {
		return addr;
	}
	
	//跳转到用户地址页面
	public String addrPage() {
		//查询购物车数量
		User user = (User) ActionContext.getContext().getSession().get("user");
		if(user!=null) {
			Cart cart = cartService.findCartByUid(user);
			if(cart!=null) {
				ActionContext.getContext().getValueStack().set("count", cart.getCount());
			}
		}		
		//查询所有一级分类
		List<Category> clist = categoryService.findAll();
		ActionContext.getContext().getValueStack().set("clist", clist);
		//查询用户的所有地址
		User existUser = (User) ActionContext.getContext().getSession().get("user");
		List<Address> alist = addressService.findAddrByUid(existUser.getUid());
		ActionContext.getContext().getValueStack().set("alist", alist);
		//传递用户的路径
		String route = "地址管理";
		ActionContext.getContext().getValueStack().set("route", route);
		return "address";
	}
	
	//添加地址
	public String addAddr() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		addr.setState(0);
		addr.setUser(user);
		addressService.save(addr);
		return "addAddr";
	}
	
	//删除地址
	public String deleteAddr() {
		Address address = addressService.findAddrByAid(addr.getAid());
		addressService.deleteAddr(address);
		return "deleteAddr";
	}
	
	//修改地址
	public String editAddr() {
		Address address = addressService.findAddrByAid(addr.getAid());
		addr.setState(address.getState());
		addr.setUser(address.getUser());
		addressService.editAddr(addr);
		return "editAddr";
	}
	
	//设为默认地址
	public String setDefaultAddr() {
		addressService.setDefaultAddr(addr.getAid());
		return "defaultAddr";
	}
}
