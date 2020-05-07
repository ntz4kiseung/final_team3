package com.contact.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RestResource;

import com.contact.domain.Notice;

@RestResource(path="notice", rel="notice")
public interface NoticeRepository extends PagingAndSortingRepository<Notice, String> {

}
