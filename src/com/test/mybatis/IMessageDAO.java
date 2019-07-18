package com.test.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IMessageDAO
{
	public int checkId(String id);
	public int messageAdd(@Param("userId")String userId, @Param("message")MessageDTO message);
	public ArrayList<MessageDTO> messageRecevieList(@Param("userId")String userId, @Param("pageNum")String pageNum);
	public ArrayList<MessageDTO> messageSendList(@Param("userId")String userId, @Param("pageNum")String pageNum);
	public int messageinsert(MessageDTO messageDTO);
	public int messageDelete(@Param("userId")String userId, @Param("messageId")String messageId);
	public int messageCheckDate(String messageid);
	public int messageRecevieTotalPageNum(String userId);
	public int messageRecevieTotalLargePageNum(String userId);
	public int messageSendTotalPageNum(String userId);
	public int messageSendTotalLargePageNum(String userId);
}