package cn.me.tpoff.admin.index.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.me.tpoff.admin.index.dao.AdminIndexDao;
import cn.me.tpoff.order.vo.Order;
import cn.me.tpoff.user.vo.User;

/**
 * 主页数据Service
 * @author 严杨鸿
 *
 */

@Transactional
public class AdminIndexService {
	private AdminIndexDao adminIndexDao;

	public AdminIndexDao getAdminIndexDao() {
		return adminIndexDao;
	}
	public void setAdminIndexDao(AdminIndexDao adminIndexDao) {
		this.adminIndexDao = adminIndexDao;
	}
	//用户注册量
	public Integer findUserCount() {
		return adminIndexDao.findUserCount();
	}
	
	//订单数量
	public Integer findOrderCount() {
		return adminIndexDao.findOrderCount();
	}
	
	//交易成功量
	public Integer findOrderSuccessCount() {
		return adminIndexDao.findOrderSuccessCount();
	}
	
	//成功交易额
	public Double findTurnOver() {
		return adminIndexDao.findTurnOver();
	}
	
	//最近注册用户
	public List<User> findUserList() {
		return adminIndexDao.findUserList();
	}
	
	//最近成功交易
	public List<Order> findOrderSuccessList() {
		return adminIndexDao.findOrderSuccessList();
	}
	
}
