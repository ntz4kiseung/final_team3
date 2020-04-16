package com.test.mybatis;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController 
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/main.action", method = RequestMethod.GET)
	public String myMessageRecevie(Model model, HttpSession session)
	{
		IBadgeDAO badge = sqlSession.getMapper(IBadgeDAO.class);
		// 랜덤 뱃지 2개 생성
		ArrayList<BadgeDTO> randomBadgeList = badge.randomMainBadge();
		// 생성된 랜덤 뱃지의 최근 획득 유저 리스트 생성
		ArrayList<String> userList1 = null;
		ArrayList<String> userList2 = null;		
		if(randomBadgeList.size() >= 2) {
			userList1 = badge.getUserList(randomBadgeList.get(0).getBadgePointId());
			userList2 = badge.getUserList(randomBadgeList.get(1).getBadgePointId());			
		}
//		ArrayList<String> userList1 = badge.getUserList(randomBadgeList.get(0).getBadgePointId());
//		ArrayList<String> userList2 = badge.getUserList(randomBadgeList.get(1).getBadgePointId());
		// for문 돌리기 위해 두 리스트를 하나에 담아줌
		ArrayList<ArrayList<String>> userList = new ArrayList<ArrayList<String>>();
		userList.add(userList1);
		userList.add(userList2);
		
		// 모델에 담아 전송 준비
		model.addAttribute("badgeList", randomBadgeList);
		model.addAttribute("userList", userList);
		

		IPostDAO post = sqlSession.getMapper(IPostDAO.class);

		// 로그인 했는지 확인
		String user = (String)session.getAttribute("userId");
		ArrayList<PostDTO> mainPostList1 = new ArrayList<PostDTO>();
		if((user==null || user.equals("")))
		{
			// 로그인 안했다면
			mainPostList1 = post.mainHotList();
			IInterDAO interA = sqlSession.getMapper(IInterDAO.class);
			IAddrDAO addrA = sqlSession.getMapper(IAddrDAO.class);
			
			model.addAttribute("addrsilist", addrA.addrSiList());
			model.addAttribute("intermainlist", interA.interMainList());
		}
		else
		{
			// 로그인 했다면
			mainPostList1 = post.mainRecommendList(user);
		}

		// 했건 안했건 마감 임박은 보여주기
		ArrayList<PostDTO> mainPostList2 = post.mainApproachingList();
		
		// 모델에 담기
		model.addAttribute("mainPostList1", mainPostList1);
		model.addAttribute("mainPostList2", mainPostList2);		
		
		return "WEB-INF/views/Main.jsp";
	}
}
