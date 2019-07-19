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
		System.out.println("유저 아이디 비밀번호");
		
		System.out.println(user.getUserId());
		
		userA.userNewBadgeInsert(user);
		System.out.println("유저 기본 뱃지");
		
		
		String badgelogid = userA.userNewBadgeSelect(user);
		System.out.println("뱃지값 넣기" + badgelogid);
		
		  
		userA.userEssentialInsert(user, badgelogid);
		System.out.println("유저 에센셜 넣기");
		
		
		 
		userA.userSubInsert(user);
		System.out.println("유저 서브 넣기");
		
		
		
		userA.userTelInsert(user);
		System.out.println("유저 서브 넣기");
		
		userA.userEmailInsert(user);
		System.out.println("유저 이메일 넣기");
		  
		addrA.userAddrInsert1(addr);
		System.out.println("유저 지역1 넣기");
		userA.insertNewGrade(user.getUserId());
		
		
		
		if(addr.getAddrGuId2() != "")
		{
			addrA.userAddrInsert2(addr);
		}
		else 
		{
			System.out.println("2번 지역 실패");
		}
		if(addr.getAddrGuId3() != "")
		{
			addrA.userAddrInsert3(addr);
		}
		else 
		{
			System.out.println("3번 지역 실패");
		}
		
		
		
		
		
		interA.userInterInsert1(inter); 
		System.out.println("유저 관심1 넣기");
		
		
		
		if (inter.getInterSubId2() != "")
		{
			interA.userInterInsert2(inter);
		}
		else 
		{
			System.out.println("2번 지역 실패");
		}
		
		
		
		if (inter.getInterSubId3() != "")
		{
			interA.userInterInsert3(inter);
		}
		else 
		{
			System.out.println("3번 관심 실패");
		}
		return "redirect:login.action";
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
