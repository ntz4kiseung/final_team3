package com.sp.bbs;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("bbs.boardController")
public class BoardController
{
	@Autowired
	private BoardService service;

	@RequestMapping(value = "/bbs/created", method = RequestMethod.GET)
	public String createdForm(Model model) throws Exception
	{
		model.addAttribute("mode", "created");
		return "bbs/created";
	}

	@RequestMapping(value = "/bbs/created", method = RequestMethod.POST)
	public String createdSubmit(Board dto, HttpServletRequest req) throws Exception
	{
		dto.setIpAddr(req.getRemoteAddr());
		service.insertBoard(dto);

		return "redirect:/bbs/list";
	}

	@RequestMapping(value = "/bbs/article")
	public String article(@RequestParam int num
						, @RequestParam int page
						, @RequestParam(value = "searchKey", defaultValue = "subject") String searchKey
						, @RequestParam(value = "searchValue", defaultValue = "") String searchValue
						, Model model) throws Exception
	{
		searchValue = URLDecoder.decode(searchValue, "utf-8");

		String query = "page=" + page;
		if (searchValue.length() != 0)
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

		service.updateHitCount(num);

		Board dto = service.readBoard(num);
		if (dto == null)
			return "redirect:/bbs/list?" + query;

		// dto.setContent(myUtil.htmlSymbols(dto.getContent()));

		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);

		Board preReadDto = service.preReadBoard(map);
		Board nextReadDto = service.nextReadBoard(map);

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);

		return "bbs/article";
	}

	@RequestMapping(value = "/bbs/update", method = RequestMethod.GET)
	public String updateForm(@RequestParam int num
							, @RequestParam String page, Model model) throws Exception
	{
		Board dto = service.readBoard(num);
		if (dto == null)
			return "redirect:/bbs/list?page=" + page;

		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);

		return "bbs/created";
	}

	@RequestMapping(value = "/bbs/update", method = RequestMethod.POST)
	public String updateSubmit(Board dto, @RequestParam(value = "page") String page) throws Exception
	{
		service.updateBoard(dto);

		return "redirect:/bbs/list?page=" + page;
	}

	@RequestMapping(value = "/bbs/delete")
	public String delete(@RequestParam(value = "num") int num
						, @RequestParam(value = "page") String page) throws Exception
	{
		// 자료 삭제
		service.deleteBoard(num);

		return "redirect:/bbs/list?page=" + page;
	}
}






