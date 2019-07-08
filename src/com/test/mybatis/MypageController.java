package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/createpostlist.action", method=RequestMethod.GET)
	public String myReviewList(Model model)
	{
		IAddrDAO dao1 = sqlSession.getMapper(IAddrDAO.class);
		IInterDAO dao2 = sqlSession.getMapper(IInterDAO.class);
		IUserDAO dao3 = sqlSession.getMapper(IUserDAO.class);
		IPostDAO dao4 = sqlSession.getMapper(IPostDAO.class);
		
		model.addAttribute("addr", dao1.addr());
		model.addAttribute("inter", dao2.inter());
		model.addAttribute("profile",dao3.profile());
		model.addAttribute("CertiCheck",dao3.CertiCheck());
		model.addAttribute("myReviewList", dao4.myReviewList());
		
		return "/WEB-INF/views/CreatePostList.jsp";
	}
	
	
	@RequestMapping(value="/joinpostlist.action", method=RequestMethod.GET)
	public String reviewList(Model model)
	{
		IAddrDAO dao1 = sqlSession.getMapper(IAddrDAO.class);
		IInterDAO dao2 = sqlSession.getMapper(IInterDAO.class);
		IUserDAO dao3 = sqlSession.getMapper(IUserDAO.class);
		IPostDAO dao4 = sqlSession.getMapper(IPostDAO.class);
		
		model.addAttribute("addr", dao1.addr());
		model.addAttribute("inter", dao2.inter());
		model.addAttribute("profile",dao3.profile());
		model.addAttribute("CertiCheck",dao3.CertiCheck());
		model.addAttribute("reviewList", dao4.reviewList());
		
		return "/WEB-INF/views/JoinPostList.jsp";
	}
	


	
}
