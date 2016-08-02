package cn.me.tpoff.admin.category.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.me.tpoff.admin.category.dao.AdminCategoryDao;
import cn.me.tpoff.category.vo.Category;

/**
 * 一级分类Service
 * @author 严杨鸿
 *
 */

@Transactional
public class AdminCategoryService {
	private AdminCategoryDao adminCategoryDao;

	public AdminCategoryDao getAdminCategoryDao() {
		return adminCategoryDao;
	}
	public void setAdminCategoryDao(AdminCategoryDao adminCategoryDao) {
		this.adminCategoryDao = adminCategoryDao;
	}
	
	//查询所有一级分类
	public List<Category> findCategoryList() {
		return adminCategoryDao.findCategoryList();
	}
	
	//修改一级分类
	public void categoryEdit(Category category) {
		adminCategoryDao.categoryEdit(category);
	}
	
	//查询一级分类的数量
	public Integer findCategoryCount() {
		return adminCategoryDao.findCategoryCount();
	}
	
	//添加一级分类
	public void categoryAdd(Category category) {
		adminCategoryDao.categoryAdd(category);
	}
	
	//查询该一级分类下二级分类的数量
	public Integer findCategorySecondCount(Integer cid) {
		return adminCategoryDao.findCategorySecondCount(cid);
	}
	
	//查询一级分类下商品数量
	public Integer findProductCount(Integer cid) {
		return adminCategoryDao.findProductCount(cid);
	}
	
	//删除一级分类
	public void categoryDelete(Category category) {
		adminCategoryDao.categoryDelete(category);
	}
}
