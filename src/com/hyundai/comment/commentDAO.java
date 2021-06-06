package com.hyundai.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class commentDAO {
	
	
	

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
		
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		return conn;
	}
	
	public void closeDB(){
		try{
		if(rs != null){rs.close();};
		if(pstmt != null){pstmt.close();};
		if(conn != null){conn.close();};
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	public void insert(commentBean cb){
		int COMMENTNUM=0;
		try {
		conn = getConnection();
		
		sql="select max(COMMENTNUM) from comment";
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		if(rs.next()){
			COMMENTNUM = rs.getInt(1)+1;
		}
		
		
		sql="insert into my.comment(COMMENTNUM , NUM, NAME, CONTENT, DATE, IP) "
				+ "values(?,?,?,?,now(),?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, COMMENTNUM);
			pstmt.setInt(2, cb.getNUM());
			pstmt.setString(3, cb.getNAME());
			pstmt.setString(4, cb.getCONTENT());
			pstmt.setString(5, cb.getIP());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
	}
	
	public ArrayList getCommentList(){
		ArrayList CommentListAll = new ArrayList();
		
		commentBean cb = null;
				
		try {
				conn = getConnection();
		sql="select * from comment";
		
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			cb = new commentBean();
			
			cb.setCOMMENTNUM(rs.getInt("COMMENTNUM"));
			cb.setNUM(rs.getInt("NUM"));
			cb.setNAME(rs.getString("NAME"));
			cb.setCONTENT(rs.getString("CONTENT"));
			cb.setDATE(rs.getDate("DATE"));
			cb.setIP(rs.getString("IP"));
			
			CommentListAll.add(cb);
		}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				closeDB();
			}
			return CommentListAll;
		}
	
	public int update(commentBean cb,String id){
		System.out.println(id);
		
		int check = -1;
		try {
		conn = getConnection();
		sql="select NAME from comment where COMMENTNUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cb.getCOMMENTNUM());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(rs.getString("NAME").equals(id)){
					sql="update my.comment set CONTENT=? where COMMENTNUM=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, cb.getCONTENT());
					pstmt.setInt(2, cb.getCOMMENTNUM());
					check = pstmt.executeUpdate();
				}else{
					check=0;
					
				}
			}else{
				check=-1;
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return check;
	}
	
	/*public int delete(commentBean cb){
		int check=-1;
		try {
		conn = getConnection();
		sql="select * from comment where COMMENTNUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cb.getCOMMENTNUM());
			rs=pstmt.executeQuery();
			if(rs.next()){
			if(cb.getNAME().equals(rs.getString("NAME"))){
				sql="delete from comment where COMMENTNUM=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cb.getCOMMENTNUM());
				
				check = pstmt.executeUpdate();
			
			}else{
				check = 0;
			}
			
			}else{
				check = -1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return check;
	}*/
	
	public void delete(commentBean cb){
		try {
		conn = getConnection();
		sql="delete from comment where COMMENTNUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cb.getCOMMENTNUM());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	

	public static void main(String[] args) {
		

	}

}
