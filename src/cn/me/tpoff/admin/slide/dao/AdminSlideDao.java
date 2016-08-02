package cn.me.tpoff.admin.slide.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.me.tpoff.slideimg.vo.SlideImg;

/**
 * 轮播图Dao
 * @author 严杨鸿
 *
 */

public class AdminSlideDao extends HibernateDaoSupport {

	//查询轮播图集合数据
	public List<SlideImg> findSlideList() {
		String hql = "from SlideImg s where s.flag = 1 order by sid asc";
		List<SlideImg> list = this.getHibernateTemplate().find(hql);
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	//根据sid查询轮播图
	public SlideImg findSlide(Integer sid) {
		String hql = "from SlideImg s where s.sid = ?";
		List<SlideImg> list = this.getHibernateTemplate().find(hql, sid);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	//更新轮播图
	public void slideEdit(SlideImg oldSlide) {
		this.getHibernateTemplate().update(oldSlide);
	}

}
