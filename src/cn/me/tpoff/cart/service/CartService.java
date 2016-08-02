package cn.me.tpoff.cart.service;

import java.util.HashSet;
import java.util.Set;

import org.springframework.transaction.annotation.Transactional;

import cn.me.tpoff.address.vo.Address;
import cn.me.tpoff.cart.dao.CartDao;
import cn.me.tpoff.cart.vo.Cart;
import cn.me.tpoff.cartitem.vo.CartItem;
import cn.me.tpoff.product.dao.ProductDao;
import cn.me.tpoff.product.vo.Product;
import cn.me.tpoff.user.vo.User;

/**
 * 购物车Service
 * @author 严杨鸿
 *
 */

@Transactional
public class CartService {
	private CartDao cartDao;
	private ProductDao productDao;
	
	public ProductDao getProductDao() {
		return productDao;
	}
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	public CartDao getCartDao() {
		return cartDao;
	}
	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	
	//加入购物车
	public Integer addToCart(Integer pid, Integer subcount, User user) {
		Boolean flag = true;
		Double total = 0.0;	//购物车总金额
		Integer count = 0;	//购物车总数量
		Product product = productDao.findProduct(pid);	//添加的商品
		Double subtotal = product.getPrice() * subcount;
		
		Cart cart = cartDao.hasCart(user.getUid());
		if(cart==null) {
			cart = new Cart();
		}
		Set<CartItem> cartItems = cart.getCartItems();
		if(cartItems==null) {
			cartItems = new HashSet<CartItem>();
			CartItem _cartItem = new CartItem();		//创建购物车项
			_cartItem.setProduct(product);
			_cartItem.setSubcount(subcount);
			_cartItem.setSubtotal(subtotal);
			cartItems.add(_cartItem);
			total = total + subtotal;
			count = count + subcount;
		} else {
			for(CartItem cm : cartItems) {
				if(product.getPid()==cm.getProduct().getPid()) {
					Integer _subcount = cm.getSubcount() + subcount;
					Double _subtotal = cm.getSubtotal() + subtotal;
					cm.setSubcount(_subcount);
					cm.setSubtotal(_subtotal);
					total = total + _subtotal;
					count = count + _subcount;
					flag = false;
				} else {
					total = total + cm.getSubtotal();
					count = count + cm.getSubcount();
				}
			}
			if(flag) {
				CartItem _cartItem = new CartItem();		//创建购物车项
				_cartItem.setProduct(product);
				_cartItem.setSubcount(subcount);
				_cartItem.setSubtotal(subtotal);
				cartItems.add(_cartItem);
				total = total + subtotal;
				count = count + subcount;
			}
		}
		cart.setCartItems(cartItems);
		cart.setCount(count);
		cart.setTotal(total);
		cart.setUser(user);
		
		cartDao.addToCart(cart);
		return count;
	}
	
	//根据用户查询购物车
	public Cart findCartByUid(User user) {
		return cartDao.findCartByUid(user.getUid());
	}
	
	//购物车中添加数量
	public void add(User user, Integer pid) {
		Cart cart = cartDao.findCartByUid(user.getUid());
		Set<CartItem> cartItems = cart.getCartItems();
		Double price = null;
		Integer count = null;
		Double total = null;
		for(CartItem c : cartItems) {
			if(c.getProduct().getPid()==pid) {
				c.setSubcount(c.getSubcount()+1);
				c.setSubtotal(c.getSubtotal()+c.getProduct().getPrice());
				price = c.getProduct().getPrice();
				break;
			}
		}
		
		count = cart.getCount() + 1;
		total = cart.getTotal() + price;
		cart.setTotal(total);
		cart.setCount(count);
	}
	
	//购物车中减少数量
	public void less(User user, Integer pid) {
		Cart cart = cartDao.findCartByUid(user.getUid());
		Set<CartItem> cartItems = cart.getCartItems();
		Double price = null;
		Integer count = null;
		Double total = null;
		for(CartItem c : cartItems) {
			if(c.getProduct().getPid()==pid) {
				c.setSubcount(c.getSubcount()-1);
				c.setSubtotal(c.getSubtotal()-c.getProduct().getPrice());
				price = c.getProduct().getPrice();
				break;
			}
		}
		
		count = cart.getCount() - 1;
		total = cart.getTotal() - price;
		cart.setTotal(total);
		cart.setCount(count);
	}
	
	//删除购物车中的指定商品
	public void deleteProductFromCart(User user, Integer pid) {
		Cart cart = cartDao.findCartByUid(user.getUid());
		Set<CartItem> cartItems = cart.getCartItems();
		CartItem cm = null;
		for(CartItem c : cartItems) {
			if(c.getProduct().getPid()==pid) {
				cart.setCount(cart.getCount()-c.getSubcount());
				cart.setTotal(cart.getTotal()-c.getSubtotal());
				cm = c;
				break;
			}
		}
		cart.getCartItems().remove(cm);
		cm.setCart(null);
		cartDao.deleteProductFromCart(cart, cm);
	}
	
	//添加地址
	public void addAddr(User user, String receiver, String phone, String addr) {
		Address address = new Address();
		address.setAddr(addr);
		address.setPhone(phone);
		address.setReceiver(receiver);
		address.setState(0);
		address.setUser(user);
		cartDao.addAddr(address);
	}
}
