package com.common.domain;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity // 
@Table(name="ADDR_SI") // 테이블이름과 클래스 이름이 다를 경우 설정
public class AddrSi {
	
	@Id
	@Column(name="ADDRSIID")
	private String addrSiId;
	@Column(name="ADDRSINAME")
	private String addrSiName;
	
	@OneToMany
	@JoinColumn(name="ADDRSIID") // 실제 DB에서 key로 들어갈 것
	Set<AddrGu> gu; // 도메인 path로 들어갈 이름
	
	public Set<AddrGu> getGu() {
		return gu;
	}
	public void setGu(Set<AddrGu> gu) {
		this.gu = gu;
	}
	public String getAddrSiId() {
		return addrSiId;
	}
	public void setAddrSiId(String addrSiId) {
		this.addrSiId = addrSiId;
	}
	public String getAddrSiName() {
		return addrSiName;
	}
	public void setAddrSiName(String addrSiName) {
		this.addrSiName = addrSiName;
	}
	
}
