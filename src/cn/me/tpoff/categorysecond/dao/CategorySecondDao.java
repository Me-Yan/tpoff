package cn.me.tpoff.categorysecond.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.me.tpoff.category.vo.Category;
import cn.me.tpoff.categorysecond.vo.CategorySecond;

/**
 * 二级分类Dao
 * @author 严杨鸿
 *
 */

public class CategorySecondDao extends HibernateDaoSupport {
	
	//根据指定csid查询对应的对象
	public CategorySecond findByCsid(Integer csid) {
		String hql = "from CategorySecond cs where cs.csid = ?";
		List<CategorySecond> list = this.getHibernateTemplate().find(hql, csid);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
}
