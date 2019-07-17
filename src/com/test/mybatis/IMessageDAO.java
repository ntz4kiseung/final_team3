package com.test.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IMessageDAO
{
	public int checkId(String id);
	public int messageAdd(@Param("userId")String userId, @Param("message")MessageDTO message);
	public ArrayList<MessageDTO> messageRecevieList(String userId);
	public ArrayList<MessageDTO> messageSendList(String userId);
	public int messageinsert(MessageDTO messageDTO);
	public int messageDelete(String messageid);
	public int messageCheckDate(String messageid);
}
