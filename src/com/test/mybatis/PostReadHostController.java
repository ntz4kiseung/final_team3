package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class PostReadHostController
{
	// SqlSession 을 활용하여 마이바티스 객체 의존성 (자동) 주입
	@Autowired
	private SqlSession sqlSession;

	// 매개변수를 정의하는 과정에서 매개변수 목록에 적혀있는
	// 클래스의 객체 정보는 스프링이 제공한다.

	// 사용자의 요청 주소와 메소드를 매핑하는 과정 필요
	// @RequestMapping(value = "요청주소", method = 전송방식)
	// 이 때, 전송 방식은 submit 액션인 경우만 POST
	// 나머지 모든 전송 방식은 GET 으로 처리한다.
	
	@RequestMapping(value = "/postreadhost.action", method = RequestMethod.GET)
	public String hostList(Model model)
	{
		String result = null;
		
		IPostDAO IPostDAO = sqlSession.getMapper(IPostDAO.class);
		IJoinDAO joinDAO = sqlSession.getMapper(IJoinDAO.class);
		IReportDAO reportDAO = sqlSession.getMapper(IReportDAO.class);
		String followId = "anlant";
		model.addAttribute("postlist",IPostDAO.postlist(followId)); 
		model.addAttribute("list",joinDAO.joinlist()); 
		model.addAttribute("replylist",joinDAO.replylist());
		model.addAttribute("reportlist", reportDAO.reportlist());
		 
		result = "WEB-INF/views/PostReadHost.jsp";

		return result;
	}
	
	@RequestMapping(value = "/hostjoininsert.action", method = RequestMethod.GET)
	public String JoinInsert(Model model, JoinDTO joinDTO)
	{
		String result = null;
		IJoinDAO joinDAO = sqlSession.getMapper(IJoinDAO.class);
		System.out.println(joinDTO.getContents());
		joinDTO.setUserId("anlant");
		joinDAO.joininsert(joinDTO);
		
		result = "redirect:postreadhost.action";
		return result;
	}
	
	@RequestMapping(value = "/hostreportinsert.action", method = RequestMethod.GET)
	public String reportPost(Model model, ReportDTO reportDTO)
	{
		String result = null;
		IReportDAO reportDAO = sqlSession.getMapper(IReportDAO.class);
		reportDTO.setUserId("anlant");
		reportDAO.reportpostinsert(reportDTO);
		
		result = "redirect:postreadhost.action";
		return result;
	}
	
	@RequestMapping(value = "/hostreportjoininsert.action", method = RequestMethod.GET)
	public String reportJoin(Model model, ReportDTO reportDTO)
	{
		String result = null;
		IReportDAO reportDAO = sqlSession.getMapper(IReportDAO.class);
		reportDTO.setUserId("anlant");
		reportDAO.reportjoininsert(reportDTO);
		
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
		//IJoinDAO joinDAO = sqlSession.getMapper(IJoinDAO.class);
		System.out.println("test");
		System.out.println(joinIds);
		String[] joinId = joinIds.split(" ");
		System.out.println(joinId);
		//joinDAO.joinupdate(joinDTO);
		result = "redirect:postreadhost.action";
		return result;
	}
}
