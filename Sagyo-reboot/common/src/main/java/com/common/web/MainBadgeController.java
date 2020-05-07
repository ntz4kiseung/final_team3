package com.common.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.common.domain.Badge;
import com.common.repository.BadgeRepository;

@RestController
public class MainBadgeController {

	@Autowired
	private BadgeRepository badgeRepository;
	
	@RequestMapping("/main-badges")
	public @ResponseBody List<Badge> mainBadges() {
		return badgeRepository.randomMainBadges();
	}
}
