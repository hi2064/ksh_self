<%@page import="com.hyundai.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String USER_ID = request.getParameter("userid");

MemberDAO bdao = new MemberDAO();

int result = bdao.idCheck(USER_ID);

%>
<%=result %>
