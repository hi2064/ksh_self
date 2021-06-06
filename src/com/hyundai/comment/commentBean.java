package com.hyundai.comment;

import java.util.Date;

public class commentBean {

	private int COMMENTNUM;
	private int NUM;
	private String NAME;
	private String CONTENT;
	private Date DATE;
	private String IP;
	
	



	public int getCOMMENTNUM() {
		return COMMENTNUM;
	}





	public void setCOMMENTNUM(int cOMMENTNUM) {
		COMMENTNUM = cOMMENTNUM;
	}





	public int getNUM() {
		return NUM;
	}





	public void setNUM(int nUM) {
		NUM = nUM;
	}





	public String getNAME() {
		return NAME;
	}





	public void setNAME(String nAME) {
		NAME = nAME;
	}





	public String getCONTENT() {
		return CONTENT;
	}





	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}





	public Date getDATE() {
		return DATE;
	}





	public void setDATE(Date dATE) {
		DATE = dATE;
	}





	public String getIP() {
		return IP;
	}





	public void setIP(String iP) {
		IP = iP;
	}



	


	@Override
	public String toString() {
		return "commentBean [COMMENTNUM=" + COMMENTNUM + ", NUM=" + NUM + ", NAME=" + NAME + ", CONTENT=" + CONTENT
				+ ", DATE=" + DATE + ", IP=" + IP + "]";
	}





	public static void main(String[] args) {
		

	}

}
