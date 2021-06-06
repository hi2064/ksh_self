<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>My Blue Hands</title>
</head>
<body>
  <%
		request.setCharacterEncoding("UTF-8");
		
		String FILENAME = request.getParameter("FILENAME");
		String savePath = "upload";
		ServletContext ctx = getServletContext();
		String sDownloadPath = ctx.getRealPath(savePath);
		
		System.out.println(FILENAME);
		
		String sFilePath = sDownloadPath +"\\"+FILENAME;
		
		System.out.println("다운로드할 파일 주소 : "+sFilePath);

		byte[] b = new byte[4096];
		
		FileInputStream fis = new FileInputStream(sFilePath);
		
		String sMimeType = getServletContext().getMimeType(sFilePath);
		
		System.out.println("sMimeType =>> "+sMimeType);
		
		if(sMimeType == null){
			sMimeType = "application/octet-stream";
		}
		
		response.setContentType(sMimeType);
		
		String agent = request.getHeader("User-Agent");
		
		System.out.println("사용자 정보 : "+agent);
		
		boolean ieBrowser =
		(agent.indexOf("MSIE")>-1 || agent.indexOf("Trident")>-1);
		
		if(ieBrowser){
			FILENAME = URLEncoder.encode(FILENAME, "UTF-8").replace("\\+", "%20");
		}else{
			FILENAME = new String(FILENAME.getBytes("UTF-8"),"iso-8859-1");
		}

		response.setHeader("Content-Disposition", "attachment; filename="+FILENAME);
		
		ServletOutputStream out2 = response.getOutputStream();
		
		int numRead;

		while((numRead = fis.read(b, 0 , b.length)) != -1){
			out2.write(b, 0 ,numRead);
			
		}
		out2.flush();
		out2.close();
		fis.close();

		
	%>


</body>
</html>