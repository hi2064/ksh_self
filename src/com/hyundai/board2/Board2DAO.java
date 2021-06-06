package com.hyundai.board2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.hyundai.board.boardBean;
import com.hyundai.comment.commentBean;

public class Board2DAO {

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
	
	public void insert2(BoardBean2 bb){
		int num = 0;
		try {
		conn = getConnection();
		sql="select max(NUM) from board2";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				num = rs.getInt(1)+1;
			}
			sql="insert into board2(NUM, NAME, SUBJECT, CONTENT, DATE, RE_REF, RE_LEV, RE_SEQ) "
					+ "values(?,?,?,?,now(),?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getNAME());
			pstmt.setString(3, bb.getSUBJECT());
			pstmt.setString(4, bb.getCONTENT());
			pstmt.setInt(5,num);
			pstmt.setInt(6, bb.getRE_LEV());
			pstmt.setInt(7, bb.getRE_SEQ());
			
			pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
	}
	
	public int getBoardCount(){
		int cnt = 0;
		try {
		conn = getConnection();
		sql="select count(*) from board2";
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
	
	public void getBoard(BoardBean2 bb){
		try {
		conn = getConnection();
		sql="select * from board2 where NUM=?";
		pstmt.setInt(1, bb.getNUM());
		pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
	}
	
	public ArrayList getBoardList(){
		ArrayList boardListAll = new ArrayList();
		
		BoardBean2 bb = null;
		try{
			conn = getConnection();
			sql = "select * from board2";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				bb = new BoardBean2();
				
				bb.setNUM(rs.getInt("NUM"));
				bb.setSUBJECT(rs.getString("SUBJECT"));
				bb.setCONTENT(rs.getString("CONTENT"));
				bb.setDATE(rs.getDate("DATE"));
				bb.setRE_REF(rs.getInt("RE_REF"));
				bb.setRE_LEV(rs.getInt("RE_LEV"));
				bb.setRE_SEQ(rs.getInt("RE_SEQ"));
				
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
		
		BoardBean2 bb = null;
		try{
			conn = getConnection();
			sql="select * from my.board2 order by RE_REF desc, RE_SEQ asc limit ?, ?";
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				bb = new BoardBean2();
				
				bb.setNUM(rs.getInt("NUM"));
				bb.setSUBJECT(rs.getNString("SUBJECT"));
				bb.setNAME(rs.getString("NAME"));
				bb.setCONTENT(rs.getString("CONTENT"));
				bb.setDATE(rs.getDate("DATE"));
				bb.setRE_REF(rs.getInt("RE_REF"));
				bb.setRE_LEV(rs.getInt("RE_LEV"));
				bb.setRE_SEQ(rs.getInt("RE_SEQ"));
				
				boardList.add(bb);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return boardList;
	}
	
	public BoardBean2 getboard(int NUM){
		BoardBean2 bb = null;
		try {
		conn = getConnection();
		sql="select * from board2 where NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, NUM);
			rs = pstmt.executeQuery();
			if(rs.next()){
				bb = new BoardBean2();
				
				bb.setNUM(rs.getInt("NUM"));
				bb.setNAME(rs.getString("NAME"));
				bb.setSUBJECT(rs.getString("SUBJECT"));
				bb.setCONTENT(rs.getString("CONTENT"));
				bb.setDATE(rs.getDate("DATE"));
				bb.setRE_REF(rs.getInt("RE_REF"));
				bb.setRE_LEV(rs.getInt("RE_LEV"));
				bb.setRE_SEQ(rs.getInt("RE_SEQ"));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return bb;
		
	}
	
	public int update(BoardBean2 bb, String NAME){
		int check = -1;
		try {
		conn = getConnection();
		sql = "select NAME from board2 where NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bb.getNUM());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(NAME.equals(rs.getString("NAME"))){
					sql ="update board2 set SUBJECT=?, CONTENT=? where NUM=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, bb.getSUBJECT());
					pstmt.setString(2, bb.getCONTENT());
					pstmt.setInt(3, bb.getNUM());
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
	
public void delete(BoardBean2 bb){
		
		try {
		conn = getConnection();
		sql="delete from board2 where NUM=?";
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
		// TODO Auto-generated method stub

	}

}
