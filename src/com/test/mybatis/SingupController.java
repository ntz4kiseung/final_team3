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
		String result = null;
		result = "/WEB-INF/views/SignUp.jsp";
		
		ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);
		
		model.addAttribute("addrsilist",dao.addrSiList());
		model.addAttribute("intermainlist", dao.interMainList());
		
		return result;
	}
	
	

	
	
	@RequestMapping(value="/insertuser.action", method=RequestMethod.POST)
	public String signupInsert(UserDTO user, AddrDTO addr, InterDTO inter)
	{
		ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);
		
		dao.userLoginInsert(user);
		
		dao.userNewBadgeInsert(user);
		String badgelogid = dao.userNewBadgeSelect(user);
		  
		dao.userEssentialInsert(user, badgelogid);
		 
		dao.userSubInsert(user);
		
		dao.userTelInsert(user);
		
		dao.userEmailInsert(user);
		  
		dao.userAddrInsert1(addr);
		
		if(addr.getAddrGuId2() != "")
		{
			dao.userAddrInsert2(addr);
		}
		else 
		{
			System.out.println("2번 구 입력 실패");
		}
		if(addr.getAddrGuId3() != "")
		{
			dao.userAddrInsert3(addr);
		}
		else 
		{
			System.out.println("3번 구 입력 실패");
		}
		
		dao.userInterInsert1(inter); 
		if (inter.getInterSubId2() != "")
		{
			dao.userInterInsert2(inter);
		}
		else 
		{
			System.out.println("2번 소주제 입력 실패");
		}
		if (inter.getInterSubId3() != "")
		{
			dao.userInterInsert3(inter);
		}
		else 
		{
			System.out.println("3번 소주제 입력 실패");
		}
		  

		
		return "redirect:signup.action";
	}
	
	@RequestMapping(value="/addrguajax.action", method=RequestMethod.GET)
	public String addrGuAjax(String siid, ModelMap model)
	{
		
		ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);
		
		model.addAttribute("list", dao.addrGuList(siid));
		
		return "/WEB-INF/views/AddrGuAjax.jsp";
	}

	@RequestMapping(value="/intersubajax.action", method=RequestMethod.GET)
	public String intersubajax(String mainid, ModelMap model)
	{
		System.out.println("mainid = " + mainid);
		ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);
		model.addAttribute("list", dao.interSubList(mainid));
		
		System.out.println(dao.interSubList(mainid).get(0).getInterSubName1());
		return "/WEB-INF/views/InterSubAjax.jsp";
	}
	
	
	
	@RequestMapping(value="intermain.action", method=RequestMethod.GET)
	public void signupMainList(String mainid, HttpServletResponse reponse)
	{
		
	}
	
	@RequestMapping(value="/idcheck.action")
	public void singUpcheckId(String id, HttpServletResponse response) throws IOException
	{
		int result = 0;
		ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);
		result = dao.checkId(id);
		
		response.getWriter().print(result);
	}
	
	@RequestMapping(value="/nickcheck.action")
	public void singUpcheckNinkname(String nickname, HttpServletResponse response) throws IOException
	{
		int result = 0;
		ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);
		result = dao.checkNick(nickname);
		response.getWriter().print(result);
	}
	
}
