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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyProfileController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/myprofile.action", method = RequestMethod.GET)
	public String myProfile(Model model, HttpSession session)
	{
		String userId = (String) session.getAttribute("userId");
		IUserDAO user = sqlSession.getMapper(IUserDAO.class);
		
		model.addAttribute("UserList",user.userList(userId));
		model.addAttribute("MyPageBad",user.MyPageBad(userId));
		model.addAttribute("myPageList", user.myPageList(userId));
		model.addAttribute("myPageAddrList", user.myPageAddrList(userId));
		model.addAttribute("myPageInterList", user.myPageInterList(userId));
		
		System.out.println("성별 아이디 : " + user.myPageList(userId).get(0).getGenderId());
		
		return "WEB-INF/views/MyProfile.jsp";
	}
	
	@RequestMapping(value="/myprofilemodify.action", method = RequestMethod.GET)
	public String myProfileModify(Model model, HttpSession session)
	{
		String userId = (String) session.getAttribute("userId");
		IUserDAO user = sqlSession.getMapper(IUserDAO.class);
		IAddrDAO addr = sqlSession.getMapper(IAddrDAO.class);
		IInterDAO inter = sqlSession.getMapper(IInterDAO.class);
		
		model.addAttribute("intermainlist", inter.interMainList());
		model.addAttribute("addrsilist", addr.addrSiList());
		model.addAttribute("MyPageBad",user.MyPageBad(userId));
		model.addAttribute("myPageList", user.myPageList(userId));
		model.addAttribute("myPageAddrList", user.myPageAddrList(userId));
		model.addAttribute("myPageInterList", user.myPageInterList(userId));
	
		
		return "WEB-INF/views/MyProfileModify.jsp";
	}
	
	@RequestMapping(value="/profileidcheck.action")
	public void profileCheckId(String id, HttpServletResponse response) throws IOException
	{
		int result = 0;
		IUserDAO user = sqlSession.getMapper(IUserDAO.class);
		result = user.checkId(id);
		
		response.getWriter().print(result);
	}
	
	@RequestMapping(value="/profilegupwdcheck.action")
	public void profileCheckGuPwd(String gupwd, HttpServletResponse response, HttpSession session) throws IOException
	{
		int result = 0;
		String userId = (String) session.getAttribute("userId");
		IUserDAO user = sqlSession.getMapper(IUserDAO.class);
		
		result = user.checkGuPwd(userId, gupwd);
		response.getWriter().print(result);
	}
	
	

}
