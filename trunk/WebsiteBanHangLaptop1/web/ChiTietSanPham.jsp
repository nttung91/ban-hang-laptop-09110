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

<%
    boolean isItemExist = false;
    boolean hasSanPham = true;

    Laptop lt = new Laptop();
    LinhKien lk = new LinhKien();
    SanPham sp = null;
    String loaiSanPham = null, maSanPham = null;
    ArrayList<SanPham> gioHang;
     
     out.println(request.getContextPath());
    if (session.getAttribute("GioHang") != null) {
        gioHang = (ArrayList<SanPham>) session.getAttribute("GioHang");
        // out.println("set masp1");
    } else {
        gioHang = new ArrayList<SanPham>();
        //out.println("set masp2");
    }

    if (request.getAttribute("sanPham") != null) {
        sp = (SanPham) request.getAttribute("sanPham");
    }
    if (request.getAttribute("isItemExist") != null) {
        isItemExist = (Boolean) request.getAttribute("isItemExist");
    }
    if (request.getAttribute("hasSanPham") != null) {
        hasSanPham = (Boolean) request.getAttribute("hasSanPham");
    }
    if (request.getAttribute("loaiSanPham") != null) {
        loaiSanPham = request.getAttribute("loaiSanPham").toString();
    }
    if (request.getAttribute("laptop") != null) {
        lt = (Laptop) request.getAttribute("laptop");
    }
    if (request.getAttribute("linhkien") != null) {
        lk = (LinhKien) request.getAttribute("linhkien");
    }
     out.println(request.getMethod());
      if (sp!=null){
                (new SanPhamDAO()).tangSoLuotXem(sp, 1);
            }

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title><%=maSanPham%></title>
        <link href="css/dang_nhap.css" rel="stylesheet" type="text/css" />
        <link href="css/thong_tin_san_pham.css" rel="stylesheet" type="text/css" />
        <link href="css/giohangsub.css" type="text/css" rel="stylesheet"/>
        <script src="js/jquery-1.8.2.min.js" type="text/javascript"></script>
         <script type="text/javascript" src="js/jquery.fancybox.js?v=2.1.3"></script>
	<link rel="stylesheet" type="text/css" href="css/jquery.fancybox.css?v=2.1.2" media="screen" />
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
            $(function(){
                $box = $('#chitietgiohang');
                $box.children("a").each(function(){
                    $box1 = $(this);
                    $box1.children().each(function(){
                        if ($box.width() < $(this).width()) {
                            $(this).wrap('<marquee>');
                        }
                    });
                    
                });
            });
			$(document).ready(function() {
			$("#soLuong").keydown(function(event) {
        // Allow: backspace, delete, tab, escape, and enter
        if ( event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 || 
             // Allow: Ctrl+A
            (event.keyCode == 65 && event.ctrlKey === true) || 
             // Allow: home, end, left, right
            (event.keyCode >= 35 && event.keyCode <= 39)) {
                 // let it happen, don't do anything
                 return;
        }
        else {
            // Ensure that it is a number and stop the keypress
            if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 )) {
                event.preventDefault(); 
            }   
        }
    });
			// Disable opening and closing animations, change title type
			$(".fancybox-effects-b").fancybox({
				openEffect  : 'fade',
				closeEffect	: 'fade',
				
				helpers : {
					title : {
						type : 'over'
					}
				}
			});
				});
        </script>
        <style type="text/css">
		.fancybox-custom .fancybox-skin {
			box-shadow: 0 0 50px #222;
		}
	</style>
    </head>

    <body topmargin="-10px">
        <!--pop up gio hang-->
        <div id="giohang">
            <div id="title">Ban co <%=gioHang.size()%> </br>san pham</br>trong gio</div>
            <%out.println(gioHang.size());%>
            <div id="chitietgiohang">
            <%
                    for (int i = 0; i < gioHang.size(); i++) {
                        SanPhamDAO spdao = new SanPhamDAO();
                %>     
                <a href="ChiTietSanPham.jsp?loaiSanPham=<%=spdao.getLoaiSanPham(gioHang.get(i).getMaSanPham())%>&maSanPham=<%=gioHang.get(i).getMaSanPham()%>">
                    <li><%=gioHang.get(i).getTenSanPham()%></li>
                </a>
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

        <!-- Main content -->
        <table width="1000px" cellpadding="0" cellspacing="0"  align="center">
            <tr>
                <td width="45%" rowspan="8" id="hinh_anh_sp_chi_tiet">
					<a class="fancybox-effects-b" href="<% if (hasSanPham) {
                            out.print(sp.getHinhAnh());
                        }%>" title="<% if (hasSanPham) {
                            out.print(sp.getTenSanPham());
                        }%>"><img src="<% if (hasSanPham) {
                            out.print(sp.getHinhAnh());
                        }%>" alt=""  width="300" height="217"/></a>
                </td>
                <td width="22%" height="39" id="ten_san_pham"><% if (hasSanPham) {
                        out.println(sp.getTenSanPham());
                    }%></td>
                <td height="39" colspan="2" id="ten_san_pham">&nbsp;</td>
            </tr>
            <tr>
                <td class="text_thong_tin_san_pham_even">Mã số</td>
                <td colspan="2" class="text_thong_tin_san_pham_even">: <%out.println(sp.getMaSanPham());%></td>
            </tr>
            <tr>
                <td class="text_thong_tin_san_pham">Nhà sản xuất</td>
                <td colspan="2" class="text_thong_tin_san_pham">:
                    <% if (hasSanPham) {
                            out.println(sp.getHangSanXuat().getTenHang());
                        }%></td>
            </tr>
            <tr>
                <td class="text_thong_tin_san_pham_even">Bảo hành</td>
                <td colspan="2" class="text_thong_tin_san_pham_even">: <% if (hasSanPham) {
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
                <td class="text_thong_tin_san_pham_even">Số Lượt xem</td>
                <td colspan="2" class="text_thong_tin_san_pham_even">:
                    <% if (hasSanPham) {
                            out.println(sp.getSoLuotXem());
                        }%></td>
            </tr>
            <tr>
            <form action="GioHang.do" method="post">
                <input type="hidden" name="Action" value="ThemVaoGio" />
                <input type="hidden" name="maSanPham" value="<%=sp.getMaSanPham()%>" />
              
                <td class="text_thong_tin_san_pham"><label for="soLuong">Số Lượng</label><input type="text" name="soLuong" id="soLuong" style="margin-left:5px;width:100px" value="1" /> </td>
                <td width="33%" class="gia_san_pham">  <input type="submit" value="" style="background-image:url(images/addtocart.png);background-repeat:no-repeat;background-size:100% 100%;width:159px;height:35px;" /></td>
            </form>
            </tr>
            <tr>
                <td height="38" colspan="3" class="gia_san_pham"><% if (hasSanPham) {
                        out.println(myLib.CurrencyConvertor.AmountToCurrencyFomat(sp.getGia(), "VND"));
                    }%>
                </td>
            </tr>
            <tr>
                <td height="24">&nbsp;</td>
                <td height="24" colspan="3"> <p>
                        <%
                            if (hasSanPham) {
                                Iterator<ChiTietKhuyenMai> it = sp.getChiTietKhuyenMais().iterator();
                                while (it.hasNext()) {
                                    ChiTietKhuyenMai ctkm = it.next();
                                    out.println("<li class='khuyen_mai'>" + ctkm.getKhuyenMai().getNoiDungKhuyenMai() + "</li>");;
                                }
                            }

                        %>
                    </p></td>
            </tr>
            <tr>
                <td colspan="4" style="vertical-align:top;">
                    <div class="container">
                        <table width="100%" cellpadding="0" cellspacing="0" class="<% if (loaiSanPham.equals("laptop")) {
                                out.println("showed");
                            } else {
                                out.println(
                                        "hidden");
                            }%>" style="margin-top:10px;">
                            <tr>
                                <td height="38"  colspan="4"><div bgcolor="#0066CC" class="text_header">Thông số kỹ thuật</div></td>
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
                                <td class="text_thong_tin_san_pham_even"><label>Kích Thước Màn Hình</label></td>
                                <td class="text_thong_tin_san_pham_even">:
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
                                <td class="text_thong_tin_san_pham_even">Ổ Cứng</td>
                                <td class="text_thong_tin_san_pham_even">:
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
                                <td class="text_thong_tin_san_pham_even">VGA</td>
                                <td class="text_thong_tin_san_pham_even">:
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
                                <td class="text_thong_tin_san_pham_even">OS</td>
                                <td class="text_thong_tin_san_pham_even">:
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
                                            if (lt.getTinhNangKhac() != null) {
                                                out.println(lt.getTinhNangKhac());
                                            } else {
                                                out.println("Không có");
                                            }
                                        }%></td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="text_thong_tin_san_pham_even">Pin</td>
                                <td class="text_thong_tin_san_pham_even">:
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


                    <div class="<% if (loaiSanPham.equals(
                                "laptop")) {
                            out.println("hidden");
                        } else {
                            out.println(
                                    "showed");
                        }%>">
                        <div bgcolor="#0066CC" class="text_header">Thông số kỹ thuật</div>
                        <div style="margin-top:0px;top:0px;left:0px; ">
                            <ul><% if (hasSanPham && loaiSanPham.equals("linhkien")) {
                                    String s = lk.getMoTa();
                                    String[] arr = s.split("</br>");
                                    for (int i = 0; i < arr.length; i++) {
										if (i%2==0)
                                        out.println("<li class='chi_tiet_phu_kien'>" + arr[i] + "</li>");
										else 
										out.println("<li class='chi_tiet_phu_kien_even'>" + arr[i] + "</li>");
                                    }
                                }%>
                            </ul>
                        </div>
                    </div>


                    <div class="text_header">Sản phầm tương tự</div>

                </td>
            </tr>
        </table>

<%} else {%>
        <div align="center" style="width:100%;"><h3>Sản phẩm không tồn tại !!</h3></div>

        <%                            }

        %>
        <!-- End of Main content -->

    </body>
</html>
