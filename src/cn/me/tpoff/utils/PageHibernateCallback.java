package cn.me.tpoff.utils;

import java.sql.SQLException;
import java.util.List;



import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

/**
 * 分页
 * @author 严杨鸿
 *
 * @param <T>
 */

public class PageHibernateCallback<T> implements HibernateCallback<List<T>> {
	private String hql;				//查询语句
	private Object[] params;		//传递的参数
	private Integer startIndex;		//查询的起始位置
	private Integer pageSize;		//分页大小
	
	
	public PageHibernateCallback(String hql, Object[] params,
			Integer startIndex, Integer pageSize) {
		super();
		this.hql = hql;
		this.params = params;
		this.startIndex = startIndex;
		this.pageSize = pageSize;
	}


	@Override
	public List<T> doInHibernate(Session session) throws HibernateException,
			SQLException {
		Query query = session.createQuery(hql);
		for (int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
		
		query.setFirstResult(startIndex);
		query.setMaxResults(pageSize);
		return query.list();
	}
	
}
