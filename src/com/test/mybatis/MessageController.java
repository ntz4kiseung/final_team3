package com.test.mybatis;

import java.util.List;

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
	
	@RequestMapping(value="/myMessageRecevie.action", method = RequestMethod.GET)
	public String myMessageRecevie( Model model)
	{
		
		IMessageDAO dao = sqlSession.getMapper(IMessageDAO.class);
		
		model.addAttribute("messageRecevieList",dao.messageRecevieList());
		 
		return "WEB-INF/views/MyMessageReceive.jsp";
	}
	
	@RequestMapping(value="/myMessageSend.action", method = RequestMethod.GET)
	public String myMessageSend(Model model)
	{
		
		IMessageDAO dao = sqlSession.getMapper(IMessageDAO.class);
		
		model.addAttribute("messageSendList",dao.messageSendList());
		 
		return "WEB-INF/views/MyMessageSend.jsp";
	}


	@RequestMapping(value="/MessageSend.action", method=RequestMethod.POST)	
	public String MessageSend(MessageDTO m)
	{
		IMessageDAO dao = sqlSession.getMapper(IMessageDAO.class);
		
		dao.messageAdd(m); 
		
		return "redirect:myMessageRecevie.action";
		
	}
	
	@RequestMapping(value="/MessageSend2.action", method=RequestMethod.POST)	
	public String MessageSend2(MessageDTO m)
	{
		IMessageDAO dao = sqlSession.getMapper(IMessageDAO.class);
		
		dao.messageAdd(m); 
		
		return "redirect:myMessageSend.action";
		
	}
	
	@RequestMapping(value="/messageDelete.action", method=RequestMethod.POST)	
	public String messageDelete(Model model,MessageDTO m)
	{
		IMessageDAO dao = sqlSession.getMapper(IMessageDAO.class);
		
		model.addAttribute("messageDelete",dao.messageDelete(m));
		
		return "redirect:myMessageRecevie.action";
		
	}
	

}
