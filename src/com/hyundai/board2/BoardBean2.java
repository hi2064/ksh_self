package com.hyundai.board2;

import java.util.Date;

public class BoardBean2 {

	private int NUM;
	private String NAME;
	private String SUBJECT;
	private String CONTENT;
	private Date DATE;
	private int RE_REF;
	private int RE_LEV;
	private int RE_SEQ;
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
	public String getSUBJECT() {
		return SUBJECT;
	}
	public void setSUBJECT(String sUBJECT) {
		SUBJECT = sUBJECT;
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
	@Override
	public String toString() {
		return "BoardBean2 [NUM=" + NUM + ", NAME=" + NAME + ", SUBJECT=" + SUBJECT + ", CONTENT=" + CONTENT + ", DATE="
				+ DATE + ", RE_REF=" + RE_REF + ", RE_LEV=" + RE_LEV + ", RE_SEQ=" + RE_SEQ + "]";
	}
	
	
	
	
	
	
	
}
