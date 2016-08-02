package cn.me.tpoff.admin.product.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.me.tpoff.category.vo.Category;
import cn.me.tpoff.categorysecond.vo.CategorySecond;
import cn.me.tpoff.comment.vo.Comment;
import cn.me.tpoff.detail.vo.Detail;
import cn.me.tpoff.product.vo.Product;
import cn.me.tpoff.show.vo.Show;
import cn.me.tpoff.utils.PageHibernateCallback;


/**
 * 后台商品管理Dao
 * @author 严杨鸿
 *
 */

public class AdminProductDao extends HibernateDaoSupport {

	//后台商品列表
	public Integer findProductCount(String keyword) {
		String hql = null;
		String now = null;
		if(keyword==null) {
			hql = "select count(*) from Product p where p.state = 1 order by pdate desc";
			List<Long> list = this.getHibernateTemplate().find(hql);
			if(list!=null&&list.size()>0) {
				return list.get(0).intValue();
			}
			return null;
		} else {
			now = "%" + keyword + "%";
			hql = "select count(*) from Product p where p.state = 1 and p.pname like ? order by pdate desc";
			List<Long> list = this.getHibernateTemplate().find(hql, now);
			if(list!=null&&list.size()>0) {
				return list.get(0).intValue();
			}
			return null;
		}
	}

	//查询商品列表分页数据
	public List<Product> findProductList(String keyword, Integer begin, Integer limit) {
		String hql = null;
		String now = null;
		if(keyword==null) {
			hql = "from Product p where p.state = 1 order by pdate desc";
			List<Product> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{}, begin, limit));
			if(list!=null&&list.size()>0) {
				return list;
			}
			return null;
		} else {
			now = "%" + keyword + "%";
			hql = "from Product p where p.state = 1 and p.pname like ? order by pdate desc";
			List<Product> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{now}, begin, limit));
			if(list!=null&&list.size()>0) {
				return list;
			}
			return null;
		}
	}
	
	//具体商品
	public Product findProduct(Integer pid) {
		String hql = "from Product p where p.pid = ?";
		List<Product> list = this.getHibernateTemplate().find(hql, pid);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	//图片展示
	public List<Show> findShowList(Integer pid) {
		String hql = "from Show s where s.product.pid = ? order by s.sid asc";
		List<Show> list = this.getHibernateTemplate().find(hql, pid);
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	//商品详情图片
	public List<Detail> findDetailList(Integer pid) {
		String hql = "from Detail d where d.product.pid = ? order by d.pdid asc";
		List<Detail> list = this.getHibernateTemplate().find(hql, pid);
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}
	//具体商品评论数量
	public Integer findCommentCount(Integer pid) {
		String hql = "select count(*) from Comment c where c.product.pid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql, pid);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return null;
	}
	
	//商品评论
	public List<Comment> findCommentList(Integer pid, Integer begin, Integer limit) {
		String hql = "from Comment c where c.product.pid = ? order by cdate desc";
		List<Comment> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Comment>(hql, new Object[]{pid}, begin, limit));
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	//删除商品评论
	public void deleteComment(Comment comment) {
		this.getHibernateTemplate().delete(comment);
	}

	//查询某个评论记录
	public Comment findComment(Integer pcid) {
		String hql = "from Comment c where c.pcid = ?";
		List<Comment> list = this.getHibernateTemplate().find(hql, pcid);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	
	//查询所有一级分类
	public List<Category> findCategoryList() {
		String hql = "from Category";
		List<Category> list = this.getHibernateTemplate().find(hql);
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	//下架商品
	public void productDown(Product product) {
		this.getHibernateTemplate().update(product);
	}

	//查询下架商品数量
	public Integer findDownProductCount(String keyword) {
		String hql = null;
		String now = null;
		if(keyword==null) {
			hql = "select count(*) from Product p where p.state = 0 order by pdate desc";
			List<Long> list = this.getHibernateTemplate().find(hql);
			if(list!=null&&list.size()>0) {
				return list.get(0).intValue();
			}
			return null;
		} else {
			now = "%" + keyword + "%";
			hql = "select count(*) from Product p where p.state = 0 and p.pname like ? order by pdate desc";
			List<Long> list = this.getHibernateTemplate().find(hql, now);
			if(list!=null&&list.size()>0) {
				return list.get(0).intValue();
			}
			return null;
		}
	}

	//查询下架商品分页数据
	public List<Product> findDownProductList(String keyword, Integer begin, Integer limit) {
		String hql = null;
		String now = null;
		if(keyword==null) {
			hql = "from Product p where p.state = 0 order by pdate desc";
			List<Product> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{}, begin, limit));
			if(list!=null&&list.size()>0) {
				return list;
			}
			return null;
		} else {
			now = "%" + keyword + "%";
			hql = "from Product p where p.state = 0 and p.pname like ? order by pdate desc";
			List<Product> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{now}, begin, limit));
			if(list!=null&&list.size()>0) {
				return list;
			}
			return null;
		}
	}

	//上架商品
	public void productUp(Product product) {
		this.getHibernateTemplate().update(product);
	}

	//保存商品基本信息
	public void saveProduct(Product product) {
		this.getHibernateTemplate().save(product);
	}

	//保存图片展示
	public void saveShow(Show show) {
		this.getHibernateTemplate().saveOrUpdate(show);
	}

	//保存商品详情图片
	public void saveDetail(Detail detail) {
		this.getHibernateTemplate().saveOrUpdate(detail);
	}

	//根据一级分类cid查询相应二级分类
	public List<CategorySecond> findCategorySecondList(Integer cid) {
		String hql = "from CategorySecond cs where cs.category.cid = ? order by csid asc";
		List<CategorySecond> list = this.getHibernateTemplate().find(hql, cid);
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	//修改商品基本信息
	public void updateInfo(Product product) {
		this.getHibernateTemplate().update(product);
	}

	//根据一级分类查询对应二级分类
	public List<CategorySecond> findCategorySecondList(Category category) {
		String hql = "from CategorySecond cs where cs.category.cid = ? order by csid asc";
		List<CategorySecond> list = this.getHibernateTemplate().find(hql, category.getCid());
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	//删除图片展示
	public void deleteShow(Show show) {
		this.getHibernateTemplate().delete(show);
	}

	//删除商品详情
	public void deleteDetail(Detail detail) {
		this.getHibernateTemplate().delete(detail);
	}


}
