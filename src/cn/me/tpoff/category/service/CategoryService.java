package cn.me.tpoff.category.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.me.tpoff.category.dao.CategoryDao;
import cn.me.tpoff.category.vo.Category;
import cn.me.tpoff.categorysecond.vo.CategorySecond;


/**
 * 一级分类service层
 * @author 严杨鸿
 *
 */


@Transactional
public class CategoryService {
	private CategoryDao categoryDao;

	public CategoryDao getCategoryDao() {
		return categoryDao;
	}

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}
	
	//查询所有一级分类
	public List<Category> findAll() {
		return categoryDao.findAll();
	}
	
	//根据指定cid查询对应的对象
	public Category findByCid(Integer cid) {
		return categoryDao.findByCid(cid);
	}
	
}
