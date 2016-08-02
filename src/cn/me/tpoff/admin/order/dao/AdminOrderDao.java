package cn.me.tpoff.admin.order.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.me.tpoff.order.vo.Order;
import cn.me.tpoff.utils.PageHibernateCallback;

/**
 * 后台订单管理Dao
 * @author 严杨鸿
 *
 */

public class AdminOrderDao extends HibernateDaoSupport {

	//查询number或state条件的订单数量
	public Integer findOrderCount(String number, Integer state) {
		String hql = null;
		if(number!=null) {
			hql = "select count(*) from Order o where o.number = ?";
			List<Long> list = this.getHibernateTemplate().find(hql, number);
			if(list!=null&&list.size()>0) {
				return list.get(0).intValue();
			}
		} else if(state!=null) {
			hql = "select count(*) from Order o where o.state = ?";
			List<Long> list = this.getHibernateTemplate().find(hql, state);
			if(list!=null&&list.size()>0) {
				return list.get(0).intValue();
			}
		} else {
			hql = "select count(*) from Order";
			List<Long> list = this.getHibernateTemplate().find(hql);
			if(list!=null&&list.size()>0) {
				return list.get(0).intValue();
			}
		}
		return null;
	}

	//根据number或state查询订单分页数据
	public List<Order> findOrderList(String number, Integer state, Integer begin, Integer limit) {
		String hql = null;
		if(number!=null) {
			hql = "from Order o where o.number = ? order by odate desc";
			List<Order> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Order>(hql, new Object[]{number}, begin, limit));
			if(list!=null&&list.size()>0) {
				return list;
			}
		} else if(state!=null) {
			hql = "from Order o where o.state = ? order by odate desc";
			List<Order> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Order>(hql, new Object[]{state}, begin, limit));
			if(list!=null&&list.size()>0) {
				return list;
			}
		} else {
			hql = "from Order order by odate desc";
			List<Order> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Order>(hql, new Object[]{}, begin, limit));
			if(list!=null&&list.size()>0) {
				return list;
			}
		}
		return null;
	}

	//根据oid查询订单
	public Order findOrder(Integer oid) {
		String hql = "from Order o where o.oid = ?";
		List<Order> list = this.getHibernateTemplate().find(hql, oid);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	//确认发货
	public void sendGoods(Order order) {
		this.getHibernateTemplate().update(order);
	}

}
