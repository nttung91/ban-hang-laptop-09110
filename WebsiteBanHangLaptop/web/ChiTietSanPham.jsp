<%-- 
    Document   : ChiTietSanPham
    Created on : Oct 3, 2012, 8:40:26 PM
    Author     : THANHTUNG
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="org.hibernate.HibernateException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.pojo.*,model.dao.*"%>
<%!    String username, password, maSanPham, loaiSanPham;
    boolean hasSanPham = true;
    SanPhamDAO daosp = new SanPhamDAO();
    LaptopDAO daolt = new LaptopDAO();
    LinhKienDAO daolk = new LinhKienDAO();
    SanPham sp;
    Laptop lt = new Laptop();
    LinhKien lk = new LinhKien();
    ArrayList<SanPham> gioHang;
%>
<%    //kiem tra dieu kien

    if (request.getParameter("logout") != null) {
        if (Boolean.parseBoolean(request.getParameter("logout").toString())) {
            session.invalidate();
        }
    }
    if (request.getParameter("daDangNhap") != null) {
        if (Boolean.parseBoolean(request.getParameter("daDangNhap").toString())) {
        }
    } else {
        session.setAttribute("daDangNhap", false);
    }

    if (request.getParameter("maSanPham") != null) {
        maSanPham = request.getParameter("maSanPham");

    } else {
        hasSanPham = false;
    }
    if (request.getParameter("loaiSanPham") != null) {
        loaiSanPham = request.getParameter("loaiSanPham");

    } else {
        hasSanPham = false;
    }
    // tuy chinh de test

    //maSanPham = "SP001";
    //loaiSanPham = "Laptop";
    if (hasSanPham) {
        if (loaiSanPham.equals("Laptop")) {
            lt = daolt.getObject(maSanPham);
            sp = lt.getSanPham();
        } else {
            lk = daolk.getObject(maSanPham);
            sp = lk.getSanPham();
        }

    } else {
        hasSanPham = true;
        maSanPham = "SP002";
        loaiSanPham = "LinhKien";
        if (loaiSanPham.equals("Laptop")) {
            lt = daolt.getObject(maSanPham);
            sp = lt.getSanPham();
        } else {
            lk = daolk.getObject(maSanPham);
            sp = lk.getSanPham();
        }
    }
    //kiem tra gio hang va lay san tu gio hang
    if (session.getAttribute("gioHang")!=null){
        gioHang = (ArrayList<SanPham>)session.getAttribute("gioHang");
    }
       else {
        gioHang = new ArrayList<SanPham>();
       }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title><%=maSanPham%></title>
        <link href="css/dang_nhap.css" rel="stylesheet" type="text/css" />
        <link href="css/thong_tin_san_pham.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery-1.8.2.min.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">
			$(function() {
            var offset = $("#giohang").offset();
         	var button = $("#btn_tim_kiem").position();
			  $("#giohang").css("top",button.top);
            $(window).scroll(function() {
                if ($(window).scrollTop() > button.top) {
                    $("#giohang").stop().animate({
                        top: 10
                    });
                } else {
                    $("#giohang").stop().animate({
                        top: button.top-$(window).scrollTop()
                    });
                };
            });
        });
		
		
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
   <!--pop up gio hang-->
    <div id="giohang">
    <div id="title">Ban co <%=gioHang.size()%> </br>san pham</br>trong gio</div>
    
    <div id="chitietgiohang">
        <%
for (int i = 0;i<gioHang.size();i++)
{       %>     
<a href="ChiTietSanPham.jsp?loaiSanPham=Laptop&maSanPham=<%=gioHang.get(i).getMaSanPham()%>"><li><%=gioHang.get(i).getTenSanPham()%></li></a>
          <%      }  
    %>
                </div>
    <div>
        <a href="GioHang.jsp"><input type="button" value="Xem chi tiet" /></a>
    </div>
    </div>
   <!--pop up gio hang-->
        <table align="center" width="1000" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td height="50" colspan="3" id="banner_container"><table width="1000px" height="197" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="200" height="56">&nbsp;</td>
                            <td width="482"></td>
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
                            <td height="50px" width="137"><a href="http://www.google.com"><img src="images/CartMenu.png" width="100%" height="50px"/></a></td>
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
                    <table width="933" cellpadding="0" cellspacing="0" style="margin-top:10px; ">
                        <tr>
                            <td colspan="2" rowspan="7" id="hinh_anh_sp_chi_tiet"><img src="<% if (hasSanPham) {
                                    out.print(sp.getHinhAnh());
                                }%>" alt="no image" width="300" height="217" /></td>
                            <td height="39" id="ten_san_pham"><% if (hasSanPham) {
                                    out.println(sp.getTenSanPham());
                                }%></td>
                            <td height="39" colspan="2" id="ten_san_pham">&nbsp;</td>
                        </tr>
                        <tr>
                            <td width="505" class="text_thong_tin_san_pham">Mã số</td>
                            <td colspan="2" class="text_thong_tin_san_pham">:</td>
                        </tr>
                        <tr>
                            <td class="text_thong_tin_san_pham">Nhà sản xuất</td>
                            <td colspan="2" class="text_thong_tin_san_pham">:
                                <% if (hasSanPham) {
                                        out.println(sp.getHangSanXuat().getTenHang());
                                    }%></td>
                        </tr>
                        <tr>
                            <td class="text_thong_tin_san_pham">Bảo hành</td>
                            <td colspan="2" class="text_thong_tin_san_pham">: <% if (hasSanPham) {
                                    out.println(sp.getThoiGianBaoHanh() + " Tháng");
                                }%></td>
                        </tr>
                        <tr>
                            <td class="text_thong_tin_san_pham">Ngày cập nhật</td>
                            <td colspan="2" class="text_thong_tin_san_pham">:
                                <% if (hasSanPham) {
                                        out.println(myLib.DateConvertor.formatUtilDate(sp.getNgayCapNhat()));
                                    }%></td>
                        </tr>
                        <tr>
                            <td height="55" colspan="2" class="gia_san_pham"><% if (hasSanPham) {
                                    out.println(myLib.CurrencyConvertor.AmountToCurrencyFomat(sp.getGia(), "VND"));
                                                                           }%></td>
                            <td width="505" class="gia_san_pham"><a href="GioHang.jsp?Action=Add&maSanPham=<%=maSanPham%>"><img src="images/addtocart.png" alt="no image" width="159" height="35" /></a></td>
                        </tr>
                        <tr>
                            <td height="38" colspan="3" >
                                <p>
                                    <%
                                        if (hasSanPham) {
                                            Iterator<ChiTietKhuyenMai> it = sp.getChiTietKhuyenMais().iterator();
                                            while (it.hasNext()) {
                                                ChiTietKhuyenMai ctkm = it.next();
                                                out.println("<li class='khuyen_mai'>" + ctkm.getKhuyenMai().getNoiDungKhuyenMai() + "</li>");;
                                            }
                                        }

                                    %>
                                </p>

                            </td>
                        </tr>
                        <tr>
                            <td height="24">&nbsp;</td>
                            <td height="24">&nbsp;</td>
                            <td height="24">&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;Thông tin thêm</td>
                            <td height="24">&nbsp;</td>
                            <td height="24">&nbsp;</td>
                        </tr>
                        <tr>
                            <td width="505" colspan="5" style="vertical-align:top;">
                                <div class="container">
                                    <table width="100%" height="100%" align="left" class="<% if (loaiSanPham.equals("Laptop")) {
                                        out.println("showed");
                                    } else {
                                        out.println(
                                                "hidden");
                                    }%>">
                                        <tr>
                                            <td  colspan="4"><div bgcolor="#0066CC" class="text_header">Thông số kỹ thuật</div></td>
                                        </tr>
                                        <tr>
                                            <td width="22%" class="text_thong_tin_san_pham">CPU</td>
                                            <td width="25%" class="text_thong_tin_san_pham">:
                                                <% if (hasSanPham && lt != null) {
                                                    out.println(lt.getChipCpu());
                                                }%></td>
                                            <td width="47%">&nbsp;</td>
                                            <td width="6%">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="text_thong_tin_san_pham">Kích Thước Màn Hình</td>
                                            <td class="text_thong_tin_san_pham">:
                                                <% if (hasSanPham && lt != null) {
                                                    out.println(lt.getManHinh() + "Inch");
                                                }%></td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="text_thong_tin_san_pham">RAM</td>
                                            <td class="text_thong_tin_san_pham">:
                                                <% if (hasSanPham && lt != null) {
                                                    out.println(lt.getRam());
                                                }%></td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="text_thong_tin_san_pham">Ổ Cứng</td>
                                            <td class="text_thong_tin_san_pham">:
                                                <% if (hasSanPham && lt != null) {
                                                    out.println(lt.getOCung());
                                                }%></td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="text_thong_tin_san_pham">Đĩa quang</td>
                                            <td class="text_thong_tin_san_pham">:
                                                <% if (hasSanPham && lt != null) {
                                                    out.println(lt.getDiaQuang());
                                                }%></td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="text_thong_tin_san_pham">VGA</td>
                                            <td class="text_thong_tin_san_pham">:
                                                <% if (hasSanPham && lt != null) {
                                                    out.println(lt.getCardDoHoa());
                                                }%></td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="text_thong_tin_san_pham">Wireless</td>
                                            <td class="text_thong_tin_san_pham">:
                                                <% if (hasSanPham && lt != null) {
                                                    out.println(lt.getCardKhongDay());
                                                }%></td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="text_thong_tin_san_pham">OS</td>
                                            <td class="text_thong_tin_san_pham">:
                                                <% if (hasSanPham && lt != null) {
                                                    out.println(lt.getHeDieuHanh());
                                                }%></td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="text_thong_tin_san_pham">Tính năng khác</td>
                                            <td class="text_thong_tin_san_pham">:
                                                <% if (hasSanPham && lt != null) {
                                                    out.println(lt.getTinhNangKhac());
                                                }%></td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="text_thong_tin_san_pham">Pin</td>
                                            <td class="text_thong_tin_san_pham">:
                                                <% if (hasSanPham && lt != null) {
                                                    out.println(lt.getPin());
                                                }%></td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="text_thong_tin_san_pham">Trọng lượng</td>
                                            <td class="text_thong_tin_san_pham">:
                                                <% if (hasSanPham && lt != null) {
                                                    out.println(lt.getCanNang());
                                                }%></td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </div>

                                <div class="container">
                                    <div class="<% if (loaiSanPham.equals(
                                                "Laptop")) {
                                            out.println("hidden");
                                        } else {
                                      out.println(
                                              "showed");
                                  }%>">
                                        <div bgcolor="#0066CC" class="text_header">Thông tin chi tiết</div>
                                        <div style="margin-top:0px;top:0px;left:0px; ">
                                            <ul><% if (hasSanPham) {
                                                    String s = lk.getMoTa();
                                                    String[] arr = s.split("</br>");
                                                    for (int i = 0; i < arr.length; i++) {
                                                        out.println("<li class='chi_tiet_phu_kien'>" + arr[i] + "</li>");
                                                                                         }
                                                                                     }%>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="container">
                                    <div class="text_header">Sản phầm tương tự</div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <!-- End of Main content -->
            <tr>
                <td colspan="3"><img src="images/footer1.jpg" width="1000" /></td>
            </tr>
        </table>
    </body>
</html>
