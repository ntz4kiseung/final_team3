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
	
	@RequestMapping(value="/joinpostlist.action", method=RequestMethod.GET)
	public String mypageList(Model model)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		model.addAttribute("userList", dao.userList());
		
		model.addAttribute("reviewList", dao.reviewList());
		
		return "/WEB-INF/views/JoinPostList.jsp";
	}
	
}
