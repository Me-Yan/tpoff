package cn.me.tpoff.orderitem.vo;

import cn.me.tpoff.order.vo.Order;
import cn.me.tpoff.product.vo.Product;

/**
 * 订单项
 * @author 严杨鸿
 *
 */

public class OrderItem {
	private Integer omid;		//id
	private Integer subcount;		//数量
	private Double subtotal;	//小计
	private Product product;	//商品
	private Order order;		//订单
	private Integer state;		//商品是否评论
	
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getOmid() {
		return omid;
	}
	public void setOmid(Integer omid) {
		this.omid = omid;
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
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
	
}
