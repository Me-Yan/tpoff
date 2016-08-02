package cn.me.tpoff.admin.product.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.me.tpoff.admin.product.service.AdminProductService;
import cn.me.tpoff.category.vo.Category;
import cn.me.tpoff.categorysecond.vo.CategorySecond;
import cn.me.tpoff.comment.vo.Comment;
import cn.me.tpoff.detail.vo.Detail;
import cn.me.tpoff.product.vo.Product;
import cn.me.tpoff.show.vo.Show;
import cn.me.tpoff.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 后台管理商品Action
 * @author 严杨鸿
 *
 */

public class AdminProductAction extends ActionSupport implements ModelDriven<Product> {
	private Product product = new Product();
	private AdminProductService adminProductService;
	
	private Integer page;
	private String keyword;
	private Integer pcid;	//商品评论pcid
	private Integer pc;		//删除商品时跳转的判断
	private Integer dflag;	//下架商品时跳转的判断
	private Integer uflag;	//上架商品跳转的判断
	private Integer aflag;	//添加商品跳转的判断
	private Integer failFlag; //添加失败
	
	//上传商品
		//列表图片
	private File proimg;
	private String proimgFileName;
	private String proimgContentType;
	
		//图片展示
	private List<File> show;
	private List<String> showFileName;
	private List<String> showContentType;
	
		//商品详情
	private List<File> detail;
	private List<String> detailFileName;
	private List<String> detailContentType;
	
		//一级分类cid
	private Integer cid;
	
	//删除图片
	private Integer sid;
	private Integer pdid;
	

	public Integer getFailFlag() {
		return failFlag;
	}
	public void setFailFlag(Integer failFlag) {
		this.failFlag = failFlag;
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public Integer getPdid() {
		return pdid;
	}
	public void setPdid(Integer pdid) {
		this.pdid = pdid;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Integer getAflag() {
		return aflag;
	}
	public void setAflag(Integer aflag) {
		this.aflag = aflag;
	}
	public File getProimg() {
		return proimg;
	}
	public void setProimg(File proimg) {
		this.proimg = proimg;
	}
	public String getProimgFileName() {
		return proimgFileName;
	}
	public void setProimgFileName(String proimgFileName) {
		this.proimgFileName = proimgFileName;
	}
	public String getProimgContentType() {
		return proimgContentType;
	}
	public void setProimgContentType(String proimgContentType) {
		this.proimgContentType = proimgContentType;
	}
	public List<File> getShow() {
		return show;
	}
	public void setShow(List<File> show) {
		this.show = show;
	}
	public List<String> getShowFileName() {
		return showFileName;
	}
	public void setShowFileName(List<String> showFileName) {
		this.showFileName = showFileName;
	}
	public List<String> getShowContentType() {
		return showContentType;
	}
	public void setShowContentType(List<String> showContentType) {
		this.showContentType = showContentType;
	}
	public List<File> getDetail() {
		return detail;
	}
	public void setDetail(List<File> detail) {
		this.detail = detail;
	}
	public List<String> getDetailFileName() {
		return detailFileName;
	}
	public void setDetailFileName(List<String> detailFileName) {
		this.detailFileName = detailFileName;
	}
	public List<String> getDetailContentType() {
		return detailContentType;
	}
	public void setDetailContentType(List<String> detailContentType) {
		this.detailContentType = detailContentType;
	}
	public Integer getUflag() {
		return uflag;
	}
	public void setUflag(Integer uflag) {
		this.uflag = uflag;
	}
	public Integer getDflag() {
		return dflag;
	}
	public void setDflag(Integer dflag) {
		this.dflag = dflag;
	}
	public Integer getPc() {
		return pc;
	}
	public void setPc(Integer pc) {
		this.pc = pc;
	}
	public Integer getPcid() {
		return pcid;
	}
	public void setPcid(Integer pcid) {
		this.pcid = pcid;
	}
	public AdminProductService getAdminProductService() {
		return adminProductService;
	}
	public void setAdminProductService(AdminProductService adminProductService) {
		this.adminProductService = adminProductService;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	
	@Override
	public Product getModel() {
		return product;
	}
	
	//商品列表
	public String productPage() {
		String kw = (String) ActionContext.getContext().getSession().get("keyword");
		if(keyword!=null) {
			ActionContext.getContext().getSession().remove("keyword");
			ActionContext.getContext().getSession().put("keyword", keyword);
		} else if(keyword==null&&kw!=null&&page!=null) {
			keyword = kw;
		} else if(keyword==null&&kw!=null&&page==null) {
			ActionContext.getContext().getSession().remove("keyword");
		}
		if(page==null) {
			page = 1;
		}
		if(dflag!=null) {
			ActionContext.getContext().getValueStack().set("downSuccess", "下架成功！");
		}
		if(aflag!=null) {
			ActionContext.getContext().getValueStack().set("addSuccess", "成功添加商品！");
		}
		PageBean<Product> pageBean = adminProductService.findProductList(page, keyword);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		
		return "productPage";
	}
	
	//具体商品
	public String productDetail() {
		List<Show> showList = adminProductService.findShowList(product.getPid());
		List<Detail> detailList = adminProductService.findDetailList(product.getPid());
		product = adminProductService.findProduct(product.getPid());
		ActionContext.getContext().getValueStack().set("showList", showList);
		ActionContext.getContext().getValueStack().set("detailList", detailList);
		return "productDetail";
	}
	
	//商品评论
	public String productComment() {
		if(page==null) {
			page = 1;
		}
		if(pc!=null) {
			ActionContext.getContext().getValueStack().set("deleteComment", "删除成功！");
		}
		PageBean<Comment> pageBean = adminProductService.findCommentList(product.getPid(), page);
		if(pageBean.getList()!=null&&pageBean.getList().size()>0) {
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		}
		return "productComment";
	}
	
	//删除商品评论
	public String deleteComment() {
		adminProductService.deleteComment(pcid);
		return "deleteComment";
	}
	
	//商品编辑页面
	public String productEdit() {
		product = adminProductService.findProduct(product.getPid());	//根绝pid查询商品
		List<Show> showList = adminProductService.findShowList(product.getPid());	//商品展示
		List<Detail> detailList = adminProductService.findDetailList(product.getPid());	//商品详情
		List<Category> cList = adminProductService.findCategoryList();	//查询所有一级分类
		List<CategorySecond> csList = adminProductService.findCategorySecondList(product.getCategorySecond().getCategory());//查询一级分类下对应二级分类
		ActionContext.getContext().getValueStack().set("csList", csList);
		ActionContext.getContext().getValueStack().set("cList", cList);
		ActionContext.getContext().getValueStack().set("showList", showList);
		ActionContext.getContext().getValueStack().set("detailList", detailList);
		
		return "productEdit";
	}
	
	//下架商品
	public String productDown() {
		adminProductService.productDown(product.getPid());		
		return "productDown";
	}
	
	//商品添加页面
	public String addPage() {
		if(failFlag!=null) {
			ActionContext.getContext().getValueStack().set("failFlag", "0");
		}
		List<Category> cList = adminProductService.findCategoryList();
		ActionContext.getContext().getValueStack().set("cList", cList);
		
		return "addPage";
	}
	
	//下架商品页面
	public String downPage() {
		String kw = (String) ActionContext.getContext().getSession().get("keyword");
		if(keyword!=null) {
			ActionContext.getContext().getSession().remove("keyword");
			ActionContext.getContext().getSession().put("keyword", keyword);
		} else if(keyword==null&&kw!=null&&page!=null) {
			keyword = kw;
		} else if(keyword==null&&kw!=null&&page==null) {
			ActionContext.getContext().getSession().remove("keyword");
		}
		if(page==null) {
			page = 1;
		}
		if(uflag!=null) {
			ActionContext.getContext().getValueStack().set("upSuccess", "上架成功！");
		}
		PageBean<Product> pageBean = adminProductService.findDownProductList(page, keyword);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		
		return "downPage";
	}
	
	//上架商品
	public String productUp() {
		adminProductService.productUp(product.getPid());
		return "productUp";
	}
	
	//上传商品
	public String productAdd() throws IOException {
		System.out.println("---------------外面");
		System.out.println(show.size());
		System.out.println(detail.size());
		if(proimg!=null&&show!=null&&show.size()>0&&detail!=null&&detail.size()>0) {
			
		//列表图片
			//新名字
			Integer pEndIndex = proimgFileName.lastIndexOf(".");
			String pEnd = proimgFileName.substring(pEndIndex);
			String pNewName = System.currentTimeMillis() + pEnd;
			Integer pid	= adminProductService.saveProduct(product, pNewName);	//商品id
			
			//上传图片
			String pPath = ServletActionContext.getServletContext().getRealPath("/products/titles");
			String pNewPath = pPath + "/" + pid +pNewName;
			
			File pFile = new File(pNewPath);
			FileUtils.copyFile(proimg, pFile);
			
			System.out.println("------------------------列表图片");
			
			
		//商品展示
			for(int i=0; i<show.size(); i++) {
				//新名字
				Integer sEndIndex = showFileName.get(i).lastIndexOf(".");
				String sEnd = showFileName.get(i).substring(sEndIndex);
				String sNewName = System.currentTimeMillis() + sEnd;
				Integer sid = adminProductService.saveShow(pid, sNewName);
				
				//上传图片
				String sPath = ServletActionContext.getServletContext().getRealPath("/products/shows");
				String sNewPath = sPath + "/" + sid + sNewName;
				
				File sFile = new File(sNewPath);
				FileUtils.copyFile(show.get(i), sFile);
			}
		
			System.out.println("--------------------商品展示");
			
		//商品详情
			for(int i=0; i<detail.size(); i++) {
				//新名字
				Integer dEndIndex = detailFileName.get(i).lastIndexOf(".");
				String dEnd = detailFileName.get(i).substring(dEndIndex);
				String dNewName = System.currentTimeMillis() + dEnd;
				Integer did = adminProductService.saveDetail(pid, dNewName);
				
				//上传图片
				String dPath =ServletActionContext.getServletContext().getRealPath("/products/details");
				String dNewPath = dPath + "/" + did + dNewName;
				
				File dFile = new File(dNewPath);
				FileUtils.copyFile(detail.get(i), dFile);
			}
			
			System.out.println("-----------------------------商品详情");
			
		} else {
			return "addFail";
		}
		
		return "productAdd";
	}
	
	//根据选择的一级分类，查询相应的二级分类
	public String findCategorySecond() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		List<CategorySecond> list = adminProductService.findCategoryList(cid);
		for(CategorySecond cs : list) {
			cs.setCategory(null);
		}
		
		JSONArray jsonArray = JSONArray.fromObject(list);
		
		out.print(jsonArray);
		
		return NONE;
	}
	
	//修改商品的基本信息
	public String editInfo() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Product oldProduct = adminProductService.findProduct(product.getPid());
		
		//更新商品信息
		product.setPdate(oldProduct.getPdate());
		product.setSalecount(oldProduct.getSalecount());
		product.setPimg(oldProduct.getPimg());
		product.setUcount(oldProduct.getUcount());
		product.setState(oldProduct.getState());
		adminProductService.updateInfo(product);
		out.print("yes");
		out.flush();
		out.close();
		
		return NONE;
	}
	
	//修改列表图片
	public String editImg() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(proimg!=null) {
			//新名字
			Integer pEndIndex = proimgFileName.lastIndexOf(".");
			String pEnd = proimgFileName.substring(pEndIndex);
			String pNewName = System.currentTimeMillis() + pEnd;
			
			//删除旧图片
			Product oldProduct = adminProductService.findProduct(product.getPid());
			String oldPath = ServletActionContext.getServletContext().getRealPath(oldProduct.getPimg());
			File oldFile = new File(oldPath);
			oldFile.delete();
			
			//更新商品信息
			oldProduct.setPimg("products/titles/"+pNewName);
			adminProductService.updateInfo(oldProduct);
			
			//上传新图片
			String path = ServletActionContext.getServletContext().getRealPath("/products/titles");
			String newPath = path + "/" + pNewName;
			File newFile = new File(newPath);
			FileUtils.copyFile(proimg, newFile);
			
			out.print("products/titles/"+ pNewName);
			out.flush();
			out.close();
			
		} else {
			out.print("no");
			out.flush();
			out.close();
		}
		
		return NONE;
	}
	
	//修改图片展示
	public String editShow() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(show!=null&&show.size()>0) {
			List<Show> list = new ArrayList<Show>();
			for(int i=0; i<show.size(); i++) {
				//新名字
				Integer sEndIndex = showFileName.get(i).lastIndexOf(".");
				String sEnd = showFileName.get(i).substring(sEndIndex);
				String sNewName = System.currentTimeMillis() + sEnd;
				Integer sid = adminProductService.saveShow(product.getPid(), sNewName);
				
				//上传图片
				String sPath = ServletActionContext.getServletContext().getRealPath("/products/shows");
				String sNewPath = sPath + "/" + sid + sNewName;
				
				File sFile = new File(sNewPath);
				FileUtils.copyFile(show.get(i), sFile);
				
				Show s = new Show();
				s.setPspath("products/shows/"+ sid + sNewName);
				s.setSid(sid);
				list.add(s);
			}
			JSONArray jsonArray = JSONArray.fromObject(list);
			out.print(jsonArray);
			out.flush();
			out.close();
		} else {
			out.close();
		}
		
		return NONE;
	}
	
	//修改图片详情
	public String editDetail() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(detail!=null&&detail!=null) {
			List<Detail> list = new ArrayList<Detail>();
			for(int i=0; i<detail.size(); i++) {
				//新名字
				Integer dEndIndex = detailFileName.get(i).lastIndexOf(".");
				String dEnd = detailFileName.get(i).substring(dEndIndex);
				String dNewName = System.currentTimeMillis() + dEnd;
				Integer did = adminProductService.saveDetail(product.getPid(), dNewName);
				
				//上传图片
				String dPath =ServletActionContext.getServletContext().getRealPath("/products/details");
				String dNewPath = dPath + "/" + did + dNewName;
				
				File dFile = new File(dNewPath);
				FileUtils.copyFile(detail.get(i), dFile);
				
				Detail d = new Detail();
				d.setPdpath("products/details/"+ did + dNewName);
				d.setPdid(did);
				list.add(d);
			}
			JSONArray jsonArray = JSONArray.fromObject(list);
			out.print(jsonArray);
			out.flush();
			out.close();
		} else {
			out.close();
		}
		
		return NONE;
	}
	
	//删除图片展示
	public String deleteShow() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		adminProductService.deleteShow(sid);
		out.print("yes");
		out.flush();
		out.close();
		
		return NONE;
	}
	
	//删除图片详情
	public String deleteDetail() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		adminProductService.deleteDetail(pdid);
		out.print("yes");
		out.flush();
		out.close();
		
		return NONE;
	}
	
}
