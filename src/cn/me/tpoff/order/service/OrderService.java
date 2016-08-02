package cn.me.tpoff.order.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.transaction.annotation.Transactional;

import cn.me.tpoff.address.dao.AddressDao;
import cn.me.tpoff.address.vo.Address;
import cn.me.tpoff.cart.dao.CartDao;
import cn.me.tpoff.cart.vo.Cart;
import cn.me.tpoff.cartitem.vo.CartItem;
import cn.me.tpoff.comment.vo.Comment;
import cn.me.tpoff.order.dao.OrderDao;
import cn.me.tpoff.order.vo.Order;
import cn.me.tpoff.orderitem.vo.OrderItem;
import cn.me.tpoff.product.vo.Product;
import cn.me.tpoff.user.vo.User;
import cn.me.tpoff.utils.PageBean;

/**
 * 订单确认Service
 * @author 严杨鸿
 *
 */

@Transactional
public class OrderService {
	private OrderDao orderDao;
	private CartDao cartDao;
	private AddressDao addressDao;
	
	public AddressDao getAddressDao() {
		return addressDao;
	}
	public void setAddressDao(AddressDao addressDao) {
		this.addressDao = addressDao;
	}
	public CartDao getCartDao() {
		return cartDao;
	}
	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	public OrderDao getOrderDao() {
		return orderDao;
	}
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
	
	//提交订单
	public Integer submitOrder(User user, Integer aid, Integer isPost) {
		Order order = new Order();
		Double total = null;
		Date odate = null;
		String number = null;
		Address address = null;
		Double paytotal = null;
		Integer count = 0;
		Set<OrderItem> orderItems = new HashSet<OrderItem>();
		
		//查询购物车
		Cart cart = cartDao.findCartByUid(user.getUid());
		Set<CartItem> cartItems = cart.getCartItems();
		total = cart.getTotal();
		if(isPost==1) {
			paytotal = cart.getTotal();
		} else {
			paytotal = cart.getTotal() + 15;
		}
		
		odate = new Date();
		
		DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		number = df.format(odate);
		
		address = addressDao.findAddrById(aid);
		for(CartItem cm : cartItems) {
			count = count + cm.getSubcount();
			OrderItem om = new OrderItem();
			om.setSubcount(cm.getSubcount());
			om.setSubtotal(cm.getSubtotal());
			om.setProduct(cm.getProduct());
			orderItems.add(om);
			om.setState(0);//为0表示未评论    为1表示已评论
		}
		
		order.setTotal(total);
		order.setUser(user);
		order.setState(1);	
		order.setOdate(odate);
		order.setNumber(number);
		order.setPaytotal(paytotal);
		order.setOrderItems(orderItems);
		order.setReceiver(address.getReceiver());
		order.setPhone(address.getPhone());
		order.setCount(count);
		order.setAddr(address.getAddr());
		order.setFlag(0);
		//清空购物车
		orderDao.clearCart(cart);
		orderDao.submitOrder(order);
		//修改订单编号
		order.setNumber(order.getNumber() + order.getOid().toString());
		return order.getOid();
	}
	
	//查询订单分页数据
	public PageBean<Order> findOrderByUid(User user, Integer page) {
		PageBean<Order>	pageBean = new PageBean<Order>();
		Integer limit = 5;
		Integer totalCount = null;
		Integer totalPage = null;
		
		totalCount = orderDao.findCountByUid(user.getUid());
		if(totalCount%limit!=0) {
			totalPage = totalCount / limit + 1;
		} else {
			totalPage = totalCount / limit;
		}
		
		Integer begin = (page-1) * limit;
		List<Order> list = orderDao.findOrderByUid(user.getUid(), begin, limit);
		
		pageBean.setLimit(limit);
		pageBean.setList(list);
		pageBean.setPage(page);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		
		return pageBean;
	}
	
	//查询三条订单记录
	public PageBean<Order> findRecentOrderByUid(User user, Integer page) {
		PageBean<Order>	pageBean = new PageBean<Order>();
		Integer limit = 3;
		Integer totalCount = null;
		Integer totalPage = null;
		
		totalCount = orderDao.findCountByUid(user.getUid());
		if(totalCount%limit!=0) {
			totalPage = totalCount / limit + 1;
		} else {
			totalPage = totalCount / limit;
		}
		
		Integer begin = (page-1) * limit;
		List<Order> list = orderDao.findOrderByUid(user.getUid(), begin, limit);
		
		pageBean.setLimit(limit);
		pageBean.setList(list);
		pageBean.setPage(page);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		
		return pageBean;
	}
	
	//根据订单id查询订单
	public Order findOrderByOid(Integer oid) {
		return orderDao.findOrderByOid(oid);
	}
	
	//确认收货
	public void confirmGet(Integer oid) {
		Order order = orderDao.findOrderByOid(oid);
		order.setState(4);
	}
	
	//提交评论
	public void submitComment(Integer pid, String username, String content, Integer omid, Integer oid) {
		Product product = new Product();
		product.setPid(pid);
		Comment comment = new Comment();
		comment.setCdate(new Date());
		comment.setContent(content);
		comment.setProduct(product);
		comment.setUsername(username);
		orderDao.submitComment(comment);
		OrderItem om = orderDao.findOrderItemByOmid(omid);
		om.setState(1);
		
		Order order = orderDao.findOrderByOid(oid);
		Set<OrderItem> orderItems = order.getOrderItems();
		Boolean value = false;
		for(OrderItem orderItem : orderItems) {
			if(orderItem.getState()==0) {
				value = true;
				break;
			}
		}
		if(value) {
			order.setFlag(0);
		} else {
			order.setFlag(1);
		}
	}
}
