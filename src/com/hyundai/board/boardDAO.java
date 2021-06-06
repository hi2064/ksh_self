package com.hyundai.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.hyundai.comment.commentBean;




public class boardDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql ="";
	
	public Connection getConnection(){
		
		try {
		Context initCTX = new InitialContext();
		
		
			DataSource ds = 
					(DataSource) initCTX.lookup("java:comp/env/jdbc/mysqlDB");
			
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return conn;
		
	}
	
	public void closeDB(){
		try{
			if(rs != null){rs.close();}
			if(pstmt != null){pstmt.close();}
			if(conn != null){conn.close();}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	public void insert(boardBean bb){
		int num = 0;
		try {
		conn = getConnection();
		sql="select max(NUM) from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				num = rs.getInt(1)+1;
			}
				sql="insert into board(NUM, SUBJECT, NAME, CONTENT, READCOUNT, RE_REF, RE_LEV, RE_SEQ, DATE, IP, FILE) "
						+ "values(?,?,?,?,?,?,?,?,now(),?,?)";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, num);
				pstmt.setString(2, bb.getSUBJECT());
				pstmt.setString(3, bb.getNAME());
				pstmt.setString(4, bb.getCONTENT());
				pstmt.setInt(5, bb.getREADCOUNT());
				pstmt.setInt(6, num);
				pstmt.setInt(7, bb.getRE_LEV());
				pstmt.setInt(8, bb.getRE_SEQ());
				pstmt.setString(9, bb.getIP());
				pstmt.setString(10, bb.getFILE());
				
				pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				pstmt.close();
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}	
	}
	
	
	public ArrayList getBoardList(){
		ArrayList boardListAll = new ArrayList();
		
		boardBean bb = null;
		try{
			conn = getConnection();
			sql = "select * from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				bb = new boardBean();
				
				bb.setNUM(rs.getInt("NUM"));
				bb.setSUBJECT(rs.getString("SUBJECT"));
				bb.setCONTENT(rs.getString("CONTENT"));
				bb.setREADCOUNT(rs.getInt("READCOUNT"));
				bb.setRE_REF(rs.getInt("RE_REF"));
				bb.setRE_LEV(rs.getInt("RE_LEV"));
				bb.setRE_SEQ(rs.getInt("RE_SEQ"));
				bb.setDATE(rs.getDate("DATE"));
				bb.setIP(rs.getString("IP"));
				bb.setFILE(rs.getString("FILE"));
				
				boardListAll.add(bb);
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		return boardListAll;
	}
	
	public ArrayList getBoardList(int startRow, int pageSize){
		ArrayList boardList = new ArrayList();
		
		boardBean bb = null;
		try{
			conn = getConnection();
			sql="select * from my.board order by RE_REF desc, RE_SEQ asc limit ?, ?";
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				bb = new boardBean();
				
				bb.setNUM(rs.getInt("NUM"));
				bb.setSUBJECT(rs.getNString("SUBJECT"));
				bb.setNAME(rs.getString("NAME"));
				bb.setCONTENT(rs.getString("CONTENT"));
				bb.setREADCOUNT(rs.getInt("READCOUNT"));
				bb.setRE_REF(rs.getInt("RE_REF"));
				bb.setRE_LEV(rs.getInt("RE_LEV"));
				bb.setRE_SEQ(rs.getInt("RE_SEQ"));
				bb.setDATE(rs.getDate("DATE"));
				bb.setIP(rs.getString("IP"));
				bb.setFILE(rs.getString("FILE"));
				
				boardList.add(bb);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return boardList;
	}
	
	public int getBoardCount(){
		int cnt = 0;
		try {
		conn = getConnection();
		sql="select count(*) from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				cnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return cnt;
		
	}
	
	public void getBoard(boardBean bb){
		try {
		conn = getConnection();
		sql="select * from board where NUM=?";
		pstmt.setInt(1, bb.getNUM());
		pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
	}
	
	public void upDateReadCount(int NUM){
		try {
		conn = getConnection();
		sql ="update board set READCOUNT=READCOUNT+1 where NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, NUM);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			closeDB();
		}
	}
	
	public boardBean getboard(int NUM){
		boardBean bb = null;
		try {
		conn = getConnection();
		sql="select * from board where NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, NUM);
			rs = pstmt.executeQuery();
			if(rs.next()){
				bb = new boardBean();
				
				bb.setNUM(rs.getInt("NUM"));
				bb.setSUBJECT(rs.getString("SUBJECT"));
				bb.setNAME(rs.getString("NAME"));
				bb.setCONTENT(rs.getString("CONTENT"));
				bb.setREADCOUNT(rs.getInt("READCOUNT"));
				bb.setRE_REF(rs.getInt("RE_REF"));
				bb.setRE_LEV(rs.getInt("RE_LEV"));
				bb.setRE_SEQ(rs.getInt("RE_SEQ"));
				bb.setDATE(rs.getDate("DATE"));
				bb.setIP(rs.getString("IP"));
				bb.setFILE(rs.getString("FILE"));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return bb;
		
	}
	
	public int update(boardBean bb, String NAME){
		int check = -1;
		try {
		conn = getConnection();
		sql = "select NAME from board where NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bb.getNUM());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(rs.getString("NAME").equals(NAME)){
					sql ="update board set SUBJECT=?, CONTENT=?, FILE=? where NUM=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, bb.getSUBJECT());
					pstmt.setString(2, bb.getCONTENT());
					pstmt.setString(3, bb.getFILE());
					pstmt.setInt(4, bb.getNUM());
					check = pstmt.executeUpdate();
				}else{
					// 작성자가 아닙니다
					check=0;
				}
			}else{
				// 글이없다
				check=-1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return check;
	}
	
	public void delete(boardBean bb, commentBean cb){
		
		try {
		conn = getConnection();
		sql="delete from comment where NUM=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cb.getNUM());
		pstmt.executeUpdate();
		
		
		
		sql="delete from board where NUM=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bb.getNUM());
		pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
	}
	
	
	
	
	public static void main(String[] args) {
		
		
		
		
		

	}

}
