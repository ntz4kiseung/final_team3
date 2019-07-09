package com.test.mybatis;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class FindIdPwController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/findid.action", method=RequestMethod.GET)
	public String findidTelForm(ModelMap model)
	{
		String result = null;
		result = "/WEB-INF/views/FindId.jsp";
		
		
		return result;
	}
	
	@RequestMapping(value="/findpw.action", method=RequestMethod.GET)
	public String findidEmailForm(ModelMap model)
	{
		String result = null;
		result = "/WEB-INF/views/FindPw.jsp";
		
		
		return result;
	}
	
	
	
	
	@RequestMapping(value="/findidresult.action", method=RequestMethod.GET)
	public String finidResult()
	{
		String result = null;
		result = "/WEB-INF/views/FindIdComplete.jsp";
		
		return result;
	}
	
	
	
	@RequestMapping(value="/findidtelcheck.action")
	public void findIdTelCheck(String[] findidtel, HttpServletResponse response) throws IOException
	{
		String result = "";

		IFindIdPwDAO dao = sqlSession.getMapper(IFindIdPwDAO.class);

		result = dao.findIdTel(findidtel[0], findidtel[1]);
		
		response.getWriter().print(result);
	}
	
	
	@RequestMapping(value="/findidemailcheck.action")
	public void findIdEmailCheck(String[] findidemail, HttpServletResponse response) throws IOException
	{
		String result = "";
		
		IFindIdPwDAO dao = sqlSession.getMapper(IFindIdPwDAO.class);
		
		result = dao.findIdEmail(findidemail[0], findidemail[1]);
		
		response.getWriter().print(result);
		
	}
	
	@RequestMapping(value="/findidtelinsert.action", method=RequestMethod.POST)
	public String findIdTelInsert(UserDTO user, Model model)
	{
		IFindIdPwDAO dao = sqlSession.getMapper(IFindIdPwDAO.class);
		
		dao.findIdTelInsert(user);
		
		model.addAttribute("resultid", user.getUserId());
		
		return "redirect:findidresult.action";
	}
	
	@RequestMapping(value="/findidemailinsert.action", method=RequestMethod.POST)
	public String findIdEmailInsert(UserDTO user, Model model)
	{
		IFindIdPwDAO dao = sqlSession.getMapper(IFindIdPwDAO.class);
		
		dao.findIdEmailInsert(user);
		
		model.addAttribute("resultid", user.getUserId());
		
		return "redirect:findidresult.action";
	}
}
