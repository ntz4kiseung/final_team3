package com.test.mybatis;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LogInController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/login.action", method=RequestMethod.GET)
	public String openLogin()
	{
		
		return "/WEB-INF/views/LogIn.jsp";
	}
	
	@RequestMapping(value="/checklogin.action")
	public void checkLogin(String[] logindata, HttpServletResponse response) throws IOException
	{
		IUserDAO userA = sqlSession.getMapper(IUserDAO.class);
		int count = 0;
		count =  userA.checkIdPw(logindata[0], logindata[1]);
		
		System.out.println(count);
		response.getWriter().print(count);
	}
	
	@RequestMapping(value="/loginsuccess.action", method=RequestMethod.POST)
	public String successLogin(HttpSession session, UserDTO user)
	{
		session.setAttribute("userId", user.getUserId());
		System.out.println(user.getUserId());
		
		return "redirect: main.action";
	}
	
	@RequestMapping(value="/logout.action", method=RequestMethod.GET)
	public String logOut(HttpSession session)
	{
		session.removeAttribute("userId");
		return "redirect: main.action";
	}

}
