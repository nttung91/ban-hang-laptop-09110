<%-- 
    Document   : DanhSachSanPham
    Created on : Sep 28, 2012, 7:31:31 PM
    Author     : THANHTUNG
--%>

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
                display:block;
            }
        </style></head>

    <body topmargin="-10px">
        <table align="center" width="1000px" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td height="50" colspan="3" id="banner_container"><table width="1000px" height="195" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="200">&nbsp;</td>
                            <td width="482">&nbsp;</td>
                            <td colspan="3"><table width="100%" height="30px">
                                    <tr>
                                        <td style="border-right-style:solid;border-right-width:medium;border-bottom-color:#000; padding-right:5px" align="right">Dang nhap</td>
                                        <td align="left" style="padding-left:5px">Thoat</td>
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
                            <td width="137" height="45">&nbsp;</td>
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

                        <li class="menu_mid" ><a href="#"  class="menu_mid">Danh Mục</a>
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
                        <li  class="menu_last"><a href="#" title="Contact" >Contact</a></li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td height="50px" colspan="3" id="timkiem_bg">
                    <form method="get" action="DanhSachSanPham.jsp" name="frmSearch">
                        <label for="tenSanPham" style="margin-left:10px">Tên Sản Phẩm</label>
                        <input type="text"  name="tenSanPham" style="width:400px" />
                        <label for="HangSanXuat">Danh mục</label>
                        <select name="HangSanXuat" style="width:200px">
                            <option value="" selected="selected">--Chọn danh mục--</option>
                            <% 
                                List<HangSanXuat> listHangSX = hangsxDAO.getList();
                                for(int i = 0 ; i <listHangSX.size() ; i ++){
                                    HangSanXuat hsx = listHangSX.get(i);
                                    if (hsx.getTinhTrang()==0)
                                        continue;
                            %>
                            <option value=<%= hsx.getMaHang() %>><%= hsx.getTenHang() %></option>
                            <%}%>
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
                    <table width="1000px" border="0" cellspacing="0" cellpadding="0" style="margin-left:10px">
                        <tr>
                            <td width="459" height="36">Trang <a href="#">1</a> |</td>
                            <td align="right">Số sản phẩm trên trang </td>
                            <td><form method="post">
                                    <select name="soSachTrenTrang">
                                        <%
                                        for (int i = 1 ; i <= 10 ; i ++){
                                        if (i==5){
%>
<option value=<%= i%> selected=true><%= i%></option>
                           <% i++;}%>
                                        <option value=<%= i%> ><%= i%></option>
                                        <% } %>
                                    </select>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td width="417">&nbsp;</td>
                            <td width="45">&nbsp;</td>
                        </tr>
                        <tr>
                            <td height="201" colspan="3"><table width="99%" border="0" cellspacing="0" cellpadding="0">

                                    <%
                                    List<SanPham> list=null;
                                    String tensp = "";
                                    String mahang = "";
                                    if(request.getParameter("tenSanPham")!=null)
                                        tensp=request.getParameter("tenSanPham");
                                    
                                    if(request.getParameter("HangSanXuat")!=null)
                                        mahang = request.getParameter("HangSanXuat");
                                   
                                    String timkiem= (tensp+","+mahang);
                                    
                                        list=spdao.search(timkiem);
                                    
                                        //list = spdao.getList();
                                        for (int i = 0; i < list.size(); i++) {


                                    %>
                                    <tr>
                                      
                                            <%
                                                for (int j = i; j < i + 3 && j < list.size(); j++) {
                                                    SanPham sp = list.get(j);

                                            %>
                                              <td width="33%">
                                            <!-- sp 1 - 1 -->
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="san_pham">
                                                <tr>
                                                    <td><img src="images/laptop1.jpg" width="130" height="103" /></td>
                                                </tr>
                                                <tr>
                                                    <td class="ten_san_pham"><%=sp.getTenSanPham()%></td>
                                                </tr>
                                                <tr>
                                                    <td><span class="gia"><%=sp.getGia()%></span></td>
                                                </tr>
                                                <tr>
                                                    <td class="khuyen_mai"><%=0%></td>
                                                </tr>
                                            </table>
                                            <!-- sp 1 - 1 end -->
                                              </td>
                                            <% 

                                                } i += 2;%>
                                      
                                                
                                    </tr>
                                    <%                }
                                    %>
                                    <!--ket thuc 1 dong -->
                                </table>
                            </td>
                        </tr>
                        <tr>
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

