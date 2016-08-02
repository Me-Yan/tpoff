package cn.me.tpoff.admin.slide.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.me.tpoff.admin.slide.service.AdminSlideService;
import cn.me.tpoff.slideimg.vo.SlideImg;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 轮播图Action
 * @author 严杨鸿
 *
 */

public class AdminSlideAction extends ActionSupport implements ModelDriven<SlideImg> {
	private SlideImg slideImg = new SlideImg();
	private AdminSlideService adminSlideService;
	
	
	//上传文件
	private File slide;
	private String slideFileName;
	private String slideContentType;
	
	//修改判断标志
	private Integer sflag;
	private Integer fflag;
	
	public Integer getSflag() {
		return sflag;
	}
	public void setSflag(Integer sflag) {
		this.sflag = sflag;
	}
	public Integer getFflag() {
		return fflag;
	}
	public void setFflag(Integer fflag) {
		this.fflag = fflag;
	}
	public File getSlide() {
		return slide;
	}
	public void setSlide(File slide) {
		this.slide = slide;
	}
	public String getSlideFileName() {
		return slideFileName;
	}
	public void setSlideFileName(String slideFileName) {
		this.slideFileName = slideFileName;
	}
	public String getSlideContentType() {
		return slideContentType;
	}
	public void setSlideContentType(String slideContentType) {
		this.slideContentType = slideContentType;
	}
	public AdminSlideService getAdminSlideService() {
		return adminSlideService;
	}
	public void setAdminSlideService(AdminSlideService adminSlideService) {
		this.adminSlideService = adminSlideService;
	}

	@Override
	public SlideImg getModel() {
		return slideImg;
	}
	
	//轮播图页面
	public String slidePage() {
		if(fflag!=null) {
			ActionContext.getContext().getValueStack().set("editFail", "修改失败");
		} else if(sflag!=null) {
			ActionContext.getContext().getValueStack().set("editSuccess", "修改成功");
		}
		List<SlideImg> slideList = adminSlideService.findSlideList();
		ActionContext.getContext().getValueStack().set("slideList", slideList);
		
		return "slidePage";
	}
	
	//修改轮播图
	public String slideEdit() throws IOException {
		SlideImg oldSlide = adminSlideService.findSlide(slideImg.getSid());
		if(slide!=null) {
			//合成新图片的名字
			Integer endIndex = slideFileName.lastIndexOf(".");
			String end = slideFileName.substring(endIndex);
			String newName = System.currentTimeMillis() + end;
			
			//删除旧的图片
			if(oldSlide.getSpath()!=null) {
				String oldPath = ServletActionContext.getServletContext().getRealPath(oldSlide.getSpath());
				System.out.println(oldPath);
				File oldFile = new File(oldPath);
				oldFile.delete();
			}
			
			//更新slide对象、更新图片
			String path = ServletActionContext.getServletContext().getRealPath("/images/slideImg");
			String newPath = path + "/" + newName;
			File newFile = new File(newPath);			
			FileUtils.copyFile(slide, newFile);
			
			oldSlide.setSpath("images/slideImg/"+newName);
			adminSlideService.slideEdit(oldSlide);
			return "slideEdit";
		} else {
			return "slideEditFail";
		}
		
	}
	
	
	
	
}
