package cn.me.tpoff.collection.service;

import java.util.Date;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.me.tpoff.collection.dao.CollectionDao;
import cn.me.tpoff.collection.vo.Collection;
import cn.me.tpoff.product.dao.ProductDao;
import cn.me.tpoff.product.vo.Product;
import cn.me.tpoff.user.vo.User;
import cn.me.tpoff.utils.PageBean;

/**
 * 收藏商品Service
 * @author 严杨鸿
 *
 */

@Transactional
public class CollectionService {
	private CollectionDao collectionDao;
	private ProductDao productDao;

	public ProductDao getProductDao() {
		return productDao;
	}
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	public CollectionDao getCollectionDao() {
		return collectionDao;
	}
	public void setCollectionDao(CollectionDao collectionDao) {
		this.collectionDao = collectionDao;
	}
	
	//查询被收藏的商品分页数据
	public PageBean<Collection> findCollectionByPage(User user, Integer page) {
		PageBean<Collection> pageBean = new PageBean<Collection>();
		Integer limit = 10;
		Integer totalCount = null;	//总记录数
		Integer totalPage = null;	//总页数
		
		totalCount = collectionDao.findCountByUid(user.getUid());
		if(totalCount%limit!=0) {
			totalPage = totalCount / limit + 1;
		} else {
			totalPage = totalCount / limit;
		}
		Integer begin = (page-1) * limit;
		List<Collection> list = collectionDao.findCollectionByUid(user.getUid(), begin, limit);
		
		pageBean.setLimit(limit);
		pageBean.setPage(page);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		return pageBean;
	}
	
	//收藏
	public void addToCollection(User user, Integer pid) {
		Collection collection = new  Collection();
		Product product = productDao.findProduct(pid);
		
		collection.setColdate(new Date());
		collection.setProduct(product);
		collection.setUser(user);
		collectionDao.addToCollection(collection);
		
	}
	
	//删除某个收藏
	public void deleteCollectionByColid(Integer colid) {
		Collection collection = collectionDao.findCollectionByColid(colid);
		collectionDao.deleteCollectionByColid(collection);
	}
	
	//查询三个收藏记录
	public PageBean<Collection> findRecentCollectionByUid(User user, Integer page) {
		PageBean<Collection> pageBean = new PageBean<Collection>();
		Integer limit = 5;
		Integer totalCount = null;	//总记录数
		Integer totalPage = null;	//总页数
		
		totalCount = collectionDao.findCountByUid(user.getUid());
		if(totalCount%limit!=0) {
			totalPage = totalCount / limit + 1;
		} else {
			totalPage = totalCount / limit;
		}
		Integer begin = (page-1) * limit;
		List<Collection> list = collectionDao.findCollectionByUid(user.getUid(), begin, limit);
		
		pageBean.setLimit(limit);
		pageBean.setPage(page);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		return pageBean;
	}
	
	
}
