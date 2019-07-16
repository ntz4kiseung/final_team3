package com.test.mybatis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CsController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/notice.action",method= {RequestMethod.POST, RequestMethod.GET})
	public String noticeList(Model model, String keyword, String pageNum)
	{	
		if(pageNum==null)
			pageNum="1";
		
		ICsDAO dao = sqlSession.getMapper(ICsDAO.class);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("largePage", (int)(Math.ceil((double)Integer.parseInt(pageNum)/5)));
		model.addAttribute("totalPage",dao.noticeTotalPageNum(keyword));
		model.addAttribute("totalLargePage",dao.noticeTotalLargePageNum(keyword));
		model.addAttribute("list", dao.noticeList(keyword, pageNum));
		
		return "/WEB-INF/views/Notice.jsp";
	}
	
	@RequestMapping(value="/faq.action",method= {RequestMethod.POST, RequestMethod.GET})
	public String faqList(Model model, String keyword, String pageNum)
	{	
		if(pageNum==null)
			pageNum="1";
		
		ICsDAO dao = sqlSession.getMapper(ICsDAO.class);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("largePage", (int)(Math.ceil((double)Integer.parseInt(pageNum)/5)));
		model.addAttribute("totalPage",dao.faqTotalPageNum(keyword));
		model.addAttribute("totalLargePage",dao.faqTotalLargePageNum(keyword));
		model.addAttribute("list", dao.faqList(keyword, pageNum));
		
		return "/WEB-INF/views/FAQ.jsp";
	}
	
	@RequestMapping(value="/directquestionwrite.action",method= {RequestMethod.POST, RequestMethod.GET})
	public String DirectQuestionWrite(HttpSession session)
	{	
		String userId = (String)session.getAttribute("userId");
		
		if(userId==null || userId.equals("")){
			return "redirect:login.action";
		}
		
		return "/WEB-INF/views/DirectQuestionWrite.jsp";
	}
	
	@RequestMapping(value="/directquestioncomplete.action",method= {RequestMethod.POST, RequestMethod.GET})
	public String DirectQuestionComplete(HttpSession session, CsDTO d)
	{	
		String userId = (String)session.getAttribute("userId");
		
		if(userId==null || userId.equals("")){
			return "redirect:login.action";
		}
		
		ICsDAO dao = sqlSession.getMapper(ICsDAO.class);
		dao.drwrite(d);
		
		return "/WEB-INF/views/DirectQuestionComplete.jsp";
	}
	
	@RequestMapping(value="/withdrawal.action",method= {RequestMethod.POST, RequestMethod.GET})
	public String Withdrawal(HttpSession session)
	{	
		String userId = (String)session.getAttribute("userId");
		
		if(userId==null || userId.equals("")){
			return "redirect:login.action";
		}
		
		return "/WEB-INF/views/Withdrawal.jsp";
	}
	
	@RequestMapping(value="/withdrawalcheck.action",method= {RequestMethod.POST, RequestMethod.GET})
	public String Withdrawalcheck(Model model, CsDTO d, HttpSession session)
	{	
		String userId = (String)session.getAttribute("userId");
		
		if(userId==null || userId.equals("")){
			return "redirect:login.action";
		}
		
		ICsDAO dao = sqlSession.getMapper(ICsDAO.class);
		model.addAttribute("userId",userId); // view페이지에 userid 뿌리기위해 넘겨주는거 WithdrawalCheck.jsp
		model.addAttribute("nickname",dao.nickname(userId));
		
		return "/WEB-INF/views/WithdrawalCheck.jsp";
	}
	
	//withdrawalcomplete.action.action
	@RequestMapping(value="/withdrawalcomplete.action",method= {RequestMethod.POST, RequestMethod.GET})
	public String Withdrawalcheckcomplete(Model model, HttpSession session, HttpServletRequest request, CsDTO w)
	{	
		String userId = (String)session.getAttribute("userId");
		
		if(userId==null || userId.equals("")){
			return "redirect:login.action";
		}
		String result= null;
		ICsDAO dao = sqlSession.getMapper(ICsDAO.class);
		userId = request.getParameter("userId");
		
		String pwd = request.getParameter("pwd");
		w.setPageNum(pwd);
		
		int idpwcheckCount = dao.idpwcheck(w);
		
		if (idpwcheckCount==1) // 비번이 맞을 경우 
		{
			dao.del_user(userId);
			session.removeAttribute("userId");
			result = "/WEB-INF/views/WithdrawalComplete.jsp"; 
			
		}else if (idpwcheckCount!=1) // 맞지 않을 경우 
		{
			result =  "redirect: withdrawalcheck.action";
		}
		return result;
	}		
}
























