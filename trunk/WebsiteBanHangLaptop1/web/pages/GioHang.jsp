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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        ${sessionScope.obj.getAction()}
        <table align="center" width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr><td>
                </td>
            </tr>
            <tr>
                <td>
                    <form method="get" action="GioHang.do">
                        <div id="gio_hang">
                            <table width="100%" border="1px solid #000" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="3%" align="center" class="gio_hang_header">STT</td>
                                    <td width="18%" align="center" class="gio_hang_header">Hình ảnh</td>
                                    <td width="23%" align="center" class="gio_hang_header">Tên sản phẩm</td>
                                    <td width="16%" align="center" class="gio_hang_header">Giá</td>
                                    <td width="14%" align="center" class="gio_hang_header">Số Lượng</td>
                                    <td width="23%" align="center" class="gio_hang_header">Tổng</td>
                                    <td width="3%" align="center" class="gio_hang_header">Xoá</td>
                                </tr>
                                <c:choose>
                                    <c:when test="${sessionScope.GioHang.size() == 0 || sessionScope.GioHang ==null }">

                                        <tr>
                                            <td align="center" colspan="7"><p>GIỎ HÀNG ĐANG TRỐNG</p>
                                                <p>----BẤM TIẾP TỤC MUA ĐỂ TIẾP TỤC MUA HÀNG ----</p></td>

                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="i" value="1"></c:set>
                                        <c:forEach var="sp" items="${sessionScope.GioHang}"> 
                                        
                                       

                                 
                                <tr id="chi_tiet_gio_hang">
                                    <td align="center">${i}</td>
                                    <td><div class="hinh_anh_san_pham"><img src="${sp.getHinhAnh()}" width="100px" height="100px" alt="Loi Hinh anh" longdesc="#" /></div></td>
                                    <td><p>${sp.getTenSanPham()}</p></td>
                                    <td><div class="gia_san_pham"><fmt:formatNumber type="currency" value="${sp.getGia()}" currencySymbol="" maxFractionDigits="0"></fmt:formatNumber> VND</div></td>
                                    <td><div class="so_luong"><input name="txt_so_luong" type="text" size="5" maxlength="5" value="${sp.getSoLuongTon()}" /></div></td>
                                    <td><div class="thanh_tien"><span class="gia_san_pham"><fmt:formatNumber type="currency" currencySymbol="" value="${sp.getGia() * sp.getSoLuongTon()}" maxFractionDigits="0"></fmt:formatNumber> VND</span></div></td>
                                    <td><div class="xoa_san_pham"><a href="BanLapTop.do?Action=GioHang&ThaoTac=XoaSanPham&maSanPham=${sp.getMaSanPham()}" target="_self"><img src="images/xoasanpham.png" alt="Loi hinh anh" width="30" height="30" align="middle" /></a></div></td>
                                </tr>
                                    <c:set var="i" value="${i+1}"></c:set>
                                        </c:forEach>
                                   </c:otherwise>
                                </c:choose>

                              
                                <tr>
                                    <td colspan="5" align="right" style="padding-right:5px;" class="tong_tien">Thành Tiền</td>
                                    <td colspan="2" class="tong_tien" style="padding-left:5px;"><fmt:formatNumber type="currency" currencySymbol="" value="${tong}"></fmt:formatNumber>VND</td>
                                </tr>
                                <tr>
                                    <td colspan="5" align="right" style="padding-right:5px;" class="tong_tien">VAT (10%):</td>
                                    <td colspan="2" class="tong_tien" style="padding-left:5px;"><fmt:formatNumber type="currency" currencySymbol="" value="${vat}"></fmt:formatNumber>VND</td>
                                </tr>
                                <tr>
                                    <td colspan="5"align="right" style="padding-right:5px;" class="tong_tien">Tổng Cộng:</td>
                                    <td colspan="2" class="tong_tien" style="padding-left:5px;"><fmt:formatNumber type="currency" currencySymbol="" value="${thanhtien}"></fmt:formatNumber>VND</td>
                                </tr>

                            </table>
                            <div align="right">
                              <p>
                                    <c:if test="${sessionScope.GioHang.size() > 0}">
                                    <input name="cap_nhat" type="submit" value="Cập nhật" class="button_control"/>
                                    <a href="BanLapTop.do?Action=GioHang&ThaoTac=HuyGioHang"><input name="huy_gio_hang" type="button" value="Huỷ Giỏ Hàng" class="button_control" /></a>
                                    <a href="BanLapTop.do?Action=DatHang"><input name="thanh_toan" type="button" class="button_control" value="Đặt Hàng"  /></a> 
                                    </c:if>
                                    <a href="BanLapTop.do?Action=SanPham"><input name="mua_tiep" type="button" value="Tiếp tục mua" class="button_control" /></a>
                                </p>
                            </div>
                        </div>

                    </form>
                </td>
            </tr>
        </table>

    </body>
</html>
