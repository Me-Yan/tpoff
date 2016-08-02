package cn.me.tpoff.user.service;

import java.util.Date;
import java.util.Random;

import org.springframework.transaction.annotation.Transactional;

import cn.me.tpoff.user.dao.UserDao;
import cn.me.tpoff.user.vo.User;
import cn.me.tpoff.utils.MailUtils;
import cn.me.tpoff.utils.UUIDUtils;

/**
 * 用户Service层
 * @author 严杨鸿
 *
 */

@Transactional
public class UserService {
	private UserDao userDao;
	
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	
	//登录
	public User login(User user) {		
		return userDao.login(user);
	}
	
	//查询用户名是否已经被注册
	public User findByUsername(User user) {
		return userDao.findByUsername(user);
	}
	
	//用户注册
	public void save(User user) {
		String ecode = UUIDUtils.getUUID() + UUIDUtils.getUUID();
		user.setEcode(ecode);
		user.setState(0);
		user.setRegtime(new Date());
		if(user.getUpath()==null){
			user.setUpath("images/headImg/headImg.png");
		}
		userDao.save(user);
		MailUtils.sendMail(user.getEmail(), ecode);
	}
	
	//检测邮箱是否被使用
	public User findByEmail(User user) {
		return userDao.findByEmail(user);
	}
	
	//查询需要被激活账号的信息
	public User findByEcode(User user) {
		return userDao.findByEcode(user);
	}
	
	//修改被激活账号的信息
	public void update(User existUser) {
		userDao.update(existUser);
	}
	
	//修改用户信息
	public void editUser(User user) {
		userDao.editUser(user);
	}

}
