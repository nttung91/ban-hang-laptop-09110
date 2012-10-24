<%-- 
    Document   : DangNhap
    Created on : Oct 3, 2012, 2:52:06 PM
    Author     : THANHTUNG
--%>


<%@page import="java.sql.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="org.hibernate.HibernateException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.pojo.*,model.dao.*"%>
<%!    String username, password;
%>
<%    //kiem tra dieu kien
    
    boolean flag = true;
    boolean oke = true;
    if (request.getParameter("tenDangNhap") != null) {
        username = request.getParameter("tenDangNhap").toString();
    } else {
        flag = false;

    }
    if (request.getParameter("matKhau") != null) {
        password = request.getParameter("matKhau").toString();

    } else {
        flag = false;
    }

    if (flag) {

        

        KhachHangTrucTuyenDAO khttdao = new KhachHangTrucTuyenDAO();
        oke = khttdao.isDangNhapThanhCong(username, myLib.MD5Convertor.Convert2MD5(password.trim()));

        if (oke) {

            //session.removeAttribute("listVal");
            session.setAttribute("tenDangNhap", username);
            session.setAttribute("daDangNhap", true);
            response.sendRedirect("DanhSachSanPham.jsp");
            //  out.println("<h1>fad</h1>");

        }
    }




%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
        <link href="css/dang_nhap.css" rel="stylesheet" type="text/css" />
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
       

    <body topmargin="-10px">

        <jsp:include page="header.jsp"/>
        <table align="center" width="1000px" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2">
                    <!-- Main content -->

                    <table width="506" border="0" cellpadding="0" cellspacing="0" style="margin-top:10px">
                        <form method="post" name="dangnhap" >
                            <tr>
                                <td height="48" colspan="4" style="transition: all; -o-transition: all; -ms-transition: all; -moz-transition: all; -webkit-transition: all; margin-top: 10px; border: thin double #F00; background: #69F; padding-left: 10px; font-size: 24px; border-radius:10px;">Đăng Nhập</td>
                            </tr>
                            <tr>
                              <td height="27" class="text_reg" style="padding-left: 10px;">&nbsp;</td>
                              <td colspan="2"><label id="txt_error"><% if (!oke) out.println("Tên đăng nhập hoặc mật khẩu không đúng"); %></label>  </td>
                              <td>&nbsp;</td>
                          </tr>
                            <tr>
                                <td width="153" height="41" class="text_reg" style="padding-left: 10px;">Tên đăng nhập</td>
                                <td colspan="2"><input name="tenDangNhap" type="text" dir="ltr" size="40px" maxlength="20" /></td>
                                <td width="18">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="36" class="text_reg" style="padding-left: 10px;">Mật Khẩu</td>
                                <td colspan="2"><input name="matKhau" type="password" dir="ltr" size="40px" maxlength="20" /></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="39">&nbsp;</td>
                                <td colspan="2"><input style="width:100px; height:30px;" name="btnDangNhap" type="submit" value="Đăng Nhập" />&nbsp;
                                    <input style="width:100px; height:30px;" name="btnNhapLai" type="reset" value="Nhập Lại"/></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="39" colspan="2" class="text_reg">Bạn chưa có tài khoản?</td>
                                <td width="245" id="dang_ky"><a href="DangKyThanhVien.jsp">Đăng ký ngay</a></td>
                                <td>&nbsp;</td>
                            </tr>
                        </form>
                  </table></td>
                <td width="4">&nbsp;</td>
            </tr>
        </table>
        <!-- End of Main content -->
        <jsp:include page="footer.jsp"/>
    </body>
</html>
