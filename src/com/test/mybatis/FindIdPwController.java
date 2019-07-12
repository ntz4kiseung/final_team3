package com.test.mybatis;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class FindIdPwController
{
	@Autowired
	private SqlSession sqlSession;
	
	
	// 아이디 찾기 폼
	@RequestMapping(value="/findid.action", method=RequestMethod.GET)
	public String fIdForm(ModelMap model)
	{
		String result = null;
		result = "/WEB-INF/views/FindId.jsp";
		
		return result;
	}
	
	// 비밀번호 찾기 폼
	@RequestMapping(value="/findpw.action", method=RequestMethod.GET)
	public String fPwForm(ModelMap model)
	{
		String result = null;
		result = "/WEB-INF/views/FindPw.jsp";
		
		return result;
	}
	
	// 아이디 찾기 이름 전화번호 유효 확인
	@RequestMapping(value="/findidtelcheck.action")
	public void fIdTelCheck(String[] findidtel, HttpServletResponse response) throws IOException
	{
		String result = "";
		
		IUserDAO userA = sqlSession.getMapper(IUserDAO.class);
		
		result = userA.findIdTel(findidtel[0], findidtel[1]);
		
		response.getWriter().print(result);
	}
	
	
	// 아이디 찾기 이름 이메일 유효 확인
	@RequestMapping(value="/findidemailcheck.action")
	public void fIdEmailCheck(String[] findidemail, HttpServletResponse response) throws IOException
	{
		String result = "";
		
		IUserDAO userA = sqlSession.getMapper(IUserDAO.class);
		
		result = userA.findIdEmail(findidemail[0], findidemail[1]);
		
		response.getWriter().print(result);
	}
	
	// 비밀번호 찾기 개인정보 체크 휴대전화
	@RequestMapping(value="/findpwtelcheck.action")
	public void fPwTelCheck(String[] findpwtel, HttpServletResponse response) throws IOException
	{
		int result = 0;
		
		IUserDAO userA = sqlSession.getMapper(IUserDAO.class);
		
		result = userA.findPwTelCheck(findpwtel[0], findpwtel[1], findpwtel[2]);
		response.getWriter().print(result);
	}
	// 비밀번호 찾기 개인정보 체크 이메일
	@RequestMapping(value="/findpwemailcheck.action")
	public void fPwEmailCheck(String[] findpwemail, HttpServletResponse response) throws IOException
	{
		int result = 0;
		
		IUserDAO userA = sqlSession.getMapper(IUserDAO.class);
		
		result = userA.findPwEmailCheck(findpwemail[0], findpwemail[1], findpwemail[2]);
		response.getWriter().print(result);
	}
	
	// 아이디 찾기 전화 인증번호 DB입력
	@RequestMapping(value="/findidtelinsert.action", method=RequestMethod.POST)
	public String fIdTelInsert(UserDTO user, Model model)
	{
		IUserDAO userA = sqlSession.getMapper(IUserDAO.class);
		
		userA.findIdTelInsert(user);
		
		model.addAttribute("resultid", user.getUserId());
		
		return "redirect:findidresult.action";
	}
	
	// 아이디 찾기 이메일 인증번호 DB입력
	@RequestMapping(value="/findidemailinsert.action", method=RequestMethod.POST)
	public String fIdEmailInsert(UserDTO user, Model model)
	{
		IUserDAO userA = sqlSession.getMapper(IUserDAO.class);
		
		userA.findIdEmailInsert(user);
		
		model.addAttribute("resultid", user.getUserId());
		
		return "redirect:findidresult.action";
	}
	
	
	// 비밀번호 찾기 전화 인증번호 DB 입력
	@RequestMapping(value="/findpwtelinsert.action", method=RequestMethod.POST)
	public String fPwTelInsert(UserDTO user, Model model)
	{
		IUserDAO userA = sqlSession.getMapper(IUserDAO.class);
		
		userA.findPwTemp(user);
		userA.findPwTelInsert(user);
		
		model.addAttribute("checkName", "휴대전화");
		
		return "redirect:findpwresult.action";
	}
	
	
	
	// 비밀번호 찾기 이메일 인증번호 DB 입력
	@RequestMapping(value="/findpwemailinsert.action", method=RequestMethod.POST)
	public String fPwEmailInsert(UserDTO user, Model model)
	{
		IUserDAO userA = sqlSession.getMapper(IUserDAO.class);
		
		userA.findPwTemp(user);
		userA.findPwEmailInsert(user);
		
		model.addAttribute("checkName", "E-mail");
		return "redirect:findpwresult.action";
	}
	
	
	// 아이디 찾기 결과
	@RequestMapping(value="/findidresult.action", method=RequestMethod.GET)
	public String fIdResult()
	{
		String result = null;
		result = "/WEB-INF/views/FindIdComplete.jsp";
		
		return result;
	}
	
	// 비밀번호 찾기 결과
	@RequestMapping(value="/findpwresult.action", method=RequestMethod.GET)
	public String fPwResult()
	{
		String result = null;
		
		result = "/WEB-INF/views/FindPwComplete.jsp";
		return result;
	}
}
