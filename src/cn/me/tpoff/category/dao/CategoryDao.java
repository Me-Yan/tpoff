package cn.me.tpoff.category.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.me.tpoff.category.vo.Category;
import cn.me.tpoff.categorysecond.vo.CategorySecond;

/**
 * 一级分类Dao层
 * @author 严杨鸿
 *
 */

public class CategoryDao extends HibernateDaoSupport {
	
	//查询所有一级分类
	public List<Category> findAll() {
		String hql = "from Category";
		return this.getHibernateTemplate().find(hql);
	}
	
	//根据指定cid查询对应的对象
	public Category findByCid(Integer cid) {
		String hql = "from Category c where c.cid = ?";
		List<Category> list = this.getHibernateTemplate().find(hql, cid);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	
	

}
