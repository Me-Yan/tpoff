package cn.me.tpoff.collection.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.me.tpoff.cart.service.CartService;
import cn.me.tpoff.cart.vo.Cart;
import cn.me.tpoff.category.service.CategoryService;
import cn.me.tpoff.category.vo.Category;
import cn.me.tpoff.collection.service.CollectionService;
import cn.me.tpoff.collection.vo.Collection;
import cn.me.tpoff.user.vo.User;
import cn.me.tpoff.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 收藏商品Action
 * @author 严杨鸿
 *
 */

public class CollectionAction extends ActionSupport {
	private CollectionService collectionService;
	private CategoryService categoryService;
	private CartService cartService;
	private Integer page;
	private Integer pid;
	private Integer colid;

	public Integer getColid() {
		return colid;
	}
	public void setColid(Integer colid) {
		this.colid = colid;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
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
	public CollectionService getCollectionService() {
		return collectionService;
	}
	public void setCollectionService(CollectionService collectionService) {
		this.collectionService = collectionService;
	}
	
	//跳转到我的收藏页面
	public String collectionPage() {
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
		//查询所有收藏的商品
		PageBean<Collection> pageBean = collectionService.findCollectionByPage(user, page);
		if(pageBean.getList()!=null&&pageBean.getList().size()>0) {
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		}
		//传递用户的路径
		String route = "我的收藏";
		ActionContext.getContext().getValueStack().set("route", route);
		return "collectionPage";
	}
	
	//收藏
	public String addToCollection() throws IOException {
		User user = (User) ActionContext.getContext().getSession().get("user");
		collectionService.addToCollection(user, pid);
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("yes");
		out.flush();
		out.close();
		
		return NONE;		
	}
	
	//删除收藏
	public String deleteCollectionByColid() {
		collectionService.deleteCollectionByColid(colid);
		return "deleteCollectionByCid";
	}
}
