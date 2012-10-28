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
    boolean isItemExist = false;
    if (hasSanPham) {
		out.println("<script>alert("+maSanPham+loaiSanPham+")</script>");
        if (loaiSanPham.equals("Laptop")) {
            lt = daolt.getObject(maSanPham);
            if (lt != null) {
                sp = lt.getSanPham();
                isItemExist = true;
            }

        } else {
            lk = daolk.getObject(maSanPham);
            if (lk != null) {
                sp = lk.getSanPham();
                isItemExist = true;
            }
        }
        if (sp == null) {
            isItemExist = false;
        }

    } else {
        isItemExist = false;
    }
    //kiem tra gio hang va lay san tu gio hang
    if (session.getAttribute("gioHang") != null) {
        gioHang = (ArrayList<SanPham>) session.getAttribute("gioHang");
    } else {
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
		
		
            
        </script>
    </head>

    <body topmargin="-10px">
        <!--pop up gio hang-->
        <div id="giohang">
            <div id="title">Ban co <%=gioHang.size()%> </br>san pham</br>trong gio</div>

            <div id="chitietgiohang">
                <%
            for (int i = 0; i < gioHang.size(); i++) {%>     
                <a href="ChiTietSanPham.jsp?loaiSanPham=Laptop&maSanPham=<%=gioHang.get(i).getMaSanPham()%>"><li><%=gioHang.get(i).getTenSanPham()%></li></a>
                <%      }
                %>
            </div>
            <div>
                <a href="GioHang.jsp"><input type="button" value="Xem chi tiet" /></a>
            </div>
        </div>
        <!--pop up gio hang-->
        <jsp:include page="header.jsp"/>

        <% if (isItemExist) {%>
        <table align="center" width="1000" border="0" cellpadding="0" cellspacing="0">

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
                            <td width="505" class="gia_san_pham"><a href="GioHang.jsp?Action=ThemVaoGio&maSanPham=<%=maSanPham%>"><img src="images/addtocart.png" alt="no image" width="159" height="35" /></a></td>
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
                                            <ul><% if (hasSanPham && loaiSanPham.equals("LinhKien")) {
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
        </table>
        <%} else {%>
        <div align="center" style="width:100%;"><h3>Sản phẩm không tồn tại !!</h3></div>

        <%                            }

        %>
        <!-- End of Main content -->
        <jsp:include page="footer.jsp"/>        
    </body>
</html>
