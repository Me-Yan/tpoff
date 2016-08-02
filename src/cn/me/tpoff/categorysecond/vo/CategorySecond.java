package cn.me.tpoff.categorysecond.vo;

import cn.me.tpoff.category.vo.Category;

/**
 * 二级分类
 * @author 严杨鸿
 *
 */

public class CategorySecond {
	private Integer csid;		//id
	private String csname;		//二级分类名称
	private Category category;	//所属一级分类
	
	
	public Integer getCsid() {
		return csid;
	}
	public void setCsid(Integer csid) {
		this.csid = csid;
	}
	public String getCsname() {
		return csname;
	}
	public void setCsname(String csname) {
		this.csname = csname;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
}
