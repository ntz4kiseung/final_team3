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
public class FaqController
{
	@Autowired
	private SqlSession sqlSession;
	
	//@SuppressWarnings("unused")
	/*@RequestMapping(value="/faq.action",method= {RequestMethod.POST, RequestMethod.GET})
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
	
		return result;
			
		
	}*/
	
	
	
	
}
























