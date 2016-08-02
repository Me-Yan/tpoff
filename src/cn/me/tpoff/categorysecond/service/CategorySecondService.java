package cn.me.tpoff.categorysecond.service;

import org.springframework.transaction.annotation.Transactional;

import cn.me.tpoff.categorysecond.dao.CategorySecondDao;
import cn.me.tpoff.categorysecond.vo.CategorySecond;

/**
 * 二级分类Service
 * @author 严杨鸿
 *
 */

@Transactional
public class CategorySecondService {
	private CategorySecondDao categorySecondDao;
	
	public CategorySecondDao getCategorySecondDao() {
		return categorySecondDao;
	}
	public void setCategorySecondDao(CategorySecondDao categorySecondDao) {
		this.categorySecondDao = categorySecondDao;
	}
	
	
	//根据指定csid查询对应的对象
	public CategorySecond findByCsid(Integer csid) {
		return categorySecondDao.findByCsid(csid);
	}
}
