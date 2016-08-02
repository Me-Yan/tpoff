package cn.me.tpoff.admin.index.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.me.tpoff.order.vo.Order;
import cn.me.tpoff.user.vo.User;
import cn.me.tpoff.utils.PageHibernateCallback;

/**
 * 主页数据Dao
 * @author 严杨鸿
 *
 */

public class AdminIndexDao extends HibernateDaoSupport {

	//用户注册量
	public Integer findUserCount() {
		String hql = "select count(*) from User";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return null;
	}
	
	//订单数量
	public Integer findOrderCount() {
		String hql = "select count(*) from Order";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return null;
	}

	//交易成功量
	public Integer findOrderSuccessCount() {
		//0 已取消 1 未付款 2 等待发货 3等待收货4 交易成功
		String hql = "select count(*) from Order o where o.state = 4";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return null;
	}

	//成功交易额
	public Double findTurnOver() {
		String hql = "select round(sum(o.total),2) from Order o where o.state=4";
		List<Double> list = this.getHibernateTemplate().find(hql);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	//最近注册用户
	public List<User> findUserList() {
		String hql = "from User order by regtime desc";
		List<User> list = this.getHibernateTemplate().execute(new PageHibernateCallback<User>(hql, new Object[]{}, 0, 10));
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	//最近成功交易
	public List<Order> findOrderSuccessList() {
		String hql = "from Order o where o.state = 4 order by odate desc";
		List<Order> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Order>(hql, new Object[]{}, 0, 5));
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

}
