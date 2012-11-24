<%-- 
    Document   : left_1
    Created on : Nov 5, 2012, 9:13:57 AM
    Author     : MRKYT
--%>

<%@page import="model.pojo.KhoanGia"%>
<%@page import="model.dao.KhoanGiaDAO"%>
<%@page import="model.dao.HangSanXuatDAO"%>
<%@page import="model.dao.SanPhamDAO"%>
<%@page import="myLib.SearchStringConvertor"%>
<%@page import="model.pojo.SanPham"%>
<%@page import="java.util.List"%>
<%@page import="model.pojo.HangSanXuat"%>
<%@page import="model.pojo.temp_class"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<link href="../css/danh_sach_san_pham.css" rel="stylesheet" type="text/css" />
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
<table width="90%" height="100%" id="left_backg" align="left"  >
    <tr >
        <td style="vertical-align:top; width:95%">
            <div class="sidebox-wrapper " style="border:medium ; vertical-align: top; ">
                <h3 class="sidebox-title"><span>THƯƠNG HIỆU</span></h3>
                <div class="sidebox-body" style="border:solid 2px #6D6D6D ;" > 
                    <c:set var="obj" value="${ sessionScope.temp }"/>
                    <c:forEach var="hsx" items="${obj.getListHangSX()}">
                        <c:if test="${hsx.getTinhTrang() != 0}">

                            <div><a href="BanLapTop.do?Action=SanPham&HangSanXuat=${hsx.getMaHang()}&LoaiSanPham=${ obj.getLoaiSanPham()}&Trang=1&SoSanPham=${ obj.getSosptrang()}">${ hsx.getTenHang()}</a></div>

                        </c:if>
                    </c:forEach>

                </div>
            </div>
            <c:if test="${ true }">

                <div class="sidebox-wrapper " style="border:medium ; ">
                    <h3 class="sidebox-title"><span>Tính Năng</span></h3>

                    <div class="sidebox-body" style="border:solid 2px #6D6D6D ;" > 
                        <div class="sidebox-sub-title">Giá Laptop</div>

                        <form id="form1" name="form1" method="get" action="BanLapTop.do?Action=SanPham&HangSanXuat=${ obj.getMahang()}&LoaiSanPham=laptop&Trang=1&SoSanPham=${obj.getSosptrang()}">
                            <c:forEach var="kg" items="${obj.getListKhoanGia()}">

                               
                                
                                <fmt:formatNumber var="tu" value="${kg.getGiaTu()/1000000}" type="number"/>
                                <fmt:formatNumber var="den" value="${kg.getGiaDen()/1000000}" type="number"/>
                                
                                <div>
                                    <a href="BanLapTop.do?Action=SanPham&HangSanXuat=${obj.getMahang()}&LoaiSanPham=${ obj.getLoaiSanPham()}&Trang=1&SoSanPham=${obj.getSosptrang()}&giatu=${ kg.getGiaTu()}&giaden=${kg.getGiaDen()}"> 
                                        ${ tu} - ${ den} Triệu 
                                    </a>

                                </div>
                            </c:forEach>

                        </form>

                        <div class="sidebox-sub-title">Màn Hình</div>

                        <div>
                            <a href="/laptop/laptop-sony/">0 - 14 inch</a>
                        </div>
                        <div>
                            <a href="/laptop/laptop-apple/">14 inch trở lên</a>
                        </div>

                    </div>
                </div>

            </c:if>
        </td>
    </tr>

</table>

