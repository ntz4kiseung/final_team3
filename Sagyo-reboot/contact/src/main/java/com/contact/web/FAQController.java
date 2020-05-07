package com.contact.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.rest.webmvc.RepositoryRestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.contact.domain.FAQ;
import com.contact.repository.FAQRepository;

@RepositoryRestController
public class FAQController {
	
	@Autowired
	FAQRepository faqRepository;
	
	@RequestMapping(value="/frequently-answered-question", method=RequestMethod.GET)
	public @ResponseBody Iterable<FAQ> findAllBySortAndPaging(@RequestParam(name="page", defaultValue = "0") String pageNum){
		Pageable page = PageRequest.of(Integer.parseInt(pageNum), 10, Sort.by(Sort.Direction.DESC, "faqDate"));
		return faqRepository.findAll(page);
	}
}
