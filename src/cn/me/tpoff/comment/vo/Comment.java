package cn.me.tpoff.comment.vo;

import java.util.Date;

import cn.me.tpoff.product.vo.Product;
import cn.me.tpoff.user.vo.User;

/**
 * 商品评论
 * @author 严杨鸿
 *
 */

public class Comment {
	private Integer pcid;
	private String content;		//评论内容
	private String username;	//谁评论的
	private Date cdate;			//评论时间
	private Product product;	//被评论的商品
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getPcid() {
		return pcid;
	}
	public void setPcid(Integer pcid) {
		this.pcid = pcid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
}
