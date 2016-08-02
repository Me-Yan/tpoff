package cn.me.tpoff.show.vo;

import cn.me.tpoff.product.vo.Product;

/**
 * 具体商品放大镜图片
 * @author 严杨鸿
 *
 */

public class Show {
	private Integer sid;	
	private String pspath;
	private Product product;
	
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getPspath() {
		return pspath;
	}
	public void setPspath(String pspath) {
		this.pspath = pspath;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
}
