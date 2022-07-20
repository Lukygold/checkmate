package com.kh.checkmate.board.sharingInformation.model.vo;

import java.sql.Date;

public class SharingInformation {
	private int informationNo;	//	INFORMATION_NO	NUMBER
	private int userNo;	//	USER_NO	NUMBER
	private String userId;
	private String informationCategory;	//	INFORMATION_CATEGORY	VARCHAR2(1 BYTE)
	private String informationTitle;	//	INFORMATION_TITLE	VARCHAR2(100 BYTE)
	private String informationContent;	//	INFORMATION_CONTENT	VARCHAR2(4000 BYTE)
	private Date informationDate;	//	INFORMATION_DATE	DATE
	private int informationView;	//	INFORMATION_VIEW	NUMBER
	private String informationStatus;	//	INFORMATION_STATUS	VARCHAR2(1 BYTE)
	public SharingInformation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SharingInformation(int informationNo, int userNo, String userId, String informationCategory,
			String informationTitle, String informationContent, Date informationDate, int informationView,
			String informationStatus) {
		super();
		this.informationNo = informationNo;
		this.userNo = userNo;
		this.userId = userId;
		this.informationCategory = informationCategory;
		this.informationTitle = informationTitle;
		this.informationContent = informationContent;
		this.informationDate = informationDate;
		this.informationView = informationView;
		this.informationStatus = informationStatus;
	}
	public int getInformationNo() {
		return informationNo;
	}
	public void setInformationNo(int informationNo) {
		this.informationNo = informationNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getInformationCategory() {
		return informationCategory;
	}
	public void setInformationCategory(String informationCategory) {
		this.informationCategory = informationCategory;
	}
	public String getInformationTitle() {
		return informationTitle;
	}
	public void setInformationTitle(String informationTitle) {
		this.informationTitle = informationTitle;
	}
	public String getInformationContent() {
		return informationContent;
	}
	public void setInformationContent(String informationContent) {
		this.informationContent = informationContent;
	}
	public Date getInformationDate() {
		return informationDate;
	}
	public void setInformationDate(Date informationDate) {
		this.informationDate = informationDate;
	}
	public int getInformationView() {
		return informationView;
	}
	public void setInformationView(int informationView) {
		this.informationView = informationView;
	}
	public String getInformationStatus() {
		return informationStatus;
	}
	public void setInformationStatus(String informationStatus) {
		this.informationStatus = informationStatus;
	}
	@Override
	public String toString() {
		return "SharingInformation [informationNo=" + informationNo + ", userNo=" + userNo + ", userId=" + userId
				+ ", informationCategory=" + informationCategory + ", informationTitle=" + informationTitle
				+ ", informationContent=" + informationContent + ", informationDate=" + informationDate
				+ ", informationView=" + informationView + ", informationStatus=" + informationStatus + "]";
	}
	
}
