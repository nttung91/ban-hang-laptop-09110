<%-- 
    Document   : DangNhap
    Created on : Oct 3, 2012, 2:52:06 PM
    Author     : THANHTUNG
--%>

<%@page errorPage="ThongBaoLoi.jsp" %>
<%@page isErrorPage="true" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="org.hibernate.HibernateException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.pojo.*,model.dao.*"%>
<%@page import="myLib.*"%>
<%@ page import="javax.servlet.http.HttpUtils.*" %> 
<%!    String username, password;
%>
<%    //kiem tra dieu kien
    
    ArrayList<SanPham> gioHang = new ArrayList<SanPham>();
    if (session.getAttribute("GioHang")!=null){
        gioHang = (ArrayList<SanPham>)session.getAttribute("GioHang");
    }
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
        <link href="css/giohang.css" rel="stylesheet" type="text/css" />
        <script language="javascript" type="text/javascript">
            function showAvancedSearchMenu()
            {
                var table = document.getElementById("tim_kiem_nang_cao");
                if (table.style.display == "none"){
                    table.style.display = "block";
                }
                else {table.style.display = "none";}
            }
        </script>
        <style type="text/css">

        </style></head>

    <body topmargin="-10px">
         <table align="center" width="1000px" border="0" cellpadding="0" cellspacing="0">
             <tr><td>
                     <jsp:include page="header.jsp"/>
                 </td>
             </tr>
            <tr>
                <td>
                    <form method="get">
                        <div id="gio_hang">
                            <table width="100%" border="1px solid #000" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="5%" align="center" class="gio_hang_header">STT</td>
                                    <td width="15%" align="center" class="gio_hang_header">Hinh anh</td>
                                    <td width="25%" align="center" class="gio_hang_header">Ten san pham</td>
                                    <td width="15%" align="center" class="gio_hang_header">Gia</td>
                                    <td width="15%" align="center" class="gio_hang_header">So Luong</td>
                                    <td width="20%" align="center" class="gio_hang_header">Tong</td>
                                    <td align="center" class="gio_hang_header">Xoa</td>
                                </tr>
                                <%if (gioHang.size() == 0) {
                                %>
                                <tr>
                                    <td align="center" colspan="7"><p>GIỎ HÀNG ĐANG TRỐNG</p>
                                        <p>----BẤM TIẾP TỤC MUA ĐỂ TIẾP TỤC MUA HÀNG ----</p></td>

                                </tr>
                                <%                                } else {
                                %>
                                <%
                                    for (int i = 0; i < gioHang.size(); i++) {
                                        SanPham sp = gioHang.get(i);

                                %>
                                <tr id="chi_tiet_gio_hang">
                                    <td align="center"><%=(i + 1)%></td>
                                    <td><div class="hinh_anh_san_pham"><img src="<%=sp.getHinhAnh()%>" width="100px" height="100px" alt="Loi Hinh anh" longdesc="#" /></div></td>
                                    <td><p><%=sp.getTenSanPham()%></p></td>
                                    <td><div class="gia_san_pham"><%=myLib.CurrencyConvertor.AmountToCurrencyFomat(sp.getGia(), "VND")%></div></td>
                                    <td><div class="so_luong"><input name="txt_so_luong" type="text" size="5" maxlength="5" value="<%=sp.getSoLuongTon()%>" /></div></td>
                                    <td><div class="thanh_tien"><span class="gia_san_pham"><%=myLib.CurrencyConvertor.AmountToCurrencyFomat(sp.getGia() * sp.getSoLuongTon(), "VND")%></span></div></td>
                                    <td><div class="xoa_san_pham"><a href="GioHang.do?Action=XoaSanPham&maSanPham=<%= sp.getMaSanPham()%>" target="_self"><img src="images/xoasanpham.png" alt="Loi hinh anh" width="30" height="30" align="middle" /></a></div></td>
                                </tr>
                                <%}
                                     }%> 

                                <%
                                    double tong = 0;
                                    for (int i = 0; i < gioHang.size(); i++) {
                                        tong += gioHang.get(i).getGia() * gioHang.get(i).getSoLuongTon();
                                    }
                                    double vat = tong * 0.1;
                                    double thanhtien = tong + vat;
                                %>
                                <tr>
                                    <td colspan="5" align="right" style="padding-right:5px;" class="tong_tien" width="70%">Thanh tien</td>
                                    <td colspan="2" class="tong_tien" style="padding-left:5px;"><%= myLib.CurrencyConvertor.AmountToCurrencyFomat(tong, "VND")%></td>
                                </tr>
                                <tr>
                                    <td colspan="5" align="right" style="padding-right:5px;" class="tong_tien" width="70%">VAT (10%):</td>
                                    <td colspan="2" class="tong_tien" style="padding-left:5px;"><%= myLib.CurrencyConvertor.AmountToCurrencyFomat(vat, "VND")%></td>
                                </tr>
                                <tr>
                                    <td colspan="5"align="right" style="padding-right:5px;" class="tong_tien" width="70%">Tong cong:</td>
                                    <td colspan="2" class="tong_tien" style="padding-left:5px;"><%= myLib.CurrencyConvertor.AmountToCurrencyFomat(thanhtien, "VND")%></td>
                                </tr>

                            </table>
                            <div align="right">
                                <p>
                                    <%if (gioHang.size() > 0) {%>
                                    <input name="cap_nhat" type="submit" value="Cap nhat" class="button_control"/>
                                    <a href="GioHang.jsp?Action=HuyGioHang"><input name="huy_gio_hang" type="button" value="Huỷ Giỏ Hàng" class="button_control" /></a>
                                    <a href="ThanhToan.jsp"><input name="thanh_toan" type="button" class="button_control" value="Thanh toán"  /></a> 
                                    <%}%>
                                    <a href="DanhSachSanPham.do"><input name="mua_tiep" type="button" value="Tiếp tục mua" class="button_control" /></a>
                                </p>
                            </div>
                        </div>

                    </form>
                </td>
            </tr>
        </table>
        
    </body>
</html>
