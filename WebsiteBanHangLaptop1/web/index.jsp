<%-- 
    Document   : Navigation1
    Created on : Nov 3, 2012, 9:06:33 AM
    Author     : THANHTUNG
--%>

<%@page import="Gobal.Parameters"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@taglib prefix="template" uri="/WEB-INF/tlds/TagLibrary.tld" %> 
<%
    String pageNav = Parameters.DEFAULT_PAGE + ".do";
    if (request.getParameter("page") != null) {
        pageNav = request.getParameter("page");
        pageNav += ".do";
    }
%>
<template:insert template="MainTemplate.jsp"> 
    <template:put name="title" content="<%=pageNav%>"  
                  direct="true"/> 
    <template:put name="header" content="header.jsp"  
                  direct="false"/> 
    <template:put name="main"  
    content="<%=pageNav%>" direct="false"/> 

    <template:put name="footer" content="footer.jsp"  
                  direct="false"/>
</template:insert>