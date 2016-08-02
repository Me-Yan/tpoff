package cn.me.tpoff.cart.vo;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import cn.me.tpoff.cartitem.vo.CartItem;
import cn.me.tpoff.user.vo.User;

/**
 * 购物车
 * @author 严杨鸿
 *
 */

public class Cart {
	private Integer cid;		//id
	private Double total;		//总金额
	private User user;			//绑定用户
	private Integer count;	//总数量
	private Set<CartItem> cartItems = new HashSet<CartItem>();	//购物车项集合
	
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Set<CartItem> getCartItems() {
		return cartItems;
	}
	public void setCartItems(Set<CartItem> cartItems) {
		this.cartItems = cartItems;
	}
}
