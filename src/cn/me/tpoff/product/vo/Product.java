package cn.me.tpoff.product.vo;

import java.util.Date;

import cn.me.tpoff.categorysecond.vo.CategorySecond;


/**
 * 具体的商品类
 * @author 严杨鸿
 *
 */

public class Product {
	private Integer pid;					//商品id
	private CategorySecond categorySecond;	//二级分类id
	private String pname;					//商品名称
	private Double price;	//价格
	private Integer least;	//起订量
	private String unit;	//计量单位
	private String function;	//功效
	private Date pdate;		//上架时间
	private Integer salecount;	//销量
	private String pimg;	//商品列表时的展示图片
	private Integer ucount;	//有多少用户购买
	private Integer state;	//1 上架   0 下架
	
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public CategorySecond getCategorySecond() {
		return categorySecond;
	}
	public void setCategorySecond(CategorySecond categorySecond) {
		this.categorySecond = categorySecond;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getLeast() {
		return least;
	}
	public void setLeast(Integer least) {
		this.least = least;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getFunction() {
		return function;
	}
	public void setFunction(String function) {
		this.function = function;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public Integer getSalecount() {
		return salecount;
	}
	public void setSalecount(Integer salecount) {
		this.salecount = salecount;
	}
	public String getPimg() {
		return pimg;
	}
	public void setPimg(String pimg) {
		this.pimg = pimg;
	}
	public Integer getUcount() {
		return ucount;
	}
	public void setUcount(Integer ucount) {
		this.ucount = ucount;
	}
}
