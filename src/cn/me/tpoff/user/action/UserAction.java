package cn.me.tpoff.user.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.me.tpoff.cart.service.CartService;
import cn.me.tpoff.cart.vo.Cart;
import cn.me.tpoff.category.service.CategoryService;
import cn.me.tpoff.category.vo.Category;
import cn.me.tpoff.user.service.UserService;
import cn.me.tpoff.user.vo.User;
import cn.me.tpoff.utils.MailUtils;
import cn.me.tpoff.utils.UUIDUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


/**
 * 登录Action
 * @author 严杨鸿
 *
 */
public class UserAction extends ActionSupport implements ModelDriven<User>{
	
	private User user = new User();
	private UserService userService;
	private CartService cartService;
	private String code;			//接收验证码
	private CategoryService categoryService;
	
	//上传文件需要的三个属性
	private File headImg;	//文件对应的类
	private String headImgFileName;	//文件名
	private String headImgContentType;	//文件类型
	
	//修改密码
	private String oldPwd;
	private String newPwd;
	
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
	public File getHeadImg() {
		return headImg;
	}
	public void setHeadImg(File headImg) {
		this.headImg = headImg;
	}
	public String getHeadImgFileName() {
		return headImgFileName;
	}
	public void setHeadImgFileName(String headImgFileName) {
		this.headImgFileName = headImgFileName;
	}
	public String getHeadImgContentType() {
		return headImgContentType;
	}
	public void setHeadImgContentType(String headImgContentType) {
		this.headImgContentType = headImgContentType;
	}
	public CategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public CartService getCartService() {
		return cartService;
	}
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Override
	public User getModel() {
		return user;
	}
	
	//登录页面
	public String loginPage() throws IOException {
		ActionContext.getContext().getSession().clear();
		
		return "loginPage";
	}
	
	//检测登录信息
	public String login() throws IOException {
		String checkcode = (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		User existUser = userService.login(user);
		if(code.equalsIgnoreCase(checkcode) == true) {
			if(existUser!=null&&existUser.getState()==0) {
				out.print("unactive");
				out.flush();
			} else if(existUser!=null&&existUser.getState()==1) {				
				ServletActionContext.getRequest().getSession().setAttribute("user", existUser);
			} else {
				out.print("up");
				out.flush();
			}
		} else {
			
			out.print("code");
			out.flush();
		}
		out.close();
		
		return NONE;
	}
	
	
	//退出登录
	public String logout() {
		ServletActionContext.getRequest().getSession().invalidate();		
		return "logout";
	}
	
	//注册界面
	public String registerPage() {
		return "registerPage";
	}
	
	//查询用户名是否被注册
	public String findByUsername() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(userService.findByUsername(user)==null) {
			out.print("0");
			out.flush();
		} else {
			out.print("1");
			out.flush();
		}
		out.close();
		
		return NONE;
	}
	
	//检测验证码是否正确
	public String findByCode() throws IOException {
		String checkcode = (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(code.equalsIgnoreCase(checkcode)==true) {
			out.print("1");
			out.flush();
			out.close();
			return NONE;
		}
		out.print("0");
		out.flush();
		out.close();
		return NONE;
	}
	
	//用户注册
	public String register() {		
		userService.save(user);
		return "regWait";
	}
	
	//检测邮箱是否被使用
	public String findByEmail() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(userService.findByEmail(user)!=null) {
			out.print("1");
			out.flush();
			out.close();
			return NONE;
		}
		out.print("0");
		out.flush();
		out.close();
		return NONE;
	}
	
	//激活邮箱
	public String active() {
		User existUser = userService.findByEcode(user);
		if(existUser==null) {
			return "regFail";
		} else {
			existUser.setEcode(null);
			existUser.setState(1);
			userService.update(existUser);
			ServletActionContext.getRequest().getSession().setAttribute("username", existUser.getUsername());
			return "regSuccess";
		}
	}
	
	//进入个人资料页面
	public String userPage() {
		//查询购物车数量
		User user = (User) ActionContext.getContext().getSession().get("user");
		if(user!=null) {
			Cart cart = cartService.findCartByUid(user);
			if (cart!=null) {
				ActionContext.getContext().getValueStack().set("count", cart.getCount());
			}
		}
		//查询所有一级分类
		List<Category> clist = categoryService.findAll();		
		ActionContext.getContext().getValueStack().set("clist", clist);
		//传递用户的路径
		String route = "个人资料";
		ActionContext.getContext().getValueStack().set("route", route);
		return "userPage";
	}
	
	//修改用户信息
	public String editUser() {
		User existUser = (User) ActionContext.getContext().getSession().get("user");
		existUser.setGender(user.getGender());
		existUser.setUsername(user.getUsername());
		existUser.setRealname(user.getRealname());
		existUser.setProvince(user.getProvince());
		userService.editUser(existUser);
		
		return "editUser";
	}
	
	//修改头像
	public String editHeadImg() throws IOException {
		User user = (User) ActionContext.getContext().getSession().get("user");
		
		if(headImg!=null) {
			String path = ServletActionContext.getServletContext().getRealPath("images");
			//创建文件类型对象
			int endIndex = headImgFileName.lastIndexOf(".");	//查询文件名后缀的开始位置
			String endName = headImgFileName.substring(endIndex);	//取后缀名
			String newName = user.getUid().toString()+endName;	//合成新的文件名
			
			String oldPath = ServletActionContext.getServletContext().getRealPath(user.getUpath());	//获取旧的文件名路径
			if(oldPath.contains("images\\headImg\\headImg.png")) {
				File diskFile = new File(path+"/headImg/"+newName);
				//文件上传
				FileUtils.copyFile(headImg, diskFile);
				user.setUpath("images/headImg/"+newName);
				userService.editUser(user);
				ActionContext.getContext().getSession().put("user", user);
			} else {
				File oldFile = new File(oldPath);
				oldFile.delete();
				File diskFile = new File(path+"/headImg/"+newName);
				//文件上传
				FileUtils.copyFile(headImg, diskFile);
				user.setUpath("images/headImg/"+newName);
				userService.editUser(user);
				ActionContext.getContext().getSession().put("user", user);
			}
		}
		
		
		return "editHeadImg";
	}
	
	//进入安全中心页面
	public String safetyPage() {
		//查询购物车数量
		User user = (User) ActionContext.getContext().getSession().get("user");
		User existUser = userService.findByUsername(user);
		ActionContext.getContext().getSession().put("user", existUser);
		if(user!=null) {
			Cart cart = cartService.findCartByUid(user);
			if (cart!=null) {
				ActionContext.getContext().getValueStack().set("count", cart.getCount());
			}
		}
		//查询所有一级分类
		List<Category> clist = categoryService.findAll();		
		ActionContext.getContext().getValueStack().set("clist", clist);
		//传递用户的路径
		String route = "安全中心";
		ActionContext.getContext().getValueStack().set("route", route);
				
		return "safetyPage";
	}
	
	//检测旧密码是否正确
	public String checkPwd() throws IOException {
		User existUser = (User) ActionContext.getContext().getSession().get("user");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(existUser.getPassword().equals(oldPwd)) {
			out.print("yes");
		} else {
			out.print("no");
		}
		out.flush();
		out.close();
		
		return NONE;
	}
	
	//修改密码
	public String editPwd() {
		User existUser = (User) ActionContext.getContext().getSession().get("user");
		existUser.setPassword(newPwd);
		userService.editUser(existUser);
		
		return "editPwd";
	}
	
	//修改邮箱
	public String editEmail() throws IOException {
		User existUser = userService.findByEmail(user);
		User sUser = (User) ActionContext.getContext().getSession().get("user");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(existUser!=null) {
			out.print("no");
		} else {
			out.print("yes");
			String ecode = UUIDUtils.getUUID() + UUIDUtils.getUUID();
			MailUtils.editMail(sUser.getUsername(), user.getEmail(), ecode);
			String mergeEcode = user.getEmail() + "&" + ecode;
			sUser.setEcode(mergeEcode);
			userService.editUser(sUser);
		}
		out.flush();
		out.close();
		
		return NONE;
	}
	
	//邮箱修改成功
	public String confirmEmail() {
		User existUser = userService.findByUsername(user);
		String newEmail = existUser.getEcode().substring(0, existUser.getEcode().indexOf("&"));
		String code = existUser.getEcode().substring(existUser.getEcode().indexOf("&")+1);
		if(user.getEcode().equals(code)) {
			existUser.setEcode(null);
			existUser.setEmail(newEmail);
			userService.editUser(existUser);
		}
		return "confirmEmail";
	}
}
