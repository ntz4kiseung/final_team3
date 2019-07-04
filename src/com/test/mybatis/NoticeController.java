package com.test.mybatis;

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
	
	@RequestMapping(value="/noticelist.action",method=RequestMethod.GET)
	public String noticeList(Model model)
	{	
		String result= null;
		
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
				

		model.addAttribute("list",dao.list());
		
		result = "/WEB-INF/views/NoticetList.jsp";
		return result;
		
	}
	
	@RequestMapping(value="/searchnotice.action",method=RequestMethod.POST)
	public String searchNotice(Model model ,NoticeDTO n )
	{	
		String result= null;
		
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
				

		model.addAttribute("searchlist",dao.searchlist(n));
		
		result = "/WEB-INF/views/NoticetList.jsp";
		return result;
		
	}
	
	
}
























