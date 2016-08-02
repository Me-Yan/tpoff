package cn.me.tpoff.admin.order.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.me.tpoff.admin.order.dao.AdminOrderDao;
import cn.me.tpoff.order.vo.Order;
import cn.me.tpoff.utils.PageBean;

/**
 * 后台订单管理Service
 * @author 严杨鸿
 *
 */

@Transactional
public class AdminOrderService {
	private AdminOrderDao adminOrderDao;

	public AdminOrderDao getAdminOrderDao() {
		return adminOrderDao;
	}
	public void setAdminOrderDao(AdminOrderDao adminOrderDao) {
		this.adminOrderDao = adminOrderDao;
	}
	
	//订单页面
	public PageBean<Order> orderPage(Integer page, String number, Integer state) {
		PageBean<Order> pageBean = new PageBean<Order>();
		Integer limit = 5;
		Integer totalCount = null;
		Integer totalPage = null;
		totalCount = adminOrderDao.findOrderCount(number, state);
		if(totalCount%limit!=0) {
			totalPage = totalCount / limit + 1;
		} else {
			totalPage = totalCount / limit;
		}
		Integer begin = (page-1) * limit;
		List<Order> list = adminOrderDao.findOrderList(number, state, begin, limit);
		
		pageBean.setLimit(limit);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		pageBean.setPage(page);
		pageBean.setList(list);
		
		return pageBean;
	}
	
	//发货
	public void sendGoods(Integer oid) {
		Order order = adminOrderDao.findOrder(oid);
		order.setState(3);
		adminOrderDao.sendGoods(order);
	}
	
}
