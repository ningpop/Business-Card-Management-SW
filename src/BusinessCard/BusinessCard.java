package BusinessCard;

import java.util.ArrayList;
import java.sql.Date;

public class BusinessCard {
	private int id;					// 명함 번호
	private String name;			// 성명
	private String phone;			// 휴대폰 번호
	private String team;			// 부서
	private String position;		// 직급
	private String email;			// 이메일 주소
	private Date savedTime;		// 저장 일자
	private String company;			// 회사명
	private String address;			// 회사 주소
	private String zip;				// 회사 우편번호
	private String fax;				// 회사 팩스번호
	private String telephone;		// 회사 전화번호
	private String businessType;	// 업종 명
	
	public BusinessCard(int id, String name, String phone, String team, String position,
			String email, String company, String address, String zip,
			String fax, String telephone, String businessType, Date savedTime) {
		// TODO Auto-generated constructor stub
		this.name = name;
		this.phone = phone;
		this.team = team;
		this.position = position;
		this.email = email;
		this.company = company;
		this.address = address;
		this.zip = zip;
		this.fax = fax;
		this.telephone = telephone;
		this.businessType = businessType;
		this.savedTime = savedTime;
	}
	/* Getter & Setter */
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getSavedTime() {
		return savedTime;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getBusinessType() {
		return businessType;
	}
	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	
}
