<%-- 
    Document   : HienThiThongBao
    Created on : Nov 25, 2012, 11:34:02 AM
    Author     : THANHTUNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
		#thongbao {
		color:#F00;
		font-family:"Courier New", Courier, monospace;
		font-size:16px;
				
	}
		</style>
    </head>
    <body>
        <h2 align="center">Thông báo</h2>
        <p id="thongbao" align="center">${thongbao}</p>
        <a href="BanLapTop.do?Action=SanPham">Trang Chủ</a>
    </body>
</html>
