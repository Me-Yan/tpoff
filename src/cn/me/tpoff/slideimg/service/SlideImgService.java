package cn.me.tpoff.slideimg.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.me.tpoff.slideimg.dao.SlideImgDao;
import cn.me.tpoff.slideimg.vo.SlideImg;

/**
 * 轮播图片的service类
 * @author 严杨鸿
 *
 */
@Transactional
public class SlideImgService {
	private SlideImgDao slideImgDao;

	public SlideImgDao getSlideImgDao() {
		return slideImgDao;
	}

	public void setSlideImgDao(SlideImgDao slideImgDao) {
		this.slideImgDao = slideImgDao;
	}

	//查询所有的轮播图片
	public List<SlideImg> findAll() {
		return slideImgDao.findAll();
	}
}
