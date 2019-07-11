package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FollowController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/myfollowing.action", method = RequestMethod.GET)
	public String myFollowing(Model model)
	{
		IFollowingDAO dao = sqlSession.getMapper(IFollowingDAO.class);
		IMyPageDAO dao2 = sqlSession.getMapper(IMyPageDAO.class);
		
		model.addAttribute("followingBad",dao.followingBad());
		model.addAttribute("followingList",dao.followingList());
		model.addAttribute("followingAddrList",dao.followingAddrList());
		model.addAttribute("followingInterList",dao.followingInterList());
		
		model.addAttribute("MyPageBad",dao2.MyPageBad());
		model.addAttribute("myPageList", dao2.myPageList());
		model.addAttribute("myPageAddrList", dao2.myPageAddrList());
		model.addAttribute("myPageInterList", dao2.myPageInterList());	
		
		return "WEB-INF/views/MyFollowing.jsp";
	}
	
	@RequestMapping(value="/myfollower.action", method = RequestMethod.GET)
	public String myFollower(Model model)
	{
		IFollowerDAO dao = sqlSession.getMapper(IFollowerDAO.class);
		IMyPageDAO dao2 = sqlSession.getMapper(IMyPageDAO.class);
		
		model.addAttribute("followerBad",dao.followerBad());
		model.addAttribute("followerList",dao.followerList());
		model.addAttribute("followerAddrList",dao.followerAddrList());
		model.addAttribute("followerInterList",dao.followerInterList());
		
		model.addAttribute("MyPageBad",dao2.MyPageBad());
		model.addAttribute("myPageList", dao2.myPageList());
		model.addAttribute("myPageAddrList", dao2.myPageAddrList());
		model.addAttribute("myPageInterList", dao2.myPageInterList());	
		
		return "WEB-INF/views/MyFollower.jsp";
	}
}
