package com.test.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IBadgeDAO
{
   public ArrayList<BadgeDTO> BadgeList1(String userId);
   public int BadgeList1_count(String userId);
   public ArrayList<BadgeDTO> BadgeList1_date(String userId);
   
   public ArrayList<BadgeDTO> PointList(@Param("userId")String userId, @Param("badgeId")String badgeId);
   
   
   public ArrayList<BadgeDTO> BadgeList2(String userId);
   public ArrayList<BadgeDTO> BadgeList3(String userId);
   public ArrayList<BadgeDTO> BadgeList4(String userId);
   public int mainBadge(@Param("userId")String userId, @Param("badgeLogId")String badgeLogId );
   
   public ArrayList<BadgeDTO> positiveBadge();
   public ArrayList<BadgeDTO> negativeBadge();
   public ArrayList<BadgeDTO> hostBadge();
   
   public ArrayList<BadgeDTO> randomMainBadge();
   public ArrayList<String> getUserList(String badgePointId);
   
}