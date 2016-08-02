package cn.me.tpoff.admin.user.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;


import org.apache.struts2.ServletActionContext;

import cn.me.tpoff.admin.user.service.AdminUserService;
import cn.me.tpoff.admin.user.vo.AdminUser;
import cn.me.tpoff.user.vo.User;
import cn.me.tpoff.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 后台管理人员Action
 * @author 严杨鸿
 *
 */

public class AdminUserAction extends ActionSupport implements ModelDriven<AdminUser> {
	private AdminUser adminUser = new AdminUser();
	private AdminUserService adminUserService;
	private Integer page;
	
	private String oldPwd;	//旧密码
	private String newPwd;	//新密码
	
	//前台用户
	private Integer uid;
	private String username;
	private String pwd;
	private String realname;
	private String gender;
	private String province;
	private String phone;
	private String email;
	private Integer state;
	
	private Integer add;
	private Integer edit;
	private Integer delete;
	
	
	public Integer getAdd() {
		return add;
	}
	public void setAdd(Integer add) {
		this.add = add;
	}
	public Integer getEdit() {
		return edit;
	}
	public void setEdit(Integer edit) {
		this.edit = edit;
	}
	public Integer getDelete() {
		return delete;
	}
	public void setDelete(Integer delete) {
		this.delete = delete;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public String getOldPwd() {
		return oldPwd;
	}
	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}
	public String getNewPwd() {
		return newPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	public AdminUserService getAdminUserService() {
		return adminUserService;
	}
	public void setAdminUserService(AdminUserService adminUserService) {
		this.adminUserService = adminUserService;
	}
	@Override
	public AdminUser getModel() {
		return adminUser;
	}
	
	//登录
	public String login() {
		AdminUser existAdminUser = adminUserService.findAdminUser(adminUser);
		ActionContext.getContext().getSession().clear();
		if(existAdminUser==null) {
			ActionContext.getContext().getSession().put("errorMessage", "用户名不存在或密码错误！");
			return "fail";
		} else {
			ActionContext.getContext().getSession().put("adminUser", existAdminUser);
			return SUCCESS;
		}
	}
	
	//退出
	public String logout() {
		ActionContext.getContext().getSession().clear();
		return "logout";
	}
	
	//跳转到修改密码页面
	public String editPwdPage() {
		return "editPwdPage";
	}
	
	//修改密码
	public String editPassword() {
		AdminUser existAdminUser = (AdminUser) ActionContext.getContext().getSession().get("adminUser");
		if(existAdminUser.getPassword().equals(oldPwd)) {
			existAdminUser.setPassword(newPwd);
			adminUserService.editPassword(existAdminUser);
			return "editSuccess";
		} else {
			ActionContext.getContext().getSession().put("errorFail", "密码错误！");
			return "editFail";
		}
	}
	
	//用户列表
	public String userPage() {
		if(add==null) {
			ActionContext.getContext().getSession().remove("addSuccess");			
		}
		if(delete==null) {
			ActionContext.getContext().getSession().remove("deleteSuccess");
		}
		if(edit==null) {
			ActionContext.getContext().getSession().remove("editSuccess");
		}
		
		if(page==null) {
			page = 1;
		}
		PageBean<User> pageBean = adminUserService.findUserList(page);
		if(pageBean.getList()!=null&&pageBean.getList().size()>0) {
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		}
		
		return "userPage";
	}
	
	//添加用户
	public String addUser() {
		ActionContext.getContext().getSession().remove("addSuccess");
		ActionContext.getContext().getSession().put("addSuccess", "添加成功！");
		adminUserService.addUser(username, pwd, realname, gender, province, phone, email, state);
		
		return "addUser";
	}
	
	//删除用户
	public String deleteUser() {
		ActionContext.getContext().getSession().remove("deleteSuccess");
		adminUserService.deleteUser(uid);
		ActionContext.getContext().getSession().put("deleteSuccess", "删除成功！");
		return "deleteUser";
	}
	
	//编辑用户
	public String editUser() {
		ActionContext.getContext().getSession().remove("editSuccess");
		adminUserService.editUser(uid, username, pwd, realname, gender, province, phone, email, state);
		ActionContext.getContext().getSession().put("editSuccess", "修改成功！");
		
		
		return "editUser";
	}
	
	//头像列表
	public String headImgPage() {
		if(page==null) {
			page = 1;
		}
		PageBean<User> pageBean = adminUserService.findHeadImgList(page);
		if(pageBean.getList()!=null&&pageBean.getList().size()>0){
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		}
		
		return "headImgPage";
	}
	
	//设置默认头像
	public String setDefaultHeadImg() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		User user = adminUserService.findUser(uid);
		String oldPath = ServletActionContext.getServletContext().getRealPath(user.getUpath());
		System.out.println(oldPath);
		if(!oldPath.contains("images\\headImg\\headImg.png")) {
			File file = new File(oldPath);
			file.delete();
			adminUserService.setDefaultHeadImg(user);
		}
		
		out.print("images/headImg/headImg.png");
		out.flush();
		out.close();
		
		return NONE;
	}
}
