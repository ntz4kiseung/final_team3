package com.test.mybatis;

import java.util.List;

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
public class BadgeController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/mybadge.action", method = RequestMethod.GET)
	public String myBadge(Model model, HttpSession session)
	{
		String userId = (String) session.getAttribute("userId");
		
		IBadgeDAO dao = sqlSession.getMapper(IBadgeDAO.class);
		IUserDAO dao2 = sqlSession.getMapper(IUserDAO.class);
		
		model.addAttribute("BadgeList1",dao.BadgeList1());
		model.addAttribute("BadgeList2",dao.BadgeList2());
		model.addAttribute("BadgeList3",dao.BadgeList3());
		model.addAttribute("BadgeList4",dao.BadgeList4());
		
		model.addAttribute("MyPageBad",dao2.MyPageBad(userId));
		model.addAttribute("myPageList", dao2.myPageList(userId));
		model.addAttribute("myPageAddrList", dao2.myPageAddrList(userId));
		model.addAttribute("myPageInterList", dao2.myPageInterList(userId));
		return "WEB-INF/views/MyBadge.jsp";
	}
	
	

}
