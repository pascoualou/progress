<%@ page language="java" 
         contentType="text/html;charset=UTF-8" 
         pageEncoding="UTF-8" 
         session="true" 
         errorPage="/WEB-INF/jsp/errorPage.jsp"%>
<% // Forward to the home page 
// request.getRequestDispatcher("/static/home.jsp").forward(request, response);
request.getRequestDispatcher("magi.html").forward(request, response);
%>
