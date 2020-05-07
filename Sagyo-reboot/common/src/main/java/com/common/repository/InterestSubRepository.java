package com.common.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RestResource;

import com.common.domain.InterestSub;

@RestResource(path="interest-sub", rel="interest-sub")
public interface InterestSubRepository extends CrudRepository<InterestSub, String>{

}
