<%-- 
    Document   : DanhSachSanPham
    Created on : Sep 28, 2012, 7:31:31 PM
    Author     : MRKYT
--%>

<%@page import="myLib.SearchStringConvertor"%>
<%@page import="java.io.Serializable"%>
<%@page import="org.hibernate.type.SerializableType"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.dao.*,model.pojo.*" %>
<%!    //khai bao bien vs ham
    SanPhamDAO spdao = new SanPhamDAO();
    HangSanXuatDAO hangsxDAO = new HangSanXuatDAO();

%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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

        <!--        <style type="text/css">
        
                    #sidebox-title{
                        margin: 1px 0px 0px 0px;
                        padding: 5px 6px 0px 6px;
                        height: 35px;
                        line-height: 100%;
        
        
        
                        background: #D1D1D1;
                        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#A9A9A9, endColorstr=#C2C2C2);
                        background: -webkit-gradient(linear, left top, left bottom, from(#A9A9A9), to(#C2C2C2));
                        background: -moz-linear-gradient(top,  #A9A9A9,  #C2C2C2);
                        border: solid 3px #6D6D6D;
                    }
        
                </style>-->
    </head>

    <body topmargin="-10px">
        <jsp:include page="header.jsp"/>

        <table align="center" width="1000px" border="0" cellpadding="0" cellspacing="0">

            <tr>
                <td style="vertical-align: top;">
                    <div class="sidebox-wrapper " style="border:medium ; vertical-align: top; ">
                        <h3 class="sidebox-title"  ><span>THƯƠNG HIỆU</span></h3>
                        <div class="sidebox-body" style="width:180px ; border:solid 2px #6D6D6D ;" > 

                            <%

                                temp_class obj = (temp_class) session.getAttribute("Info");
                                for (int i = 0; i < obj.getListHangSX().size(); i++) {
                                    HangSanXuat hsx = obj.getListHangSX().get(i);
                                    if (hsx.getTinhTrang() == 0) {
                                        continue;
                                    }
                            %>
                            <div><a href="DanhSachSanPham.jsp?HangSanXuat=<%=hsx.getMaHang()%>&LoaiSanPham=<%= obj.getLoaiSanPham()%>&Trang=1&SoSanPham=<%= obj.getSosptrang()%>"><%= hsx.getTenHang()%></a></div>
                            <% }%>


                        </div>
                    </div>
                    <%
                        List<String> LString = null;
                        List<SanPham> list = null;
                        String maKhoanGia = " ";

                        if (request.getParameter("tenSanPham") != null) {
                            obj.setTensp(request.getParameter("tenSanPham"));
                        }
                       
                        
                        if (request.getParameter("giatu") != null) {
                            obj.setGiatu(Double.parseDouble(request.getParameter("giatu")));
                        }
                        if (request.getParameter("giaden") != null) {
                            obj.setGiaden(Double.parseDouble(request.getParameter("giaden")));
                        }
                        if (request.getParameter("HangSanXuat") != null) {
                            obj.setMahang(request.getParameter("HangSanXuat"));
                        }

                        if (request.getParameter("LoaiSanPham") != null) {
                            obj.setLoaiSanPham(request.getParameter("LoaiSanPham"));
                        }

                        String timkiem = (obj.getTensp() + "," + obj.getMahang());
                        // String Tim Kiem Tra Ve Se La 1 List<String> (LoaiSanPham , HangSanXuat , TenSP)
                        LString = SearchStringConvertor.GetClear(timkiem);
                        if (!LString.get(0).equals(" ")) {
                            obj.setLoaiSanPham(LString.get(0));
                        }
                        if (!LString.get(1).equals(" ")) {
                            obj.setMahang(LString.get(1));
                        }
                        if (!LString.get(2).equals(" ")) {
                            obj.setTensp(LString.get(2));
                        }
                        timkiem = (obj.getTensp() + "," + obj.getMahang());

                        list = spdao.search(timkiem, obj.getGiatu(), obj.getGiaden());

                        int sosp = 0;

                        if (true) {

                    %>
                    <div class="sidebox-wrapper " style="border:medium ; ">
                        <h3 class="sidebox-title"  ><span>Tính Năng</span></h3>

                        <div class="sidebox-body" style="width:180px ; border:solid 2px #6D6D6D ;" > 
                            <h4 style="margin-left:10px" >Giá Laptop</h4>

                            <form id="form1" name="form1" method="get" action="DanhSachSanPham.jsp?HangSanXuat=<%= obj.getMahang()%>&LoaiSanPham=laptop&Trang=1&SoSanPham=<%=obj.getSosptrang()%>">

                                <%
                                    KhoanGiaDAO khoanGiaDAO = new KhoanGiaDAO();
                                    for (int i = 0; i < khoanGiaDAO.getList().size(); i++) {
                                        KhoanGia kg = khoanGiaDAO.getList().get(i);

                                        String tu = (String.valueOf(kg.getGiaTu() / 1000));
                                        String den = (String.valueOf(kg.getGiaDen() / 1000));

//                                            if (kg.getMaKhoanGia().equals(request.getParameter("gia")))
//                                                check = true;
%>


                                <div>
                                    <a href="DanhSachSanPham.jsp?HangSanXuat=<%= obj.getMahang()%>&LoaiSanPham=laptop&Trang=1&SoSanPham=<%=obj.getSosptrang()%>&giatu=<%= kg.getGiaTu()%>&giaden=<%=kg.getGiaDen()%>"> 
                                        <%= tu%> triệu - <%= den%> triệu 
                                    </a>

                                </div>
                                <%}%>


                            </form>

                            <h4>Màn Hình</h4>

                            <div>
                                <a href="/laptop/laptop-sony/">0 - 14 inch</a>
                            </div>
                            <div>
                                <a href="/laptop/laptop-apple/">14 inch trở lên</a>
                            </div>

                        </div>
                    </div>
                    <%}%>
                </td>
                <td colspan="2" style="vertical-align: top;" >
                    <%


                        for (int i = 0; i < list.size(); i++) {
                            SanPham sp = list.get(i);
                            if (obj.getLoaiSanPham().equals("laptop") && !sp.getLaptops().isEmpty()) {
                                sosp++;
                            } else if (obj.getLoaiSanPham().equals("linhkien") && !sp.getLinhKiens().isEmpty()) {
                                sosp++;
                            } else if (!obj.getLoaiSanPham().equals("laptop") && !obj.getLoaiSanPham().equals("linhkien")) {
                                sosp++;
                            }
                        }
                        int tongtrang = (sosp % obj.getSosptrang() == 0 ? sosp / obj.getSosptrang() : ((sosp / obj.getSosptrang()) + 1));
                    %>
                    <table width="820px" border="0" cellspacing="0" cellpadding="0" style="margin-left:10px ; vertical-align: top;">
                        <tr>

                            <td width="459" height="36">
                                <%if (tongtrang < 1) {
                                    } else {
                                %>
                                Trang  
                                <% }%>
                                <!-- list Trang Begin -->

                                <%
                                    int showdau = (obj.getTrang() % 5 == 0 ? ((obj.getTrang() / 5) - 1) * 5 + 1 : (obj.getTrang() / 5) * 5 + 1);
                                    if (obj.getTrang() > 1) {

                                %>

                                <a href="DanhSachSanPham.jsp?HangSanXuat=<%= obj.getMahang()%>&LoaiSanPham=<%=obj.getLoaiSanPham()%>&SoSanPham=<%= obj.getSosptrang()%>&Trang=<%=1%>"><<</a> |
                                <a href="DanhSachSanPham.jsp?HangSanXuat=<%= obj.getMahang()%>&LoaiSanPham=<%=obj.getLoaiSanPham()%>&SoSanPham=<%= obj.getSosptrang()%>&Trang=<%=obj.getTrang() - 1%>"><</a> 
                                <%if (showdau > 1 && showdau <= 5) {%>
                                <a href="DanhSachSanPham.jsp?HangSanXuat=<%= obj.getMahang()%>&LoaiSanPham=<%=obj.getLoaiSanPham()%>&SoSanPham=<%= obj.getSosptrang()%>&Trang=<%=1%>">. . .</a> 
                                <%} else if (showdau > 5) {%>
                                <a href="DanhSachSanPham.jsp?HangSanXuat=<%= obj.getMahang()%>&LoaiSanPham=<%=obj.getLoaiSanPham()%>&SoSanPham=<%= obj.getSosptrang()%>&Trang=<%=showdau - 5%>">. . .</a> 
                                <%}%>
                                <%}%>
                                <%


                                    for (int i = showdau; i < showdau + 5 && i <= tongtrang; i++) {


                                %>
                                <a href="DanhSachSanPham.jsp?HangSanXuat=<%= obj.getMahang()%>&LoaiSanPham=<%=obj.getLoaiSanPham()%>&SoSanPham=<%= obj.getSosptrang()%>&Trang=<%=i%>"><%=i%></a> |
                                <%
                                    }
                                    if (obj.getTrang() < tongtrang) {

                                %>
                                <%if (showdau < tongtrang - 4) {%>
                                <a href="DanhSachSanPham.jsp?HangSanXuat=<%= obj.getMahang()%>&LoaiSanPham=<%=obj.getLoaiSanPham()%>&SoSanPham=<%= obj.getSosptrang()%>&Trang=<%=showdau + 6%>">. . .</a> 
                                <%}%>

                                <a href="DanhSachSanPham.jsp?HangSanXuat=<%= obj.getMahang()%>&LoaiSanPham=<%=obj.getLoaiSanPham()%>&SoSanPham=<%= obj.getSosptrang()%>&Trang=<%=obj.getTrang() + 1%>" >></a> |
                                <a href="DanhSachSanPham.jsp?HangSanXuat=<%= obj.getMahang()%>&LoaiSanPham=<%=obj.getLoaiSanPham()%>&SoSanPham=<%= obj.getSosptrang()%>&Trang=<%=tongtrang%>">>></a> 
                                <%}%>
                                <!-- list Trang End -->

                            </td>


                            <td align="right">Số sản phẩm trên trang </td>
                            <td><form method="post" action="DanhSachSanPham.jsp?HangSanXuat=<%= obj.getMahang()%>&LoaiSanPham=<%=obj.getLoaiSanPham()%>&Trang=1" >
                                    <select name="SoSanPham" onchange="submit()">
                                        <%
                                            for (int i = 1; i <= 10; i++) {
                                                if (i == obj.getSosptrang()) {
                                        %>
                                        <option value=<%= i%> selected=true ><%= i%></option>
                                        <% i++;
                                            }%>
                                        <option value=<%= i%> ><%= i%></option>
                                        <% }%>
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
                                    <%
                                        //   Class a = (LoaiSanPham.equals("laptop")?Laptop.class : LinhKien.class);
                                        //   a.getClass();

                                        List l = null;
                                        LaptopDAO laptopDAO = new LaptopDAO();
                                        LinhKienDAO linhkienDAO = new LinhKienDAO();
                                        //  l=laptopDAO.searchPhanTrang(timkiem, sosptrang, trang);

                                        String loaiSanPham = "Laptop";
                                        l = spdao.searchPhanTrang(timkiem, obj.getSosptrang(), obj.getTrang());
                                        if (obj.getLoaiSanPham().equals("laptop")) {
                                            l = laptopDAO.searchPhanTrang(timkiem, obj.getSosptrang(), obj.getTrang(), obj.getGiatu(), obj.getGiaden());
                                            loaiSanPham = "Laptop";
                                        }
                                        if (obj.getLoaiSanPham().equals("linhkien")) {
                                            l = linhkienDAO.searchPhanTrang(timkiem, obj.getSosptrang(), obj.getTrang());
                                            loaiSanPham = "Linhkien";
                                        }
                                        //list = spdao.getList();

                                        for (int i = 0; i < l.size(); i++) {


                                            SanPham sp = null;
                                            if (obj.getLoaiSanPham().equals("laptop")) {
                                                sp = ((Laptop) l.get(i)).getSanPham();
                                            } else if (obj.getLoaiSanPham().equals("linhkien")) {
                                                sp = ((LinhKien) l.get(i)).getSanPham();
                                            } else {
                                                sp = (SanPham) l.get(i);
                                            }
                                            String loai = "";
                                            if (!sp.getLaptops().isEmpty()) {
                                                loai = "laptop";
                                            }
                                            if (!sp.getLinhKiens().isEmpty()) {
                                                loai = "linhkien";
                                            }

                                    %>
                                    <div class="item">
                                        <!-- sp 1 - 1 -->
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="san_pham">
                                            <tr>
                                                <td><a href="ChiTietSanPham.jsp?loaiSanPham=<%=loai%>&maSanPham=<%=sp.getMaSanPham()%>" style="text-decoration:none;"><img class="imgsp" src=<%= sp.getHinhAnh()%> width="130" height="103" /></a></td>
                                            </tr>
                                            <tr>
                                                <td class="ten_san_pham"><a href="ChiTietSanPham.jsp?loaiSanPham=<%=loaiSanPham%>&maSanPham=<%=sp.getMaSanPham()%>" style="text-decoration:none;"><%=sp.getTenSanPham()%></a></td>
                                            </tr>
                                            <tr>
                                                <td><span class="gia"><%= sp.getGia() + "00 VND"%></span></td>
                                            </tr>
                                            <tr>
                                                <td class="khuyen_mai"><%=loai%></td>
                                            </tr>
                                            
                                        </table>
                                                
                                        <!-- sp 1 - 1 end -->
                                    </div>

                                    <%}%>

                                    <!--ket thuc 1 dong -->
                                </div>
                            </td>
                                    <tr id="box">
                                <td colspan="3">

                                </td>
                            </tr>
                    </table>
                </td>
                <td width="4">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3"><img src="images/footer1.jpg" width="1000" /></td>
            </tr>
        </table>
    </body>
</html>
