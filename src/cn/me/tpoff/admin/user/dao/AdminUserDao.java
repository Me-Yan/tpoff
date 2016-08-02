package cn.me.tpoff.admin.user.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.me.tpoff.admin.user.vo.AdminUser;
import cn.me.tpoff.user.vo.User;
import cn.me.tpoff.utils.PageHibernateCallback;

/**
 * 后台管理人员Dao
 * @author 严杨鸿
 *
 */

public class AdminUserDao extends HibernateDaoSupport {
	
	//管理人员登录
	public AdminUser findAdminUser(AdminUser adminUser) {
		String hql = "from AdminUser au where au.name = ? and au.password = ?";
		List<AdminUser> list = this.getHibernateTemplate().find(hql, adminUser.getName(), adminUser.getPassword());
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	
	//修改密码
	public void editPassword(AdminUser existAdminUser) {
		this.getHibernateTemplate().update(existAdminUser);
	}

	//用户列表
	public List<User> findUserList() {
		String hql = "from User";
		List<User> list = this.getHibernateTemplate().find(hql);
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	//查询用户数量
	public Integer findUserCount() {
		String hql = "select count(*) from User";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return null;
	}

	//查询分页用户数据
	public List<User> findUserList(Integer limit, Integer begin) {
		String hql = "from User order by regtime desc";
		List<User>	list = this.getHibernateTemplate().execute(new PageHibernateCallback<User>(hql, new Object[]{}, begin, limit));
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	//添加用户
	public void addUser(User user) {
		this.getHibernateTemplate().save(user);
	}
	
	//根据id查询用户
	public User findUser(Integer uid) {
		String hql = "from User u where u.uid = ?";
		List<User> list = this.getHibernateTemplate().find(hql, uid);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	//删除用户
	public void deleteUser(User user) {
		this.getHibernateTemplate().delete(user);
	}

	//编辑用户
	public void editUser(User user) {
		this.getHibernateTemplate().update(user);
	}

	//查询头像列表分页
	public List<User> findHeadImgList(Integer begin, Integer limit) {
		String hql = "select new User(u.uid, u.upath) from User u order by regtime desc";
		List<User> list = this.getHibernateTemplate().execute(new PageHibernateCallback<User>(hql, new Object[]{}, begin, limit));
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	//查询头像的数量
	public Integer findHeadImgCount() {
		String hql = "select count(*) from User";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return null;
	}
	
	//设置默认头像
	public void setDefaultHeadImg(User user) {
		this.getHibernateTemplate().update(user);
	}


}
