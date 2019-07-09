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
		IMyPageDAO dao1 = sqlSession.getMapper(IMyPageDAO.class);
		IPostDAO dao2 = sqlSession.getMapper(IPostDAO.class);
		
		model.addAttribute("myPageList",dao1.myPageList());
		model.addAttribute("myPageAddrList", dao1.myPageAddrList());
		model.addAttribute("myPageInterList", dao1.myPageInterList());
		model.addAttribute("myReviewList", dao2.myReviewList());
		
		return "/WEB-INF/views/CreatePostList.jsp";
	}
	
	
	@RequestMapping(value="/joinpostlist.action", method=RequestMethod.GET)
	public String reviewList(Model model)
	{
		IMyPageDAO dao1 = sqlSession.getMapper(IMyPageDAO.class);
		IPostDAO dao2 = sqlSession.getMapper(IPostDAO.class);
		
		model.addAttribute("myPageList",dao1.myPageList());
		model.addAttribute("myPageAddrList", dao1.myPageAddrList());
		model.addAttribute("myPageInterList", dao1.myPageInterList());
		model.addAttribute("reviewList", dao2.reviewList());
		
		return "/WEB-INF/views/JoinPostList.jsp";
	}
	


	
}
