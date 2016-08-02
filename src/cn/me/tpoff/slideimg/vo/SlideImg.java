package cn.me.tpoff.slideimg.vo;

import cn.me.tpoff.product.vo.Product;

/**
 * 轮播图片
 * @author 严杨鸿
 *
 */

public class SlideImg {
	private Integer sid;	//id
	private String spath;	//图片路径
	private Product product;	//绑定的商品
	private Integer flag;
	
	
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getSpath() {
		return spath;
	}
	public void setSpath(String spath) {
		this.spath = spath;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
}
