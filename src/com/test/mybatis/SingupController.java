package com.test.mybatis;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SingupController
{
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value="/signup.action", method=RequestMethod.GET)
	public String signupForm(ModelMap model)
	{
		String result = null;
		result = "/WEB-INF/views/SignUp.jsp";
		
		ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);
		
		model.addAttribute("addrsilist",dao.addrSiList());
		model.addAttribute("intermainlist", dao.interMainList());
		
		System.out.println(dao.interMainList().size());
		
		return result;
	}
	
	

	
	
	@RequestMapping(value="/insertuser.action", method=RequestMethod.POST)
	public String signupInsert(UserDTO user, AddrDTO addr, InterDTO inter)
	{
		
		ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);
		
		
		System.out.println(user.getTelCheck());
		
		System.out.println(user.getEmailCheck());
		
		
		  dao.userLoginInsert(user);
		  
		  dao.userEssentialInsert(user);
		  
		  dao.userSubInsert(user);
		  
		  dao.userAddrInsert(addr); 
		  
		  dao.userInterInsert(inter); 
		  
		  dao.userTelInsert(user);
		  
		  dao.userEmailInsert(user);
		 	 
		
		return "redirect:signup.action";
	}
	
	@RequestMapping(value="/addrgu.action", method=RequestMethod.GET)
	public void signupGuList(String siid, HttpServletResponse response) throws IOException
	{
		System.out.println(siid);
		
		response.setContentType("text/html;charset=utf-8");
		
		ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);
		
		
		ArrayList<AddrDTO> str = dao.addrGuList(siid);
		
	    String result = "";
	    
	    for (int i = 0; i < dao.addrGuList(siid).size(); i++)
		{
			result += str.get(i).getAddrGuId1();
			result += ",";
			result += str.get(i).getAddrGuName1();
			result += ",";
		}
	    System.out.println(result);
		 
	    response.getWriter().print(result);
	}
	
	
	@RequestMapping(value="/addrguajax.action", method=RequestMethod.GET)
	public String addrGuAjax()
	{
		String result = "";
		
		
		
		
		result = "/WEB-INF/views/AddrGuAjax.jsp";
		return result;
	}
	
	
	
	
	@RequestMapping(value="intermain.action", method=RequestMethod.GET)
	public void signupMainList(String mainid, HttpServletResponse reponse)
	{
		
	}
	
	@RequestMapping(value="/idcheck.action")
	public void singUpcheckId(String id, HttpServletResponse response) throws IOException
	{
		int result = 0;
		ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);
		result = dao.checkId(id);
		
		response.getWriter().print(result);
	}
	
	@RequestMapping(value="/nickcheck.action")
	public void singUpcheckNinkname(String nickname, HttpServletResponse response) throws IOException
	{
		int result = 0;
		ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);
		result = dao.checkNick(nickname);
		response.getWriter().print(result);
	}
	
}
