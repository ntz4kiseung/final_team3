package com.contact.web;

import javax.swing.text.html.FormSubmitEvent.MethodType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.rest.webmvc.RepositoryRestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.contact.domain.Notice;
import com.contact.repository.NoticeRepository;

@RepositoryRestController
public class NoticeController {

	@Autowired
	NoticeRepository noticeRepository;
	
	@RequestMapping(value="/notice", method = RequestMethod.GET)
	public @ResponseBody Iterable<Notice> findAllBySortAndPaging(@RequestParam(name = "page", defaultValue = "0") String pageNum) {
		Pageable page = PageRequest.of(Integer.parseInt(pageNum), 10, Sort.by(Sort.Direction.DESC, "noticeDate"));
		return noticeRepository.findAll(page);
	}
}
