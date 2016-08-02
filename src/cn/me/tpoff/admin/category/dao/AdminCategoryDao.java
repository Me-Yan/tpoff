package cn.me.tpoff.admin.category.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.me.tpoff.category.vo.Category;

/**
 * 一级分类Dao
 * @author 严杨鸿
 *
 */

public class AdminCategoryDao extends HibernateDaoSupport {

	//查询所有一级分类
	public List<Category> findCategoryList() {
		String hql = "from Category order by cid asc";
		List<Category> list = this.getHibernateTemplate().find(hql);
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	//修改一级分类
	public void categoryEdit(Category category) {
		this.getHibernateTemplate().update(category);
	}

	//查询一级分类数量
	public Integer findCategoryCount() {
		String hql = "select count(*) from Category";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	//添加一级分类
	public void categoryAdd(Category category) {
		this.getHibernateTemplate().save(category);
	}

	//根据一级分类cid查询旗下的二级分类数量
	public Integer findCategorySecondCount(Integer cid) {
		String hql = "select count(*) from CategorySecond cs where cs.category.cid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql, cid);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	//查询一级分类下商品数量
	public Integer findProductCount(Integer cid) {
		String hql = "select count(*) from Product p where p.categorySecond.category.cid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql, cid);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	//删除一级分类
	public void categoryDelete(Category category) {
		this.getHibernateTemplate().delete(category);
	}

}
