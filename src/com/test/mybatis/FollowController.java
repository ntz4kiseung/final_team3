package com.test.mybatis;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.ParameterParser;
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
		
		model.addAttribute("followingBad",dao.followingBad(userId));
		model.addAttribute("followingList",dao.followingList(userId));
		model.addAttribute("followingAddrList",dao.followingAddrList(userId));
		model.addAttribute("followingInterList",dao.followingInterList(userId));
		
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
		
		model.addAttribute("followerBad",dao.followerBad(userId));
		model.addAttribute("followerList",dao.followerList(userId));
		model.addAttribute("followerAddrList",dao.followerAddrList(userId));
		model.addAttribute("followerInterList",dao.followerInterList(userId));
		
		model.addAttribute("MyPageBad",dao2.MyPageBad(userId));
		model.addAttribute("myPageList", dao2.myPageList(userId));
		model.addAttribute("myPageAddrList", dao2.myPageAddrList(userId));
		model.addAttribute("myPageInterList", dao2.myPageInterList(userId));	
		
		return "WEB-INF/views/MyFollower.jsp";
	}
	
	@RequestMapping(value="/followingajax.action", method = RequestMethod.GET)
	public void singUpcheckId(ModelMap model,String followId,String fck,HttpServletResponse response,FollowDTO followDTO, HttpSession session) throws IOException
	{
		String userId = (String) session.getAttribute("userId");
		
		int result = 0;
		IFollowDAO dao = sqlSession.getMapper(IFollowDAO.class);
		
	

		int fck1 = Integer.parseInt(fck);
		
		//System.out.println(followId);
		//System.out.println(userId);
		//System.out.println(fck);
		
		if(fck1 == 0)
		{
			dao.followinsert2(userId, followId);
			result = 1;
			
		}
		else if(fck1 == 1)
		{
			
			dao.followdelete2(userId, followId);
			result = 0;
			
		}
		followDTO.setFollowId(Integer.toString(result));
		response.getWriter().print(result);

	}
	
}
