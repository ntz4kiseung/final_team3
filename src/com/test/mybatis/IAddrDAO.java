package com.test.mybatis;

import java.util.ArrayList;

public interface IAddrDAO
{
	public ArrayList<AddrDTO> addrSiList();
	public ArrayList<AddrDTO> addrGuList(String siid);
	public int userAddrInsert1(AddrDTO addr);
	public int userAddrInsert2(AddrDTO addr);
	public int userAddrInsert3(AddrDTO addr);

}
