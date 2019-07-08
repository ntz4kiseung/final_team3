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
public class FindIdPwController
{
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value="/findid.action", method=RequestMethod.GET)
	public String findidForm(ModelMap model)
	{
		String result = null;
		result = "/WEB-INF/views/FindId.jsp";
		
		
		return result;
	}
	@RequestMapping(value="/findidtelcheck.action")
	public void findidCheck(String[] findidtel, HttpServletResponse response) throws IOException
	{
		int result = 0;

		IFindIdPwDAO dao = sqlSession.getMapper(IFindIdPwDAO.class);

		result = dao.findIdTelCheck(findidtel[0], findidtel[1]);
		
		response.getWriter().print(result);
	}
	
	
	@RequestMapping(value="/findidemailcheck.action")
	public void findemailCheck(String[] findidemail, HttpServletResponse response) throws IOException
	{
		int result = 0;
		
		IFindIdPwDAO dao = sqlSession.getMapper(IFindIdPwDAO.class);
		
		result = dao.findIdEmailCheck(findidemail[0], findidemail[1]);
		
		response.getWriter().print(result);
		
	}
}
