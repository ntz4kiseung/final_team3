package com.test.mybatis;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

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
	public String myMessageRecevie( Model model)
	{
		
		IMessageDAO dao = sqlSession.getMapper(IMessageDAO.class);
		IMyPageDAO dao2 = sqlSession.getMapper(IMyPageDAO.class);
		
		model.addAttribute("MyPageBad",dao2.MyPageBad());
		model.addAttribute("myPageList", dao2.myPageList());
		model.addAttribute("myPageAddrList", dao2.myPageAddrList());
		model.addAttribute("myPageInterList", dao2.myPageInterList());	
		
		model.addAttribute("messageRecevieList",dao.messageRecevieList());
		 
		return "WEB-INF/views/MyMessageReceive.jsp";
	}
	
	@RequestMapping(value="/mymessagesend.action", method = RequestMethod.GET)
	public String myMessageSend(Model model)
	{
		
		IMessageDAO dao = sqlSession.getMapper(IMessageDAO.class);
		IMyPageDAO dao2 = sqlSession.getMapper(IMyPageDAO.class);
		
		model.addAttribute("MyPageBad",dao2.MyPageBad());
		model.addAttribute("myPageList", dao2.myPageList());
		model.addAttribute("myPageAddrList", dao2.myPageAddrList());
		model.addAttribute("myPageInterList", dao2.myPageInterList());	
		
		model.addAttribute("messageSendList",dao.messageSendList());
		 
		return "WEB-INF/views/MyMessageSend.jsp";
	}


	@RequestMapping(value="/messagesend.action", method=RequestMethod.POST)	
	public String MessageSend(MessageDTO m)
	{
		IMessageDAO dao = sqlSession.getMapper(IMessageDAO.class);
		
		dao.messageAdd(m); 
		
		return "redirect:mymessagerecevie.action";
		
	}
	

	@RequestMapping(value="/messageidcheck.action")
	public void singUpcheckId(String id, HttpServletResponse response) throws IOException
	{
		
		int result = 0;

		IMessageDAO dao2 = sqlSession.getMapper(IMessageDAO.class);
		result = dao2.checkId(id);

		response.getWriter().print(result);
		
	}

	
	@RequestMapping(value="/messagesend2.action", method=RequestMethod.POST)	
	public String MessageSend2(MessageDTO m)
	{
		IMessageDAO dao = sqlSession.getMapper(IMessageDAO.class);
		
		dao.messageAdd(m); 
		
		return "redirect:mymessagesend.action";
		
	}
	
	@RequestMapping(value="/messagedelete.action", method=RequestMethod.POST)	
	public String messageDelete(Model model,MessageDTO m)
	{
		IMessageDAO dao = sqlSession.getMapper(IMessageDAO.class);
		
		model.addAttribute("messageDelete",dao.messageDelete(m));
		
		return "redirect:mymessagerecevie.action";
		
	}
	

}
