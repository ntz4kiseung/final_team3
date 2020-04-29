package com.test.mybatis;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MessageController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/mymessagerecevie.action", method = RequestMethod.GET)
	public String myMessageRecevie( Model model, HttpSession session, String pageNum )
	{
		String userId = (String) session.getAttribute("userId");
		if(userId==null||userId.equals(""))
			return "redirect: login.action";
			
		if(pageNum==null||pageNum.equals(""))
			pageNum="1";
		
		IMessageDAO dao = sqlSession.getMapper(IMessageDAO.class);
		IUserDAO dao2 = sqlSession.getMapper(IUserDAO.class);
		
		model.addAttribute("MyPageBad",dao2.MyPageBad(userId));
		model.addAttribute("myPageList", dao2.myPageList(userId));
		model.addAttribute("myPageAddrList", dao2.myPageAddrList(userId));
		model.addAttribute("myPageInterList", dao2.myPageInterList(userId));	
		model.addAttribute("messageRecevieList",dao.messageRecevieList(userId, pageNum));
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("largePage", (int)(Math.ceil((double)Integer.parseInt(pageNum)/5)));
		model.addAttribute("totalPage",dao.messageRecevieTotalPageNum(userId));
		model.addAttribute("totalLargePage",dao.messageRecevieTotalLargePageNum(userId));
		
		return "WEB-INF/views/MyMessageReceive.jsp";
	}
	
	@RequestMapping(value="/mymessagesend.action", method = RequestMethod.GET)
	public String myMessageSend(Model model, HttpSession session, String pageNum)
	{
		String userId = (String) session.getAttribute("userId");
		if(userId==null||userId.equals(""))
			return "redirect: login.action";
		
		if(pageNum==null||pageNum.equals(""))
			pageNum="1";
		
		IMessageDAO dao = sqlSession.getMapper(IMessageDAO.class);
		IUserDAO dao2 = sqlSession.getMapper(IUserDAO.class);
		
		model.addAttribute("MyPageBad",dao2.MyPageBad(userId));
		model.addAttribute("myPageList", dao2.myPageList(userId));
		model.addAttribute("myPageAddrList", dao2.myPageAddrList(userId));
		model.addAttribute("myPageInterList", dao2.myPageInterList(userId));	
		model.addAttribute("messageSendList",dao.messageSendList(userId, pageNum));
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("largePage", (int)(Math.ceil((double)Integer.parseInt(pageNum)/5)));
		model.addAttribute("totalPage",dao.messageSendTotalPageNum(userId));
		model.addAttribute("totalLargePage",dao.messageSendTotalLargePageNum(userId));
		
		return "WEB-INF/views/MyMessageSend.jsp";
	}


	@RequestMapping(value="/messagesend.action", method=RequestMethod.POST)	
	public String MessageSend(MessageDTO m, HttpSession session)
	{
		String userId = (String) session.getAttribute("userId");
		if(userId==null||userId.equals(""))
			return "redirect: login.action";
		
		IMessageDAO dao = sqlSession.getMapper(IMessageDAO.class);
		dao.messageAdd(userId, m); 
		
		return "redirect:mymessagerecevie.action";
	}
	

	@RequestMapping(value="/messageidcheck.action")
	public void singUpcheckId(String id, HttpServletResponse response) throws IOException
	{
		int result = 0;

		IMessageDAO dao2 = sqlSession.getMapper(IMessageDAO.class);
		result = dao2.checkId(id);
		System.out.println(result);
		response.getWriter().print(result);
	}

	
	@RequestMapping(value="/messagesend2.action", method=RequestMethod.POST)	
	public String MessageSend2(MessageDTO m, HttpSession session)
	{
		IMessageDAO dao = sqlSession.getMapper(IMessageDAO.class);
		String userId = (String) session.getAttribute("userId");
		dao.messageAdd(userId, m); 
		
		return "redirect:mymessagesend.action";
	}
	
	@RequestMapping(value="/messagedelete.action", method=RequestMethod.POST)	
	public void messageDelete(String[] checkArr, HttpServletResponse response, HttpSession session) throws IOException
	{
		IMessageDAO dao = sqlSession.getMapper(IMessageDAO.class);
		String userId = (String) session.getAttribute("userId");
		System.out.println(userId);
		int result = 0;
		
		for (int i = 0; i < checkArr.length; i++)
		{
			result  = dao.messageDelete(userId,checkArr[i]);
		}
		response.getWriter().print(result);
	}
	
	@RequestMapping(value="/checkDateajax.action", method=RequestMethod.POST)	
	public String messageCheckDate(String msgId) throws IOException
	{
		IMessageDAO dao = sqlSession.getMapper(IMessageDAO.class);
	
		dao.messageCheckDate(msgId);
		
		return "WEB-INF/views/messageCheckDateAjax.jsp";
	}
}
