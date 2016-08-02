package cn.me.tpoff.product.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.me.tpoff.collection.vo.Collection;
import cn.me.tpoff.comment.vo.Comment;
import cn.me.tpoff.detail.vo.Detail;
import cn.me.tpoff.product.vo.Product;
import cn.me.tpoff.show.vo.Show;
import cn.me.tpoff.utils.PageHibernateCallback;

/**
 * 商品Dao
 * @author 严杨鸿
 *
 */

public class ProductDao extends HibernateDaoSupport {
	
	//根据一级分类id查询对应的8个商品
	public List<Product> findByCategory(Integer cid) {
		String hql = "from Product p where p.categorySecond.category.cid = ? and state = 1 order by pdate desc, pid desc";
		List<Product> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{cid}, 0, 12));
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}
	
	//根据一级分类查询分页商品
	public List<Product> findProductByCid(Integer cid, Integer begin, Integer limit, String style, String sort) {
		String hql = "from Product p where p.categorySecond.category.cid = ? and state = 1 order by "+ style +" "+ sort +", pid desc";
		List<Product> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{cid}, begin, limit));
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}
	
	
	//分局一级分类id查询商品记录数
	public Integer findCountByCid(Integer cid) {
		String hql = "select count(*) from Product p where p.categorySecond.category.cid = ? and state = 1";
		List<Long> list = this.getHibernateTemplate().find(hql, cid);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return null;
	}

	//查询指定二级分类下的所有商品记录数
	public Integer findCountByCsid(Integer csid) {
		String hql = "select count(*) from Product p where p.categorySecond.csid = ? and state = 1";
		List<Long> list = this.getHibernateTemplate().find(hql, csid);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return null;
	}

	//查询指定二级分类下的分页商品的集合数据
	public List<Product> findProductByCsid(Integer csid, Integer begin, Integer limit, String style, String sort) {
		String hql = "from Product p where p.categorySecond.csid = ? and state = 1 order by "+ style +" "+ sort +", pid desc";
		List<Product> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{csid}, begin, limit));
		if(list!=null&&list.size()>0) {			
			return list;
		}
		return null;
	}

	//根据关键字查询记录数
	public Integer findCountByKeyword(String keyword) {
		String hql = "select count(*) from Product p where p.pname like ? and state = 1";
		String kw = "%"+keyword+"%";
		List<Long> list = this.getHibernateTemplate().find(hql, kw);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return null;
	}

	//根据关键字查询所有商品的集合数据
	public List<Product> findProductByKeyword(String keyword, Integer begin, Integer limit, String style, String sort) {
		String hql = "from Product p where p.pname like ? and state = 1 order by "+style+" "+sort+", pid desc";
		String kw = "%"+keyword+"%";
		List<Product> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{kw}, begin, limit));
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	//查询商品放大镜内的图片
	public List<Show> findShowByPid(Integer pid) {
		String hql = "from Show s where s.product.pid = ?";
		List<Show> list = this.getHibernateTemplate().find(hql, pid);
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	//查询某个商品
	public Product findProduct(Integer pid) {
		String hql = "from Product p where p.pid = ?";
		List<Product> list = this.getHibernateTemplate().find(hql, pid);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	//查询相关的3个商品
	public List<Product> findAboutProduct(Integer csid) {
		String hql = "from Product p where p.categorySecond.csid = ? and state = 1";
		List<Product> list = this.getHibernateTemplate().find(hql, csid);
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	//查询商品详情的图片
	public List<Detail> findDetailByPid(Integer pid) {
		String hql = "from Detail d where d.product.pid = ? order by pdid asc";
		List<Detail> list = this.getHibernateTemplate().find(hql, pid);
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	//查询商品的评论
	public List<Comment> findCommentByPid(Integer pid, Integer begin, Integer limit) {
		String hql = "from Comment c where c.product.pid = ?order by cdate desc";
		List<Comment> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Comment>(hql, new Object[]{pid}, begin, limit));
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	//根据商品id查询评论记录数
	public Integer findCountByPid(Integer pid) {
		String hql = "select count(*) from Comment c where c.product.pid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql, pid);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return null;
	}

	//查询用户是否收藏该商品
	public Collection findCollectionByPid(Integer uid, Integer pid) {
		String hql = "from Collection c where c.user.uid = ? and c.product.pid = ?";
		List<Collection> list = this.getHibernateTemplate().find(hql, uid, pid);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	

}
