package com.test.mybatis;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		
		System.out.println(dao.interMainList().size());
		
		return result;
	}
	
	

	
	
	@RequestMapping(value="/insertuser.action", method=RequestMethod.POST)
	public String signupInsert(UserDTO user, AddrDTO addr, InterDTO inter)
	{
		
		ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);
		
		
		System.out.println(user.getTelCheck());
		
		System.out.println(user.getEmailCheck());
		
		
		  dao.userLoginInsert(user);
		  
		  dao.userEssentialInsert(user);
		  
		  dao.userSubInsert(user);
		  
		  dao.userAddrInsert(addr); 
		  
		  dao.userInterInsert(inter); 
		  
		  dao.userTelInsert(user);
		  
		  dao.userEmailInsert(user);
		 	 
		
		return "redirect:signup.action";
	}
	
	@RequestMapping(value="/addrguajax.action", method=RequestMethod.GET)
	public String addrGuAjax(String siid, ModelMap model)
	{
		System.out.println("siid = "+siid);
		ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);
		
		/*
		 * List<AddrDTO> list = dao.addrGuList(siid);
		 */
		model.addAttribute("list", dao.addrGuList(siid));
		System.out.println(dao.addrGuList(siid).get(0).getAddrGuName2());
		System.out.println(dao.addrGuList(siid).get(0).getAddrGuName1());
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
