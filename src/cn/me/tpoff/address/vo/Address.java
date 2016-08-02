package cn.me.tpoff.address.vo;

import cn.me.tpoff.user.vo.User;

/**
 * 用户的收货地址
 * @author 严杨鸿
 *
 */

public class Address {
	private Integer aid;
	private String receiver;
	private String phone;
	private String addr;
	private Integer state;
	private User user;
	
	
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
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
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
