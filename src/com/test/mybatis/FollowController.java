package com.test.mybatis;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FollowController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/myfollowing.action", method = RequestMethod.GET)
	public String myFollowing(Model model, HttpSession session)
	{
		String userId = (String) session.getAttribute("userId");
		
		IFollowDAO dao = sqlSession.getMapper(IFollowDAO.class);
		IUserDAO dao2 = sqlSession.getMapper(IUserDAO.class);
		
		model.addAttribute("followingBad",dao.followingBad());
		model.addAttribute("followingList",dao.followingList());
		model.addAttribute("followingAddrList",dao.followingAddrList());
		model.addAttribute("followingInterList",dao.followingInterList());
		
		model.addAttribute("MyPageBad",dao2.MyPageBad(userId));
		model.addAttribute("myPageList", dao2.myPageList(userId));
		model.addAttribute("myPageAddrList", dao2.myPageAddrList(userId));
		model.addAttribute("myPageInterList", dao2.myPageInterList(userId));	
		
		return "WEB-INF/views/MyFollowing.jsp";
	}
	
	@RequestMapping(value="/myfollower.action", method = RequestMethod.GET)
	public String myFollower(Model model, HttpSession session)
	{
		String userId = (String) session.getAttribute("userId");
		
		IFollowDAO dao = sqlSession.getMapper(IFollowDAO.class);
		IUserDAO dao2 = sqlSession.getMapper(IUserDAO.class);
		
		model.addAttribute("followerBad",dao.followerBad());
		model.addAttribute("followerList",dao.followerList());
		model.addAttribute("followerAddrList",dao.followerAddrList());
		model.addAttribute("followerInterList",dao.followerInterList());
		
		model.addAttribute("MyPageBad",dao2.MyPageBad(userId));
		model.addAttribute("myPageList", dao2.myPageList(userId));
		model.addAttribute("myPageAddrList", dao2.myPageAddrList(userId));
		model.addAttribute("myPageInterList", dao2.myPageInterList(userId));	
		
		return "WEB-INF/views/MyFollower.jsp";
	}
	
	@RequestMapping(value="/followingajax.action")
	public void singUpcheckId(String followingId,String fck, HttpServletResponse response, HttpSession session) throws IOException
	{
		int result = 0;
		String userId = (String) session.getAttribute("userId");
		IFollowDAO followdao = sqlSession.getMapper(IFollowDAO.class);
		int followck = Integer.parseInt(fck);
		if(followck != 0)
		{
			result =followdao.followdelete2(followingId, userId);
		}
		else
		{
			result =followdao.followinsert2(followingId, userId);
		}

		response.getWriter().print(result);
	}
}
