package cn.me.tpoff.user.vo;

import java.util.Date;

/**
 * 具体的用户类
 * @author 严杨鸿
 *
 */

public class User {
	
	private Integer uid;		//用户id
	private String username;	//用户名
	private String password;	//密码
	private String realname;	//实名
	private String gender;		//性别
	private String province;	//省份
	private Date regtime;		//注册时间
	private String upath;		//头像路径
	private String phone;		//手机号码
	private String pcode;		//手机号码验证码
	private String email;		//邮箱
	private String ecode;		//邮箱验证码
	private Integer state;		//激活状态
	
	
	public User() {
		
	}
	
	
	public User(Integer uid, String upath) {
		this.uid = uid;
		this.upath = upath;
	}


	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public Date getRegtime() {
		return regtime;
	}
	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	}
	public String getUpath() {
		return upath;
	}
	public void setUpath(String upath) {
		this.upath = upath;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEcode() {
		return ecode;
	}
	public void setEcode(String ecode) {
		this.ecode = ecode;
	}
}
