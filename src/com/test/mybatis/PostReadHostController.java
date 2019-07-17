package com.test.mybatis;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class PostReadHostController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/postreadhost.action", method = RequestMethod.GET)
	public String hostList(Model model,HttpSession session, String postId)
	{
		IPostDAO IPostDAO = sqlSession.getMapper(IPostDAO.class);
		IJoinDAO joinDAO = sqlSession.getMapper(IJoinDAO.class);
		IReportDAO reportDAO = sqlSession.getMapper(IReportDAO.class);
		
		String followId = "anlant";
		String postHostId = "PT00002";
		
		int serchNum = (Integer)joinDAO.serchjoin(postHostId);
		ArrayList<JoinDTO> joinDTO = joinDAO.joinlist(postHostId);
		
		for (JoinDTO joinDTOs : joinDTO)
		{
			String delJoin = joinDTOs.getDelJoin();
			if(delJoin != null)
			{
				joinDTOs.setStatusId("ST00001");
				joinDAO.joinupdate(joinDTOs);
			}
		}
		
		model.addAttribute("serchNum",serchNum);
		model.addAttribute("postlist",IPostDAO.postlist(followId, postHostId)); 
		model.addAttribute("list",joinDAO.joinlist(postHostId)); 
		model.addAttribute("replylist",joinDAO.replylist(postHostId));
		model.addAttribute("reportlist", reportDAO.reportlist());
		 
		return "WEB-INF/views/PostReadHost.jsp";
	}
	
	@RequestMapping(value = "/hostreportjoininsert.action", method = RequestMethod.GET)
	public String reportJoin(Model model, ReportDTO reportDTO)
	{
		String result = null;
		IReportDAO reportDAO = sqlSession.getMapper(IReportDAO.class);
		reportDTO.setUserId("anlant");
		reportDAO.reportjoininsert(reportDTO);
		int serchNum = (Integer)reportDAO.serchreportjoin(reportDTO.getReportId());
		if(serchNum>= 5)
		{
			reportDAO.joindelcheckinsert(reportDTO);
		}
		result = "redirect:postreadjoin.action";
		return result;
	}
	
	@RequestMapping(value = "/hostreportreplyinsert.action", method = RequestMethod.GET)
	public String reportreply(Model model, ReportDTO reportDTO)
	{
		String result = null;
		IReportDAO reportDAO = sqlSession.getMapper(IReportDAO.class);
		reportDTO.setUserId("anlant");
		reportDAO.reportreplyinsert(reportDTO);
		int serchNum = (Integer)reportDAO.serchreportreply(reportDTO.getReportId());
		if(serchNum>= 5)
		{
			reportDAO.reportreplyinsert(reportDTO);
		}
		result = "redirect:postreadhost.action";
		return result;
	}
	
	@RequestMapping(value = "/hostreplyinsert.action", method = RequestMethod.GET)
	public String replyInsert(Model model, JoinDTO joinDTO)
	{
		String result = null;
		IJoinDAO joinDAO = sqlSession.getMapper(IJoinDAO.class);
		joinDTO.setUserId("anlant");
		joinDAO.replyinsert(joinDTO);
		result = "redirect:postreadhost.action";
		return result;
	}
	
	@RequestMapping(value = "/hostjoindelcheckinsert.action", method = RequestMethod.GET)
	public String joinDelcheckInsert(Model model, ReportDTO reportDTO)
	{
		String result = null;
		IReportDAO reportDAO = sqlSession.getMapper(IReportDAO.class);
		reportDAO.joindelcheckinsert(reportDTO);
		result = "redirect:postreadhost.action";
		return result;
	}
	
	@RequestMapping(value = "/hostpostDelete.action", method = RequestMethod.GET)
	public String postDelete(Model model, ReportDTO reportDTO)
	{
		String result = null;
		IReportDAO reportDAO = sqlSession.getMapper(IReportDAO.class);
		reportDTO.setReportId("PT00002");
		reportDAO.postdelte(reportDTO);
		result = "redirect:postreadhost.action";
		return result;
	}
	
	@RequestMapping(value = "/hostmessagesend.action", method = RequestMethod.POST)
	public String postMessage(Model model, MessageDTO messageDTO, String takeUserIds)
	{
		String result = null;
		IMessageDAO messageDAO = sqlSession.getMapper(IMessageDAO.class);
		String[] takeuserid = takeUserIds.split(" ");
		messageDTO.setGiveUserId("BLUMBALD");
		for (int i = 0; i < takeuserid.length; i++)
		{
			messageDTO.setTakeUserId(takeuserid[i]);
			messageDAO.messageinsert(messageDTO);
		}
		result = "redirect:postreadhost.action";
		return result;
	}
	
	@RequestMapping(value = "/hostjoinupdate.action", method = RequestMethod.GET)
	public String postJoinUpdate(Model model, JoinDTO joinDTO, String[] joinArr)
	{
		String result = null;
		IJoinDAO joinDAO = sqlSession.getMapper(IJoinDAO.class);
		joinDTO.setJoinId(joinArr[0]);
		joinDTO.setStatusId(joinArr[1]);
		joinDAO.joinupdate(joinDTO);
		result = "redirect:postreadhost.action";
		return result;
	}
	
	@RequestMapping(value = "/hostalljoinupdate.action", method = RequestMethod.POST)
	public String postJoinallUpdate(Model model, JoinDTO joinDTO, String joinIds, String statusId)
	{
		String result = null;
		IJoinDAO joinDAO = sqlSession.getMapper(IJoinDAO.class);
		String[] joinId = joinIds.split(" ");
		joinDTO.setStatusId(statusId);
		for (int i = 0; i < joinId.length; i++)
		{
			joinDTO.setJoinId(joinId[i]);
			joinDAO.joinupdate(joinDTO);
		}
		result = "redirect:postreadhost.action";
		return result;
	}
	
	@RequestMapping(value="post.action")
	public String postRead(HttpSession session, String postId)
	{
		String logInUserId = (String) session.getAttribute("userId");
		IPostDAO dao = sqlSession.getMapper(IPostDAO.class);
		String hostId = dao.getHost(postId);
		
		if(postId==null || postId.equals(""))
			return "redirect: main.action";
		
		if(hostId==null || hostId.equals(""))
			return "redirect: main.action";
		
		if(logInUserId==null || logInUserId.equals(""))
			return "redirect: login.action";
		
		if(logInUserId==hostId)
			return ("redirect: postreadhost.action?postId="+postId);
		else
			return ("redirect: postreadjoin.action?postId="+postId);
	}
}
