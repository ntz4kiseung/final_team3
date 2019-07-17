package com.test.mybatis;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.shineware.nlp.komoran.constant.DEFAULT_MODEL;
import kr.co.shineware.nlp.komoran.core.Komoran;
import kr.co.shineware.nlp.komoran.model.KomoranResult;
import kr.co.shineware.nlp.komoran.model.Token;

@Controller
public class SearchController
{
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value="/search.action", method=RequestMethod.GET)
	public String search(String keyword, HttpServletResponse response, ModelMap model, HttpSession session)
	{
		String userId = (String) session.getAttribute("userId");
		if(userId==null || userId.equals(""))
		{
			System.out.println("search.action 비로그인 진입");
			Cookie userCookie = new Cookie("userId", "");
			response.addCookie(userCookie);
		}else {
			System.out.println("search.action 로그인 진입 : " + userId);
			Cookie userCookie = new Cookie("userId", userId);
			response.addCookie(userCookie);
		}
		
		IInterDAO interA = sqlSession.getMapper(IInterDAO.class);
		IAddrDAO addrA = sqlSession.getMapper(IAddrDAO.class);
		
		model.addAttribute("addrsilist", addrA.addrSiList());
		model.addAttribute("intermainlist", interA.interMainList());
		model.addAttribute("inputKeyword", keyword);
		
		System.out.println("search.action 분석 전 키워드 : " + keyword);
		// 여기서 입력받은 키워드를 형태소 분석기로 분해해 |키워드1|키워드2|키워드3| 형태로 만들어줌
		MorphemeAnalyze analyzer = new MorphemeAnalyze();
		String keywordAnalyzed = analyzer.analyze(keyword);
		// 여기서 입력받은 키워드를 형태소 분석기로 분해해 |키워드1|키워드2|키워드3| 형태로 만들어줌
		System.out.println("search.action 분석 후 키워드 : " + keywordAnalyzed);
		
		Cookie keywordCookie = new Cookie("keyword", keywordAnalyzed);
		response.addCookie(keywordCookie);
		
		return "/WEB-INF/views/Search.jsp";
	}
	
	@RequestMapping(value="/searchajax.action", method=RequestMethod.GET)
	public String searchAjax(SearchDTO s, ModelMap model, HttpSession session)
	{
		IPostDAO postDao = sqlSession.getMapper(IPostDAO.class);
		
		String userId = (String) session.getAttribute("userId");
		// 비로그인시
		if(userId==null || userId.equals(""))
		{
			System.out.println("비로그인 통합검색 Ajax");
			model.addAttribute("list", postDao.searchListGuest(s));
		}
		// 로그인시 
		else
		{
			System.out.println("로그인 통합검색 Ajax");
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
		
		String userId = (String)session.getAttribute("userId");
		if(userId==null||userId.equals(""))
		{
			System.out.println("비로그인 유저 진입");
			Cookie userInterMainCookie = new Cookie("userInterMainId", "IM00001"); 
			Cookie userInterSubCookie = new Cookie("userInterSubId", "");
			Cookie userCookie = new Cookie("userId", "");
			response.addCookie(userCookie);
			response.addCookie(userInterSubCookie);
			response.addCookie(userInterMainCookie);
			model.addAttribute("userInterSubList", interA.interSubList("IM00001"));
		}
		else
		{
			System.out.println("로그인 유저 진입");
			InterDTO temp = interA.userInterest(userId);
			
			Cookie userInterMainIdCookie = new Cookie("userInterMainId", temp.getInterMainId1()); 
			Cookie userInterMainNameCookie = new Cookie("userInterMainName", temp.getInterMainName1()); 
			Cookie userInterSubIdCookie = new Cookie("userInterSubId", temp.getInterSubId1());
			Cookie userInterSubNameCookie = new Cookie("userInterSubName", temp.getInterSubName1());
			
			Cookie userCookie = new Cookie("userId", userId);
			
			response.addCookie(userCookie);
			response.addCookie(userInterMainIdCookie);
			response.addCookie(userInterMainNameCookie);
			response.addCookie(userInterSubIdCookie);
			response.addCookie(userInterSubNameCookie);
			
			model.addAttribute("userInterSubList", interA.interSubList(temp.getInterMainId1()));
		}
		
		System.out.println("search.action 분석 전 키워드 : " + keyword);
		// 여기서 입력받은 키워드를 형태소 분석기로 분해해 |키워드1|키워드2|키워드3| 형태로 만들어줌
		MorphemeAnalyze analyzer = new MorphemeAnalyze();
		String keywordAnalyzed = analyzer.analyze(keyword);
		// 여기서 입력받은 키워드를 형태소 분석기로 분해해 |키워드1|키워드2|키워드3| 형태로 만들어줌
		System.out.println("search.action 분석 후 키워드 : " + keywordAnalyzed);
		
		Cookie keywordCookie = new Cookie("keyword", keywordAnalyzed);
		response.addCookie(keywordCookie);
		
		return "/WEB-INF/views/SearchCate.jsp";
	}
	
	@RequestMapping(value="/searchcateajax.action", method=RequestMethod.GET)
	public String searchCateAjax(SearchDTO s, ModelMap model, HttpSession session)
	{
		IPostDAO postDao = sqlSession.getMapper(IPostDAO.class);
		
		// 비로그인시
		if(session.getAttribute("userId")==null || session.getAttribute("userId").equals("") )
		{
			System.out.println("비로그인 카테고리검색");
			model.addAttribute("list", postDao.searchCateList(s));
		}
		// 로그인시 
		else
		{
			System.out.println("로그인 카테고리검색");
			model.addAttribute("list", postDao.searchCateList(s));			
		}
		
		return "/WEB-INF/views/SearchAjax.jsp";
	}
	
	@RequestMapping(value="/intersubajax2.action", method=RequestMethod.GET)
	public String intersubajax2(String mainid, ModelMap model)
	{
		IInterDAO interA = sqlSession.getMapper(IInterDAO.class);
		model.addAttribute("list", interA.interSubList(mainid));
		return "/WEB-INF/views/InterSubAjax2.jsp";
	}
	
	
	
}
