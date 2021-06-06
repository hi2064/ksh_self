package com.hyundai.member;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {

	private Connection conn = null;
	private PreparedStatement pstmt =null;
	private ResultSet rs = null;
	
	private Connection getConnection(){
		
		try{
			Context initCTX = new InitialContext();
			DataSource ds =
					(DataSource) initCTX.lookup("java:comp/env/jdbc/mysqlDB");
			conn = ds.getConnection();
		}catch(NamingException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return conn;
	}
	
	
	public void closeDB(){
		try {
			if(rs != null){ rs.close(); }
			if(pstmt != null){ pstmt.close();}
			if(conn != null){ conn.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int join(memberBean mb){
		
			conn = getConnection();
		String sql = "insert into user(USER_ID, USER_PW, USER_NAME, USER_EMAIL, USER_ADRESS,USER_PHONE, USER_BIRTHDAY, CAR, CARYEAR) values(?,?,?,?,?,?,?,?,?)";
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mb.getUSER_ID());
			pstmt.setString(2, mb.getUSER_PW());
			pstmt.setString(3, mb.getUSER_NAME());
			pstmt.setString(4, mb.getUSER_EMAIL());
			pstmt.setString(5, mb.getUSER_ADRESS());
			pstmt.setString(6, mb.getUSER_PHONE());
			pstmt.setString(7, mb.getUSER_BIRTHDAY());
			pstmt.setString(8, mb.getCAR());
			pstmt.setInt(9, mb.getCARYEAR());
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return -1;
	}
	
	public int idCheck(String USER_ID){
		int result = 0;
		try{
			conn = getConnection();
			String sql ="select * from user where USER_ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, USER_ID);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				result = 1;
			}else{
				result = 0;
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		return result;
	}
	
	public int delete(memberBean mb){
		int check = -1;
		try {
		conn = getConnection();
		String sql ="select * from user where USER_ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mb.getUSER_ID());
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(mb.getUSER_PW().equals(rs.getString("USER_PW"))){
					sql="delete from user where USER_ID=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, mb.getUSER_ID());
					check = pstmt.executeUpdate();
				}else{
					check = 0;
					
				}
			}else{
				check = -1;
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return check;
	}
	
	public int emailCheck(String USER_EMAIL){
		int result = 0;
		try {
		conn = getConnection();
		String sql="select * from user where USER_EMAIL=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, USER_EMAIL);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			result = 1;
		}else{
			result = 0;
		}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		return result;
	}
	
	
	public static void main(String[] args) {
		

	}

}
