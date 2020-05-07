package com.contact.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RestResource;

import com.contact.domain.FAQ;

@RestResource(path = "frequently-answered-question", rel = "frequently-answered-question")
public interface FAQRepository extends PagingAndSortingRepository<FAQ, String>{
	
}
