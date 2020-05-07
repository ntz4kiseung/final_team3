package com.common.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RestResource;

import com.common.domain.InterestMain;

@RestResource(path="interest-main", rel="interest-main")
public interface InterestMainRepository extends CrudRepository<InterestMain, String> {
	
}
