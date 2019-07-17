package com.test.mybatis;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
public class BadgeController
{
   @Autowired
   private SqlSession sqlSession;
   
   @RequestMapping(value="/mybadge.action", method = RequestMethod.GET)
   public String myBadge(Model model, HttpSession session)
   {
	   
      String userId = (String)session.getAttribute("userId");
      
      
      IBadgeDAO dao = sqlSession.getMapper(IBadgeDAO.class);
      IUserDAO dao2 = sqlSession.getMapper(IUserDAO.class);
      
      model.addAttribute("BadgeList1",dao.BadgeList1(userId));
      model.addAttribute("BadgeList1_count",dao.BadgeList1_count(userId));
      model.addAttribute("BadgeList1_date",dao.BadgeList1_date(userId));
   
      
      model.addAttribute("BadgeList2",dao.BadgeList2(userId));
      model.addAttribute("BadgeList3",dao.BadgeList3(userId));
      model.addAttribute("BadgeList4",dao.BadgeList4(userId));
      
      model.addAttribute("MyPageBad",dao2.MyPageBad(userId));
      model.addAttribute("myPageList", dao2.myPageList(userId));
      model.addAttribute("myPageAddrList", dao2.myPageAddrList(userId));
      model.addAttribute("myPageInterList", dao2.myPageInterList(userId));
      
      
      return "WEB-INF/views/MyBadge.jsp";
   }
   
   
   @RequestMapping(value="/mainBadge.action", method=RequestMethod.POST)   
   public String mainBadge(String badgeLogId, HttpSession session) throws IOException
   {
      String userId = (String) session.getAttribute("userId");
      
      IBadgeDAO dao = sqlSession.getMapper(IBadgeDAO.class);

      dao.mainBadge(userId,badgeLogId);
      
      return "WEB-INF/views/MainBadgeAjax.jsp";
   }
   
   @RequestMapping(value="/badgeajax.action", method=RequestMethod.GET)   
   public String PointList(ModelMap model,String badgeId, HttpSession session) throws IOException
   {   
      
      String userId = (String) session.getAttribute("userId");
      IBadgeDAO dao = sqlSession.getMapper(IBadgeDAO.class);
      
      ArrayList<BadgeDTO> temp = dao.PointList(userId,badgeId);
      
      model.addAttribute("List",temp);

      return "WEB-INF/views/PointListAjax.jsp";
      
   }
}