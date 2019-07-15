package com.test.mybatis;

import java.io.IOException;
import java.util.ArrayList;

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
	
	@RequestMapping(value="/gunickcheck.action")
	public void profileGuNickCheck(String nickname, HttpServletResponse response, HttpSession session) throws IOException
	{
		int result = 0;
		String userId = (String) session.getAttribute("userId");
		IUserDAO user = sqlSession.getMapper(IUserDAO.class);
		
		result = user.checkGuNick(userId, nickname);
		response.getWriter().print(result);
	}
	
	@RequestMapping(value="/updateprofile.action", method = RequestMethod.POST)
	public String updateProfile(UserDTO user, AddrDTO addr, InterDTO inter, HttpSession session)
	{
		
		String userId = (String) session.getAttribute("userId");
		IUserDAO userA = sqlSession.getMapper(IUserDAO.class);
		IInterDAO interA = sqlSession.getMapper(IInterDAO.class);
		IAddrDAO addrA = sqlSession.getMapper(IAddrDAO.class);
		
		userA.updateLogin(userId, user);
		userA.updateEssential(userId, user);
		userA.updateSub(userId, user);
		
		userA.userTelInsert(user);
		userA.userEmailInsert(user);
		
		
		ArrayList<AddrDTO> addrB = userA.myPageAddrList(userId);
		ArrayList<InterDTO> interB = userA.myPageInterList(userId);
		
		if (!addr.getAddrGuId1().equals(addrB.get(0).getAddrGuId1()))
			addrA.updateAddr1(userId, addr, addrB.get(0));
		else
			System.out.println("지역1 실패");
		
		System.out.println(addrB.get(0).getAddrGuId2());
		System.out.println(userId);
		
		
		if(!addr.getAddrGuId2().equals(addrB.get(0).getAddrGuId2()))
			addrA.updateAddr2(userId, addr, addrB.get(0));
		else
			System.out.println("지역2 실패");
		
		if(!addr.getAddrGuId3().equals(addrB.get(0).getAddrGuId3()))
			addrA.updateAddr3(userId, addr, addrB.get(0));
		else 
			System.out.println("지역3 실패");
		
		if (inter.getInterSubId1() != interB.get(0).getInterSubId1())
			interA.updateInter1(userId, inter, interB.get(0));
		else
			System.out.println("관심사1 실패");
		
		if (inter.getInterSubId2() != interB.get(0).getInterSubId2())
			interA.updateInter3(userId, inter, interB.get(0));
		else
			System.out.println("관심사2 실패");
		
		if (inter.getInterSubId3() != interB.get(0).getInterSubId3())
			interA.updateInter3(userId, inter, interB.get(0));
		else
			System.out.println("관심사3 실패");
		
		
		return "redirect:myprofile.action";
	}
	

}
