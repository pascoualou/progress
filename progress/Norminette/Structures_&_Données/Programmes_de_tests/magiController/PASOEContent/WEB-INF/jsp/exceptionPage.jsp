<%@ page language="java" 
         contentType="text/html;charset=UTF-8" 
         pageEncoding="UTF-8" 
         session="true"
         trimDirectiveWhitespaces="true"
         isErrorPage="true" 
         import="java.io.*"
         import="java.util.*"
         import="java.system.*" %>
 <%! String pageType = "exception"; %>
<%
    String acceptHeader = request.getHeader("accept");
    if ( acceptHeader != null && acceptHeader.matches(".*application/json.*") ) {
        request.setAttribute("psc.as.attr.errorFormat", "json");
        response.setContentType("application/json;charset=UTF-8");
%>
<%@  include file="errorJSONBody.jsp" %>
<%
    } else {
        request.setAttribute("psc.as.attr.errorFormat", "html");
%>
<html>
<head>
<title>Pacific Application Server Exception</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/magi/css/commonStyle.css" media="screen" />
<meta http-equiv="Cache-Control" content="no-store" />
</head>
<body>
<%@  include file="exceptionPageHeader.jsp" %>
<%@  include file="errorPageBody.jsp" %>
<%@  include file="exceptionPageFooter.jsp" %>
</body>
</html>
<%
    }
%>


