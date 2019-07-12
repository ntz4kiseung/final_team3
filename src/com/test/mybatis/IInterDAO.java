package com.test.mybatis;

import java.util.ArrayList;

public interface IInterDAO
{
	public ArrayList<InterDTO> interMainList();
	public ArrayList<InterDTO> interSubList(String mainid);
	public int userInterInsert1(InterDTO inter);
	public int userInterInsert2(InterDTO inter);
	public int userInterInsert3(InterDTO inter);

}
