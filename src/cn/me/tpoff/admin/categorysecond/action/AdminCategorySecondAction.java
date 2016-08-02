package cn.me.tpoff.admin.categorysecond.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;


import org.apache.struts2.ServletActionContext;

import cn.me.tpoff.admin.categorysecond.service.AdminCategorySecondService;
import cn.me.tpoff.category.vo.Category;
import cn.me.tpoff.categorysecond.vo.CategorySecond;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 后台二级分类Action
 * @author 严杨鸿
 *
 */

public class AdminCategorySecondAction extends ActionSupport implements ModelDriven<CategorySecond> {
	private CategorySecond categorySecond = new CategorySecond();
	private AdminCategorySecondService adminCategorySecondService;
	
	//添加成功的判断标志
	private Integer flag;
	private Integer cid;
	
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	public AdminCategorySecondService getAdminCategorySecondService() {
		return adminCategorySecondService;
	}
	public void setAdminCategorySecondService(
			AdminCategorySecondService adminCategorySecondService) {
		this.adminCategorySecondService = adminCategorySecondService;
	}

	@Override
	public CategorySecond getModel() {
		return categorySecond;
	}
	
	//二级分类页面
	public String categorySecondPage() {
		
		List<Category> categoryList = adminCategorySecondService.findCategoryList();
		if(categoryList!=null){
			ActionContext.getContext().getValueStack().set("categoryList", categoryList);
		}
		
		return "categorySecondPage";
	}
	
	//二级分类添加
	public String categorySecondAdd() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Integer id = adminCategorySecondService.categorySecondAdd(categorySecond);
		
		out.print(id.toString());
		out.flush();
		out.close();
		
		
		return NONE;
	}
	
	//二级分类编辑
	public String categorySecondEdit() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Category category = new Category();
		category.setCid(cid);
		categorySecond.setCategory(category);
		adminCategorySecondService.categorySecondEdit(categorySecond);
		
		out.print("yes");
		out.flush();
		out.close();
		
		return NONE;
	}
	
	public String categorySecondDelete() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Integer count = adminCategorySecondService.findProductCount(categorySecond.getCsid());
		if(count==0) {
			adminCategorySecondService.categorySecondDelete(categorySecond);
			out.print("yes");
		} else {
			out.print("no");
		}
		
		out.flush();
		out.close();
		
		return NONE;
	}
	
	
	

}
