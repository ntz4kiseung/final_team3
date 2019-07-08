package com.test.mybatis;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
		
		IPostDAO dao = sqlSession.getMapper(IPostDAO.class);
		model.addAttribute("postlist",dao.postlist());
		model.addAttribute("list",dao.joinlist()); 
		model.addAttribute("replylist",dao.replylist());
		model.addAttribute("reportlist", dao.reportlist());
		 
		result = "WEB-INF/views/PostReadJoin.jsp";

		return result;
	}
	
	@RequestMapping(value = "/postreadhost.action", method = RequestMethod.GET)
	public String hostList(Model model)
	{
		String result = null;
		
		IPostDAO dao = sqlSession.getMapper(IPostDAO.class);
		model.addAttribute("postlist",dao.postlist()); 
		model.addAttribute("list",dao.joinlist()); 
		model.addAttribute("replylist",dao.replylist());
		model.addAttribute("reportlist", dao.reportlist());
		 
		result = "WEB-INF/views/PostReadHost.jsp";

		return result;
	}
	
	@RequestMapping(value = "/followinsert.action", method = RequestMethod.POST)
	public String followInsert(ModelMap model, FollowDTO followDTO)
	{
		String result = null;
		System.out.println(followDTO.getUserId());
		IPostDAO dao = sqlSession.getMapper(IPostDAO.class);
		followDTO.setUserId("anlant");
		String userId = followDTO.getFollowId();
		dao.followinsert(followDTO);
		System.out.println("userId");
		model.addAttribute("postlist",userId); 
		result = "WEB-INF/views/FollowUpdateAjax.jsp";

		return result;
	}
	@RequestMapping(value = "/followdelete.action", method = RequestMethod.POST)
	public String followDelete(ModelMap model, FollowDTO followDTO)
	{
		String result = null;
		System.out.println(followDTO.getUserId());
		IPostDAO dao = sqlSession.getMapper(IPostDAO.class);
		followDTO.setUserId("anlant");
		String userId = followDTO.getFollowId();
		dao.followdelete(followDTO); 
		System.out.println("userId");
		model.addAttribute("postlist",userId);
		result = "WEB-INF/views/FollowDeleteAjax.jsp";

		return result;
	}
}
