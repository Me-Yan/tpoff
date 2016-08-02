package cn.me.tpoff.cart.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.me.tpoff.address.vo.Address;
import cn.me.tpoff.cart.vo.Cart;
import cn.me.tpoff.cartitem.vo.CartItem;

/**
 * 购物车Dao
 * @author 严杨鸿
 *
 */

public class CartDao extends HibernateDaoSupport {
	//查询购物车项中是否存在数据
	public Cart hasCart(Integer uid) {
		String hql = "from Cart c where c.user.uid = ?";
		List<Cart> list = this.getHibernateTemplate().find(hql, uid);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	//添加到购物车
	public void addToCart(Cart cart) {
		this.getHibernateTemplate().saveOrUpdate(cart);
	}

	//根据指定uid查询购物车
	public Cart findCartByUid(Integer uid) {
		String hql = "from Cart c where c.user.uid = ?";
		List<Cart> list = this.getHibernateTemplate().find(hql, uid);
		if(list!=null&list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	//删除购物车中的指定商品
	public void deleteProductFromCart(Cart cart, CartItem cartItem) {
		this.getHibernateTemplate().update(cart);
		this.getHibernateTemplate().delete(cartItem);
	}

	//添加地址
	public void addAddr(Address address) {
		this.getHibernateTemplate().save(address);
	}

}
