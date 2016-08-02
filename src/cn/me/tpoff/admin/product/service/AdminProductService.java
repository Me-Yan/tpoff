package cn.me.tpoff.admin.product.service;

import java.util.Date;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.me.tpoff.admin.product.dao.AdminProductDao;
import cn.me.tpoff.category.vo.Category;
import cn.me.tpoff.categorysecond.vo.CategorySecond;
import cn.me.tpoff.comment.vo.Comment;
import cn.me.tpoff.detail.vo.Detail;
import cn.me.tpoff.product.vo.Product;
import cn.me.tpoff.show.vo.Show;
import cn.me.tpoff.utils.PageBean;

/**
 * 后台管理商品Service
 * @author 严杨鸿
 *
 */

@Transactional
public class AdminProductService {
	private AdminProductDao adminProductDao;

	public AdminProductDao getAdminProductDao() {
		return adminProductDao;
	}
	public void setAdminProductDao(AdminProductDao adminProductDao) {
		this.adminProductDao = adminProductDao;
	}
	
	//商品列表
	public PageBean<Product> findProductList(Integer page, String keyword) {
		PageBean<Product> pageBean = new PageBean<Product>();
		Integer limit = 10;
		Integer totalCount = null;
		Integer totalPage = null;
		totalCount = adminProductDao.findProductCount(keyword);
		if(totalCount%limit!=0) {
			totalPage = totalCount / limit + 1;
		} else {
			totalPage = totalCount / limit;
		}
		Integer begin = (page-1) * limit;
		List<Product> list = adminProductDao.findProductList(keyword, begin, limit);
		
		pageBean.setLimit(limit);
		pageBean.setPage(page);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		
		return pageBean;
	}
	
	//具体商品
	public Product findProduct(Integer pid) {
		return adminProductDao.findProduct(pid);
	}
	
	//图片展示
	public List<Show> findShowList(Integer pid) {
		return adminProductDao.findShowList(pid);
	}
	
	//商品详情图片
	public List<Detail> findDetailList(Integer pid) {
		return adminProductDao.findDetailList(pid);
	}
	
	//商品评论
	public PageBean<Comment> findCommentList(Integer pid, Integer page) {
		PageBean<Comment> pageBean = new PageBean<Comment>();
		Integer limit = 10;
		Integer totalCount = null;
		Integer totalPage = null;
		totalCount = adminProductDao.findCommentCount(pid);
		if(totalCount%limit!=0) {
			totalPage = totalCount / limit + 1;
		} else {
			totalPage = totalCount / limit;
		}
		Integer begin = (page-1) * limit;
		List<Comment> list = adminProductDao.findCommentList(pid, begin, limit);
		
		pageBean.setLimit(limit);
		pageBean.setPage(page);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		
		return pageBean;
	}
	
	//删除商品评论
	public void deleteComment(Integer pcid) {
		Comment comment = adminProductDao.findComment(pcid);
		adminProductDao.deleteComment(comment);
	}
	
	//查询所有一级分类
	public List<Category> findCategoryList() {
		return adminProductDao.findCategoryList();
	}
	
	//下架商品
	public void productDown(Integer pid) {
		Product product = adminProductDao.findProduct(pid);
		product.setState(0);
		adminProductDao.productDown(product);
	}
	
	//下架商品页面
	public PageBean<Product> findDownProductList(Integer page, String keyword) {
		PageBean<Product> pageBean = new PageBean<Product>();
		Integer limit = 10;
		Integer totalCount = null;
		Integer totalPage = null;
		totalCount = adminProductDao.findDownProductCount(keyword);
		if(totalCount%limit!=0) {
			totalPage = totalCount / limit + 1;
		} else {
			totalPage = totalCount / limit;
		}
		Integer begin = (page-1) * limit;
		List<Product> list = adminProductDao.findDownProductList(keyword, begin, limit);
		
		pageBean.setLimit(limit);
		pageBean.setPage(page);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		
		return pageBean;
	}
	
	//上架商品
	public void productUp(Integer pid) {
		Product product = adminProductDao.findProduct(pid);
		product.setState(1);
		adminProductDao.productUp(product);
	}
	
	//保存商品，并返回商品id
	public Integer saveProduct(Product product, String pNewName) {
		Product p = product;
		p.setPdate(new Date());
		p.setState(1);
		p.setSalecount(0);
		p.setUcount(0);
		
		System.out.println("--------------我要开始存储了");
		System.out.println(product.getFunction());
		System.out.println(product.getPname());
		System.out.println(product.getUnit());
		System.out.println(product.getCategorySecond().getCsid());
		System.out.println(product.getLeast());
		System.out.println(product.getPdate());
		System.out.println(product.getPid());
		System.out.println(product.getPrice());
		System.out.println(product.getSalecount());
		System.out.println(product.getState());
		System.out.println(product.getUcount());
		
		adminProductDao.saveProduct(p);
		String pimg = "products/titles/" + p.getPid() + pNewName;
		p.setPimg(pimg);
		
		System.out.println("华丽的分割线------------------------");
		
		System.out.println(product.getFunction());
		System.out.println(product.getPimg());
		System.out.println(product.getPname());
		System.out.println(product.getUnit());
		System.out.println(product.getCategorySecond().getCsid());
		System.out.println(product.getLeast());
		System.out.println(product.getPdate());
		System.out.println(product.getPid());
		System.out.println(product.getPrice());
		System.out.println(product.getSalecount());
		System.out.println(product.getState());
		System.out.println(product.getUcount());
		
		
		adminProductDao.saveProduct(p);
		
		return p.getPid();
	}
	
	//保存图片展示的图片
	public Integer saveShow(Integer pid, String sNewName) {
		Show show = new Show();
		Product product = new Product();
		product.setPid(pid);
		show.setProduct(product);
		adminProductDao.saveShow(show);
		String path = "products/shows/" + show.getSid() + sNewName;
		show.setPspath(path);
		return show.getSid();
	}
	
	//保存商品详情的图片
	public Integer saveDetail(Integer pid, String dNewName) {
		Detail detail = new Detail();
		Product product = new Product();
		product.setPid(pid);
		detail.setProduct(product);
		adminProductDao.saveDetail(detail);
		String path = "products/details/" + detail.getPdid() + dNewName;
		detail.setPdpath(path);
		return detail.getPdid();
	}
	
	//根据一级分类cid查询相应二级分类
	public List<CategorySecond> findCategoryList(Integer cid) {
		return adminProductDao.findCategorySecondList(cid);
	}
	
	//修改商品基本信息
	public void updateInfo(Product product) {
		adminProductDao.updateInfo(product);
	}
	
	//根据一级分类查询相应的二级分类
	public List<CategorySecond> findCategorySecondList(Category category) {
		return adminProductDao.findCategorySecondList(category);
	}
	
	//删除图片展示
	public void deleteShow(Integer sid) {
		Show show = new Show();
		show.setSid(sid);
		adminProductDao.deleteShow(show);
	}
	
	//删除商品详情
	public void deleteDetail(Integer pdid) {
		Detail detail = new Detail();
		detail.setPdid(pdid);
		adminProductDao.deleteDetail(detail);
	}
	
}
