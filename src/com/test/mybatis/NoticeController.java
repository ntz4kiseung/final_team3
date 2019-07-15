package com.test.mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeController
{
	@Autowired
	private SqlSession sqlSession;

	
	@SuppressWarnings("unused")
	@RequestMapping(value="/notice.action",method= {RequestMethod.POST, RequestMethod.GET})
	public String noticeList(Model model, HttpServletRequest request) throws NumberFormatException
	{	
		String result= null;
		
		ICsDAO dao = sqlSession.getMapper(ICsDAO.class);
		
	
			String reqpage = request.getParameter("pagesu"); // 게시물 하단 페이지 1/2/3 요청시 돌아가는 구문~ 
			String keyword = request.getParameter("keyword");
			
			System.out.println(keyword+"keyword확인");
			if (reqpage==null) // 만약 최초 페이지 로드시 값은 NULL이기때문에 자동으로 1 넣어줄수 있도록 함 ! 
			{
				reqpage = "1";
			}
			if (keyword==null)
			{
				keyword="";
			}
			model.addAttribute("list",dao.list(keyword, reqpage)); // 리스트에 요청페이지 담아서 dao 보내줌~~ 
		
			int reqpageN = Integer.parseInt(reqpage); // 요청페이지 강제 변환 ~ 
			int start = 1;
			int countPage = 5;  // 하단에 뿌려질 page 넘버의 갯수 
			model.addAttribute("countPage",countPage);
			//startPage + countPage - 1
			int end = start+countPage-1; 
			
			
			
		/*
		 int page(reqpage) =  현재 페이지번호 
		 int countList = 한 페이지에 출력될 게시물 수 
		 int countPage = 한화면에 출력될 페이지 수 
		 
		 int totalCount = 게시물 총 갯수 
		 
		 int startPage
		 */
			
			String paging = "";
			
		int pages = (int)Math.ceil(dao.count(keyword)/15.0); // 총 페이지 갯수 
		
		
		
		
		
		
		
		if (request.getParameter("nextpage") != null)
		{
			int nextpage = Integer.parseInt(request.getParameter("nextpage"));
			System.out.println(nextpage+"넥스트페이지확인");
			
			start = countPage;
			System.out.println(start+"  start  6나와야하고");
			end = start+countPage-2;
			System.out.println(end+"  end 10나와야함");
		}
		
			
		//System.out.println(start+"플러스1 하면 2나와야함");
			
			
	
		
		
		int nextpg =0;
		
		if (start>countPage)
		{
			paging += "<button>이전페이지</button>";
		}
		for (int i = start; i <= end; i++)
		{
			System.out.println(i+"i값 찍기 ");
			paging += "<button type='submit' id='pagesu' name='pagesu' class='btn btn-deep-orange' value=" + i + ">" +i+ "</button>";
			nextpg = i;
		}
		++end;
		if (true)
		{
			paging+= "<button type='submit' id='nextpage' name='nextpage' value='"+end+"'>다음페이지</button>";
		}
		model.addAttribute("paging",paging);
		
		
		
		System.out.println(pages+"페이지수 확인");
		model.addAttribute("pages",pages);
		model.addAttribute("keyword",keyword);
		
		
	
		
		result = "/WEB-INF/views/Notice.jsp";
		return result;
		
		

		
		
		
	}
	
	@RequestMapping(value="/searchnotice.action",method=RequestMethod.POST)
	public String searchNotice(Model model /* ,String keyword */, HttpServletRequest request)
	{	
		//System.out.println("/searchnotice.action호출 확인"+request.getParameter("keyword"));
		 
		String keyword = request.getParameter("keyword");
		String reqpage = request.getParameter("pagesu");
		
		System.out.println(keyword +"검색페이지에서 숫자 누를때 keyword에 뭐가뜨는지 보자~ ");
		System.out.println(keyword+"searchlist keyword이당 ");
		
		String result= null;
		
		ICsDAO dao = sqlSession.getMapper(ICsDAO.class);
				
		//System.out.println("ㅎㅎㅎ"+keyword+"데이터 확인");
		//model.addAttribute("searchlist",dao.searchlist(keyword)); // 여기서 안들어가는듯??? 
		//System.out.println("ㅎㅎㅎ"+keyword+"데이터 확인");
		
		//model.addAttribute("searchlist",keyword);  // 여기 key 값이 넘어가는 구조인듯. 
		 
		
		//dao.searchlist(keyword);// dao에있는 search라는 select문에 값을 보냄~ 
		
		if (keyword==null)
		{
			keyword="";
		};
		if (reqpage==null)
		{
			reqpage = "1";
		}
		
	
		
		
		 int pages = (int)Math.ceil(dao.count(keyword)/10.0); // 
			System.out.println(pages+"페이지수 확인 searchlist");
			model.addAttribute("pages",pages);
			//model.addAttribute("")
		
		 
		System.out.println("매퍼 전~ ");
		
		try
		{
			
			model.addAttribute("list",dao.searchlist(keyword,reqpage));//<<-- 요 끝에 꺼는 DAO~ 
								// 요고 뷰 페이지에서 접근할때 경로임 ㅇㅇ 
			// 페이징 처리 시작? 
			System.out.println("매퍼 후~ ");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		// 페이징 처리 끝 
		result = "/WEB-INF/views/SearchList.jsp";
		return result;
		
	}
	
	@RequestMapping(value="/faq.action",method= {RequestMethod.POST, RequestMethod.GET})
	public String faqList(Model model, HttpServletRequest request)
	{	
		String result= null;
		
		ICsDAO dao = sqlSession.getMapper(ICsDAO.class);
		
	
			String reqpage = request.getParameter("pagesu"); // 게시물 하단 페이지 1/2/3 요청시 돌아가는 구문~ 
			String keyword = request.getParameter("keyword");
			//System.out.println(keyword);
			
			System.out.println(keyword+"keyword확인");
			if (reqpage==null) // 만약 최초 페이지 로드시 값은 NULL이기때문에 자동으로 1 넣어줄수 있도록 함 ! 
			{
				reqpage = "1";
			}
			if (keyword==null)
			{
				keyword="";
			}
			model.addAttribute("list",dao.faqlist(keyword, reqpage)); // 리스트에 요청페이지 담아서 dao 보내줌~~ 
		
			
		int pages = (int)Math.ceil(dao.faqcount(keyword)/15.0); // 
		
		System.out.println(pages+"페이지수 확인");
		model.addAttribute("pages",pages);
		model.addAttribute("keyword",keyword);
		
		result = "/WEB-INF/views/FAQ.jsp";
	
		
		return result;
			
		
	}
	
	@RequestMapping(value="/directquestionwrite.action",method= {RequestMethod.POST, RequestMethod.GET})
	public String DirectQuestionWrite(Model model, HttpServletRequest request)
	{	
		String result= null;
		
		
		
		
		String title= request.getParameter("title");
		String content = request.getParameter("content");
		
		
		
		
		result = "/WEB-INF/views/DirectQuestionWrite.jsp";
		
		
		return result;
			
		
	}
	
	//
	
	@RequestMapping(value="/directquestioncomplete.action",method= {RequestMethod.POST, RequestMethod.GET})
	public String DirectQuestionComplete(Model model, HttpServletRequest request, CsDTO d)
	{	
		String result= null;
		
		
		ICsDAO dao = sqlSession.getMapper(ICsDAO.class);
		
		//directquestioncompleteDTO titleContent= d;
		
		
		System.out.println(d+"뭐가넘어올까?");
		// 일단 뭐 주소값이 넘어옴 
		
		dao.drwrite(d);
		
		
		result = "/WEB-INF/views/DirectQuestionComplete.jsp";
		
		
		return result;
	}
	
	
	
	@RequestMapping(value="/withdrawal.action",method= {RequestMethod.POST, RequestMethod.GET})
	public String Withdrawal(Model model, HttpServletRequest request, CsDTO d)
	{	
		
		String result= null;
		

		
		
		result = "/WEB-INF/views/Withdrawal.jsp";
		
		
		return result;
	}
	
	@RequestMapping(value="/withdrawalcheck.action",method= {RequestMethod.POST, RequestMethod.GET})
	public String Withdrawalcheck(Model model, HttpServletRequest request, CsDTO d)
	{	
		
		String result= null;
		
	
		
		ICsDAO dao = sqlSession.getMapper(ICsDAO.class);
		//id 불러오고~ 그걸 기반으로 닉네임 불러오고~ 
		String userId = "coimhin"; // 현재 로그인한 아이디가 불러져야하는데 아직 session 으로 구현해야하는데 못함~ 
				
		model.addAttribute("userId",userId); // view페이지에 userid 뿌리기위해 넘겨주는거 WithdrawalCheck.jsp
		// id 값으로 nickname 불러올수 있도록 처리하자~ 
		
		System.out.println(dao.nickname(userId));
		
		model.addAttribute("nickname",dao.nickname(userId));
		
		result = "/WEB-INF/views/WithdrawalCheck.jsp";
		
		
		return result;
	}
	
	//withdrawalcomplete.action.action
	@RequestMapping(value="/withdrawalcomplete.action",method= {RequestMethod.POST, RequestMethod.GET})
	public String Withdrawalcheckcomplete(Model model, HttpServletRequest request, CsDTO w)
	{	
		
		String result= null;
		ICsDAO dao = sqlSession.getMapper(ICsDAO.class);
		String userId = request.getParameter("userId");
		
		String pwd = request.getParameter("pwd");
		System.out.println("userId확인 "+userId);// 잘넘어옴~~ 
		System.out.println("password확인"+pwd);// 잘넘어옴~~
		
		
		// 이제 여기서 아이디 비번이 맞는지 검증을 해야함!! 
		
		int idpwcheckCount = dao.idpwcheck(w);
		// 여기까진 잘됨 
		
		System.out.println(idpwcheckCount+"<< 이거 idpwcheckCount");
		
		if (idpwcheckCount==1) // 비번이 맞을 경우 
		{
			// del_user 테이블에 데이터 insert 문 들어가는걸로~ 
			
			
			dao.del_user(userId);
			System.out.println("실행되는지 테스트");
			result = "/WEB-INF/views/WithdrawalComplete.jsp"; 
			
		}else if (idpwcheckCount!=1) // 맞지 않을 경우 
		{
			result =  "withdrawalcheck.action";
			System.out.println("2-1");
		}
		
		System.out.println("3");
		return result;
		
	}		
		
}
























