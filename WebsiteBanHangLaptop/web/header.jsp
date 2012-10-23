
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="org.hibernate.HibernateException"%>
<%@page import="model.pojo.*,model.dao.*"%>
<%!    //khai bao bien vs ham
    SanPhamDAO spdao = new SanPhamDAO();
    HangSanXuatDAO hangsxDAO = new HangSanXuatDAO();

%>
<%
    if (request.getParameter("logout") != null) {
        if (Boolean.parseBoolean(request.getParameter("logout").toString())) {
            session.setAttribute("daDangNhap", false);
            session.removeAttribute("tenDangNhap");
        }
    }
    if (session.getAttribute("daDangNhap") != null) {
        // out.println("<h1>fad</h1>");
    } else {

        session.setAttribute("daDangNhap", false);
    }
%>
<link href="css/dang_nhap.css" rel="stylesheet" type="text/css" />


<table align="center" width="1000px" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td height="50" colspan="3" id="banner_container"><table width="1000px" height="197" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="200" height="56">&nbsp;</td>
                    <td width="482">&nbsp;</td>
                    <td colspan="3"><table width="100%" height="30px">
                            <tr>
                                <td style="border-top-style: none; border-top-width: medium; border-top-color: #333; border-right-style:solid; border-right-width:medium; border-bottom-color:#000; padding-right:5px" align="right">
                                    <a href="<%
                                        if (Boolean.parseBoolean(session.getAttribute("daDangNhap").toString())) {
                                            out.println("TrangCaNhan.jsp?tenDanhNhap=" + session.getAttribute("tenDangNhap").toString() + "");
                                        } else {
                                            out.println("DangNhap.jsp");
                                        }%>" class="menu_login">
                                        <!-- Sua noi dung -->
                                        <%
                                            if (Boolean.parseBoolean(session.getAttribute("daDangNhap").toString())) {
                                                out.println("Xin chào, " + session.getAttribute("tenDangNhap"));
                                            } else {
                                                out.println("Đăng nhập");
                                            }
                                        %>


                                    </a></td>
                                <td align="left" style="padding-left:5px">
                                    <a href="<%
                                        if (Boolean.parseBoolean(session.getAttribute("daDangNhap").toString())) {
                                            out.println("DangKyThanhVien.jsp?logout=true");
                                        } else {
                                            out.println("DangKyThanhVien.jsp");
                                        }

                                       %>" class="menu_login"><%
                                           if (Boolean.parseBoolean(session.getAttribute("daDangNhap").toString())) {
                                               out.println("Thoat");
                                           } else {
                                               out.println("Dang Ky");
                                           }
                                        %>                  </a></td>
                            </tr>
                        </table></td>
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
                    <td height="50px" width="137"><img src="../images/CartMenu.png" width="100%" height="50px" /></td>
                    <td>&nbsp;</td>
                </tr>
            </table></td>
    </tr>
    <tr>
        <td colspan="3" id="menu_container">

            <ul id="menu">
                <li class="menu_first"><a href="#">Trang Chủ</a>

                </li>

                <li class="menu_mid" ><a href="#" >Danh Mục</a>
                    <ul>
                        <li><a href="#">Laptop</a>
                            <ul
                                <!--Cac hang lap top start-->
                                <%
                                    temp_class obj = new temp_class();
                                    KhoanGiaDAO khoanGiaDAO = new KhoanGiaDAO();
                                    obj.setListKhoanGia(khoanGiaDAO.getList());

                                    obj.setSosptrang(5);

                                    obj.setTrang(1);

                                    obj.setGiatu(0);
                                    obj.setGiaden(0);

                                    obj.setMahang("");
                                    obj.setLoaiSanPham("");


                                    obj.setTensp("");

                                    if (request.getParameter("tenSanPham") != null) {
                                        obj.setTensp(request.getParameter("tenSanPham"));
                                    }

                                    if (request.getParameter("HangSanXuat") != null) {
                                        obj.setMahang(request.getParameter("HangSanXuat"));
                                    }

                                    if (request.getParameter("LoaiSanPham") != null) {
                                        obj.setLoaiSanPham(request.getParameter("LoaiSanPham"));
                                    }
                                    if (request.getParameter("SoSanPham") != null) {
                                        obj.setSosptrang(Integer.parseInt(request.getParameter("SoSanPham")));
                                    }
                                    if (request.getParameter("Trang") != null) {
                                        obj.setTrang(Integer.parseInt(request.getParameter("Trang")));
                                    }

                                    obj.setListHangSX(hangsxDAO.getList());
                                    for (int i = 0; i < obj.getListHangSX().size(); i++) {
                                        HangSanXuat hsx = obj.getListHangSX().get(i);
                                        if (hsx.getTinhTrang() == 0) {
                                            continue;
                                        }
                                %>
                                <li><a href="DanhSachSanPham.jsp?HangSanXuat=<%= hsx.getMaHang()%>&LoaiSanPham=laptop&Trang=1&SoSanPham=<%=obj.getSosptrang()%>" title=<%= hsx.getTenHang()%>><%= hsx.getTenHang()%></a></li>
                                <%}%>

                            </ul>
                        </li>
                        <li><a href="#" title="Active projects">Linn Kiện</a>
                            <ul>
                                <!--Cac hang link kien -->
                                <%
                                    for (int i = 0; i < obj.getListHangSX().size(); i++) {
                                        HangSanXuat hsx = obj.getListHangSX().get(i);
                                        if (hsx.getTinhTrang() == 0) {
                                            continue;
                                        }
                                %>
                                <li><a href="DanhSachSanPham.jsp?HangSanXuat=<%= hsx.getMaHang()%>&LoaiSanPham=linhkien&Trang=1&SoSanPham=<%= obj.getSosptrang()%>" title=<%= hsx.getTenHang()%>><%= hsx.getTenHang()%></a></li>
                                <%}%>
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
    <tr>
        <td height="50px" colspan="3" id="timkiem_bg">
            <form method="post" action="DanhSachSanPham.jsp?Trang=1&SoSanPham=<%= obj.getSosptrang()%>" name="frmSearch" >

                <select name="LoaiSanPham" style="margin-left:10px " >
                    <option value="" selected="selected">--All--</option>
                    <option value="laptop" >LapTop</option>
                    <option value="linhkien" >Linh Kiện</option>
                </select>

                <label  for="tenSanPham" >Tên Sản Phẩm</label>
                <input type="text"  name="tenSanPham" style="width:350px" value="<%= obj.getTensp()%>" />
                <label for="HangSanXuat">Danh mục</label>
                <select name="HangSanXuat" style="width:200px">
                    <option value="" selected="selected">--Chọn danh mục--</option>
                    <%

                        for (int i = 0; i < obj.getListHangSX().size(); i++) {
                            HangSanXuat hsx = obj.getListHangSX().get(i);
                            if (hsx.getTinhTrang() == 0) {
                                continue;
                            }
                    %>
                    <option value=<%= hsx.getMaHang()%>><%= hsx.getTenHang()%></option>
                    <%}%>
                </select>
                <label for="danhMuc" onclick="showAvancedSearchMenu()">Nang Cao</label>
                <input type="submit" id="btn_tim_kiem"  value="&nbsp;&nbsp;&nbsp;Tìm kiếm" name="timKiem"/>
            </form>
        </td>
    </tr>


    <tr>
        <td></td>
        <td width="820px">
            <table  width="820px" border="0" cellspacing="0" cellpadding="0" id="tim_kiem_nang_cao">

                <form method="post" action="DanhSachSanPham.jsp?Trang=1&SoSanPham=<%= obj.getSosptrang()%>" name="frmSearch">
                    <tr>
                        <td width="151"> <label  for="tenSanPham" style="margin-left:10px">Tên Sản Phẩm</label></td>
                        <td width="515"><input type="text" name="tenSanPham" /></td>
                        <td width="334">&nbsp;</td>
                    </tr>
                    <tr>
                        <td><label for="HangSanXuat" style="margin-left:10px">Hãng Sản Xuất</label></td>
                        <td><select name="HangSanXuat" style="width:200px">
                                <option value="" selected="selected">--Chọn danh mục--</option>
                                <%

                                    for (int i = 0; i < obj.getListHangSX().size(); i++) {
                                        HangSanXuat hsx = obj.getListHangSX().get(i);
                                        if (hsx.getTinhTrang() == 0) {
                                            continue;
                                        }
                                %>
                                <option value=<%= hsx.getMaHang()%>><%= hsx.getTenHang()%></option>
                                <%}%>
                            </select></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><label for="HangSanXuat" style="margin-left:10px">Giá Tiền</label></td>
                        <td>Từ : &nbsp;&nbsp; 
                            <select name="giatu" > 
                                <option value="" selected="selected">--Giá Từ--</option>
                                <%

                                    for (int i = 0; i < obj.getListKhoanGia().size(); i++) {
                                        KhoanGia kg = obj.getListKhoanGia().get(i);
                                        String tu = (String.valueOf(kg.getGiaTu() / 1000));


                                %>
                                <option value=<%= kg.getGiaTu()%>><%= tu%> triệu</option>
                                <%}%>
                            </select>
                            &nbsp;
                            &nbsp;
                            <select name="giaden" style="width:200px">
                                <option value="" selected="selected">--Giá Đến--</option>
                                <%

                                    for (int i = 0; i < obj.getListKhoanGia().size(); i++) {
                                        KhoanGia kg = obj.getListKhoanGia().get(i);
                                        String den = (String.valueOf(kg.getGiaDen() / 1000));

                                %>
                                <option value=<%= kg.getGiaDen()%>><%= den%> triệu</option>
                                <%}%>
                            </select> VND
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </form>
            </table>
        </td>
    </tr>
</table>
<%
    session.setAttribute("Info", obj);

%>
