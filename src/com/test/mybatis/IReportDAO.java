package com.test.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IReportDAO
{
	public ArrayList<ReportDTO> reportlist();
	public int reportpostinsert(@Param("reportDTO")ReportDTO reportDTO,@Param("postHostId")String postHostId);
	public int reportjoininsert(ReportDTO reportDTO);
	public int reportreplyinsert(ReportDTO reportDTO);
	public int joindelcheckinsert(ReportDTO reportDTO);
	public int postdelte(ReportDTO reportDTO);
}
