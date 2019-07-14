package com.test.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IAddrDAO
{
	public ArrayList<AddrDTO> addrSiList();
	public ArrayList<AddrDTO> addrGuList(String siid);
	public int userAddrInsert1(AddrDTO addr);
	public int userAddrInsert2(AddrDTO addr);
	public int userAddrInsert3(AddrDTO addr);

	
	public int updateAddr1(@Param("userId")String userId, @Param("addr")AddrDTO addr, @Param("addr2")AddrDTO addr2);
	public int updateAddr2(@Param("userId")String userId, @Param("addr")AddrDTO addr, @Param("addr2")AddrDTO addr2);
	public int updateAddr3(@Param("userId")String userId, @Param("addr")AddrDTO addr, @Param("addr2")AddrDTO addr2);
}
