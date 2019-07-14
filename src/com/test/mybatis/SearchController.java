package com.test.mybatis;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public String search(String keyword, HttpServletResponse response, ModelMap model)
	{
		IInterDAO interA = sqlSession.getMapper(IInterDAO.class);
		IAddrDAO addrA = sqlSession.getMapper(IAddrDAO.class);
		
		model.addAttribute("addrsilist", addrA.addrSiList());
		model.addAttribute("intermainlist", interA.interMainList());
		model.addAttribute("inputKeyword", keyword);
		
		System.out.println("메인에서도 잘오나? " + keyword);
		
		// 여기서 입력받은 키워드를 형태소 분석기로 분해해 |키워드1|키워드2|키워드3| 형태로 만들어줌
		String keyword2 = "|" + keyword + "|";
		// 여기서 입력받은 키워드를 형태소 분석기로 분해해 |키워드1|키워드2|키워드3| 형태로 만들어줌
		
		Cookie keywordCookie = new Cookie("keyword", keyword2);
		response.addCookie(keywordCookie);
		
		return "/WEB-INF/views/Search.jsp";
	}
	
	@RequestMapping(value="/searchajax.action", method=RequestMethod.GET)
	public String searchAjax(SearchDTO s, ModelMap model, HttpSession session)
	{
		IPostDAO postDao = sqlSession.getMapper(IPostDAO.class);
		
		// 비로그인시
		if(session.getAttribute("userId")==null || session.getAttribute("userId").equals("") )
		{
			System.out.println("비로그인 통합검색");
			model.addAttribute("list", postDao.searchListGuest(s));
		}
		// 로그인시 
		else
		{
			System.out.println("로그인 통합검색");
			model.addAttribute("list", postDao.searchList(s));			
		}
		
		return "/WEB-INF/views/SearchAjax.jsp";
	}
	
	@RequestMapping(value="/searchcate.action", method=RequestMethod.GET)
	public String searchCate(String keyword, HttpSession session, HttpServletResponse response, ModelMap model)
	{
		IInterDAO interA = sqlSession.getMapper(IInterDAO.class);
		IAddrDAO addrA = sqlSession.getMapper(IAddrDAO.class);
		
		model.addAttribute("addrsilist", addrA.addrSiList());
		model.addAttribute("intermainlist", interA.interMainList());
		model.addAttribute("inputKeyword", keyword);
		
//		로그인 상황 가정
		session.setAttribute("userId", "adiard");
		
		String userId = (String)session.getAttribute("userId");
		if(userId==null||userId.equals(""))
		{
			
		}
		else
		{
			System.out.println("로그인 유저 진입");
			InterDTO temp = interA.userInterest(userId);
			Cookie userInterMainCookie = new Cookie("userInterMainId", temp.getInterMainId1()); 
			Cookie userInterSubCookie = new Cookie("userInterSubId", temp.getInterSubId1());
			response.addCookie(userInterSubCookie);
			response.addCookie(userInterMainCookie);
			
			model.addAttribute("userInterSubList", interA.interSubList(temp.getInterMainId1()));
		}
		
		// 여기서 입력받은 키워드를 형태소 분석기로 분해해 |키워드1|키워드2|키워드3| 형태로 만들어줌
		String keyword2 = "|" + keyword + "|";
		// 여기서 입력받은 키워드를 형태소 분석기로 분해해 |키워드1|키워드2|키워드3| 형태로 만들어줌
		
		Cookie keywordCookie = new Cookie("keyword", keyword2);
		response.addCookie(keywordCookie);
		
		return "/WEB-INF/views/SearchCate.jsp";
	}
}
