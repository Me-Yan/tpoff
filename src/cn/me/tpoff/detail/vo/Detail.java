package cn.me.tpoff.detail.vo;

import cn.me.tpoff.product.vo.Product;

/**
 * 商品详情中的图片
 * @author 严杨鸿
 *
 */

public class Detail {
	private Integer pdid;	
	private String pdpath;
	private Product product;
	
	public Integer getPdid() {
		return pdid;
	}
	public void setPdid(Integer pdid) {
		this.pdid = pdid;
	}
	public String getPdpath() {
		return pdpath;
	}
	public void setPdpath(String pdpath) {
		this.pdpath = pdpath;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
}
