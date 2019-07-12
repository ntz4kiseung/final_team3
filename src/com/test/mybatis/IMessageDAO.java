package com.test.mybatis;

import java.util.ArrayList;

public interface IMessageDAO
{
	public int checkId(String id);
	public int messageAdd(MessageDTO m);
	public ArrayList<MessageDTO> messageRecevieList();
	public ArrayList<MessageDTO> messageSendList();
	public int messageinsert(MessageDTO messageDTO);
	public int messageDelete(String messageid);
}
