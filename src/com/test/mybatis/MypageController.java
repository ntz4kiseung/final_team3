package com.test.mybatis;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MypageController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/createpostlist.action", method=RequestMethod.GET)
	public String myReviewList(Model model, HttpSession session)
	{
		String userId = (String) session.getAttribute("userId");
		
		// 세션에서 로그인 정보 받아봄
		// 비로그인이라면
		if(userId==null||userId.equals(""))
		{
		   System.out.println("비로그인 유저 진입");
		   return "redirect: login.action"; // 비로그인시 돌려보낼 곳 
		}
		// 로그인이라면
		else
		{
		   System.out.println("로그인 유저 진입");
		}
		
		IUserDAO dao1 = sqlSession.getMapper(IUserDAO.class);
		IPostDAO dao2 = sqlSession.getMapper(IPostDAO.class);
		IBadgeDAO dao3 = sqlSession.getMapper(IBadgeDAO.class);
		
		ArrayList<PostDTO> myReviewList = dao2.myReviewList(userId);
		
		model.addAttribute("myPageList",dao1.myPageList(userId));
		model.addAttribute("myPageAddrList", dao1.myPageAddrList(userId));
		model.addAttribute("myPageInterList", dao1.myPageInterList(userId));
		model.addAttribute("myReviewList", myReviewList);
		model.addAttribute("positiveBadge", dao3.positiveBadge());
		model.addAttribute("negativeBadge", dao3.negativeBadge());
		
		return "/WEB-INF/views/CreatePostList.jsp";
	}
	
	 @RequestMapping(value="/hostReview.action", method=RequestMethod.GET) 
	 public void hostReview(String postId, HttpServletResponse response) throws IOException 
	 {
		 //System.out.println(postId);
		 
		 response.setContentType("text/html;charset=UTF-8");
		 
		 
		 IPostDAO dao = sqlSession.getMapper(IPostDAO.class);
		 
		 ArrayList<PostDTO> str = dao.hostReview(postId);
		 
		 System.out.println("host 사이즈 : "+dao.hostReview(postId).size());
		 
		 String result = "";
		 
		 for (int i = 0; i < dao.hostReview(postId).size(); i++)
		 {
			 result += str.get(i).getUserId();
	         result += ",";
	         result += str.get(i).getUrl();
	         result += ",";
	         result += str.get(i).getNickname();
	         result += ",";
		 }
		 
		 System.out.println(result);
		
		 
		 response.getWriter().print(result);
	 }
	 
	 @RequestMapping(value="/guestReview.action", method=RequestMethod.GET) 
	 public void guestReview(String postId, HttpServletResponse response) throws IOException 
	 {
		 response.setContentType("text/html;charset=UTF-8");
		 
		 IPostDAO dao = sqlSession.getMapper(IPostDAO.class);
		 
		 ArrayList<PostDTO> str = dao.guestReview(postId);
		 
		 System.out.println("사이즈 : " + dao.guestReview(postId).size());
		 
		 String result = "";
		 
		 for (int i = 0; i < dao.guestReview(postId).size(); i++)
		 {
			 result += str.get(i).getUserId();
	         result += ",";
	         result += str.get(i).getUrl();
	         result += ",";
	         result += str.get(i).getNickname();
	         result += ",";
		 }
		 
		 response.getWriter().print(result);
	 }
	 
	 @RequestMapping(value="/myreviewinsert.action", method=RequestMethod.POST) 
	 public String myReviewInsert(HttpServletRequest request, HttpSession session)
	 {
		 String hostId = (String) session.getAttribute("userId");		// 평가한 유저 아이디
		 
		 
		 IReviewDAO dao = sqlSession.getMapper(IReviewDAO.class);
		 
		 String postId = request.getParameter("postId");				// 방 번호
		 String[] grade = request.getParameterValues("grade");			// 등급
		 String[] userId = request.getParameterValues("userId");		// 평가받는 유저 아이디
		 String[] badgeId = request.getParameterValues("badgeId");		// 뱃지 아이디
		 String[] contents = request.getParameterValues("contents");	// 내용
		 
		 
		 
		 
		for (int i = 0; i < grade.length; i++)
		{
			String reviewId = dao.getNextReviewId();
			
			//System.out.println("reviewId : " + reviewId);
			//System.out.println("hostId : " + hostId);
			System.out.println("postId : " + postId);
			System.out.println("grade : " + grade[i]);
			System.out.println("userId : "+ userId[i]);
			System.out.println("badgeId : " + badgeId[i]);
			System.out.println("contents : " + contents[i]);
			
			dao.reviewInsertMain(postId,hostId,grade[i],userId[i]);
			
			//System.out.println(badgeId[i]);
			if (!badgeId[i].equals("nonSelect") || !contents[i].equals(""))
			{
				System.out.println("뱃지선택 or 코멘트 작성");
				dao.reviewInsertSub(badgeId[i],contents[i],reviewId);
			}
			
		}
		return "redirect:createpostlist.action";
	 }
	 
	 @RequestMapping(value="/reviewinsert.action", method=RequestMethod.POST) 
	 public String reviewInsert(HttpServletRequest request, HttpSession session)
	 {
		 String hostId = (String) session.getAttribute("userId");		// 평가한 유저 아이디
		 
		 
		 IReviewDAO dao = sqlSession.getMapper(IReviewDAO.class);
		 
		 String postId = request.getParameter("postId");				// 방 번호
		 String[] grade = request.getParameterValues("grade");			// 등급
		 String[] userId = request.getParameterValues("userId");		// 평가받는 유저 아이디
		 String[] badgeId = request.getParameterValues("badgeId");		// 뱃지 아이디
		 String[] contents = request.getParameterValues("contents");	// 내용
		 
		 
		 
		 
		for (int i = 0; i < grade.length; i++)
		{
			String reviewId = dao.getNextReviewId();
			
			//System.out.println("reviewId : " + reviewId);
			//System.out.println("hostId : " + hostId);
			System.out.println("postId : " + postId);
			System.out.println("grade : " + grade[i]);
			System.out.println("userId : "+ userId[i]);
			System.out.println("badgeId : " + badgeId[i]);
			System.out.println("contents : " + contents[i]);
			
			dao.reviewInsertMain(postId,hostId,grade[i],userId[i]);
			
			//System.out.println(badgeId[i]);
			if (!badgeId[i].equals("nonSelect") || !contents[i].equals(""))
			{
				System.out.println("뱃지선택 or 코멘트 작성");
				dao.reviewInsertSub(badgeId[i],contents[i],reviewId);
			}
			
		}
		return "redirect:joinpostlist.action";
	 }
	 
	 @RequestMapping(value="/hostReviewView.action", method=RequestMethod.GET)
	 public String reviewView()
	 {
		 
		 return "";
	 }
	
	
	
	@RequestMapping(value="/joinpostlist.action", method=RequestMethod.GET)
	public String reviewList(Model model, HttpSession session)
	{
		String userId = (String) session.getAttribute("userId");
		
		if(userId==null||userId.equals(""))
		{
		   System.out.println("비로그인 유저 진입");
		   return "redirect: login.action"; // 비로그인시 돌려보낼 곳 
		}
		// 로그인이라면
		else
		{
		   System.out.println("로그인 유저 진입");
		}
		
		IUserDAO dao1 = sqlSession.getMapper(IUserDAO.class);
		IPostDAO dao2 = sqlSession.getMapper(IPostDAO.class);
		IBadgeDAO dao3 = sqlSession.getMapper(IBadgeDAO.class);
		
		ArrayList<PostDTO> reviewList = dao2.reviewList(userId);
		
		
		model.addAttribute("myPageList",dao1.myPageList(userId));
		model.addAttribute("myPageAddrList", dao1.myPageAddrList(userId));
		model.addAttribute("myPageInterList", dao1.myPageInterList(userId));
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("positiveBadge", dao3.positiveBadge());
		model.addAttribute("negativeBadge", dao3.negativeBadge());
		model.addAttribute("hostBadge", dao3.hostBadge());
		
		return "/WEB-INF/views/JoinPostList.jsp";
	}
	
	

	
}
