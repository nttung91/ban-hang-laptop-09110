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
    if (request.getParameter("logout") != null) {
        if (Boolean.parseBoolean(request.getParameter("logout").toString())) {
            session.invalidate();

        }
    }
    if (session.getAttribute("daDangNhap") != null) {
        // out.println("<h1>fad</h1>");
    } else {

        session.setAttribute("daDangNhap", false);
               }

        boolean flag = true;
    
        if (request.getParameter("tenDangNhap")!= null) {
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
          
            boolean oke = false;
           
            KhachHangTrucTuyenDAO khttdao = new KhachHangTrucTuyenDAO();
            oke = khttdao.isDangNhapThanhCong(username, myLib.MD5Convertor.Convert2MD5(password.trim()));
            
            if (oke) {
              
                //session.removeAttribute("listVal");
                session.setAttribute("tenDangNhap", username);
                session.setAttribute("daDangNhap", true);
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
        <style type="text/css">
            #banner_container {
                position: relative;
                width:1000px;
                height:200px;
                background-image:url(images/Banner.jpg);
                background-repeat:no-repeat;
            }
            #banner_table_container{
                position:absolute;
                width:1000px;
                height:200px;
            }
            #timkiem_bg {
                background-image: url(images/timkiem_bg.jpg);
                background-repeat:no-repeat;
                background-position: center center;
                vertical-align:middle;

            }

            #btn_tim_kiem{
                width:100px;
                height:35px;
                background-image:url(images/TimKiem.png);
                background-repeat:no-repeat;

            }
            #Cart {
                background-image: url(images/CartMenu.png);
                height: 50px;
                width: 150px;
                background-repeat:no-repeat;
            }
            #menu_container {
                padding-top:10px;
                padding-bottom:10px;
            }
            #menu, #menu ul {
                list-style:none;
                padding:0;
                margin:0;
            }

            #menu li {
                float:left;
                position:relative;
                line-height: 3.2em;
                width: 250px;
                text-align:center;
                background-size:100% 100%;
                -moz-background-size: 100% 100%;
            }
            #menu li ul {
                position:absolute;
                margin-top:0;
                margin-left:0;
                display:none;
            }
            #menu ul li ul {
                margin-top:-3.2em;
                margin-left:250px;
            }

            #menu a {
                display:block;
                border-right:1px solid #fff;

                color:#3B3B3B;
                text-decoration:none;
                padding:0 10px;
            }
            #menu a:hover {

                color:#fff;
            }
            #menu ul {
                border-top:1px solid #fff;
            }
            #menu ul a {
                border-right:none;
                border-right:1px solid #fff;
                border-bottom:1px solid #fff;
                border-left:1px solid #fff;
                background-color:#9999FF;


            }
            /* SHOW SUBMENU 1 */
            #menu li:hover ul, #menu li.over ul {
                display:block;
            }
            #menu li:hover ul ul, #menu li.over ul ul {
                display:none;
            }
            /* SHOW SUBMENU 2 */
            #menu ul li:hover ul, #menu ul li.over ul {
                display:block;
            }

            .menu_first {
                background-image:url(images/Menu_Item_First.jpg);
                background-repeat:no-repeat;
            }
            .menu_mid {
                background-image:url(images/Menu_Item_Mid.jpg);
                background-repeat:no-repeat;

            }
            .menu_last {
                background-image:url(images/Menu_Item_Last.jpg);
                background-repeat:no-repeat;

            }
            #tim_kiem_nang_cao {
                display:none;
            }
            .menu_login:hover{
                color:#000;
                text-decoration:none;
            }
            .menu_login {
                font-weight: bold; font-style: oblique; font-family: 'MS Serif', 'New York', serif; font-size:18px; color:#00F;
            }
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
                                                        out.println("Xin chào, " + session.getAttribute("tenDangNhap") );
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
                <td colspan="2">
                    <!-- Main content -->
                   
                    <table width="506" border="0" cellpadding="0" cellspacing="0" style="margin-top:10px">
                        <form method="post" name="dangnhap" >
                            <tr>
                                <td height="48" colspan="4" style="transition: all; -o-transition: all; -ms-transition: all; -moz-transition: all; -webkit-transition: all; margin-top: 10px; border: thin double #F00; background: #69F; padding-left: 10px; font-size: 24px; border-radius:10px;">Đăng Nhập</td>
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
            <!-- End of Main content -->
            <tr>
                <td colspan="3"><img src="images/footer1.jpg" width="1000" /></td>
            </tr>
        </table>
    </body>
</html>
