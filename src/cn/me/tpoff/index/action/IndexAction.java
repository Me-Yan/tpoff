package cn.me.tpoff.index.action;

import java.util.List;

import cn.me.tpoff.cart.service.CartService;
import cn.me.tpoff.cart.vo.Cart;
import cn.me.tpoff.category.service.CategoryService;
import cn.me.tpoff.category.vo.Category;
import cn.me.tpoff.product.service.ProductService;
import cn.me.tpoff.product.vo.Product;
import cn.me.tpoff.slideimg.service.SlideImgService;
import cn.me.tpoff.slideimg.vo.SlideImg;
import cn.me.tpoff.user.vo.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


/**
 * 跳转到首页Action
 * @author 严杨鸿
 *
 */
public class IndexAction extends ActionSupport {	
	
	private CategoryService categoryService;
	private ProductService productService;
	private SlideImgService slideImgService;
	private CartService cartService;
	
	public CartService getCartService() {
		return cartService;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public SlideImgService getSlideImgService() {
		return slideImgService;
	}

	public void setSlideImgService(SlideImgService slideImgService) {
		this.slideImgService = slideImgService;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public CategoryService getCategoryService() {
		return categoryService;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	
	//首页
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
		//查询轮播图片
		List<SlideImg> slist = slideImgService.findAll();
		ActionContext.getContext().getValueStack().set("slist", slist);
		
		List<List<Product>>  plist = productService.findByCategory(clist);
		ActionContext.getContext().getValueStack().set("plist", plist);
		return "index";
	}
	
	
}
