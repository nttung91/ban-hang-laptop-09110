<%-- 
    Document   : ChiTietDonHang
    Created on : Nov 25, 2012, 1:55:32 PM
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
        <link href="css/giohang.css" rel="stylesheet" type="text/css" />

    </head>
    <body>
        <h2>Chi Tiết Đơn Hàng</h2>
        <h4>Mã Đơn Hàng: ${datHang.getMaDonHang()}</h4>
        <h4>Người Nhận: ${datHang.getNguoiNhan()}</h4>
        <h4>Địa Chỉ: ${datHang.getDiaChiGiaoHang()}</h4>
        <h4>Thời Gian Đặt Hàng: <fmt:formatDate value="${datHang.getNgayDat()}" pattern="dd/MM/yyyy hh:mm:ss" /> </h4>
        <h4>Chi Tiết Đơn Hàng</h4>
        <table align="left" width="100%" border="1" cellpadding="0" cellspacing="0">
            <tr>
                <td width="5%" align="center" class="gio_hang_header">STT</td>
                <td width="15%" align="center" class="gio_hang_header">Hinh anh</td>
                <td width="25%" align="center" class="gio_hang_header">Ten san pham</td>
                <td width="15%" align="center" class="gio_hang_header">Gia</td>
                <td width="15%" align="center" class="gio_hang_header">số lượng</td>
               <td width="15%" align="center" class="gio_hang_header">Tổng Tiền</td>

            </tr>
            <c:choose>
                <c:when test="${chiTietDonHangs.size() == 0 }">

                    <tr>
                        <td align="center" colspan="7"><p>ĐƠN HÀNG TRỐNG</p>
                            </td>

                    </tr>
                </c:when>
                <c:otherwise>
                    <c:set var="i" value="1"></c:set>
                    <c:forEach var="sp" items="${chiTietDonHangs}"> 




                        <tr id="chi_tiet_gio_hang">
                            <td align="center">${i}</td>
                            <td><div class="hinh_anh_san_pham"><img src="${sp.getHinhAnh()}" width="100px" height="100px" alt="Loi Hinh anh" longdesc="#" /></div></td>
                            <td><p>${sp.getTenSanPham()}</p></td>
                            <td><div class="gia_san_pham"><fmt:formatNumber type="currency" value="${sp.getGia()}" currencySymbol=""></fmt:formatNumber> VND</div></td>
                            <td><div class="so_luong"><label>${sp.getSoLuongTon()}</label></div></td>
                            <td><div class="thanh_tien"><span class="gia_san_pham"><fmt:formatNumber type="currency" currencySymbol="" value="${sp.getGia() * sp.getSoLuongTon()}"></fmt:formatNumber>VND</span></div></td>
                            
                        </tr>
                        <c:set var="i" value="${i+1}"></c:set>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </table>
        <a href="BanLapTop.do?Action=TrangCaNhan"><< Quay Lại</a>
    </body>
</html>
