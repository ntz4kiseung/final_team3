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


@Controller
public class MypageController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/createpostlist.action", method=RequestMethod.GET)
	public String myReviewList(Model model)
	{
		IMyPageDAO dao1 = sqlSession.getMapper(IMyPageDAO.class);
		IPostDAO dao2 = sqlSession.getMapper(IPostDAO.class);
		IBadgeDAO dao3 = sqlSession.getMapper(IBadgeDAO.class);
		
		model.addAttribute("myPageList",dao1.myPageList());
		model.addAttribute("myPageAddrList", dao1.myPageAddrList());
		model.addAttribute("myPageInterList", dao1.myPageInterList());
		model.addAttribute("myReviewList", dao2.myReviewList());
		model.addAttribute("positiveBadge", dao3.positiveBadge());
		model.addAttribute("negativeBadge", dao3.negativeBadge());
		model.addAttribute("hostBadge", dao3.hostBadge());
		
		return "/WEB-INF/views/CreatePostList.jsp";
	}
	
	/*
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/hostReview.action", method=RequestMethod.GET)
	public ResponseEntity review(Model model, String postId, HttpServletRequest request)throws IOException
	{
		
		HttpHeaders header = new HttpHeaders();
		IPostDAO dao = sqlSession.getMapper(IPostDAO.class);
		
		ArrayList<PostDTO> result = dao.hostReview(postId);
		
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		
		System.out.println("size ===== " + result.size());
		
		for(PostDTO dto : result)
		{
			HashMap hm = new HashMap();
			
			hm.put("userId", dto.getUserId());
			hm.put("url", dto.getUrl());
			
			hmlist.add(hm);
		}
		
		JSONArray arr = new JSONArray(hmlist);
		
		System.out.println("json length ====== " + arr.length());
		
		return new ResponseEntity(arr.toString(), header, HttpStatus.CREATED);
		
	}
	*/
	
	
	 @RequestMapping(value="/hostReview.action", method=RequestMethod.GET) 
	 public void review(String postId, HttpServletResponse response) throws IOException 
	 {
		 //System.out.println(postId);
		 
		 response.setContentType("text/html;charset=UTF-8");
		 
		 IPostDAO dao = sqlSession.getMapper(IPostDAO.class);
		 
		 ArrayList<PostDTO> str = dao.hostReview(postId);
		 
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
	
	
	
	@RequestMapping(value="/joinpostlist.action", method=RequestMethod.GET)
	public String reviewList(Model model)
	{
		IMyPageDAO dao1 = sqlSession.getMapper(IMyPageDAO.class);
		IPostDAO dao2 = sqlSession.getMapper(IPostDAO.class);
		
		model.addAttribute("myPageList",dao1.myPageList());
		model.addAttribute("myPageAddrList", dao1.myPageAddrList());
		model.addAttribute("myPageInterList", dao1.myPageInterList());
		model.addAttribute("reviewList", dao2.reviewList());
		
		return "/WEB-INF/views/JoinPostList.jsp";
	}
	


	
}
