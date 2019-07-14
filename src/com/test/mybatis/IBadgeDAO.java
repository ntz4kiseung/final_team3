package com.test.mybatis;

import java.util.ArrayList;

public interface IBadgeDAO
{
	public ArrayList<BadgeDTO> BadgeList1();
	public ArrayList<BadgeDTO> BadgeList2();
	public ArrayList<BadgeDTO> BadgeList3();
	public ArrayList<BadgeDTO> BadgeList4();
	public int mainBadge(String badgeLogId);
	
	public ArrayList<BadgeDTO> positiveBadge();
	public ArrayList<BadgeDTO> negativeBadge();
	public ArrayList<BadgeDTO> hostBadge();
	
	public ArrayList<BadgeDTO> randomMainBadge();
	public ArrayList<String> getUserList(String badgePointId);
	
}
