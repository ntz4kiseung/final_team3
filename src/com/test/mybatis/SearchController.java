package com.test.mybatis;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SearchController
{
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value="/search.action", method=RequestMethod.GET)
	public String findidForm(ModelMap model, SearchDTO s)
	{
		String result = null;
		result = "/WEB-INF/views/Search.jsp";
		
		IPostDAO postDao = sqlSession.getMapper(IPostDAO.class);
		
		SearchDTO searchDto = new SearchDTO();
		searchDto.setKeyword("|키워드|");
		
		model.addAttribute("list", postDao.searchList(s));
		
		return result;
	}
	
	@RequestMapping(value="/searchajax.action", method=RequestMethod.GET)
	public String test(ModelMap model, SearchDTO s)
	{
		
		IPostDAO postDao = sqlSession.getMapper(IPostDAO.class);
		
		SearchDTO searchDto = new SearchDTO();
		searchDto.setKeyword("|키워드|");
		
		model.addAttribute("list", postDao.searchList(s));
		
		return "/WEB-INF/views/SearchAjax.jsp";
	}
}
