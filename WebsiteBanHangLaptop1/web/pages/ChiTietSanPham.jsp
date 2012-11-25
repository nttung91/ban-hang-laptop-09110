<%-- 
    Document   : ChiTietSanPham
    Created on : Oct 3, 2012, 8:40:26 PM
    Author     : THANHTUNG
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="org.hibernate.HibernateException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.pojo.*,model.dao.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>${maSanPham}</title>
        <link href="css/dang_nhap.css" rel="stylesheet" type="text/css" />
        <link href="css/thong_tin_san_pham.css" rel="stylesheet" type="text/css" />
        <link href="css/giohangsub.css" type="text/css" rel="stylesheet"/>
        <script src="js/jquery-1.8.2.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/jquery.fancybox.js?v=2.1.3"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery.fancybox.css?v=2.1.2" media="screen" />
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
            $(function(){
                $box = $('#chitietgiohang');
                $box.children("a").each(function(){
                    $box1 = $(this);
                    $box1.children().each(function(){
                        if ($box.width() < $(this).width()) {
                            $(this).wrap('<marquee>');
                        }
                    });
                    
                });
            });
            $(document).ready(function() {
                $("#soLuong").keydown(function(event) {
                    // Allow: backspace, delete, tab, escape, and enter
                    if ( event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 || 
                        // Allow: Ctrl+A
                    (event.keyCode == 65 && event.ctrlKey === true) || 
                        // Allow: home, end, left, right
                    (event.keyCode >= 35 && event.keyCode <= 39)) {
                        // let it happen, don't do anything
                        return;
                    }
                    else {
                        // Ensure that it is a number and stop the keypress
                        if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 )) {
                            event.preventDefault(); 
                        }   
                    }
                });
                // Disable opening and closing animations, change title type
                $(".fancybox-effects-b").fancybox({
                    openEffect  : 'fade',
                    closeEffect	: 'fade',
				
                    helpers : {
                        title : {
                            type : 'over'
                        }
                    }
                });
            });
        </script>
        <style type="text/css">
            .fancybox-custom .fancybox-skin {
                box-shadow: 0 0 50px #222;
            }
        </style>
    </head>

    <body topmargin="-10px">
        <!--pop up gio hang-->
        <div id="giohang">
            <div id="title">Giỏ Hàng </br>${sessionScope.GioHang.size()} </br>sản phẩm</div>

            <div id="chitietgiohang">
                <c:forEach var="spp" items="${sessionScope.GioHang}" >

                    <a href="BanLapTop.do?Action=ChiTietSanPham&loaiSanPham=${spdao.getLoaiSanPham(spp.getMaSanPham())}&maSanPham=${spp.getMaSanPham()}">
                        <li>${spp.getTenSanPham()}</li>
                    </a>
                </c:forEach>
            </div>
            <div>
                <a href="BanLapTop.do?Action=GioHang"><input type="button" style="font-family:Arial, Helvetica, sans-serif;font-size:17px;font-weight:bold;" value="Xem Chi Tiết" /></a>
            </div>
        </div>
        <!--pop up gio hang-->
       
        <c:choose>
            <c:when test="${isItemExist}">

                <!-- Main content -->
                <table width="100%" cellpadding="0" cellspacing="0"  align="center">
                    <tr>
                        <td width="45%" rowspan="8" id="hinh_anh_sp_chi_tiet">
                            <a class="fancybox-effects-b" href="<c:if test="${hasSanPham}">
                                   <c:out value="${sanPham.getHinhAnh()}"></c:out></c:if>"
                               title="${sanPham.getTenSanPham()}">
                               
                                <img src="${sanPham.getHinhAnh()}" alt=""  width="300" height="217"/></a>
                        </td><td width="22%" height="39" id="ten_san_pham">
                            <c:if test="${hasSanPham}">
                                <c:out value="${sanPham.getTenSanPham()}"></c:out>
                            </c:if>
                        </td>
                        <td height="39" colspan="2" id="ten_san_pham">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="text_thong_tin_san_pham_even">Mã số</td>
                        <td colspan="2" class="text_thong_tin_san_pham_even">: <c:out value="${sanPham.getMaSanPham()}"></c:out></td>
                        </tr>
                        <tr>
                            <td class="text_thong_tin_san_pham">Nhà sản xuất</td>
                            <td colspan="2" class="text_thong_tin_san_pham">:
                            <c:if test="${hasSanPham}">
                                <c:out value="${sanPham.getHangSanXuat().getTenHang()}"></c:out>
                            </c:if></td>
                    </tr>
                    <tr>
                        <td class="text_thong_tin_san_pham_even">Bảo hành</td>
                        <td colspan="2" class="text_thong_tin_san_pham_even">:
                            <c:if test="${hasSanPham}">
                                <c:out value="${sanPham.getThoiGianBaoHanh()}">Tháng</c:out>
                            </c:if></td>
                    </tr>
                    <tr>
                        <td class="text_thong_tin_san_pham">Ngày cập nhật</td>
                        <td colspan="2" class="text_thong_tin_san_pham">:

                            <c:if test="${hasSanPham}">
                                <fmt:formatDate value="${sanPham.getNgayCapNhat()}" pattern="dd/MM/yyyy"></fmt:formatDate>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td class="text_thong_tin_san_pham_even">Số Lượt xem</td>
                        <td colspan="2" class="text_thong_tin_san_pham_even">:
                            <c:if test="${hasSanPham}">
                                <c:out value="${sanPham.getSoLuotXem()}"></c:out>
                            </c:if></td>
                    </tr>
                    <tr>
                        <form action="GioHang.do" method="post">
                            
                                <input type="hidden" name="ThaoTac" value="ThemVaoGio" />
                                <input type="hidden" name="maSanPham" value="<c:out value="${sanPham.getMaSanPham()}"></c:out>"/>
                                    <td class="text_thong_tin_san_pham">
                                        <label for="soLuong">Số Lượng</label>
                                        <input type="text" name="soLuong" id="soLuong" style="margin-left:5px;width:100px" value="1" />
                                    </td>
                                    <td width="33%" class="gia_san_pham"><input type="submit" value="" style="background-image:url(images/addtocart.png);background-repeat:no-repeat;background-size:100% 100%;width:159px;height:35px;" /></td>
                            </form>
                        </tr>
                        <tr>
                            <td height="38" colspan="3" class="gia_san_pham"> 
                            <c:if test="${hasSanPham}">
                                <fmt:formatNumber type="currency" value="${sanPham.getGia()}" currencySymbol="" maxFractionDigits="0" ></fmt:formatNumber>
                            </c:if>
                            VND</td>
                    </tr>
                    <tr>
                        <td height="24" align="center" style="color:#F00;font-style:italic;vertical-align:top;">Ấn để phóng to</td>
                        <td height="24" colspan="3"> <ul>
                                <c:if test="${hasSanPham}">
                                    <c:forEach var="km" items="${khuyenMais}">
                                        <li class='khuyen_mai'>${km}</li>
                                    </c:forEach>
                                </c:if>


                            </ul></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="vertical-align:top;">
                            <div class="container">
                                <table width="100%" cellpadding="0" cellspacing="0" class="
                                       <c:choose>
                                           <c:when test="${loaiSanPham=='laptop'}">                                
                                               <c:out value="showed"></c:out>
                                           </c:when>
                                           <c:otherwise>
                                               <c:out value="hidden"></c:out>


                                           </c:otherwise>
                                       </c:choose>" style="margin-top:10px;" >
                                    <tr>
                                        <td height="38"  colspan="4"><div bgcolor="#0066CC" class="text_header">Thông số kỹ thuật</div></td>
                                    </tr>
                                    <tr>
                                        <td width="24%" class="text_thong_tin_san_pham">CPU</td>
                                        <td width="66%" class="text_thong_tin_san_pham">:
                                            <c:if test="${hasSanPham && laptop !=null }">
                                                <c:out value="${laptop.getChipCpu()}"></c:out>

                                            </c:if> </td>
                                        <td width="4%">&nbsp;</td>
                                        <td width="6%">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="text_thong_tin_san_pham_even"><label>Kích Thước Màn Hình</label></td>
                                        <td class="text_thong_tin_san_pham_even">:
                                            <c:if test="${hasSanPham && laptop !=null }">
                                                <c:out value="${laptop.getManHinh()}"></c:out>

                                            </c:if> 
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="text_thong_tin_san_pham">RAM</td>
                                        <td class="text_thong_tin_san_pham">:
                                            <c:if test="${hasSanPham && laptop !=null }">
                                                <c:out value="${laptop.getRam()}"></c:out>

                                            </c:if> 
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="text_thong_tin_san_pham_even">Ổ Cứng</td>
                                        <td class="text_thong_tin_san_pham_even">:
                                            <c:if test="${hasSanPham && laptop !=null }">
                                                <c:out value="${laptop.getOCung()}"></c:out>

                                            </c:if> 
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="text_thong_tin_san_pham">Đĩa quang</td>
                                        <td class="text_thong_tin_san_pham">:
                                            <c:if test="${hasSanPham && laptop !=null }">
                                                <c:out value="${laptop.getDiaQuang()}"></c:out>

                                            </c:if> </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="text_thong_tin_san_pham_even">VGA</td>
                                        <td class="text_thong_tin_san_pham_even">:
                                            <c:if test="${hasSanPham && laptop !=null }">
                                                <c:out value="${laptop.getCardDoHoa()}"></c:out>

                                            </c:if> </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="text_thong_tin_san_pham">Wireless</td>
                                        <td class="text_thong_tin_san_pham">:
                                            <c:if test="${hasSanPham && laptop !=null }">
                                                <c:out value="${laptop.getCardKhongDay()}"></c:out>

                                            </c:if> </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="text_thong_tin_san_pham_even">OS</td>
                                        <td class="text_thong_tin_san_pham_even">:
                                            <c:if test="${hasSanPham && laptop !=null }">
                                                <c:out value="${laptop.getHeDieuHanh()}"></c:out>

                                            </c:if> </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="text_thong_tin_san_pham">Tính năng khác</td>
                                        <td class="text_thong_tin_san_pham">:
                                            <c:choose>
                                                <c:when test="${hasSanPham && laptop !=null }">
                                                    <c:if test="${laptop.getTinhNangKhac()}">
                                                        <c:out value="${laptop.getTinhNangKhac()}"></c:out>

                                                    </c:if> 

                                                </c:when>
                                                <c:otherwise>
                                                    <c:out value="Không có"></c:out>

                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="text_thong_tin_san_pham_even">Pin</td>
                                        <td class="text_thong_tin_san_pham_even">:
                                            <c:if test="${hasSanPham && laptop !=null }">
                                                <c:out value="${laptop.getPin()}"></c:out>

                                            </c:if></td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="text_thong_tin_san_pham">Trọng lượng</td>
                                        <td class="text_thong_tin_san_pham">:
                                            <c:if test="${hasSanPham && laptop !=null }">
                                                <c:out value="${laptop.getCanNang()}"></c:out>

                                            </c:if></td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </div>


                            <div class="<c:choose>
                                     <c:when test="${loaiSanPham=='laptop'}">

                                         <c:out value="hidden"></c:out>
                                     </c:when>
                                     <c:otherwise>
                                         <c:out value="showed"></c:out>


                                     </c:otherwise>
                                 </c:choose>">
                                <div bgcolor="#0066CC" class="text_header">Thông số kỹ thuật</div>
                                <div style="margin-top:0px;top:0px;left:0px; ">
                                    <ul>
                                        <c:if test="${hasSanPham && loaiSanPham =='linhkien'}">
                                            <c:set var="i" value="0"></c:set>
                                            <c:out value="${chiTietLinhKiens.size()}"></c:out>
                                            <c:forEach var="cts" items="${chiTietLinhKiens}">
                                                <c:choose>
                                                    <c:when test="${i%2==0}">

                                                        <li class='chi_tiet_phu_kien'>${cts}</li>
                                                    </c:when>
                                                    <c:otherwise>

                                                        <li class='chi_tiet_phu_kien_even'>${cts}</li>
                                                    </c:otherwise>
                                                </c:choose>
                                                    <c:set var="i" value="${i+1}"></c:set>
                                            </c:forEach>

                                        </c:if>
                                    </ul>
                                </div>
                            </div>


                            <div class="text_header">Sản phầm tương tự</div>

                        </td>
                    </tr>
                </table>

            </c:when>
            <c:otherwise>
                <div align="center" style="width:100%;"><h3>Sản phẩm không tồn tại !!</h3></div>

            </c:otherwise>
        </c:choose>
        <!-- End of Main content -->

    </body>
</html>
