package cn.me.tpoff.admin.categorysecond.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.me.tpoff.category.vo.Category;
import cn.me.tpoff.categorysecond.vo.CategorySecond;

/**
 * 后台二级分类Dao
 * @author 严杨鸿
 *
 */

public class AdminCategorySecondDao extends HibernateDaoSupport {
	
	//查询所有的一级分类
	public List<Category> findCategoryList() {
		String hql = "from Category c order by cid asc";
		List<Category> list = this.getHibernateTemplate().find(hql);
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	//添加二级分类
	public void categorySecondAdd(CategorySecond categorySecond) {
		this.getHibernateTemplate().save(categorySecond);
	}

	//修改二级分类
	public void categorySecondEdit(CategorySecond categorySecond) {
		this.getHibernateTemplate().update(categorySecond);
	}

	//根据二级分类csid查询商品
	public Integer findProductCount(Integer csid) {
		String hql = "select count(*) from Product p where p.categorySecond.csid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql, csid);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	//删除二级分类
	public void categorySecondDelete(CategorySecond categorySecond) {
		this.getHibernateTemplate().delete(categorySecond);
	}

}
