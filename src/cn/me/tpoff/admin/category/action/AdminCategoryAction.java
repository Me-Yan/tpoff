package cn.me.tpoff.admin.category.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;



import org.apache.struts2.ServletActionContext;

import cn.me.tpoff.admin.category.service.AdminCategoryService;
import cn.me.tpoff.category.vo.Category;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 一级分类Action
 * @author 严杨鸿
 *
 */

public class AdminCategoryAction extends ActionSupport implements ModelDriven<Category> {
	private Category category = new Category();
	private AdminCategoryService adminCategoryService;
	
	private String content;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public AdminCategoryService getAdminCategoryService() {
		return adminCategoryService;
	}
	public void setAdminCategoryService(AdminCategoryService adminCategoryService) {
		this.adminCategoryService = adminCategoryService;
	}

	@Override
	public Category getModel() {
		return category;
	}

	
	//跳转到一级分类页面
	public String categoryPage() {
		if(content!=null) {
			ActionContext.getContext().getValueStack().set("content", content);
		}
		List<Category> categoryList = adminCategoryService.findCategoryList();
		ActionContext.getContext().getValueStack().set("categoryList", categoryList);
		
		return "categoryPage";
	}
	
	//一级分类编辑
	public String categoryEdit() throws IOException {
		adminCategoryService.categoryEdit(category);
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("yes");
		out.flush();
		out.close();
		
		return NONE;
	}
	
	//一级分类添加
	public String categoryAdd() throws IOException {
		Integer count = adminCategoryService.findCategoryCount();
		if(count>=10) {
			content = "1";
		} else {
			adminCategoryService.categoryAdd(category);
			content = "2";
		}
		
		return "categoryAdd";
	}
	
	//删除一级分类
	public String categoryDelete() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Integer csCount = adminCategoryService.findCategorySecondCount(category.getCid());
		Integer pCount = adminCategoryService.findProductCount(category.getCid());
		if(csCount!=0||pCount!=0) {
			String content = "no";
			out.print(content);
		} else if(csCount==0&&pCount==0) {
			adminCategoryService.categoryDelete(category);
			content = "yes";
			out.print(content);
		}
		
		out.flush();
		out.close();
		
		return NONE;
	}
	
}
