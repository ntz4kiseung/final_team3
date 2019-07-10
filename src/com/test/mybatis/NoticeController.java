package com.test.mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeController
{
	@Autowired
	private SqlSession sqlSession;
	
	@SuppressWarnings("unused")
	@RequestMapping(value="/notice.action",method= {RequestMethod.POST, RequestMethod.GET})
	public String noticeList(Model model, HttpServletRequest request)
	{	
		String result= null;
		
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
		
	
			String reqpage = request.getParameter("pagesu"); // 게시물 하단 페이지 1/2/3 요청시 돌아가는 구문~ 
			String keyword = request.getParameter("keyword");
			
			System.out.println(keyword+"keyword확인");
			if (reqpage==null) // 만약 최초 페이지 로드시 값은 NULL이기때문에 자동으로 1 넣어줄수 있도록 함 ! 
			{
				reqpage = "1";
			}
			if (keyword==null)
			{
				keyword="";
			}
			model.addAttribute("list",dao.list(keyword, reqpage)); // 리스트에 요청페이지 담아서 dao 보내줌~~ 
		
			
		int pages = (int)Math.ceil(dao.count(keyword)/10.0); // 
		
		System.out.println(pages+"페이지수 확인");
		model.addAttribute("pages",pages);
		model.addAttribute("keyword",keyword);
		
		result = "/WEB-INF/views/Notice.jsp";
	
		return result;
		
		
		// 변수 받기 성공~~ 
		
		
		// 페이징 처리 시작? 
		
		
				//int pages = (int)Math.ceil(dao.count()/10.0); // 
				//System.out.println(pages+"페이지수 확인");
				//model.addAttribute("pages",pages);
				
				
		// 페이징 처리 끝 
		
		
		
	}
	
	@RequestMapping(value="/searchnotice.action",method=RequestMethod.POST)
	public String searchNotice(Model model /* ,String keyword */, HttpServletRequest request)
	{	
		//System.out.println("/searchnotice.action호출 확인"+request.getParameter("keyword"));
		 
		String keyword = request.getParameter("keyword");
		String reqpage = request.getParameter("pagesu");
		
		System.out.println(keyword +"검색페이지에서 숫자 누를때 keyword에 뭐가뜨는지 보자~ ");
		System.out.println(keyword+"searchlist keyword이당 ");
		
		String result= null;
		
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
				
		//System.out.println("ㅎㅎㅎ"+keyword+"데이터 확인");
		//model.addAttribute("searchlist",dao.searchlist(keyword)); // 여기서 안들어가는듯??? 
		//System.out.println("ㅎㅎㅎ"+keyword+"데이터 확인");
		
		//model.addAttribute("searchlist",keyword);  // 여기 key 값이 넘어가는 구조인듯. 
		
		
		//dao.searchlist(keyword);// dao에있는 search라는 select문에 값을 보냄~ 
		
		if (keyword==null)
		{
			keyword="";
		};
		if (reqpage==null)
		{
			reqpage = "1";
		}
		
	
		
		
		 int pages = (int)Math.ceil(dao.count(keyword)/10.0); // 
			System.out.println(pages+"페이지수 확인 searchlist");
			model.addAttribute("pages",pages);
			//model.addAttribute("")
		
		 
		System.out.println("매퍼 전~ ");
		
		try
		{
			
			model.addAttribute("list",dao.searchlist(keyword,reqpage));//<<-- 요 끝에 꺼는 DAO~ 
								// 요고 뷰 페이지에서 접근할때 경로임 ㅇㅇ 
			// 페이징 처리 시작? 
			System.out.println("매퍼 후~ ");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		// 페이징 처리 끝 
		result = "/WEB-INF/views/SearchList.jsp";
		return result;
		
	}
	
	@RequestMapping(value="/faq.action",method= {RequestMethod.POST, RequestMethod.GET})
	public String faqList(Model model, HttpServletRequest request)
	{	
		String result= null;
		
		IFaqDAO dao = sqlSession.getMapper(IFaqDAO.class);
		
	
			String reqpage = request.getParameter("pagesu"); // 게시물 하단 페이지 1/2/3 요청시 돌아가는 구문~ 
			String keyword = request.getParameter("keyword");
			//System.out.println(keyword);
			
			System.out.println(keyword+"keyword확인");
			if (reqpage==null) // 만약 최초 페이지 로드시 값은 NULL이기때문에 자동으로 1 넣어줄수 있도록 함 ! 
			{
				reqpage = "1";
			}
			if (keyword==null)
			{
				keyword="";
			}
			model.addAttribute("list",dao.list(keyword, reqpage)); // 리스트에 요청페이지 담아서 dao 보내줌~~ 
		
			
		int pages = (int)Math.ceil(dao.count(keyword)/10.0); // 
		
		System.out.println(pages+"페이지수 확인");
		model.addAttribute("pages",pages);
		model.addAttribute("keyword",keyword);
		
		result = "/WEB-INF/views/FAQ.jsp";
	
		System.out.println("real작동함? ");
		return result;
			
		
	}
	
	@RequestMapping(value="/directquestionwrite.action",method= {RequestMethod.POST, RequestMethod.GET})
	public String DirectQuestionWrite(Model model, HttpServletRequest request)
	{	
		String result= null;
		
		
		//IFaqDAO dao = sqlSession.getMapper(IFaqDAO.class);
		
		String title= request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println(title+content);
		
		
		result = "/WEB-INF/views/DirectQuestionWrite.jsp";
		
		
		return result;
			
		
	}
}
























