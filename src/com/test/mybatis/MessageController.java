package com.test.mybatis;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MessageController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/mymessagerecevie.action", method = RequestMethod.GET)
	public String myMessageRecevie( Model model, HttpSession session)
	{
		String userId = (String) session.getAttribute("userId");
		
		IMessageDAO dao = sqlSession.getMapper(IMessageDAO.class);
		IUserDAO dao2 = sqlSession.getMapper(IUserDAO.class);
		
		model.addAttribute("MyPageBad",dao2.MyPageBad(userId));
		model.addAttribute("myPageList", dao2.myPageList(userId));
		model.addAttribute("myPageAddrList", dao2.myPageAddrList(userId));
		model.addAttribute("myPageInterList", dao2.myPageInterList(userId));	
		
		model.addAttribute("messageRecevieList",dao.messageRecevieList(userId));
		 
		return "WEB-INF/views/MyMessageReceive.jsp";
	}
	
	@RequestMapping(value="/mymessagesend.action", method = RequestMethod.GET)
	public String myMessageSend(Model model, HttpSession session)
	{
		String userId = (String) session.getAttribute("userId");
		
		IMessageDAO dao = sqlSession.getMapper(IMessageDAO.class);
		IUserDAO dao2 = sqlSession.getMapper(IUserDAO.class);
		
		model.addAttribute("MyPageBad",dao2.MyPageBad(userId));
		model.addAttribute("myPageList", dao2.myPageList(userId));
		model.addAttribute("myPageAddrList", dao2.myPageAddrList(userId));
		model.addAttribute("myPageInterList", dao2.myPageInterList(userId));	
		
		model.addAttribute("messageSendList",dao.messageSendList(userId));
		 
		return "WEB-INF/views/MyMessageSend.jsp";
	}


	@RequestMapping(value="/messagesend.action", method=RequestMethod.POST)	
	public String MessageSend(MessageDTO m, HttpSession session)
	{
		IMessageDAO dao = sqlSession.getMapper(IMessageDAO.class);
		String userId = (String) session.getAttribute("userId");
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
	public void messageDelete(String[] checkArr, HttpServletResponse response) throws IOException
	{
		IMessageDAO dao = sqlSession.getMapper(IMessageDAO.class);
		int result = 0;
		
		for (int i = 0; i < checkArr.length; i++)
		{
			result  = dao.messageDelete(checkArr[i]);
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
