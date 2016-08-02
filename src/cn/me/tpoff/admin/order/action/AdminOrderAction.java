package cn.me.tpoff.admin.order.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.me.tpoff.admin.order.service.AdminOrderService;
import cn.me.tpoff.order.vo.Order;
import cn.me.tpoff.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 后台订单Action
 * @author 严杨鸿
 *
 */

public class AdminOrderAction extends ActionSupport implements ModelDriven<Order> {
	private Order order = new Order();
	private AdminOrderService adminOrderService;
	
	private Integer page;
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public AdminOrderService getAdminOrderService() {
		return adminOrderService;
	}
	public void setAdminOrderService(AdminOrderService adminOrderService) {
		this.adminOrderService = adminOrderService;
	}

	@Override
	public Order getModel() {
		return order;
	}
	
	
	//订单页面
	public String orderPage(){
		String num = (String) ActionContext.getContext().getSession().get("number");
		Integer st = (Integer) ActionContext.getContext().getSession().get("state");
		if(order.getNumber()!=null) {	//关键字查询
			ActionContext.getContext().getSession().remove("state");
			ActionContext.getContext().getSession().remove("number");
			ActionContext.getContext().getSession().put("number", order.getNumber());
		} else if(num!=null&&page!=null) {	//关键字翻页
			ActionContext.getContext().getSession().remove("state");
			order.setNumber(num);;
		} else if(order.getState()!=null) {	//非关键字查询
			ActionContext.getContext().getSession().remove("number");
			ActionContext.getContext().getSession().remove("state");
			ActionContext.getContext().getSession().put("state", order.getState());
		} else if(st!=null&&page!=null) {	//非关键字翻页
			ActionContext.getContext().getSession().remove("keyword");
			order.setState(st);
		} else if(order.getNumber()==null&&order.getState()==null) {	//非关键字查询、非状态查询
			ActionContext.getContext().getSession().remove("number");
			ActionContext.getContext().getSession().remove("state");
		}
		if(page==null) {
			page = 1;
		}
		PageBean<Order> pageBean = adminOrderService.orderPage(page, order.getNumber(), order.getState());
		if(pageBean.getList()!=null) {
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		}
		
		return "orderPage";
	}
	
	//确认发货
	public String sendGoods() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		adminOrderService.sendGoods(order.getOid());
		out.print("yes");
		out.flush();
		out.close();
		
		return NONE;
	}
}
