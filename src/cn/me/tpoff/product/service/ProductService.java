package cn.me.tpoff.product.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.transaction.annotation.Transactional;

import cn.me.tpoff.category.vo.Category;
import cn.me.tpoff.collection.vo.Collection;
import cn.me.tpoff.comment.vo.Comment;
import cn.me.tpoff.detail.vo.Detail;
import cn.me.tpoff.product.dao.ProductDao;
import cn.me.tpoff.product.vo.Product;
import cn.me.tpoff.show.vo.Show;
import cn.me.tpoff.user.vo.User;
import cn.me.tpoff.utils.PageBean;

/**
 * 商品service
 * @author 严杨鸿
 *
 */

@Transactional
public class ProductService {
	private ProductDao productDao;

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	//查询各个一级分类对应的8个商品
	public List<List<Product>> findByCategory(List<Category> clist) {
		List<List<Product>> plist = new ArrayList<List<Product>>();
		for(int i=0; i<clist.size(); i++) {
			List<Product> list = productDao.findByCategory(clist.get(i).getCid());
			plist.add(list);
		}
		return plist;
	}
	
	
	//根据一级分类查询分页商品
	public PageBean<Product> findProductByCid(Integer cid, Integer page, String style, String sort) {
		PageBean<Product> pageBean = new PageBean<Product>();		//创建一个分页类
		pageBean.setPage(page);		//设置当前页数
		Integer limit = 20;
		Integer totalCount = productDao.findCountByCid(cid);
		Integer totalPage = null;
		if(totalCount%limit!=0) {
			totalPage = totalCount / limit + 1;
		} else {
			totalPage = totalCount / limit;
		}
		Integer begin = (page-1) * limit;
		List<Product> list = productDao.findProductByCid(cid, begin, limit, style, sort);
		pageBean.setLimit(limit);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		
		return pageBean;
	}
	
	//根据二级分类查询该分类下的分页商品
	public PageBean<Product> findProductByCsid(Integer csid, Integer page, String style, String sort) {
		PageBean<Product> pageBean = new PageBean<Product>();		//创建一个分页类
		pageBean.setPage(page);		//设置当前页数
		Integer limit = 20;
		Integer totalCount = productDao.findCountByCsid(csid);
		Integer totalPage = null;
		if(totalCount%limit!=0) {
			totalPage = totalCount / limit + 1;
		} else {
			totalPage = totalCount / limit;
		}
		Integer begin = (page-1) * limit;
		List<Product> list = productDao.findProductByCsid(csid, begin, limit, style, sort);
		pageBean.setLimit(limit);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		
		return pageBean;
	}

	//根据关键字查询所有的商品
	public PageBean<Product> findProductByKeyword(String keyword, Integer page, String style, String sort) {
		PageBean<Product> pageBean = new PageBean<Product>();
		Integer limit = 20;
		Integer totalCount = productDao.findCountByKeyword(keyword);
		Integer totalPage = null;
		if(totalCount%limit!=0) {
			totalPage = totalCount / limit + 1;
		} else {
			totalPage = totalCount / limit;
		}
		Integer begin = (page-1)*limit;
		List<Product> list = productDao.findProductByKeyword(keyword, begin, limit, style, sort);
		pageBean.setLimit(limit);
		pageBean.setPage(page);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		return pageBean;
	}

	//查询商品放大镜内的图片
	public List<Show> findShowByPid(Integer pid) {
		return productDao.findShowByPid(pid);
	}

	//查询指定对象
	public Product findProduct(Integer pid) {
		return productDao.findProduct(pid);
	}

	//查询相关的3个商品
	public List<Product> findAboutProduct(Integer csid, Integer pid) {
		List<Product> list = productDao.findAboutProduct(csid);
		List<Product> glist = new ArrayList<Product>();
		Random random = new Random();
		int num = 0;
		for(int i=0; i<list.size(); i++) {
			int ran = random.nextInt(list.size());
			Product product = list.get(ran);
			Boolean flag = true;
			for(Product p : glist) {
				if(p.getPid()==product.getPid()) {
					flag = false;
				}
			}
			if(product.getPid()!=pid&&flag == true) {
				glist.add(product);
				num++;
				if(num==3) {
					break;
				}
			}
		}		
		return glist;
	}

	//查询商品详情的图片
	public List<Detail> findDetailByPid(Integer pid) {
		return productDao.findDetailByPid(pid);
	}

	//查询商品的评论
	public PageBean<Comment> findCommentByPid(Integer pid, Integer page) {
		PageBean<Comment> pageBean = new PageBean<Comment>();
		Integer limit = 10;
		Integer totalCount = productDao.findCountByPid(pid);
		Integer totalPage = null;
		if(totalCount%limit!=0) {
			totalPage = totalCount / limit + 1;
		} else {
			totalPage = totalCount / limit;
		}
		Integer begin = (page-1)*limit;
		List<Comment> list = productDao.findCommentByPid(pid, begin, limit);
		
		
		pageBean.setLimit(limit);
		pageBean.setPage(page);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		if(list!=null&&list.size()>0) {
			pageBean.setList(list);
		} else {
			return null;
		}
		return pageBean;
	}

	//查询某个商品评论的记录数
	public Integer findCountByPid(Integer pid) {
		return productDao.findCountByPid(pid);
	}

	//查询指定商品是否 被收藏
	public Collection findCollectionByPid(User user, Integer pid) {
		return productDao.findCollectionByPid(user.getUid(), pid);
	}
}
