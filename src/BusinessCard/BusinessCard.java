package BusinessCard;

import java.util.ArrayList;

public class BusinessCard {
	private int id;					// ���� ��ȣ
	private String name;			// ����
	private String phone;			// �޴��� ��ȣ
	private String team;			// �μ�
	private String position;		// ����
	private String email;			// �̸��� �ּ�
	private String savedTime;		// ���� ����
	private String company;			// ȸ���
	private String address;			// ȸ�� �ּ�
	private String zip;				// ȸ�� �����ȣ
	private String fax;				// ȸ�� �ѽ���ȣ
	private String telephone;		// ȸ�� ��ȭ��ȣ
	private String businessType;	// ���� ��
	
	public BusinessCard(int i, String name, String phone, String team, String position,
			String email, String savedTime, String company, String address, String zip,
			String fax, String telephone, String businessType) {
		// TODO Auto-generated constructor stub
		this.id = i;
		this.name = name;
		this.phone = phone;
		this.team = team;
		this.position = position;
		this.email = email;
		this.savedTime = savedTime;
		this.company = company;
		this.address = address;
		this.zip = zip;
		this.fax = fax;
		this.telephone = telephone;
		this.businessType = businessType;
	}
	/* Getter & Setter */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getSavedTime() {
		return savedTime;
	}
	public void setSavedTime(String savedTime) {
		this.savedTime = savedTime;
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
