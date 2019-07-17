package com.test.mybatis;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class PostWriteController
{
	// SqlSession 을 활용하여 마이바티스 객체 의존성 (자동) 주입
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/postwrite.action", method = RequestMethod.GET)
	public String readList(Model model)
	{
		String result = null;
		IInterDAO interA = sqlSession.getMapper(IInterDAO.class);
		IAddrDAO addrA = sqlSession.getMapper(IAddrDAO.class);
		
		model.addAttribute("addrsilist", addrA.addrSiList());
		model.addAttribute("intermainlist", interA.interMainList());
		result = "WEB-INF/views/PostWrite.jsp";

		return result;
	}
	
	@RequestMapping(value = "/postInsert.action", method = RequestMethod.POST)
	public String postWrite(Model model, PostDTO postDTO, HttpSession session)
	{
		String result = null;
		IInterDAO interA = sqlSession.getMapper(IInterDAO.class);
		IAddrDAO addrA = sqlSession.getMapper(IAddrDAO.class);
		IPostDAO postDAO = sqlSession.getMapper(IPostDAO.class);
		String userId = (String)session.getAttribute("userId");
		postDTO.setUserId(userId);
		model.addAttribute("addrsilist", addrA.addrSiList());
		model.addAttribute("intermainlist", interA.interMainList());
		System.out.println(postDTO.getMeetDate());
		postDAO.postinsert(postDTO);
		String userid = postDAO.serchpost(userId);
		result = "redirect:postreadhost.action?postId="+userid;
		return result;
	}
	
}
