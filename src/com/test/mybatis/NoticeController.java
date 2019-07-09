package com.test.mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	
	@RequestMapping(value="/noticelist.action",method= {RequestMethod.POST, RequestMethod.GET})
	public String noticeList(Model model, HttpServletRequest request)
	{	
		String result= null;
		
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
		
		try
		{
			
			String reqpage = request.getParameter("pagesu"); // 게시물 하단 페이지 1/2/3 요청시 돌아가는 구문~ 
			
			if (reqpage==null) // 만약 최초 페이지 로드시 값은 NULL이기때문에 자동으로 1 넣어줄수 있도록 함 ! 
			{
				reqpage = "1";
			}

			model.addAttribute("list",dao.list(reqpage)); // 리스트에 요청페이지 담아서 dao 보내줌~~ 
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString()); // EXCEPTION 하도 많이 발생해서 TRY 그냥 묶어버림 .. 나중에 테스트해보고 지워도 될듯 
		}
		String keyword ="";
		int pages = (int)Math.ceil(dao.count(keyword)/10.0); // 
		System.out.println(pages+"페이지수 확인");
		model.addAttribute("pages",pages);
		
		result = "/WEB-INF/views/NoticetList.jsp";
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
	
	
}
























