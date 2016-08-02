package cn.me.tpoff.collection.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.me.tpoff.collection.vo.Collection;
import cn.me.tpoff.product.vo.Product;
import cn.me.tpoff.utils.PageHibernateCallback;

/**
 * 收藏商品Dao
 * @author 严杨鸿
 *
 */

public class CollectionDao extends HibernateDaoSupport {

	//查询收藏的记录数
	public Integer findCountByUid(Integer uid) {
		String hql ="select count(*) from Collection c where c.user.uid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql, uid);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return null;
	}

	//查询收藏进行分页
	public List<Collection> findCollectionByUid(Integer uid, Integer begin, Integer limit) {
		String hql = "from Collection c where c.user.uid = ? order by coldate";
		List<Collection> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Collection>(hql, new Object[]{uid}, begin, limit));
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	//收藏商品
	public void addToCollection(Collection collection) {
		this.getHibernateTemplate().save(collection);
	}
	
	//删除收藏
	public void deleteCollectionByColid(Collection collection) {
		this.getHibernateTemplate().delete(collection);
	}

	//根据colid查询收藏
	public Collection findCollectionByColid(Integer colid) {
		String hql = "from Collection c where c.colid = ?";
		List<Collection> list = this.getHibernateTemplate().find(hql, colid);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}

}
