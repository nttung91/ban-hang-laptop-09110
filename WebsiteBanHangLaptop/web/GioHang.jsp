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
<%@ page import="javax.servlet.http.HttpUtils.*" %> 
<%!    String username, password;
%>
<%    //kiem tra dieu kien
    if (request.getParameter("logout") != null) {
        if (Boolean.parseBoolean(request.getParameter("logout").toString())) {
            session.invalidate();

        }
    }
    session.setAttribute("PrevPage",request.getRequestURL());
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
            if (maSanPham == null) return;
            SanPhamDAO dao = new SanPhamDAO();
            SanPham sanPham = dao.getObject(maSanPham);
            boolean isExist = false;
            for (int i = 0; i < gioHang.size(); i++) {
                if (gioHang.get(i).getMaSanPham().equals(maSanPham)) {
                   // gioHang.get(i).setSoLuongTon(gioHang.get(i).getSoLuongTon() + 1);
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
    <jsp:include page="header.jsp"/>
     <table align="center" width="1000px" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
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
                               
                            <tr>
                            <td colspan="5" align="right" style="padding-right:5px" width="70%">Thanh tien</td>
                            <td colspan="2">100,000,000 VND</td>
                            </tr>
                            <tr>
                            <td colspan="5" align="right" style="padding-right:5px" width="70%">VAT (10%):</td>
                            <td colspan="2">100,000,000 VND</td>
                            </tr>
                            <tr>
                            <td colspan="5"align="right" style="padding-right:5px" width="70%">Tong cong:</td>
                            <td colspan="2">100,000,000 VND</td>
                            </tr>
                           
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
                    </td>
            </tr>
        </table>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
