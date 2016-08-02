package cn.me.tpoff.address.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.me.tpoff.address.dao.AddressDao;
import cn.me.tpoff.address.vo.Address;

/**
 * 用户操作地址Service
 * @author 严杨鸿
 *
 */


@Transactional
public class AddressService {
	private AddressDao addressDao;

	public AddressDao getAddressDao() {
		return addressDao;
	}
	public void setAddressDao(AddressDao addressDao) {
		this.addressDao = addressDao;
	}
	
	//根据用户id查询其所有的地址
	public List<Address> findAddrByUid(Integer uid) {
		return addressDao.findAddrByUid(uid);
	}
	
	//保存收货地址
	public void save(Address addr) {
		addressDao.save(addr);
	}
	
	//根据aid查询实体对象
	public Address findAddrByAid(Integer aid) {
		return addressDao.findAddrByAid(aid);
	}
	
	//删除收货地址
	public void deleteAddr(Address address) {
		addressDao.deleteAddr(address);
	}
	
	//更改地址
	public void editAddr(Address addr) {
		addressDao.editAddr(addr);
	}
	
	//设置默认地址
	public void setDefaultAddr(Integer aid) {
		Address addressDefault = findAddrByAid(aid);	//新的默认地址
		Address address = addressDao.findDefaultAddr();	//旧的默认地址
		if(address!=null) {
			address.setState(0);
		}
		addressDefault.setState(1);
	}
}
