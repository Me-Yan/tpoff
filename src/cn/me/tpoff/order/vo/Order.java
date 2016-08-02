package cn.me.tpoff.order.vo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import cn.me.tpoff.address.vo.Address;
import cn.me.tpoff.orderitem.vo.OrderItem;
import cn.me.tpoff.user.vo.User;

/**
 * 订单
 * @author 严杨鸿
 *
 */

public class Order {
	private Integer oid;		//id
	private Double total;		//总金额
	private Integer count;		//购买量
	private Integer state;		//订单状态
	private Date odate;			//订单时间
	private String number;		//订单编号
	private User user;			//绑定用户
	private Double paytotal;	//付款金额
	private String receiver;	//收货人
	private String phone;		//联系电话
	private String addr;		//地址
	private Set<OrderItem> orderItems = new HashSet<OrderItem>();	//订单项集合
	private Integer flag;		//所购买的商品是否被全部评论
	
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Double getPaytotal() {
		return paytotal;
	}
	public void setPaytotal(Double paytotal) {
		this.paytotal = paytotal;
	}
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Date getOdate() {
		return odate;
	}
	public void setOdate(Date odate) {
		this.odate = odate;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<OrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
}
