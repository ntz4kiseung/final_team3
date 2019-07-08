package com.test.mybatis;

public class MessageDTO
{
	private String contents, giveUserId, takeUserId, sendDate, checkDate;
	private String messageId;

	public String getContents()
	{
		return contents;
	}

	public void setContents(String contents)
	{
		this.contents = contents;
	}

	public String getGiveUserId()
	{
		return giveUserId;
	}

	public void setGiveUserId(String giveUserId)
	{
		this.giveUserId = giveUserId;
	}

	public String getTakeUserId()
	{
		return takeUserId;
	}

	public void setTakeUserId(String takeUserId)
	{
		this.takeUserId = takeUserId;
	}

	public String getSendDate()
	{
		return sendDate;
	}

	public void setSendDate(String sendDate)
	{
		this.sendDate = sendDate;
	}

	public String getCheckDate()
	{
		return checkDate;
	}

	public void setCheckDate(String checkDate)
	{
		this.checkDate = checkDate;
	}

	public String getMessageId()
	{
		return messageId;
	}

	public void setMessageId(String messageId)
	{
		this.messageId = messageId;
	}
}
