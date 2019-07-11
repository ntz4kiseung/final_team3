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
public class MyBadgeController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/mybadge.action", method = RequestMethod.GET)
	public String myBadge(Model model)
	{
		IBadgeDAO dao = sqlSession.getMapper(IBadgeDAO.class);
		IMyPageDAO dao2 = sqlSession.getMapper(IMyPageDAO.class);
		model.addAttribute("BadgeList1",dao.BadgeList1());
		model.addAttribute("BadgeList2",dao.BadgeList2());
		model.addAttribute("BadgeList3",dao.BadgeList3());
		model.addAttribute("BadgeList4",dao.BadgeList4());
		
		model.addAttribute("MyPageBad",dao2.MyPageBad());
		model.addAttribute("myPageList", dao2.myPageList());
		model.addAttribute("myPageAddrList", dao2.myPageAddrList());
		model.addAttribute("myPageInterList", dao2.myPageInterList());
		return "WEB-INF/views/MyBadge.jsp";
	}
	
	

}
