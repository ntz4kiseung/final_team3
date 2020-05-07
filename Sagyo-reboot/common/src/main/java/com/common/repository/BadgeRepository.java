package com.common.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RestResource;

import com.common.domain.Badge;

@RestResource(path="badge", rel="badge")
public interface BadgeRepository extends CrudRepository<Badge, String>{
	
	@Query(value = "SELECT *\r\n" + 
			"FROM\r\n" + 
			"(\r\n" + 
			"    SELECT BADGEPOINTNAME, BADGEPOINTDESC1, URL, BADGEPOINTID\r\n" + 
			"    FROM POINT\r\n" + 
			"    WHERE BADGEPOINTCATEID IN ('BC00001', 'BC00003')\r\n" + 
			"      AND BADGEPOINTID NOT IN ('BP00010')\r\n" + 
			"    ORDER BY DBMS_RANDOM.VALUE\r\n" + 
			")\r\n" + 
			"WHERE ROWNUM<=2", nativeQuery = true)
	List<Badge> randomMainBadges();
	
}
