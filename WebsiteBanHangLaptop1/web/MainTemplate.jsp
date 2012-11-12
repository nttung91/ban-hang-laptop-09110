<%-- 
    Document   : MainTemplate
    Created on : Nov 3, 2012, 8:49:35 AM
    Author     : THANHTUNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="template"  
          uri="/WEB-INF/tlds/TagLibrary.tld" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><template:get name="title"/></title>
    </head>
    <body>
        <table width="1000" border="0" align="center"  cellspacing="0" cellpadding="0">
      <tr>
        <td><template:get name="header"/></td>
      </tr>
      <tr>
        <td><template:get name="main"/></td>
      </tr>
      <tr>
        <td><template:get name="footer"/></td>
      </tr>
    </table>
       
    </body>
</html>
