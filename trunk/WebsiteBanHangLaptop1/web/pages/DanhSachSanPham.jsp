<%-- 
    Document   : DanhSachSanPham
    Created on : Sep 28, 2012, 7:31:31 PM
    Author     : MRKYT
--%>

<%@page import="CreateSanPhamByCode.CreateSanPham"%>
<%@page import="myLib.StringConverter"%>
<%@page import="com.sun.org.apache.xml.internal.security.keys.content.SPKIData"%>
<%@page import="myLib.SearchStringConvertor"%>
<%@page import="java.io.Serializable"%>
<%@page import="org.hibernate.type.SerializableType"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.dao.*,model.pojo.*" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
        <link href="css/danh_sach_san_pham.css" rel="stylesheet" type="text/css" />
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


    </head>

    <body topmargin="-10px"   >


        <c:set var="obj" value="${ sessionScope.temp }"/>

        <table width="820px" height="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left:10px ; vertical-align: top;" >
            <tr>

                <td width="459" height="36">

                    <c:choose>
                        <c:when test="${ obj.getListsp().isEmpty()}">

                            <h3><c:out value="Không Có Sản Phẩm Cần Tìm"/></h3>
                        </c:when>

                    </c:choose>
                    <!-- list Trang Begin -->

                    <%
                        //SanPhamDAO spdao = new SanPhamDAO();
                        //LaptopDAO lapdao = new LaptopDAO();
                        //LinhKienDAO lkdao = new LinhKienDAO();
                        //CreateSanPham create = new CreateSanPham();

                        //Laptop l = (Laptop) create.Create(0);
                    %>
                    
                    <%
                        // //             spdao.saveOrUpdateObject(l.getSanPham());
//                        lapdao.saveOrUpdateObject(l);
%>

                    <c:if test="${obj.getTongtrang()>=1}">

                        <c:out value="Trang"/>
                    </c:if>
                    <c:set var="showdau" value="${ obj.getShowdau() }"/>

                    <c:if test="${obj.getTrang()>1}">


                        <a href="BanLapTop.do?Action=SanPham&HangSanXuat=${ obj.getMahang()}&LoaiSanPham=${obj.getLoaiSanPham()}&SoSanPham=${ obj.getSosptrang()}&Trang=1"><<</a> |
                        <a href="BanLapTop.do?Action=SanPham&HangSanXuat=${ obj.getMahang()}&LoaiSanPham=${obj.getLoaiSanPham()}&SoSanPham=${ obj.getSosptrang()}&Trang=${obj.getTrang() - 1}"><</a> 
                        <c:choose>
                            <c:when test="${(showdau > 1 && showdau <= 5)}">

                                <a href="BanLapTop.do?HangSanXuat=${ obj.getMahang()}&LoaiSanPham=${obj.getLoaiSanPham()}&SoSanPham=${ obj.getSosptrang()}&Trang=1">. . .</a> 

                            </c:when>
                            <c:when test="${(showdau > 5)}">

                                <a href="BanLapTop.do?Action=SanPham&HangSanXuat=${ obj.getMahang()}&LoaiSanPham=${obj.getLoaiSanPham()}&SoSanPham=${ obj.getSosptrang()}&Trang=${showdau - 5}">. . .</a> 

                            </c:when>
                        </c:choose>
                    </c:if>

                    <c:forEach var="i" begin="${showdau}" end="${showdau + 5 }" >
                        <c:if test="${i <= obj.getTongtrang()}">
                            <c:choose>
                                <c:when test="${i == obj.getTrang()}">

                                    <a href="BanLapTop.do?Action=SanPham&HangSanXuat=${ obj.getMahang()}&LoaiSanPham=${obj.getLoaiSanPham()}&SoSanPham=${ obj.getSosptrang()}&Trang=${i}" style="color:tomato ;" ><c:out value="${i}" /></a> |
                                </c:when>
                                <c:otherwise>

                                    <a href="BanLapTop.do?Action=SanPham&HangSanXuat=${ obj.getMahang()}&LoaiSanPham=${obj.getLoaiSanPham()}&SoSanPham=${ obj.getSosptrang()}&Trang=${i}"><c:out value="${i}" /></a> |

                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </c:forEach>
                    <c:if test="${obj.getTrang() < obj.getTongtrang()}" >
                        <c:if test="${showdau < obj.getTongtrang() - 4}">

                            <a href="BanLapTop.do?Action=SanPham&HangSanXuat=${ obj.getMahang()}&LoaiSanPham=${obj.getLoaiSanPham()}&SoSanPham=${ obj.getSosptrang()}&Trang=${showdau + 6}">. . .</a> 

                        </c:if>
                        <a href="BanLapTop.do?Action=SanPham&HangSanXuat=${ obj.getMahang()}&LoaiSanPham=${obj.getLoaiSanPham()}&SoSanPham=${ obj.getSosptrang()}&Trang=${obj.getTrang() + 1}" >></a> |
                        <a href="BanLapTop.do?Action=SanPham&HangSanXuat=${ obj.getMahang()}&LoaiSanPham=${obj.getLoaiSanPham()}&SoSanPham=${ obj.getSosptrang()}&Trang=${obj.getTongtrang()}">>></a> 

                    </c:if>
                    <!-- list Trang End -->

                </td>


                <td align="right">Số sản phẩm trên trang </td>
                <td>
                    <form method="post" action="DanhSachSanPham.do?Action=${sessionScope.temp.getAction()}&HangSanXuat=${ obj.getMahang()}&LoaiSanPham=${obj.getLoaiSanPham()}&Trang=1" >
                        <select name="SoSanPham" onchange="submit()">
                            <c:forEach var="i" begin="1" end="10">
                                <c:choose>
                                    <c:when test="${i == obj.getSosptrang()}">


                                        <option value=${ i} selected=true >${i}</option>
                                        <c:set var="i" value="${i+1}"/>
                                    </c:when>
                                    <c:otherwise>

                                        <option value=${ i}  >${i}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </form>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td width="417">&nbsp;</td>
                <td width="45">&nbsp;</td>
            </tr>
            <tr id="box">
                <td height="201" colspan="3"  >
                    <div width="100%" >
                        <c:forEach var="sp" items="${obj.getListsp()}" >

                            <c:if test="${obj.getLoaiSanPham()!=''}">
                                <c:set var="sp" value="${sp.sanPham}"/>
                            </c:if>
                            <c:set var="loai" value="Chưa Phân Loại"/>
                            <c:if test="${!sp.getLaptops().isEmpty()}">
                                <c:set var="loai" value="laptop"/>    
                            </c:if>
                            <c:if test="${!sp.getLinhKiens().isEmpty()}">
                                <c:set var="loai" value="linhkien"/>    
                            </c:if>
                            <div class="item" >
                                <!-- sp 1 - 1 -->
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="san_pham" >
                                    <tr>
                                        <td><a href="ChiTietSanPham.jsp?loaiSanPham=${loai}&maSanPham=${sp.getMaSanPham()}" style="text-decoration:none;"><img class="imgsp" src=${sp.getHinhAnh()} width="130" height="103" /></a></td>
                                    </tr>
                                    <tr>
                                        <td class="ten_san_pham"><a href="ChiTietSanPham.jsp?loaiSanPham=${obj.getLoaiSanPham()}&maSanPham=${sp.getMaSanPham()}" style="text-decoration:none;">${sp.getTenSanPham()}</a></td>
                                    </tr>
                                    <tr>
                                        <td><span class="gia"> <fmt:formatNumber type="number" value="${sp.getGia()}" groupingUsed="true"/> <c:out value=" VND"/></span></td>
                                    </tr>
                                    <tr>
                                        <td class="khuyen_mai">
                                            <c:out value="${loai}"/>
                                        </td>
                                    </tr>

                                </table>

                                <!-- sp 1 - 1 end -->
                            </div>



                        </c:forEach>
                        <!--ket thuc 1 dong -->
                    </div>
                </td>

            </tr>

        </table>

    </body>
</html>

