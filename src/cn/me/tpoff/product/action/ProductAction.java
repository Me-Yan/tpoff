package cn.me.tpoff.product.action;

import java.util.ArrayList;
import java.util.List;

import cn.me.tpoff.cart.service.CartService;
import cn.me.tpoff.cart.vo.Cart;
import cn.me.tpoff.category.service.CategoryService;
import cn.me.tpoff.category.vo.Category;
import cn.me.tpoff.categorysecond.service.CategorySecondService;
import cn.me.tpoff.categorysecond.vo.CategorySecond;
import cn.me.tpoff.collection.vo.Collection;
import cn.me.tpoff.comment.vo.Comment;
import cn.me.tpoff.detail.vo.Detail;
import cn.me.tpoff.product.service.ProductService;
import cn.me.tpoff.product.vo.Product;
import cn.me.tpoff.show.vo.Show;
import cn.me.tpoff.user.vo.User;
import cn.me.tpoff.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 商品Action
 * @author 严杨鸿
 *
 */

public class ProductAction extends ActionSupport implements ModelDriven<Product> {
	private ProductService productService;
	private CategoryService categoryService;
	private CategorySecondService categorySecondService;
	private CartService cartService;
	
	private Product product = new Product();
	
	private Integer cid;	//一级分类id
	private Integer csid;	//二级分类id
	private Integer page;	//分页
	private String style;	//排序类型
	private String sort;	//升降顺序
	private String keyword;	//关键字
	private String conPage;	//是否点击评论分页的判断值
	
	
	public CartService getCartService() {
		return cartService;
	}
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}
	public String getConPage() {
		return conPage;
	}
	public void setConPage(String conPage) {
		this.conPage = conPage;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public CategorySecondService getCategorySecondService() {
		return categorySecondService;
	}
	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}
	public Integer getCsid() {
		return csid;
	}
	public void setCsid(Integer csid) {
		this.csid = csid;
	}
	public CategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	@Override
	public Product getModel() {
		return product;
	}
	
	
	//根据一级分类查询指定该分类下的商品
	public String findProductByCid() {
		//查询购物车数量
		User user = (User) ActionContext.getContext().getSession().get("user");
		if(user!=null) {
			Cart cart = cartService.findCartByUid(user);
			if(cart!=null) {
				ActionContext.getContext().getValueStack().set("count", cart.getCount());
			}
		}	
		//查询分页的数据
		PageBean<Product> pageBean = productService.findProductByCid(cid, page, style, sort);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		//查询所有一级分类
		List<Category> clist = categoryService.findAll();		
		ActionContext.getContext().getValueStack().set("clist", clist);
		//查询查询指定一级分类
		Category category = categoryService.findByCid(cid);
		ActionContext.getContext().getValueStack().set("category", category);
		//当进行翻页时，存储需要的排列条件
		List<String> olist = new ArrayList<String>();
		olist.add(style);
		olist.add(sort);
		ActionContext.getContext().getValueStack().set("olist", olist);
		return "productList";
	}
	
	//根据二级分类查询该分类下的所有商品
	public String findProductByCsid() {
		//查询购物车数量
		User user = (User) ActionContext.getContext().getSession().get("user");
		if(user!=null) {
			Cart cart = cartService.findCartByUid(user);
			if(cart!=null) {
				ActionContext.getContext().getValueStack().set("count", cart.getCount());
			}
		}	
		//查询分页的数据
		PageBean<Product> pageBean = productService.findProductByCsid(csid, page, style, sort);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		//查询所有一级分类
		List<Category> clist = categoryService.findAll();
		ActionContext.getContext().getValueStack().set("clist", clist);
		//查询查询指定二级分类
		CategorySecond categorySecond = categorySecondService.findByCsid(csid);
		Category category = categoryService.findByCid(categorySecond.getCategory().getCid());	
		ActionContext.getContext().getValueStack().set("categorySecond", categorySecond);
		ActionContext.getContext().getValueStack().set("category", category);
		//当进行翻页时，存储需要的排列条件
		List<String> olist = new ArrayList<String>();
		olist.add(style);
		olist.add(sort);
		ActionContext.getContext().getValueStack().set("olist", olist);
		
		return "productList";
	}
	
	//根据关键字查询所有的商品
	public String findProductByKeyword() {
		
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
		//查询分页数据
		PageBean<Product> pageBean = productService.findProductByKeyword(keyword, page, style, sort);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		
		//存储必要的排列条件
		List<String> olist = new ArrayList<String>();
		olist.add(keyword);
		olist.add(style);
		olist.add(sort);
		ActionContext.getContext().getValueStack().set("olist", olist);
		return "findList";
	}
	
	//查询某个商品的详情
	public String findByPid() {		
		if(page==null) {
			page = 1;
		}
		//查询购物车数量
		User user = (User) ActionContext.getContext().getSession().get("user");
		if(user!=null) {
			Cart cart = cartService.findCartByUid(user);
			if(cart!=null) {
				ActionContext.getContext().getValueStack().set("count", cart.getCount());
			}
			//查询该用户是否收藏该商品
			Collection collection = productService.findCollectionByPid(user, product.getPid());
			if (collection!=null) {
				ActionContext.getContext().getValueStack().set("collection", "yes");
			}
		}	
		//查询所有一级分类
		List<Category> clist = categoryService.findAll();
		ActionContext.getContext().getValueStack().set("clist", clist);
		//查询商品被放大的图片
		List<Show> slist = productService.findShowByPid(product.getPid());
		ActionContext.getContext().getValueStack().set("slist", slist);
		//获取当前商品对象
		product = productService.findProduct(product.getPid());
		ActionContext.getContext().getValueStack().set("product", product);
		//查询相关的3个商品
		List<Product> plist = productService.findAboutProduct(product.getCategorySecond().getCsid(), product.getPid());
		ActionContext.getContext().getValueStack().set("plist", plist);
		//查询商品详情的图片
		List<Detail> dlist = productService.findDetailByPid(product.getPid());
		ActionContext.getContext().getValueStack().set("dlist", dlist);
		//查询商品对应的评论
		PageBean<Comment> pageBean = productService.findCommentByPid(product.getPid(), page);
		if(pageBean!=null) {
			//对评论信息中的用户名进行修改
			List<Comment> com = new ArrayList<Comment>();
			String sname = null;
			String name = null;
			for(Comment c : pageBean.getList()) {
				sname = c.getUsername();
				name = sname.charAt(0) + "***" + sname.charAt(sname.length()-1);
				c.setUsername(name);
				com.add(c);
			}
			pageBean.setList(com);
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			//评论记录数
			Integer num = productService.findCountByPid(product.getPid());
			ActionContext.getContext().getValueStack().set("num", num);
		}
		
		if(conPage!=null) {
			ActionContext.getContext().getValueStack().set("conPage", conPage);
		}
		
		
		return "product";
	}
}
