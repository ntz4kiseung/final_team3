package com.test.mybatis;

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
	public String postWrite(Model model, PostDTO postDTO)
	{
		String result = null;
		IInterDAO interA = sqlSession.getMapper(IInterDAO.class);
		IAddrDAO addrA = sqlSession.getMapper(IAddrDAO.class);
		IPostDAO postDAO = sqlSession.getMapper(IPostDAO.class);
		System.out.println(postDTO.getContents());
		System.out.println(postDTO.getTitle());
		System.out.println(postDTO.getAddrGuId());
		System.out.println(postDTO.getAddrSiId());
		System.out.println(postDTO.getAddrDetail());
		System.out.println(postDTO.getInterDetail());
		System.out.println(postDTO.getInterMainId());
		System.out.println(postDTO.getInterSubId());
		System.out.println(postDTO.getDrink());
		System.out.println(postDTO.getSamegender());
		System.out.println(postDTO.getGrade());
		System.out.println(postDTO.getMaxNum());
		System.out.println(postDTO.getMinNum());
		System.out.println(postDTO.getMeetDate());
		System.out.println(postDTO.getMoodName());
		model.addAttribute("addrsilist", addrA.addrSiList());
		model.addAttribute("intermainlist", interA.interMainList());
		postDAO.postinsert(postDTO);
		result = "redirect:postwrite.action";
		return result;
	}
	
}
