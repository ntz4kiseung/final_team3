package com.test.mybatis;

import java.util.ArrayList;

public interface IReportDAO
{
	public ArrayList<ReportDTO> reportlist();
	public int reportpostinsert(ReportDTO reportDTO);
	public int reportjoininsert(ReportDTO reportDTO);
	public int reportreplyinsert(ReportDTO reportDTO);
	public int joindelcheckinsert(ReportDTO reportDTO);
	public int postdelte(ReportDTO reportDTO);
}
