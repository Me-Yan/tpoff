package cn.me.tpoff.cartitem.vo;

import cn.me.tpoff.cart.vo.Cart;
import cn.me.tpoff.product.vo.Product;


/**
 * 购物车项
 * @author 严杨鸿
 *
 */

public class CartItem {
	private Integer cmid;		//id
	private Product product;	//绑定的商品
	private Integer subcount;	//商品数量
	private Double subtotal;	//小计
	private Cart cart;			//绑定的购物车
	
	
	public Integer getCmid() {
		return cmid;
	}
	public void setCmid(Integer cmid) {
		this.cmid = cmid;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Integer getSubcount() {
		return subcount;
	}
	public void setSubcount(Integer subcount) {
		this.subcount = subcount;
	}
	public Double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
}
