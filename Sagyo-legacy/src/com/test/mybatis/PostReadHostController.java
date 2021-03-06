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
	public String hostList(Model model, HttpSession session, String postId)
	{
		String userId = (String)session.getAttribute("userId");
		
		IPostDAO IPostDAO = sqlSession.getMapper(IPostDAO.class);
		IJoinDAO joinDAO = sqlSession.getMapper(IJoinDAO.class);
		IReportDAO reportDAO = sqlSession.getMapper(IReportDAO.class);
		
		int serchNum = (Integer)joinDAO.serchjoin(postId);
		int meetType = (Integer)joinDAO.postmeettype(postId);
		ArrayList<JoinDTO> joinDTO = joinDAO.joinlist(postId);
		
		for (JoinDTO joinDTOs : joinDTO)
		{
			String delJoin = joinDTOs.getDelJoin();
			String statusId = joinDTOs.getStatusId();
			if(delJoin != null && statusId !="ST00004")
			{
				joinDTOs.setStatusId("ST00001");
				joinDAO.joinupdate(joinDTOs);
			}
		}
		model.addAttribute("meetType",meetType);
		model.addAttribute("serchNum",serchNum);
		model.addAttribute("postlist",IPostDAO.postlist(userId, postId)); 
		model.addAttribute("list",joinDAO.joinlist(postId)); 
		model.addAttribute("replylist",joinDAO.replylist(postId));
		model.addAttribute("reportlist", reportDAO.reportlist());
		model.addAttribute("userId", userId);
		 
		return "WEB-INF/views/PostReadHost.jsp";
	}
	
	@RequestMapping(value = "/hostreportjoininsert.action", method = RequestMethod.GET)
	public String reportJoin(Model model, ReportDTO reportDTO, HttpSession session, String postId)
	{
		String result = null;
		IReportDAO reportDAO = sqlSession.getMapper(IReportDAO.class);
		String userId = (String)session.getAttribute("userId");
		reportDTO.setUserId(userId);
		reportDAO.reportjoininsert(reportDTO);
		int serchNum = (Integer)reportDAO.serchreportjoin(reportDTO.getReportId());
		if(serchNum>= 5)
		{
			reportDAO.joindelcheckinsert(reportDTO);
		}
		result = "redirect:postreadhost.action?postId="+postId;
		return result;
	}
	
	@RequestMapping(value = "/hostreportreplyinsert.action", method = RequestMethod.GET)
	public String reportreply(Model model, ReportDTO reportDTO, HttpSession session, String postId)
	{
		String result = null;
		IReportDAO reportDAO = sqlSession.getMapper(IReportDAO.class);
		String userId = (String)session.getAttribute("userId");
		reportDTO.setUserId(userId);
		reportDAO.reportreplyinsert(reportDTO);
		int serchNum = (Integer)reportDAO.serchreportreply(reportDTO.getReportId());
		if(serchNum>= 5)
		{
			reportDAO.reportreplyinsert(reportDTO);
		}
		result = "redirect:postreadhost.action?postId="+postId;
		return result;
	}
	
	@RequestMapping(value = "/hostreplyinsert.action", method = RequestMethod.GET)
	public String replyInsert(Model model, JoinDTO joinDTO, HttpSession session, String postId)
	{
		String result = null;
		IJoinDAO joinDAO = sqlSession.getMapper(IJoinDAO.class);
		String userId = (String)session.getAttribute("userId");
		joinDTO.setUserId(userId);
		joinDAO.replyinsert(joinDTO);
		result = "redirect:postreadhost.action?postId="+postId;
		return result;
	}
	
	@RequestMapping(value = "/hostpostDelete.action", method = RequestMethod.GET)
	public String postDelete(Model model, ReportDTO reportDTO)
	{
		String result = null;
		IReportDAO reportDAO = sqlSession.getMapper(IReportDAO.class);
		reportDAO.postdelte(reportDTO);
		result = "redirect:main.action";
		return result;
	}
	
	@RequestMapping(value = "/hostmessagesend.action", method = RequestMethod.POST)
	public String postMessage(Model model, MessageDTO messageDTO, String takeUserIds, HttpSession session, String postId)
	{
		String result = null;
		IMessageDAO messageDAO = sqlSession.getMapper(IMessageDAO.class);
		String userId = (String)session.getAttribute("userId");
		String[] takeuserid = takeUserIds.split(" ");
		messageDTO.setGiveUserId(userId);
		for (int i = 0; i < takeuserid.length; i++)
		{
			messageDTO.setTakeUserId(takeuserid[i]);
			messageDAO.messageinsert(messageDTO);
		}
		result = "redirect:postreadhost.action?postId="+postId;
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
		result = "redirect:postreadhost.action?postId="+joinArr[2];
		return result;
	}
	
	@RequestMapping(value = "/hostalljoinupdate.action", method = RequestMethod.POST)
	public String postJoinallUpdate(Model model, JoinDTO joinDTO, String joinIds, String statusId, String postId)
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
		int serchNum = (Integer)joinDAO.serchjoin(postId);
		model.addAttribute("serchNum",serchNum);
		result = "WEB-INF/views/serchNumAjax.jsp";
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
		
		if(logInUserId.equals(hostId))
			return ("redirect: postreadhost.action?postId="+postId);
		else
			return ("redirect: postreadjoin.action?postId="+postId);
	}
}
