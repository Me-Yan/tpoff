package cn.me.tpoff.admin.user.service;

import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Transactional;

import com.sun.mail.imap.protocol.UID;

import cn.me.tpoff.admin.user.dao.AdminUserDao;
import cn.me.tpoff.admin.user.vo.AdminUser;
import cn.me.tpoff.user.vo.User;
import cn.me.tpoff.utils.PageBean;

/**
 * 后台管理人员Service
 * @author 严杨鸿
 *
 */

@Transactional
public class AdminUserService {
	private AdminUserDao adminUserDao;

	public AdminUserDao getAdminUserDao() {
		return adminUserDao;
	}
	public void setAdminUserDao(AdminUserDao adminUserDao) {
		this.adminUserDao = adminUserDao;
	}
	
	//管理人员登录
	public AdminUser findAdminUser(AdminUser adminUser) {
		return adminUserDao.findAdminUser(adminUser);
	}
	
	//密码修改成功
	public void editPassword(AdminUser existAdminUser) {
		adminUserDao.editPassword(existAdminUser);
	}
	
	//用户列表
	public PageBean<User> findUserList(Integer page) {
		PageBean<User> pageBean = new PageBean<User>();
		Integer limit = 15;
		Integer totalCount = null;
		Integer totalPage = null;
		totalCount = adminUserDao.findUserCount();
		if(totalCount%limit!=0) {
			totalPage = totalCount / limit + 1;
		} else {
			totalPage = totalCount / limit;
		}
		Integer begin = (page-1) * limit;
		List<User> list = adminUserDao.findUserList(limit, begin);
		
		pageBean.setLimit(limit);
		pageBean.setList(list);
		pageBean.setPage(page);
		pageBean.setTotalPage(totalPage);
		pageBean.setTotalCount(totalCount);
		
		return pageBean;
	}
	
	//添加用户
	public void addUser(String username, String pwd, String realname, String gender, String province, String phone, String email, Integer state) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(pwd);
		user.setRealname(realname);
		user.setGender(gender);
		user.setProvince(province);
		user.setPhone(phone);
		user.setEmail(email);
		user.setState(state);
		user.setUpath("images/headImg/headImg.png");
		user.setRegtime(new Date());
		adminUserDao.addUser(user);
	}
	
	//删除用户
	public void deleteUser(Integer uid) {
		User user = adminUserDao.findUser(uid);
		adminUserDao.deleteUser(user);
	}
	
	//根据id查询用户
	public void editUser(Integer uid, String username, String pwd, String realname, String gender, String province, String phone, String email, Integer state) {
		User user = adminUserDao.findUser(uid);
		user.setUsername(username);
		if(pwd!=null) {
			user.setPassword(pwd);
		}
		user.setRealname(realname);
		user.setGender(gender);
		user.setProvince(province);
		user.setPhone(phone);
		user.setEmail(email);
		user.setState(state);
		adminUserDao.editUser(user);
	}
	
	//头像列表
	public PageBean<User> findHeadImgList(Integer page) {
		PageBean<User> pageBean = new PageBean<User>();
		Integer limit = 40;
		Integer totalCount = null;
		Integer totalPage = null;
		totalCount = adminUserDao.findHeadImgCount();
		if(totalCount%limit!=0) {
			totalPage = totalCount / limit + 1;
		} else {
			totalPage = totalCount / limit;
		}
		Integer begin = (page-1) * limit;
		List<User> list = adminUserDao.findHeadImgList(begin, limit);
		
		pageBean.setLimit(limit);
		pageBean.setPage(page);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		return pageBean;
	}
	
	//根绝id查询用户
	public User findUser(Integer uid) {
		return adminUserDao.findUser(uid);
	}
	
	//设置默认头像
	public void setDefaultHeadImg(User user) {
		user.setUpath("images/headImg/headImg.png");
		adminUserDao.setDefaultHeadImg(user);
	}
	
	
}
