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
		System.out.println(userId);
		
		model.addAttribute("UserList",user.userList(userId));
		model.addAttribute("MyPageBad",user.MyPageBad(userId));
		
		System.out.println(user.myPageList(userId).get(0).getName());
		
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
		
		if (addrB.get(0).getAddrGuId2()==null)
		{
			System.out.println("지나감");
		}
		else if(!addr.getAddrGuId2().equals(addrB.get(0).getAddrGuId2()))
		{
			addrA.updateAddr2(userId, addr, addrB.get(0));
		}
		else
		{
			System.out.println("지역2 실패");
		}
		
		if (addrB.get(0).getAddrGuId2()==null)
		{
			System.out.println("지나감");
		}
		else if(!addr.getAddrGuId3().equals(addrB.get(0).getAddrGuId3()))
		{
			addrA.updateAddr3(userId, addr, addrB.get(0));
		}
		else
		{
			System.out.println("지역3 실패");
		}
		
		
		
		if (interB.get(0).getInterSubId1()==null)
		{
			System.out.println("지나감");
		}
		else if (inter.getInterSubId1() != interB.get(0).getInterSubId1())
			interA.updateInter1(userId, inter, interB.get(0));
		else
			System.out.println("관심사1 실패");
		
		
		
		if (interB.get(0).getInterSubId2()==null)
		{
			System.out.println("지나감");
		}
		else if (inter.getInterSubId2() != interB.get(0).getInterSubId2())
			interA.updateInter3(userId, inter, interB.get(0));
		else
			System.out.println("관심사2 실패");
		
		
		System.out.println(interB.get(0).getInterSubId3());
		
		if (interB.get(0).getInterSubId3()==null)
		{
			System.out.println("지나감");
		}
		else if (inter.getInterSubId3() != interB.get(0).getInterSubId3())
			interA.updateInter3(userId, inter, interB.get(0));
		else
			System.out.println("관심사3 실패");
		
		
		
		
		
		return "redirect:myprofile.action";
	}
	
	@RequestMapping(value="/opprofile.action")
	public String goOpProfile(Model model, HttpSession session, String userId)
	{
		IUserDAO user = sqlSession.getMapper(IUserDAO.class);
		
		model.addAttribute("UserList",user.userList(userId));
		model.addAttribute("MyPageBad",user.MyPageBad(userId));
		model.addAttribute("myPageList", user.myPageList(userId));
		model.addAttribute("myPageAddrList", user.myPageAddrList(userId));
		model.addAttribute("myPageInterList", user.myPageInterList(userId));
		
		return "WEB-INF/views/OpponentProfile.jsp";
	}
	
	@RequestMapping(value="/profile.action")
	public String userProfile(HttpSession session, String userId)
	{
		String logInUserId = (String) session.getAttribute("userId");
		
		if(userId==null || userId.equals(""))
			return "redirect: main.action";
		
		if(logInUserId==null || logInUserId.equals(""))
			return ("redirect: opprofile.action?userId="+userId);
		else
		{
			if(logInUserId.equals(userId))
				return "redirect: myprofile.action";
			else
				return ("redirect: opprofile.action?userId="+userId);
		}
		
	}
	
	@RequestMapping(value="/opcreatepostlist.action")
	public String opCreatePostList(Model model, String userId)
	{
		IUserDAO dao1 = sqlSession.getMapper(IUserDAO.class);
		IPostDAO dao2 = sqlSession.getMapper(IPostDAO.class);
		IBadgeDAO dao3 = sqlSession.getMapper(IBadgeDAO.class);
		IUserDAO user = sqlSession.getMapper(IUserDAO.class);
		
		ArrayList<PostDTO> myReviewList = dao2.myReviewList(userId);
		
		model.addAttribute("myPageList",dao1.myPageList(userId));
		model.addAttribute("MyPageBad",user.MyPageBad(userId));
		model.addAttribute("myPageAddrList", dao1.myPageAddrList(userId));
		model.addAttribute("myPageInterList", dao1.myPageInterList(userId));
		model.addAttribute("myReviewList", myReviewList);
		model.addAttribute("positiveBadge", dao3.positiveBadge());
		model.addAttribute("negativeBadge", dao3.negativeBadge());
		model.addAttribute("opUser", userId);
		
		return "WEB-INF/views/OpponentCreatePostList.jsp";
	}
	
}
