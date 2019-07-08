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
	
	@RequestMapping(value="/follow.action", method = RequestMethod.GET)
	public String studentList( Model model)
	{
		
		IFollowDAO dao = sqlSession.getMapper(IFollowDAO.class);
		
		model.addAttribute("followList",dao.followList());
		model.addAttribute("myProfile",dao.myProfile());
		 
		return "WEB-INF/views/MyFollower.jsp";
	}
	

	@RequestMapping(value = "/follower.action", method = RequestMethod.GET)
	public String studentInsertForm(IFollowDAO f)
	{
		
		return "WEB-INF/views/StudentInsertForm.jsp";
	}
	

	
	
	
	

}
