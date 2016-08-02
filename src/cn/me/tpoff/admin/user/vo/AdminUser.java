package cn.me.tpoff.admin.user.vo;

/**
 * 后台管理用户
 * @author 严杨鸿
 *
 */

public class AdminUser {
	private Integer id;
	private String name;
	private String password;
	private Integer permission;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPermission() {
		return permission;
	}
	public void setPermission(Integer permission) {
		this.permission = permission;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
