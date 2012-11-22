
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="org.hibernate.HibernateException"%>
<%@page import="model.pojo.*,model.dao.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%

%>
<link href="css/stylesheet.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.8.2.min.js" language="javascript" type="text/javascript"></script>
<script src="js/main.js" language="javascript" type="text/javascript"></script>
<script language="javascript">
    function showAvancedSearchMenu()
    {
        var table = document.getElementById("tim_kiem_nang_cao");
        if (table.style.display == "none"){
            table.style.display = "block";
        }
        else {table.style.display = "none";}
    }
</script>

<table align="center" width="100%" border="0" cellpadding="0" cellspacing="0">
    <c:set var="obj" value="${ sessionScope.temp }"/>
  
    <tr width="100%">
        <td height="50" colspan="3" id="banner_container"><table width="100%" height="197" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="200" height="56">&nbsp;</td>
                    <td width="482">&nbsp;</td>
                    <td colspan="3"><table width="100%" height="30px">
                            <tr>
                                <td style="border-top-style: none; border-top-width: medium; border-top-color: #333; border-right-style:solid; border-right-width:medium; border-bottom-color:#000; padding-right:5px" align="right">
                                    <!-- Sua noi dung -->
                                    <c:choose>
                                        <c:when test="${obj.getTenDangNhap() != null}">
                                            <a href="TrangCaNhan.jsp?tenDanhNhap=${ obj.getTenDangNhap()}" class="menu_login">
                                                Xin Chào 
                                                ${obj.getTenDangNhap()}
                                            </a>
                                        </c:when>
                                        <c:otherwise >

                                            <a href="DangNhap.jsp" class="menu_login">
                                                Đăng Nhập
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td align="left" style="padding-left:5px">
                                    <c:choose>
                                        <c:when test="${obj.getTenDangNhap() != null}">
                                            <a href="DangKyThanhVien.jsp?logout=true" class="menu_login">
                                                Thoát
                                            </a>

                                        </c:when>
                                        <c:otherwise >

                                            <a href="DangKyThanhVien.jsp" class="menu_login">
                                                Đăng Ký
                                            </a>
                                        </c:otherwise>
                                    </c:choose>

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td width="150">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td width="31">&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td width="137" height="35">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr height="50px">
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td height="50px" width="137"><img src="images/CartMenu.png" width="100%" height="50px" /></td>
                    <td>&nbsp;</td>
                </tr>
            </table></td>
    </tr>
    <tr width="100%">
        <td colspan="3" id="menu_container">

            <ul id="menu">
                <li class="menu_first"><a href="BanLapTop.do?Action=SanPham">Trang Chủ</a>

                </li>

                <li class="menu_mid" ><a href="#" >Danh Mục</a>
                    <ul>
                        <li><a href="BanLapTop.do?Action=SanPham&LoaiSanPham=laptop&Trang=1&SoSanPham=${obj.getSosptrang()}">Laptop</a>
                            <ul
                                <!--Cac hang lap top start-->
                                <c:forEach var="hsx" items="${obj.getListHangSX()}">
                                    <c:if test="${hsx.getTinhTrang() != 0}">

                                        <li><a href="BanLapTop.do?Action=SanPham&HangSanXuat=${ hsx.getMaHang()}&LoaiSanPham=laptop&Trang=1&SoSanPham=${obj.getSosptrang()}" title=${ hsx.getTenHang()}>${ hsx.getTenHang()}</a></li>

                                    </c:if>
                                </c:forEach>

                            </ul>
                        </li>
                        <li><a href="BanLapTop.do?Action=SanPham&LoaiSanPham=linhkien&Trang=1&SoSanPham=${obj.getSosptrang()}" title="Active projects">Linn Kiện</a>
                            <ul>
                                <!--Cac hang link kien -->
                                <c:forEach var="hsx" items="${obj.getListHangSX()}">
                                    <c:if test="${hsx.getTinhTrang() != 0}">

                                        <li><a href="BanLapTop.do?Action=SanPham&HangSanXuat=${ hsx.getMaHang()}&LoaiSanPham=linhkien&Trang=1&SoSanPham=${obj.getSosptrang()}" title=${ hsx.getTenHang()}>${ hsx.getTenHang()}</a></li>

                                    </c:if>
                                </c:forEach>
                            </ul>
                            <!--Cac hang linn kien end -->
                        </li>
                    </ul>
                </li>
                <li class="menu_mid" ><a href="#" >Khuyến Mãi</a></li>
                <li class="menu_last"><a href="#" >Contact</a></li>
            </ul>
        </td>
    </tr>
    <tr width="100%">
        <td height="70px" colspan="3">

            <form method="post" action="BanLapTop.do?Action=SanPham&Trang=1&SoSanPham=${ obj.getSosptrang()}" name="frmSearch" >
                <div id="timkiem_bg">

                    <!--  <select name="LoaiSanPham" style="margin-left:10px " onchange="showValue(this.value)" >
                          <option value="-1" selected="selected" title="images/1.JPG"></option>
                          <option value="laptop" title="images/1.JPG" ></option>
                          <option value="linhkien" title="images/1.JPG"></option>
                    </select> -->
                    <table width="927">
                        <tr>
                            <!--                            <td>
                                                            <div class="loai_san_pham"  id="linhkien_icon" onclick="selectType(this)" style="background:url(images/phukien.jpg) ; background-size:100% 100%;background-repeat:no-repeat;background-position:center;"></div>
                                                        </td>
                                                        <td>
                            
                                                            <div class="loai_san_pham" id="laptop_icon" onclick="selectType(this)" style="background:url(images/laptop.png); background-size:100% 100%;background-repeat:no-repeat;background-position:center;"></div>
                                                        </td>-->
                                                        <td width="17">  </td>
                                                         <td width="269">
                                <select name="HangSanXuat" style="width:200px; height:35px;font-size:22px; color:#666;">
                                    <option value="" selected="selected">--Chọn danh mục--</option>
                                    <c:forEach var="hsx" items="${obj.getListHangSX()}">
                                        <c:if test="${hsx.getTinhTrang() != 0}">




                                            <option value=${ hsx.getMaHang()}>${hsx.getTenHang()}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </td>
                                                        
                            <td width="118">
                                <!--                                <input type="hidden" name="LoaiSanPham" id="Loaisp" value=""/>-->
                                <label  for="tenSanPham" >Tên Sản Phẩm</label>
                            </td>
                            <td width="320">

                                <input type="text"  name="tenSanPham" style="width:320px; font-size:22px; color:#666;" value="${ obj.getTimkiem()}" />
                            </td>
                           
                            <td width="179">
                                <input type="submit" id="btn_tim_kiem" name="timKiem" value=""/>
                            </td>
                           
                        </tr>
                    </table>
                </div>
            </form>


        </td>
    </tr>


    <tr>
        <td></td>
        <td width="820px">
        </td>
    </tr>
</table>

