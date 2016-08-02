package cn.me.tpoff.admin.slide.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.me.tpoff.admin.slide.dao.AdminSlideDao;
import cn.me.tpoff.slideimg.vo.SlideImg;

/**
 * 轮播图Service
 * @author 严杨鸿
 *
 */

@Transactional
public class AdminSlideService {
	private AdminSlideDao adminSlideDao;

	public AdminSlideDao getAdminSlideDao() {
		return adminSlideDao;
	}
	public void setAdminSlideDao(AdminSlideDao adminSlideDao) {
		this.adminSlideDao = adminSlideDao;
	}
	
	//查询轮播图集合数据
	public List<SlideImg> findSlideList() {
		return adminSlideDao.findSlideList();
	}
	
	//根据sid查询轮播图
	public SlideImg findSlide(Integer sid) {
		return adminSlideDao.findSlide(sid);
	}
	
	//更新轮播图
	public void slideEdit(SlideImg oldSlide) {
		adminSlideDao.slideEdit(oldSlide);
	}
}
