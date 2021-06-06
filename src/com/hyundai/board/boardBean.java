package com.hyundai.board;

import java.util.Date;

public class boardBean {
	
	
	private int NUM;
	private String SUBJECT;
	private String NAME;
	private String CONTENT;
	private int READCOUNT;
	private int RE_REF;
	private int RE_LEV;
	private int RE_SEQ;
	private Date DATE;
	private String IP;
	private String FILE;
	
	
	



	public int getNUM() {
		return NUM;
	}






	public void setNUM(int nUM) {
		NUM = nUM;
	}






	public String getSUBJECT() {
		return SUBJECT;
	}






	public void setSUBJECT(String sUBJECT) {
		SUBJECT = sUBJECT;
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






	public int getREADCOUNT() {
		return READCOUNT;
	}






	public void setREADCOUNT(int rEADCOUNT) {
		READCOUNT = rEADCOUNT;
	}






	public int getRE_REF() {
		return RE_REF;
	}






	public void setRE_REF(int rE_REF) {
		RE_REF = rE_REF;
	}






	public int getRE_LEV() {
		return RE_LEV;
	}






	public void setRE_LEV(int rE_LEV) {
		RE_LEV = rE_LEV;
	}






	public int getRE_SEQ() {
		return RE_SEQ;
	}






	public void setRE_SEQ(int rE_SEQ) {
		RE_SEQ = rE_SEQ;
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






	public String getFILE() {
		return FILE;
	}






	public void setFILE(String fILE) {
		FILE = fILE;
	}


	
	



	@Override
	public String toString() {
		return "boardBean [NUM=" + NUM + ", SUBJECT=" + SUBJECT + ", NAME=" + NAME + ", CONTENT=" + CONTENT
				+ ", READCOUNT=" + READCOUNT + ", RE_REF=" + RE_REF + ", RE_LEV=" + RE_LEV + ", RE_SEQ=" + RE_SEQ
				+ ", DATE=" + DATE + ", IP=" + IP + ", FILE=" + FILE + "]";
	}






	public static void main(String[] args) {
		

	}

}
