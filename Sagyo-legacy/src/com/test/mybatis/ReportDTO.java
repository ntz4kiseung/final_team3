package com.test.mybatis;

public class ReportDTO
{
	private String userId,reportId,reportCateName,reportDetail;

	public String getUserId()
	{
		return userId;
	}

	public void setUserId(String userId)
	{
		this.userId = userId;
	}

	public String getReportId()
	{
		return reportId;
	}

	public void setReportId(String reportId)
	{
		this.reportId = reportId;
	}

	public String getReportCateName()
	{
		return reportCateName;
	}

	public void setReportCateName(String reportCateName)
	{
		this.reportCateName = reportCateName;
	}

	public String getReportDetail()
	{
		return reportDetail;
	}

	public void setReportDetail(String reportDetail)
	{
		this.reportDetail = reportDetail;
	}
	
	
}
