package cn.me.tpoff.user.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.me.tpoff.user.vo.User;

/**
 * 用户操作Dao层
 * @author 严杨鸿
 *
 */


public class UserDao extends HibernateDaoSupport {
	
	//登录
	public User login(User user) {
		String hql = "from User where username = ? and password = ?";
		List<User> list = this.getHibernateTemplate().find(hql, user.getUsername(), user.getPassword());
		if(list!=null && list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	
	//查询用户名是否已经被注册
	public User findByUsername(User user) {
		String hql = "from User where username = ?";
		List<User> list = this.getHibernateTemplate().find(hql, user.getUsername());
		if(list!=null && list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	
	//用户注册
	public void save(User user) {
		this.getHibernateTemplate().save(user);		
	}

	//检测邮箱是否被使用
	public User findByEmail(User user) {
		String hql = "from User where email = ?";
		List<User> list = this.getHibernateTemplate().find(hql, user.getEmail());
		if(list!=null && list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	
	//查询需要被激活账号的信息
	public User findByEcode(User user) {
		String hql = "from User where email = ? and ecode = ?";
		List<User> list = this.getHibernateTemplate().find(hql, user.getEmail(), user.getEcode());
		if(list!=null && list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	
	//修改被激活账号的信息
	public void update(User existUser) {
		this.getHibernateTemplate().update(existUser);
	}

	//修改用户信息
	public void editUser(User user) {
		this.getHibernateTemplate().update(user);
	}


}
