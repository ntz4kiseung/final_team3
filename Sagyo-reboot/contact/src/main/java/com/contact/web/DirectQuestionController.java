package com.contact.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.RepositoryRestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.contact.repository.DirectQuestionRepository;


@RepositoryRestController
public class DirectQuestionController {
	@Autowired
	DirectQuestionRepository directQuestionRepository;
	/*
	@RequestMapping(value="/direct-question", method = RequestMethod.POST)
	public @ResponseBody String temp(@RequestParam String title, @RequestParam String userId, @RequestParam String contents){
		System.out.println(title);
		System.out.println(userId);
		System.out.println(contents);
		return "a";
	}*/
	
}
