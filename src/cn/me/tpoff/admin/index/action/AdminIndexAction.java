package cn.me.tpoff.admin.index.action;

import java.util.List;

import cn.me.tpoff.admin.index.service.AdminIndexService;
import cn.me.tpoff.order.vo.Order;
import cn.me.tpoff.user.vo.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 跳转到后台首页Action
 * @author 严杨鸿
 *
 */

public class AdminIndexAction extends ActionSupport {
	private AdminIndexService adminIndexService;
	
	
	public AdminIndexService getAdminIndexService() {
		return adminIndexService;
	}
	public void setAdminIndexService(AdminIndexService adminIndexService) {
		this.adminIndexService = adminIndexService;
	}

	//跳转到后台首页
	public String index() {
		return SUCCESS;
	}
	
	//主页
	public String mainPage() {
		//注册用户量
		Integer userCount = adminIndexService.findUserCount();
		//订单数量
		Integer orderCount = adminIndexService.findOrderCount();
		//交易成功量
		Integer orderSuccessCount = adminIndexService.findOrderSuccessCount();
		//成功交易额
		Double turnover = adminIndexService.findTurnOver();
		//最近注册用户
		List<User> userList = adminIndexService.findUserList();
		//最近成功交易
		List<Order> orderSuccessList = adminIndexService.findOrderSuccessList();
		
		
		ActionContext.getContext().getValueStack().set("userCount", userCount);
		ActionContext.getContext().getValueStack().set("orderCount", orderCount);
		ActionContext.getContext().getValueStack().set("orderSuccessCount", orderSuccessCount);
		ActionContext.getContext().getValueStack().set("turnover", turnover);
		ActionContext.getContext().getValueStack().set("userList", userList);
		ActionContext.getContext().getValueStack().set("orderSuccessList", orderSuccessList);		
		
		return "mainPage";
	}
}
