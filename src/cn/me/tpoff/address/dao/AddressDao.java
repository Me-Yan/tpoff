package cn.me.tpoff.address.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.me.tpoff.address.vo.Address;

/**
 * 用户操作地址Dao
 * @author 严杨鸿
 *
 */

public class AddressDao extends HibernateDaoSupport {
	
	//根据用户id查询其所有的地址
	public List<Address> findAddrByUid(Integer uid) {
		String hql = "from Address a where a.user.uid = ?";
		List<Address> list = this.getHibernateTemplate().find(hql, uid);
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	//保存收货地址
	public void save(Address addr) {
		this.getHibernateTemplate().save(addr);
	}

	//根据aid查询实体对象
	public Address findAddrByAid(Integer aid) {
		String hql = "from Address a where a.aid = ?";
		List<Address> list = this.getHibernateTemplate().find(hql, aid);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	
	//删除收货地址
	public void deleteAddr(Address address) {
		this.getHibernateTemplate().delete(address);
	}

	//更改地址信息
	public void editAddr(Address addr) {
		this.getHibernateTemplate().update(addr);;
	}

	//查询旧的默认地址
	public Address findDefaultAddr() {
		String hql = "from Address a where a.state = 1";
		List<Address> list = this.getHibernateTemplate().find(hql);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	//根据aid查询地址
	public Address findAddrById(Integer aid) {
		String hql = "from Address a where a.aid = ?";
		List<Address> list = this.getHibernateTemplate().find(hql, aid);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
}
