package com.common.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RestResource;

import com.common.domain.AddrSi;

@RestResource(path="si", rel="si")
public interface AddrSiRepository extends CrudRepository<AddrSi, String> {
	
}
