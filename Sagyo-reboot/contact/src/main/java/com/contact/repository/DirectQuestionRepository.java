package com.contact.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RestResource;

import com.contact.domain.DirectQuestion;

@RestResource(path = "direct-question", rel="direct-question")
public interface DirectQuestionRepository extends CrudRepository<DirectQuestion, Integer> {

	// @Query(value = "INSERT INTO DIRECT_QUESTION(ID, TITLE, USERID, CONTENTS, DIRECTQUESTIONDATE) VALUES(DIRECT_QUESTION_SEQ.NEXTVAL, :title, :userId, :contents, SYSDATE)")
	
	
}
