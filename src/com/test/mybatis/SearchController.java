package com.test.mybatis;
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
	public String search(String keyword, HttpServletRequest request, HttpServletResponse response, ModelMap model)
	{
		IInterDAO interA = sqlSession.getMapper(IInterDAO.class);
		IAddrDAO addrA = sqlSession.getMapper(IAddrDAO.class);
		
		model.addAttribute("addrsilist", addrA.addrSiList());
		model.addAttribute("intermainlist", interA.interMainList());
		model.addAttribute("inputKeyword", keyword);
		
		// 여기서 입력받은 키워드를 형태소 분석기로 분해해 |키워드1|키워드2|키워드3| 형태로 만들어줌
		String keyword2 = "|" + keyword + "|";
		// 여기서 입력받은 키워드를 형태소 분석기로 분해해 |키워드1|키워드2|키워드3| 형태로 만들어줌
		
		Cookie keywordCookie = new Cookie("keyword", keyword2);
		response.addCookie(keywordCookie);
		
		return "/WEB-INF/views/Search.jsp";
	}
	
	@RequestMapping(value="/searchajax.action", method=RequestMethod.GET)
	public String searchAjax(SearchDTO s, ModelMap model)
	{
		IPostDAO postDao = sqlSession.getMapper(IPostDAO.class);
		
		model.addAttribute("list", postDao.searchList(s));
		
		return "/WEB-INF/views/SearchAjax.jsp";
	}
}
