package com.common.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RestResource;

import com.common.domain.AddrGu;

// path : 도메인에 들어갈거, rel : 결과 josn에서 나올 거
@RestResource(path="gu", rel="gu")
public interface AddrGuRepository extends CrudRepository<AddrGu, String>{
	
	@Query(value = "SELECT ADDRGUID, ADDRGUNAME FROM ADDR_GU WHERE ADDRSIID=:si", nativeQuery = true)
	List<AddrGu> findBySiId(String si);
	
	@Query(value = "SELECT ADDRGUID, ADDRGUNAME FROM ADDR_GU WHERE ADDRSIID=:si AND ADDRGUID=:gu", nativeQuery = true)
	Optional<AddrGu> findOneGu(String si, String gu);
}
