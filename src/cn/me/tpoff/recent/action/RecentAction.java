package cn.me.tpoff.recent.action;

import java.util.List;

import cn.me.tpoff.cart.service.CartService;
import cn.me.tpoff.cart.vo.Cart;
import cn.me.tpoff.category.service.CategoryService;
import cn.me.tpoff.category.vo.Category;
import cn.me.tpoff.collection.service.CollectionService;
import cn.me.tpoff.collection.vo.Collection;
import cn.me.tpoff.order.service.OrderService;
import cn.me.tpoff.order.vo.Order;
import cn.me.tpoff.user.vo.User;
import cn.me.tpoff.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RecentAction extends ActionSupport {
	private OrderService orderService;
	private CollectionService collectionService;
	private CartService cartService;
	private CategoryService categoryService;
	
	public CategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public CartService getCartService() {
		return cartService;
	}
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public CollectionService getCollectionService() {
		return collectionService;
	}
	public void setCollectionService(CollectionService collectionService) {
		this.collectionService = collectionService;
	}
	
	public String execute() {
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
		
		//最近订单三条记录
		PageBean<Order> oBean = orderService.findRecentOrderByUid(user, 1);
		if(oBean.getList()!=null) {
			ActionContext.getContext().getValueStack().set("oBean", oBean);
		}
		//最近收藏三条记录
		PageBean<Collection> cBean = collectionService.findRecentCollectionByUid(user, 1);
		if(cBean.getList()!=null) {
			ActionContext.getContext().getValueStack().set("cBean", cBean);
		}
		
		return "recentPage";
	}
	
}
