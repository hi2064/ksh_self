package com.hyundai.member;

public class memberBean {

	private String USER_ID;
	private String USER_PW;
	private String USER_NAME;
	private String USER_EMAIL;
	private String USER_ADRESS;
	private String USER_PHONE;
	private String USER_BIRTHDAY;
	private String CAR;
	private int CARYEAR;
	
	
	
	/**
	 * @return the uSER_ID
	 */
	public String getUSER_ID() {
		return USER_ID;
	}



	/**
	 * @param uSER_ID the uSER_ID to set
	 */
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}



	/**
	 * @return the uSER_PW
	 */
	public String getUSER_PW() {
		return USER_PW;
	}



	/**
	 * @param uSER_PW the uSER_PW to set
	 */
	public void setUSER_PW(String uSER_PW) {
		USER_PW = uSER_PW;
	}



	/**
	 * @return the uSER_NAME
	 */
	public String getUSER_NAME() {
		return USER_NAME;
	}



	/**
	 * @param uSER_NAME the uSER_NAME to set
	 */
	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}



	/**
	 * @return the uSER_EMAIL
	 */
	public String getUSER_EMAIL() {
		return USER_EMAIL;
	}



	/**
	 * @param uSER_EMAIL the uSER_EMAIL to set
	 */
	public void setUSER_EMAIL(String uSER_EMAIL) {
		USER_EMAIL = uSER_EMAIL;
	}



	/**
	 * @return the uSER_ADRESS
	 */
	public String getUSER_ADRESS() {
		return USER_ADRESS;
	}



	/**
	 * @param uSER_ADRESS the uSER_ADRESS to set
	 */
	public void setUSER_ADRESS(String uSER_ADRESS) {
		USER_ADRESS = uSER_ADRESS;
	}



	/**
	 * @return the uSER_PHONE
	 */
	public String getUSER_PHONE() {
		return USER_PHONE;
	}



	/**
	 * @param uSER_PHONE the uSER_PHONE to set
	 */
	public void setUSER_PHONE(String uSER_PHONE) {
		USER_PHONE = uSER_PHONE;
	}



	/**
	 * @return the uSER_BIRTHDAY
	 */
	public String getUSER_BIRTHDAY() {
		return USER_BIRTHDAY;
	}



	/**
	 * @param uSER_BIRTHDAY the uSER_BIRTHDAY to set
	 */
	public void setUSER_BIRTHDAY(String uSER_BIRTHDAY) {
		USER_BIRTHDAY = uSER_BIRTHDAY;
	}



	/**
	 * @return the cAR
	 */
	public String getCAR() {
		return CAR;
	}



	/**
	 * @param cAR the cAR to set
	 */
	public void setCAR(String cAR) {
		CAR = cAR;
	}



	/**
	 * @return the cARYEAR
	 */
	public int getCARYEAR() {
		return CARYEAR;
	}



	/**
	 * @param cARYEAR the cARYEAR to set
	 */
	public void setCARYEAR(int cARYEAR) {
		CARYEAR = cARYEAR;
	}

	
	


	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "memberBean [USER_ID=" + USER_ID + ", USER_PW=" + USER_PW + ", USER_NAME=" + USER_NAME + ", USER_EMAIL="
				+ USER_EMAIL + ", USER_ADRESS=" + USER_ADRESS + ", USER_PHONE=" + USER_PHONE + ", USER_BIRTHDAY="
				+ USER_BIRTHDAY + ", CAR=" + CAR + ", CARYEAR=" + CARYEAR + "]";
	}



	public static void main(String[] args) {
		

	}

}
