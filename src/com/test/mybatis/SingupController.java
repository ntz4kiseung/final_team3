package com.test.mybatis;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SingupController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/signup.action", method=RequestMethod.GET)
	public String signupForm(ModelMap model)
	{
		String result = "/WEB-INF/views/SignUp.jsp";
		
		IInterDAO interA = sqlSession.getMapper(IInterDAO.class);
		IAddrDAO addrA = sqlSession.getMapper(IAddrDAO.class);
		
		model.addAttribute("addrsilist", addrA.addrSiList());
		model.addAttribute("intermainlist", interA.interMainList());
		return result;
	}
	
	@RequestMapping(value="/insertuser.action", method=RequestMethod.POST)
	public String signupInsert(UserDTO user, AddrDTO addr, InterDTO inter)
	{
		
		IUserDAO userA = sqlSession.getMapper(IUserDAO.class);
		IInterDAO interA = sqlSession.getMapper(IInterDAO.class);
		IAddrDAO addrA = sqlSession.getMapper(IAddrDAO.class);
		
		userA.userLoginInsert(user);
		
		userA.userNewBadgeInsert(user);
		String badgelogid = userA.userNewBadgeSelect(user);
		  
		userA.userEssentialInsert(user, badgelogid);
		 
		userA.userSubInsert(user);
		
		userA.userTelInsert(user);
		
		userA.userEmailInsert(user);
		  
		addrA.userAddrInsert1(addr);
		
		if(addr.getAddrGuId2() != "")
		{
			addrA.userAddrInsert2(addr);
		}
		else 
		{
		}
		if(addr.getAddrGuId3() != "")
		{
			addrA.userAddrInsert3(addr);
		}
		else 
		{
		}
		
		interA.userInterInsert1(inter); 
		if (inter.getInterSubId2() != "")
		{
			interA.userInterInsert2(inter);
		}
		else 
		{
		}
		if (inter.getInterSubId3() != "")
		{
			interA.userInterInsert3(inter);
		}
		else 
		{
		}
		return "redirect:signup.action";
	}
	
	@RequestMapping(value="/addrguajax.action", method=RequestMethod.GET)
	public String addrGuAjax(String siid, ModelMap model)
	{
		IAddrDAO addrA = sqlSession.getMapper(IAddrDAO.class);
		
		model.addAttribute("list", addrA.addrGuList(siid));
		
		return "/WEB-INF/views/AddrGuAjax.jsp";
	}

	@RequestMapping(value="/intersubajax.action", method=RequestMethod.GET)
	public String intersubajax(String mainid, ModelMap model)
	{
		IInterDAO interA = sqlSession.getMapper(IInterDAO.class);
		model.addAttribute("list", interA.interSubList(mainid));
		return "/WEB-INF/views/InterSubAjax.jsp";
	}
	
	@RequestMapping(value="/idcheck.action")
	public void singUpcheckId(String id, HttpServletResponse response) throws IOException
	{
		int result = 0;
		IUserDAO userA = sqlSession.getMapper(IUserDAO.class);
		result = userA.checkId(id);
		
		response.getWriter().print(result);
	}
	
	@RequestMapping(value="/nickcheck.action")
	public void singUpcheckNinkname(String nickname, HttpServletResponse response) throws IOException
	{
		IUserDAO userA = sqlSession.getMapper(IUserDAO.class);
		
		int result = 0;
		result = userA.checkNick(nickname);
		response.getWriter().print(result);
	}
	
}
