<%@page import="com.hyundai.comment.commentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hyundai.comment.commentDAO"%>
<%@page import="com.hyundai.board.boardBean"%>
<%@page import="com.hyundai.board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Blue Hands</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


</head>
<body>
<div id="wrap">
<jsp:include page="../inc/top.jsp"></jsp:include>
<br>
	<%
		request.setCharacterEncoding("UTF-8");
	
		int NUM = Integer.parseInt(request.getParameter("NUM"));
		String pageNum = request.getParameter("pageNum");
		
		boardDAO bdao = new boardDAO();
		
		bdao.upDateReadCount(NUM);
		
		boardBean bb = bdao.getboard(NUM);
		
	%>

<!-- 헤더가 들어가는 곳 -->

<!-- 본문 들어가는 곳 -->
<!-- 서브페이지 메인이미지 -->
<div id="sub_img"></div>
<!-- 서브페이지 메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="board.jsp">리스트</a></li>
<li><a href="boardForm.jsp">글쓰기</a></li>
<% 
String id = (String) session.getAttribute("USER_ID");


if(id.equals(bb.getNAME())){
%>
<li><a href="upDateForm.jsp?NUM=<%=bb.getNUM() %>&pageNum=<%=pageNum %>">글수정</a></li>
<li><a href="deletePro.jsp?NUM=<%=bb.getNUM() %>&pageNum=<%=pageNum %>" onclick="return confirm('삭제하시겠습니까?')" >글삭제</a></li>
<%
}
%>
</ul>
</nav>
	<article>
	<h1>글정보</h1>
	<fieldset>
	제목 : <%=bb.getSUBJECT() %>	<br>
	<hr>
	글쓴이 : <%=bb.getNAME() %>	<br>
	<hr>
	이미지 : 

	<%
	if(bb.getFILE() != null){
	%>

	<a href="filedown.jsp?FILENAME=<%=bb.getFILE() %>"><%=bb.getFILE() %></a>
	<center><img src="../upload/<%=bb.getFILE() %>" height="250" width="250"></center> <br>
<%
	}else{
		%>
		<h3>첨부파일 없음</h3>
		<%
	}
%>
	<textarea rows="20" cols="85" readonly="readonly">
	<%=bb.getCONTENT() %>
	</textarea>
	<!-- 
	댓글 보여주는칸
	 -->
	<jsp:useBean id="cb" class="com.hyundai.comment.commentBean"></jsp:useBean>
	<jsp:setProperty property="*" name="cb"/>
	<%
	commentDAO cdao = new commentDAO();
	cdao.getCommentList();
	
	ArrayList al = cdao.getCommentList();
	
		for(int i=0;i<al.size();i++){
			commentBean cb2 = (commentBean) al.get(i);
			if(cb2.getNUM() == NUM){
	%>
	
	<script type="text/javascript">
	function d(){
		if(confirm("삭제 하시겠습니까?")){
			location.href="commentdeletePro.jsp?pageNum=<%=pageNum %>&COMMENTNUM=<%=cb2.getCOMMENTNUM()%>&NAME=<%=id %>&NUM=<%=cb.getNUM() %>";
		}else{
			return;
		}
		
	}
	
	$(function(){
		$(".tt").on("click", function(){
			
			$.ajax({
				url:"commentdeletePro.jsp",
				type:"post",
				data:{"COMMENTNUM":$("#tt").val()},
				success:function(data){
					location.reload();
				}
			});
		});
	});
	
	</script>
	<div class="why">
	<fieldset id="k">
	<legend>[댓글]</legend>
	댓글 작성자 : <%=cb2.getNAME() %><br>
	<hr>
	내용 : <%=cb2.getCONTENT() %><br> 
	<hr>
	작성일 : <%=cb2.getDATE()%> / IP : <%=cb2.getIP() %><br>
	
	<%
	if(id.equals(cb2.getNAME())){
	%>
	<hr>
	<input type="hidden" value="<%=cb2.getCOMMENTNUM() %>" id="tt">
	<input type="button" value="댓글삭제하기" class="tt" >  | <input type="button" value="수정하기" class="u<%=i %>">
	<%
	}
	%>
	<form action="commentupdatePro.jsp?COMMENTNUM=<%=cb2.getCOMMENTNUM() %>&NUM=<%=cb2.getNUM() %>&pageNum=<%=pageNum %>" method="post">
	<input type="hidden" value="<%=id %>" name="USER_ID">
	<div class="in<%=i %>" style="display:none;"></div>
	</form>
	
<script type="text/javascript">


   $(function() {
	   $(".u<%=i %>").on("click",function(){
		var d = "<hr><input type='text' placeholder='수정하실 댓글을 작성해주세요.' size='50' name='CONTENT' />&nbsp&nbsp<input type='submit' value='댓글수정하기'/>";
			// $(".in").html(d);
			$(this).parents(".why").find(".in<%=i %>").html(d);
			$(".in<%=i %>").fadeToggle();
	}); 
});  
</script>
	
	</fieldset>
	</div>
	<%
			}
		}
	
	%>
	
	<hr>
	
	<%-- <form action="commentPro.jsp?NUM=<%=bb.getNUM() %>" method="post">
	 <input type="hidden" name="NAME" value="<%=id %>">
	 <img alt="" src="../images/blue/comment.png">  댓글쓰기 : <input type="text" name="CONTENT" size="50">
	 <input type="submit" value="댓글달기">
	</form> --%>
	
	<script type="text/javascript">
$(function(){
	$(".ax").on("click",function(){
		$.ajax({
			url:"commentPro.jsp",
			type:"post",
			data:{"CONTENT":$("#aj").val(),"NAME":$("#ajax1").val(),"NUM":$("#ajax2").val()},
			success:function(data){
				location.reload();
			},
			error:function(reauest,status,error){
				alert("비정상접근입니다.");
				history.back();
			}
			
		});
	});
	
}); 
</script>
	<input type="text" name="CONTENT" id="aj" size="75" placeholder="댓글을 작성해주세요.">      <input type="button" class="ax" value="댓글달기" >
	<input type="hidden" name="NAME" value="<%=id %>" id="ajax1"><input type="hidden" name="NUM" value="<%=bb.getNUM() %>" id="ajax2">
	
	</fieldset>	
	
	</article>

<div class="clear"></div>
<jsp:include page="../inc/bottom.jsp"></jsp:include>
</div>
</body>
</html>