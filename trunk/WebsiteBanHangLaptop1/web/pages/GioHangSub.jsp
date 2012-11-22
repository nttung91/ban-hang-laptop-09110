<%@page import="java.util.ArrayList"%>
<%@page import="model.pojo.SanPham"%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/giohangsub.css" type="text/css" />
<script src="js/jquery-1.8.2.min.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">
            $(function() {
                var offset = $("#giohang").offset();
                var button = $("#btn_tim_kiem").position();
                $("#giohang").css("top",button.top);
                $(window).scroll(function() {
                    if ($(window).scrollTop() > button.top) {
                        $("#giohang").stop().animate({
                            top: 10
                        });
                    } else {
                        $("#giohang").stop().animate({
                            top: button.top-$(window).scrollTop()
                        });
                    };
                });
            });
		
		
            
        </script>
</head>
    <% 
    ArrayList<SanPham> gioHang = new ArrayList<SanPham>();
    if (session.getAttribute("GioHang") != null) {
        gioHang = (ArrayList<SanPham>) session.getAttribute("GioHang");
    } else {
        session.setAttribute("GioHang", gioHang);
    }

%>

<body>
 <div id="giohang">
            <div id="title">Ban co <%=gioHang.size()%> </br>san pham</br>trong gio</div>

            <div id="chitietgiohang">
                <%
            for (int i = 0; i < gioHang.size(); i++) {%>     
                <a href="ChiTietSanPham.jsp?loaiSanPham=laptop&maSanPham=<%=gioHang.get(i).getMaSanPham()%>"><li><%=gioHang.get(i).getTenSanPham()%></li></a>
                <%      }
                %>
            </div>
            <div>
                <a href="GioHang.jsp"><input type="button" value="Xem chi tiet" /></a>
            </div>
        </div>
</body>
</html>