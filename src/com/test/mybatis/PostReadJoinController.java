package com.test.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class PostReadJoinController
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
	@RequestMapping(value = "/postreadjoin.action", method = RequestMethod.GET)
	public String readList(Model model)
	{
		String result = null;
		IPostDAO postDAO = sqlSession.getMapper(IPostDAO.class);
		IJoinDAO joinDAO = sqlSession.getMapper(IJoinDAO.class);
		IReportDAO reportDAO = sqlSession.getMapper(IReportDAO.class);
		String followIds = "anlant";
		String postHostId = "PT00002";
		int serchNum = (Integer)joinDAO.serchjoin(postHostId);
		ArrayList<JoinDTO> joinDTO = joinDAO.joinlist(postHostId);
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
		model.addAttribute("serchNum",serchNum);
		model.addAttribute("postlist",postDAO.postlist(followIds, postHostId));
		model.addAttribute("list",joinDAO.joinlist(postHostId)); 
		model.addAttribute("replylist",joinDAO.replylist(postHostId));
		model.addAttribute("reportlist", reportDAO.reportlist());
		
		result = "WEB-INF/views/PostReadJoin.jsp";

		return result;
	}
	
	@RequestMapping(value = "/followinsert.action", method = RequestMethod.POST)
	public String follow(ModelMap model, FollowDTO followDTO,String postHostId)
	{
		
		String result = null;
		IFollowDAO followdao = sqlSession.getMapper(IFollowDAO.class);
		IPostDAO postDAO = sqlSession.getMapper(IPostDAO.class);
		String followIdin = "anlant";
		followDTO.setUserId(followIdin);
		PostDTO postDTO = postDAO.postlist(followIdin, postHostId);
		int followId = Integer.parseInt(postDTO.getFollowId());
		if(followId != 0)
		{
			followdao.followdelete(followDTO);
		}
		else
		{
			followdao.followinsert(followDTO);
		}
		postDTO = postDAO.postlist(followIdin, postHostId);
		followId = Integer.parseInt(postDTO.getFollowId());
		model.addAttribute("followId",followId);
		result = "WEB-INF/views/FollowUpdateAjax.jsp";

		return result;
	}
	
	@RequestMapping(value = "/joininsert.action", method = RequestMethod.GET)
	public String JoinInsert(Model model, JoinDTO joinDTO,String postHostId)
	{
		String result = null;
		IJoinDAO joindao = sqlSession.getMapper(IJoinDAO.class);
		System.out.println(joinDTO.getContents());
		joinDTO.setUserId("anlant");
		joindao.joininsert(joinDTO, postHostId);
		
		result = "redirect:postreadjoin.action";
		return result;
	}
	
	@RequestMapping(value = "/reportinsert.action", method = RequestMethod.GET)
	public String reportPost(Model model, ReportDTO reportDTO,String postHostId)
	{
		String result = null;
		IReportDAO reportDAO = sqlSession.getMapper(IReportDAO.class);
		reportDTO.setUserId("anlant");
		reportDAO.reportpostinsert(reportDTO, postHostId);
		
		result = "redirect:postreadjoin.action";
		return result;
	}
	
	@RequestMapping(value = "/reportjoininsert.action", method = RequestMethod.GET)
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
	
	@RequestMapping(value = "/reportreplyinsert.action", method = RequestMethod.GET)
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
		result = "redirect:postreadjoin.action";
		return result;
	}
	
	@RequestMapping(value = "/replyinsert.action", method = RequestMethod.GET)
	public String replyInsert(Model model, JoinDTO joinDTO)
	{
		String result = null;
		IJoinDAO joinDAO = sqlSession.getMapper(IJoinDAO.class);
		joinDTO.setUserId("anlant");
		joinDAO.replyinsert(joinDTO);
		result = "redirect:postreadjoin.action";
		return result;
	}
	
	@RequestMapping(value = "/joindelcheckinsert.action", method = RequestMethod.GET)
	public String joinDelcheckInsert(Model model, ReportDTO reportDTO)
	{
		String result = null;
		IReportDAO reportDAO = sqlSession.getMapper(IReportDAO.class);
		reportDAO.joindelcheckinsert(reportDTO);
		result = "redirect:postreadjoin.action";
		return result;
	}
	
	@RequestMapping(value = "/postDelete.action", method = RequestMethod.GET)
	public String postDelete(Model model, ReportDTO reportDTO)
	{
		String result = null;
		IReportDAO reportDAO = sqlSession.getMapper(IReportDAO.class);
		System.out.println("TEST");
		reportDTO.setReportId("PT00002");
		System.out.println(reportDTO.getReportId());
		reportDAO.postdelte(reportDTO);
		result = "redirect:postreadjoin.action";
		return result;
	}
}
