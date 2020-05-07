package com.common.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ADDR_GU")
public class AddrGu {
	@Id
	@Column(name="ADDRGUID")
	private String addrGuId;
	@Column(name="ADDRGUNAME")
	private String addrGuName;
	
	public String getAddrGuId() {
		return addrGuId;
	}
	public void setAddrGuId(String addrGuId) {
		this.addrGuId = addrGuId;
	}
	public String getAddrGuName() {
		return addrGuName;
	}
	public void setAddrGuName(String addrGuName) {
		this.addrGuName = addrGuName;
	}

	
}
