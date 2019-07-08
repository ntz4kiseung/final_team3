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
public class MyProfileController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/myProfile.action", method = RequestMethod.GET)
	public String myProfile(Model model)
	{
		IProfileDAO dao = sqlSession.getMapper(IProfileDAO.class);
		IMyPageDAO dao2 = sqlSession.getMapper(IMyPageDAO.class);
		
		model.addAttribute("UserList",dao.UserList()); 
		model.addAttribute("myPageList", dao2.myPageList());
		model.addAttribute("myPageAddrList", dao2.myPageAddrList());
		model.addAttribute("myPageInterList", dao2.myPageInterList());
		
		return "WEB-INF/views/MyProfile.jsp";
	}
	
	@RequestMapping(value="/myProfileModify.action", method = RequestMethod.GET)
	public String myProfileModify(Model model)
	{
				 
		return "WEB-INF/views/MyProfileModify.jsp";
	}
	

	@RequestMapping(value="/myBadge.action", method = RequestMethod.GET)
	public String myBadge(Model model)
	{
				 
		return "WEB-INF/views/MyBadge.jsp";
	}
	
	@RequestMapping(value="/myFollowing.action", method = RequestMethod.GET)
	public String myFollowing(Model model)
	{
				 
		return "WEB-INF/views/MyFollowing.jsp";
	}
	
	@RequestMapping(value="/myFollower.action", method = RequestMethod.GET)
	public String myFollower(Model model)
	{
				 
		return "WEB-INF/views/MyFollower.jsp";
	}
}
