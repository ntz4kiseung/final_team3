package com.test.mybatis;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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
	public String findidForm(String pageNum, HttpServletRequest request, ModelMap model)
	{
		return "/WEB-INF/views/Search.jsp";
	}
	
	@RequestMapping(value="/searchajax.action", method=RequestMethod.GET)
	public String test(HttpServletRequest request, ModelMap model, String pageNum)
	{
		Cookie[] cookies = request.getCookies();
		IPostDAO postDao = sqlSession.getMapper(IPostDAO.class);
		Map<String,String> cookieMap = new HashMap<String, String>();
		
		for (Cookie cookie : cookies)
		{
			System.out.println(cookie.getName());
			System.out.println(cookie.getValue());
			cookieMap.put(cookie.getName(), cookie.getValue());
		}
		
		System.out.println("pageNum in Controller : " + pageNum);
		
		model.addAttribute("list", postDao.searchList(pageNum, cookieMap));
		
		return "/WEB-INF/views/SearchAjax.jsp";
	}
}
