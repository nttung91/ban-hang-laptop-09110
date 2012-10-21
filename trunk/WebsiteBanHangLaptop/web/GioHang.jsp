<%-- 
    Document   : DangNhap
    Created on : Oct 3, 2012, 2:52:06 PM
    Author     : THANHTUNG
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="org.hibernate.HibernateException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.pojo.*,model.dao.*"%>
<%!    String username, password;

%>
<%    //kiem tra dieu kien
    if (request.getParameter("logout") != null) {
        if (Boolean.parseBoolean(request.getParameter("logout").toString())) {
            session.invalidate();

        }
    }
    if (session.getAttribute("daDangNhap") == null) {
        session.setAttribute("daDangNhap", false);
    }
    ArrayList<SanPham> gioHang = new ArrayList<SanPham>();
    String action;
    String maSanPham;
    int[] soLuongMoi=null;
    boolean oke = true;
    //kiem tra gio hang

    if (session.getAttribute("GioHang") != null) {
        gioHang = (ArrayList<SanPham>) session.getAttribute("GioHang");
         soLuongMoi = new int[gioHang.size()];
    } else {
        session.setAttribute("GioHang", gioHang);
    }
    if (request.getParameter("Action") != null) {
        action = request.getParameter("Action");
    } else {
        action = "CapNhat";
    }
    if (action.equals("ThemVaoGio")) {
        if (request.getParameter("maSanPham") != null) {

            maSanPham = request.getParameter("maSanPham");
            SanPhamDAO dao = new SanPhamDAO();
            SanPham sanPham = dao.getObject(maSanPham);
            boolean isExist = false;
            for (int i = 0; i < gioHang.size(); i++) {
                if (gioHang.get(i).getMaSanPham().equals(maSanPham)) {
                    gioHang.get(i).setSoLuongTon(gioHang.get(i).getSoLuongTon() + 1);
                    isExist = true;
                    break;
                }
            }
            if (!isExist) {
                sanPham.setSoLuongTon(1);
                gioHang.add(sanPham);
            }
            
        } else {
            //den trang bao loi ko tim thay ma san pham
        }
    } else if (action.equals("CapNhat")) {
        if (request.getParameter("txt_so_luong") != null) {
            try {
                String[] s = request.getParameterValues("txt_so_luong");
                for (int i = 0; i < gioHang.size(); i++) {
                    soLuongMoi[i] = Integer.parseInt(s[i]);
                    gioHang.get(i).setSoLuongTon(soLuongMoi[i]);
                }
            } catch (NullPointerException ex) {
                ex.printStackTrace();
                for (int i = 0; i < gioHang.size(); i++) {
                    soLuongMoi[i] = 1;
                }
            }
        } else {
            for (int i = 0; i < gioHang.size(); i++) {
                soLuongMoi[i] = 1;
            }
        }
        if (request.getParameter("maSanPham") != null) {

            maSanPham = request.getParameter("maSanPham");

        } else {
        }
    } else if (action.equals("XoaSanPham")){
        if (request.getParameter("maSanPham") != null) {

            maSanPham = request.getParameter("maSanPham");
             for (int i = 0; i < gioHang.size(); i++) {
                if (gioHang.get(i).getMaSanPham().equals(maSanPham)) {
                    gioHang.remove(i);
                    i--;
                }
            }

        } else {
            //fdsaf
        }
    }
       else if (action.equals("HuyGioHang")){
           session.removeAttribute("GioHang");
           response.sendRedirect("GioHang.jsp");
           oke =false;
              }
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
        <link href="css/dang_nhap.css" rel="stylesheet" type="text/css" />
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
                            <td height="50px" width="137"><img src="images/CartMenu.png" width="100%" height="50px" /></td>
                            <td>&nbsp;</td>
                        </tr>
                    </table></td>
            </tr>
            <tr>
                <td colspan="3" id="menu_container">

                    <ul id="menu">
                        <li class="menu_first"><a href="#">Trang Chủ</a></li>

                        <li class="menu_mid" ><a href="#" >Danh Mục</a>
                            <ul>
                                <li><a href="#">Laptop</a>
                                    <ul>
                                        <!--Cac hang lap top start-->
                                        <li><a href="#" title="2003 projects">2003 projects</a></li>
                                        <li><a href="#" title="2004 projects">2004 projects</a></li>
                                        <li><a href="#" title="2005 projects">2005 projects</a></li>
                                        <!--Cac hang lap top end -->
                                    </ul>
                                </li>
                                <li><a href="#" title="Active projects">Linn Kiện</a>
                                    <ul>
                                        <!--Cac hang link kien -->
                                        <li><a href="#" title="Leaf industries">Leaf industries</a></li>
                                        <li><a href="#" title="Omnicron">Omnicron</a></li>
                                        <li><a href="#" title="Unkown.com">Unkown.com</a></li>
                                        <!--Cac hang linn kien end -->
                                    </ul>

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
                    <form method="get" action="#" name="frmSearch">
                        <label for="tenSach" style="margin-left:10px">Tên Sản Phẩm</label>
                        <input type="text"  name="tenSach" style="width:400px" />
                        <label for="danhMuc">Danh mục</label>
                        <select name="danhMuc" style="width:200px">
                            <option value="Tất cả" selected="selected">--Chọn danh mục--</option>
                            <option value="mã danh mục">Tên danh mục</option>
                        </select>
                        <label for="danhMuc" onclick="showAvancedSearchMenu()">Nang Cao</label>
                        <input type="submit" id="btn_tim_kiem"  value="&nbsp;&nbsp;&nbsp;Tìm kiếm" name="timKiem"/>
                    </form>
                </td>
            </tr>
            <tr>
                <td width="1000">
                    <table  width="1000px" border="0" cellspacing="0" cellpadding="0" id="tim_kiem_nang_cao">

                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <!-- Main content -->
                    <form method="get">
                        <div id="gio_hang">
                            <table width="100%" border="1px solid thin black">
                                <tr>
                                    <td width="5%" align="center" class="gio_hang_header">STT</td>
                                    <td width="15%" align="center" class="gio_hang_header">Hinh anh</td>
                                    <td width="25%" align="center" class="gio_hang_header">Ten san pham</td>
                                    <td width="15%" align="center" class="gio_hang_header">Gia</td>
                                    <td width="15%" align="center" class="gio_hang_header">So Luong</td>
                                    <td width="20%" align="center" class="gio_hang_header">Tong</td>
                                    <td width="5%" align="center" class="gio_hang_header">Xoa</td>
                                </tr>
                                <%
if (gioHang.size()==0) {
%>
 <tr>
     <td align="center" colspan="7">Gio hang dang trong</td>
                                    
                                </tr>
                                <%
} else {
%>
<%
    for (int i=0;i<gioHang.size();i++)
               {
        SanPham sp = gioHang.get(i);
        
%>
                                <tr>
                                    <td align="center"><%=(i+1)%></td>
                                    <td><div class="hinh_anh_san_pham"><img src="<%=sp.getHinhAnh()%>" width="100px" height="100px" alt="Loi Hinh anh" longdesc="#" /></div></td>
                                    <td><p><%=sp.getTenSanPham()%></p></td>
                                    <td><div class="gia_san_pham"><%=myLib.CurrencyConvertor.AmountToCurrencyFomat(sp.getGia(),"VND")%></div></td>
                                    <td><div class="so_luong"><input name="txt_so_luong" type="text" size="5" maxlength="5" value="<%=sp.getSoLuongTon()%>" /></div></td>
                                    <td><div class="thanh_tien"><span class="gia_san_pham"><%=myLib.CurrencyConvertor.AmountToCurrencyFomat(sp.getGia()*sp.getSoLuongTon(),"VND")%></span></div></td>
                                    <td><div class="xoa_san_pham"><a href="GioHang.jsp?Action=XoaSanPham&maSanPham=<%= sp.getMaSanPham()%>" target="_self"><img src="images/xoasanpham.png" alt="Loi hinh anh" width="30" height="30" align="middle" /></a></div></td>
                                </tr>
                                
 <%}}%>                               
                            </table>
                            <div align="right">
                                <p>
                                    <%if (gioHang.size()>0) {%>
                                   <input name="cap_nhat" type="submit" value="Cap nhat" class="button_control"/>
                                   <a href="GioHang.jsp?Action=HuyGioHang"><input name="huy_gio_hang" type="button" value="Huy Gio Hang" class="button_control" /></a>
                                   <a href="ThanhToan.jsp"><input name="thanh_toan" type="button" class="button_control" value="Thanh toan"  /></a> 
                                   <%}%>
                                   <a href="DanhSachSanPham.jsp"><input name="mua_tiep" type="button" value="Tiep tuc mua" class="button_control" /></a>
                                </p>
                            </div>
                        </div>

                    </form>


                    <!--End of Main content -->

                </td>
            </tr>
            <!-- End of Main content -->
            <tr>
                <td colspan="3"><img src="images/footer1.jpg" width="1000" /></td>
            </tr>
        </table>
    </body>
</html>
