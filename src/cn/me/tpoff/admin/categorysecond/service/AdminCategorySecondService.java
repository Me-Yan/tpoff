package cn.me.tpoff.admin.categorysecond.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.me.tpoff.admin.categorysecond.dao.AdminCategorySecondDao;
import cn.me.tpoff.category.vo.Category;
import cn.me.tpoff.categorysecond.vo.CategorySecond;

/**
 * 后台二级分类Service
 * @author 严杨鸿
 *
 */

@Transactional
public class AdminCategorySecondService {
	private AdminCategorySecondDao adminCategorySecondDao;

	public AdminCategorySecondDao getAdminCategorySecondDao() {
		return adminCategorySecondDao;
	}
	public void setAdminCategorySecondDao(
			AdminCategorySecondDao adminCategorySecondDao) {
		this.adminCategorySecondDao = adminCategorySecondDao;
	}
	
	//查询所有的一级分类
	public List<Category> findCategoryList() {
		return adminCategorySecondDao.findCategoryList();
	}
	
	//添加二级分类
	public Integer categorySecondAdd(CategorySecond categorySecond) {
		CategorySecond cs = categorySecond;
		adminCategorySecondDao.categorySecondAdd(cs);
		return cs.getCsid();
	}
	
	//修改二级分类
	public void categorySecondEdit(CategorySecond categorySecond) {
		adminCategorySecondDao.categorySecondEdit(categorySecond);
	}
	
	//根据二级分类csid查询商品
	public Integer findProductCount(Integer csid) {
		return adminCategorySecondDao.findProductCount(csid);
	}
	
	//删除二级分类
	public void categorySecondDelete(CategorySecond categorySecond) {
		adminCategorySecondDao.categorySecondDelete(categorySecond);
	}
}
