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
		
		IPostDAO dao = sqlSession.getMapper(IPostDAO.class);
		String followId = "anlant";
		model.addAttribute("postlist",dao.postlist(followId)); 
		model.addAttribute("list",dao.joinlist()); 
		model.addAttribute("replylist",dao.replylist());
		model.addAttribute("reportlist", dao.reportlist());
		 
		result = "WEB-INF/views/PostReadHost.jsp";

		return result;
	}
	
	@RequestMapping(value = "/hostjoininsert.action", method = RequestMethod.GET)
	public String JoinInsert(Model model, JoinDTO joinDTO)
	{
		String result = null;
		IPostDAO dao = sqlSession.getMapper(IPostDAO.class);
		System.out.println(joinDTO.getContents());
		joinDTO.setUserId("anlant");
		dao.joininsert(joinDTO);
		
		result = "redirect:postreadhost.action";
		return result;
	}
	
	@RequestMapping(value = "/hostreportinsert.action", method = RequestMethod.GET)
	public String reportPost(Model model, ReportDTO reportDTO)
	{
		String result = null;
		IPostDAO dao = sqlSession.getMapper(IPostDAO.class);
		reportDTO.setUserId("anlant");
		dao.reportpostinsert(reportDTO);
		
		result = "redirect:postreadhost.action";
		return result;
	}
	
	@RequestMapping(value = "/hostreportjoininsert.action", method = RequestMethod.GET)
	public String reportJoin(Model model, ReportDTO reportDTO)
	{
		String result = null;
		IPostDAO dao = sqlSession.getMapper(IPostDAO.class);
		reportDTO.setUserId("anlant");
		dao.reportjoininsert(reportDTO);
		
		result = "redirect:postreadjoin.action";
		return result;
	}
	
	@RequestMapping(value = "/hostreportreplyinsert.action", method = RequestMethod.GET)
	public String reportreply(Model model, ReportDTO reportDTO)
	{
		String result = null;
		IPostDAO dao = sqlSession.getMapper(IPostDAO.class);
		reportDTO.setUserId("anlant");
		dao.reportreplyinsert(reportDTO);
		
		result = "redirect:postreadhost.action";
		return result;
	}
	
	@RequestMapping(value = "/hostreplyinsert.action", method = RequestMethod.GET)
	public String replyInsert(Model model, JoinDTO joinDTO)
	{
		String result = null;
		IPostDAO dao = sqlSession.getMapper(IPostDAO.class);
		joinDTO.setUserId("anlant");
		dao.replyinsert(joinDTO);
		result = "redirect:postreadhost.action";
		return result;
	}
	
	@RequestMapping(value = "/hostjoindelcheckinsert.action", method = RequestMethod.GET)
	public String joinDelcheckInsert(Model model, ReportDTO reportDTO)
	{
		String result = null;
		IPostDAO dao = sqlSession.getMapper(IPostDAO.class);
		dao.joindelcheckinsert(reportDTO);
		result = "redirect:postreadhost.action";
		return result;
	}
	
	@RequestMapping(value = "/hostpostDelete.action", method = RequestMethod.GET)
	public String postDelete(Model model, ReportDTO reportDTO)
	{
		String result = null;
		IPostDAO dao = sqlSession.getMapper(IPostDAO.class);
		System.out.println("TEST");
		reportDTO.setReportId("PT00002");
		System.out.println(reportDTO.getReportId());
		dao.postdelte(reportDTO);
		result = "redirect:postreadhost.action";
		return result;
	}
}
