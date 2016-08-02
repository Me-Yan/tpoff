package cn.me.tpoff.order.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.me.tpoff.cart.vo.Cart;
import cn.me.tpoff.comment.vo.Comment;
import cn.me.tpoff.order.vo.Order;
import cn.me.tpoff.orderitem.vo.OrderItem;
import cn.me.tpoff.utils.PageHibernateCallback;

/**
 * 订单确认Dao
 * @author 严杨鸿
 *
 */

public class OrderDao extends HibernateDaoSupport {
	
	//提交订单
	public void submitOrder(Order order) {
		this.getHibernateTemplate().save(order);
	}
	
	//清空购物车
	public void clearCart(Cart cart) {
		this.getHibernateTemplate().delete(cart);
	}

	//查询订单分页数据
	public List<Order> findOrderByUid(Integer uid, Integer begin, Integer limit) {
		String hql = "from Order o where o.user.uid = ? order by odate desc";
		List<Order>	list = this.getHibernateTemplate().execute(new PageHibernateCallback<Order>(hql, new Object[]{uid}, begin, limit));
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	//查询用户订单总记录数
	public Integer findCountByUid(Integer uid) {
		String hql = "select count(*) from Order o where o.user.uid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql, uid);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return null;
	}

	//根据订单id查询订单
	public Order findOrderByOid(Integer oid) {
		String hql = "from Order o where o.oid = ?";
		List<Order> list = this.getHibernateTemplate().find(hql, oid);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	//提交评论
	public void submitComment(Comment comment) {
		this.getHibernateTemplate().save(comment);
	}

	//根据订单项id查询订单项
	public OrderItem findOrderItemByOmid(Integer omid) {
		String hql = "from OrderItem om where om.omid = ?";
		List<OrderItem> list = this.getHibernateTemplate().find(hql, omid);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}

}
