package cn.me.tpoff.slideimg.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.me.tpoff.slideimg.vo.SlideImg;

/**
 * 轮播图片Dao
 * @author 严杨鸿
 *
 */

public class SlideImgDao extends HibernateDaoSupport {
	
	//查询所有的轮播图片
	public List<SlideImg> findAll() {
		String hql ="from SlideImg s order by s.sid asc";
		List<SlideImg> list = this.getHibernateTemplate().find(hql);
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

}
