package cn.me.tpoff.category.vo;



import java.util.HashSet;
import java.util.Set;

import cn.me.tpoff.categorysecond.vo.CategorySecond;


/**
 * 具体的一级分类
 * @author 严杨鸿
 *
 */

public class Category {
	private Integer cid;
	private String cname;
	private Set<CategorySecond> categorySeconds = new HashSet<CategorySecond>();
	
	
	
	public Set<CategorySecond> getCategorySeconds() {
		return categorySeconds;
	}
	public void setCategorySeconds(Set<CategorySecond> categorySeconds) {
		this.categorySeconds = categorySeconds;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	
	
}
