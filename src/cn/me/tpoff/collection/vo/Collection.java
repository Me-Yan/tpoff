package cn.me.tpoff.collection.vo;


import java.util.Date;

import cn.me.tpoff.product.vo.Product;
import cn.me.tpoff.user.vo.User;

/**
 * 收藏
 * @author 严杨鸿
 *
 */

public class Collection {
	private Integer colid;
	private Product product;
	private Date coldate;
	private User user;
	
	public Integer getColid() {
		return colid;
	}
	public void setColid(Integer colid) {
		this.colid = colid;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Date getColdate() {
		return coldate;
	}
	public void setColdate(Date coldate) {
		this.coldate = coldate;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
