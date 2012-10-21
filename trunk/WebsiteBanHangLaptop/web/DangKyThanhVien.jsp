<%--
    Document   : DangKyThanhVien
    Created on : Sep 30, 2012, 6:36:35 PM
    Author     : THANHTUNG
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="org.hibernate.HibernateException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.pojo.*,model.dao.*"%>
<%!    String tenDanhNhap, matKhau, email, hoTen, gioiTinh, ngaySinh, dienThoai, thanhPho, nhapLaiMatKhau, nhapLaiEmail, diaChi;
    String[] info = null;
    String[] listVal;
    String kq = "";
    boolean isMore = true;
    String captchaInput, createdCaptcha;

    private String checkData(HttpServletRequest request, HttpSession session) {
        boolean oke = true;
        listVal = new String[10];
        if (request.getParameter("tenDangNhap") != null) {
            tenDanhNhap = request.getParameter("tenDangNhap");
            listVal[0] = tenDanhNhap;
        } else {
            oke = false;
        }
        if (request.getParameter("matKhau") != null) {
            matKhau = request.getParameter("matKhau");
        } else {
            oke = false;
        }
        if (request.getParameter("nhapLaiMatKhau") != null) {
            nhapLaiMatKhau = request.getParameter("nhapLaiMatKhau");
        } else {
            oke = false;
        }
        if (request.getParameter("email") != null) {
            email = request.getParameter("email");
            listVal[1] = email;
        } else {
            oke = false;
        }
        if (request.getParameter("nhapLaiEmail") != null) {
            nhapLaiEmail = request.getParameter("nhapLaiEmail");
        } else {
            oke = false;
        }


        if (isMore) {
            if (request.getParameter("tenKhachHang") != null) {
                hoTen = request.getParameter("tenKhachHang");
                listVal[2] = hoTen;
            } else {
                oke = false;
            }

            if (request.getParameter("gioiTinh") != null) {
                gioiTinh = request.getParameter("gioiTinh");
                listVal[3] = gioiTinh;
            } else {
                oke = false;
            }
            if (request.getParameter("dienThoai") != null) {
                dienThoai = request.getParameter("dienThoai");
                listVal[7] = dienThoai;
            } else {
                oke = false;
            }
            if (request.getParameter("thanhPho") != null) {
                thanhPho = request.getParameter("thanhPho");
                listVal[8] = thanhPho;
            } else {
                oke = false;
            }
            if (request.getParameter("diaChi") != null) {
                diaChi = request.getParameter("diaChi");
                listVal[9] = thanhPho;
            } else {
                oke = false;
            }



            listVal[4] = request.getParameter("ngay");
            listVal[5] = request.getParameter("thang");
            listVal[6] = request.getParameter("nam");
        }
        session.setAttribute("listVal", listVal);
        info = listVal;
        if (!oke) {
            kq += "Các mục (*) không được bỏ trống.</br>";
        } else {

            boolean f = true;
            if (!matKhau.equals(nhapLaiMatKhau)) {
                kq += "Mật khẩu nhập lại không trùng khớp</br>";
                f = false;
            }
            if (!email.equals(nhapLaiEmail)) {
                kq += "Email nhập lại không trùng khớp</br>";
                f = false;
            }
            if (!myLib.RegexChecking.CheckEmail(email)) {
                kq += "Email không đúng !</br>";
                f = false;
            }
            if (!myLib.RegexChecking.CheckDienThoai(dienThoai) && isMore) {
                kq += "Số Điện Thoại không đúng !";
                f = false;
            }
            if (request.getParameter("inputCaptcha") != null) {
                captchaInput = request.getParameter("inputCaptcha");
                createdCaptcha = request.getParameter("createdCaptcha");
                if (createdCaptcha != null) {

                    createdCaptcha = createdCaptcha.replaceAll(" ", "");
                    if (captchaInput.equals(createdCaptcha)) {
                    } else {
                        kq += "Ma xac nhan khong chinh xac !";
                        f = false;
                    }
                }
            } else {
                kq += "Ban chua nhap ma xac nhan!";
                f = false;
            }
            if (f) {
                //check trung lap trong csdl
                boolean f1 = true;
                //1. kiem tra ten dang nhap ton tai
                KhachHangTrucTuyenDAO khDao = new KhachHangTrucTuyenDAO();
                if (khDao.isUsernameTonTai(tenDanhNhap)) {
                    kq += "Tên đăng nhap da ton tai</br>";
                    f1 = false;
                }
                // String pass
                //2.kiem tra email trung lap
                if (khDao.isEmailTonTai(email)) {
                    kq += "Email da ton tai</br>";
                    f1 = false;
                }
                if (f1) {
                    //luu vao csdl
                    KhachHangDAO khachHangDao = new KhachHangDAO();
                    KhachHangTrucTuyenDAO khachhangttDao = new KhachHangTrucTuyenDAO();
                    KhachHangTrucTuyen khtt = new KhachHangTrucTuyen();
                    khtt.setUsername(tenDanhNhap);
                    khtt.setMatKhau(myLib.MD5Convertor.Convert2MD5(matKhau));
                    //khtt.setHoTen(hoTen);
                    khtt.setEmail(email);
                    if (!isMore) {
                        try {
                            khachhangttDao.saveOrUpdateObject(khtt);
                        } catch (HibernateException ex) {
                            kq += "Dang ky that bai</br>";
                            kq += ex.toString();
                        }
                    } else {


                        KhachHang kh = new KhachHang();
                        String maKhachHang = khachHangDao.generateKeyCode("KhachHang", "maKhachHang", "KH");
                        kh.setMaKhachHang(maKhachHang);
                        kh.setTenKhachHang(hoTen);
                        kh.setDienThoai(dienThoai);
                        kh.setDiaChi(diaChi);
                        kh.setThanhPho(thanhPho);
                        Date ns = new Date(Integer.parseInt(listVal[6]), Integer.parseInt(listVal[5]), Integer.parseInt(listVal[4]));
                        kh.setNgaySinh(ns);
                        kh.setGioiTinh(Integer.parseInt(gioiTinh));
                        khtt.setKhachHang(kh);

                        //kh.setNgaySinh();
                        try {
                            khachhangttDao.saveOrUpdateObject(khtt);
                        } catch (HibernateException ex) {
                            kq += "Dang ky that bai</br>";
                            kq += ex.toString();
                        }
                    }
                }
            }

        }
        return kq;
    }

%>
<%    //kiem tra dieu kien
    if (request.getParameter("logout") != null) {
        if (Boolean.parseBoolean(request.getParameter("logout").toString())) {
            session.setAttribute("daDangNhap", false);
        }
    }
    if (session.getAttribute("daDangNhap") != null) {
    } else {
        //chua dang nhap
        session.setAttribute("daDangNhap", false);
    }
    kq = "";
    if (checkData(request, session).equals("")) {
        //dang ky thanh cong
        //remove tham so dang ky
        session.removeAttribute("listVal");
        info = null;
        session.setAttribute("tenDangNhap", tenDanhNhap);
        session.setAttribute("daDangNhap", true);
        response.sendRedirect("DangNhap.jsp");
    }
    if (info == null) {
        info = new String[10];
    }
    if (request.getParameter("isMore") != null) {
        if (request.getParameter("isMore").equals("noMore")) {
            isMore = false;
        }
        //isMore = Boolean.parseBoolean(request.getParameter("isMore"));
        out.println("<h2>" + request.getParameter("isMore") + "</h2>");
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
        <link href="css/dang_nhap.css" rel="stylesheet" type="text/css" />
        <script src="js/dangky.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript">
              
            function optionCustomerInfo(){
                var option = document.getElementById('khachhang_info');
                var btn= document.getElementById('More');
                var btn_more = document.getElementById('btn_More');
                if (option.style.display == "none"){
                    option.style.display = "block";
                    btn.value = "More";
                    btn_more.value = "Nhap sau";	 
                } 
                else {
                    option.style.display = "none";
                    btn.value = "noMore";
                    btn_more.value = "Nhap thong tin";
                }
                //alert(check.value);
  
                      
            }
            window.onload = function()
            {
                DrawCaptcha();
                var i=0;
                for (i = 1;i <=31;i++)
                {
                    var elOptNew = document.createElement('option');
                    elOptNew.text = i ;
                    elOptNew.value = i;
                    elOptNew.id = "ngay"+i;
                      
                    var elSel = document.getElementById('ngay');
                    try {
                        elSel.add(elOptNew, null); // standards compliant; doesn't work in IE
                    }
                    catch(ex) {
                        elSel.add(elOptNew); // IE only
                    }
                }
                var elSel = document.getElementById("ngay"+<%if (info[4] != null) {
                        out.print(info[4]);
                    } else {
                        out.print("1");
                    }%>);
                            elSel.selected = true;
                  
                            for (i = 1;i <=12;i++)
                            {
                                var elOptNew = document.createElement('option');
                                elOptNew.text = i ;
                                elOptNew.value = i;
                                elOptNew.id = "thang"+i;
                                var elSel = document.getElementById('thang');
                                try {
                                    elSel.add(elOptNew, null); // standards compliant; doesn't work in IE
                                }
                                catch(ex) {
                                    elSel.add(elOptNew); // IE only
                                }
                            }
                            var elSel1 = document.getElementById("thang"+<%if (info[5] != null) {
                                    out.print(info[5]);
                                } else {
                                    out.print("1");
                                }%>);
                                        if  (elSel1 != null) elSel1.selected = true;
                                        var d = new Date();
                                        var elSel = document.getElementById('nam');
                                        for (i = 1912;i <= d.getFullYear();i++)
                                        {
                                            var elOptNew = document.createElement('option');
                                            elOptNew.text = i ;
                                            elOptNew.value = i;
                                            elOptNew.id="year"+i;
                                            try {
                                                elSel.add(elOptNew, null); // standards compliant; doesn't work in IE
                                            }
                                            catch(ex) {
                                                elSel.add(elOptNew); // IE only
                                            }
                     
                                        }
                                        var currentyear = document.getElementById("year"+<%if (info[6] != null) {
                                                out.print(info[6]);
                                            } else {
                                                out.print("(i-10)");
                                            }%>);
                                                    currentyear.selected = true;
                                                    //set value get from session
                                                    // setListValue();	
                  
                  
          
                                                }
             
                                              
        </script>
    </head>

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
                <td colspan="2">
                    <!-- Main content -->
                    <form method="get" action="">
                        <% if (session.getAttribute("listVal") != null) {
                                info = (String[]) session.getAttribute("listVal");
                            }%>
                        <div id="dangky_info" >
                            <table width="100%" style="margin-top:10px">
                                <tr>
                                    <td colspan="2" class="login_header_td">Thông tin đăng nhập</td>
                                </tr>
                                <tr>
                                    <td class="text_reg">&nbsp;</td>
                                    <td class="text_input"><p id="errorList"><%=kq%></p></td>
                                </tr>
                                <tr>
                                    <td class="text_reg">Tên Đăng nhập(<span style="color:#F00">*</span>)</td>
                                                                  <td class="text_input"><input class="text_input" id="tenDangNhap" name="tenDangNhap" type="text" size="30"  maxlength="50" value="<% if (info[0] != null) {
                                                                          out.println(info[0]);
                                                                      }%>"/></td>
                                </tr>
                                <tr>
                                    <td class="text_reg">Mật Khẩu(<span style="color:#F00">*</span>)</td>
                                    <td  ><input class="text_input" name="matKhau" type="password" size="30" maxlength="50" /></td>
                                </tr>
                                <tr>
                                    <td class="text_reg">Nhập lại mật khẩu(<span style="color:#F00">*</span>)</td>
                                    <td  ><input class="text_input" name="nhapLaiMatKhau" type="password" size="30" maxlength="50" /></td>
                                </tr>
                                <tr>
                                    <td class="text_reg">Địa chỉ email(<span style="color:#F00">*</span>)</td>
                                                 <td  ><input class="text_input" id="email" name="email" type="text" size="30" maxlength="50" value="<% if (info[1] != null) {
                                                         out.println(info[1]);
                                                     }%>"/></td>
                                </tr>
                                <tr>
                                    <td class="text_reg">Nhập Lại Địa chỉ email(<span style="color:#F00">*</span>)</td>
                                                 <td  ><input class="text_input" name="nhapLaiEmail" type="text" size="30" maxlength="50" value="<% if (info[1] != null) {
                                                         out.println(info[1]);
                                                     }%>"/></td>
                                </tr>
                                <tr>
                                    <td class="text_reg">Nhập thông tin cá nhân</td>
                                    <td  ><input type="button" value="Nhap sau" id="btn_More" onclick="optionCustomerInfo()" />
                                        <input type="hidden" name="isMore" id="More" value="More" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="khachhang_info" style="display:<% if (isMore) {
                                out.println("block");
                            } else {
                                out.println("none");
                            }%>;">
                            <table width="100%">
                                <tr>
                                    <td colspan="2" class="login_header_td">Thông tin khách hàng</td>
                                </tr>
                                <tr>
                                    <td class="text_reg">Họ và Tên(<span style="color:#F00">*</span>)</td>
                                    <td  ><input class="text_input" id="tenKhachHang" name="tenKhachHang" type="text" size="30" maxlength="50" value="<% if (info[2] != null) {
                                            out.println(info[2]);
                                        }%>"/></td>
                                </tr>
                                <tr>
                                    <td class="text_reg">Giới Tính(<span style="color:#F00">*</span>)</td>
                                               <td><input name="gioiTinh" id="gioiTinh" type="radio" value="0" <% if (info[3] != null && info[3].equals("0")) {
                                                       out.print("checked");
                                                   }%>/>
                                        Nam
                                               <input name="gioiTinh" type="radio" value="1" <% if (info[3] != null && info[3].equals("1")) {
                                                       out.print("checked");
                                                   }%>/>
                                        Nữ</td>
                                </tr>
                                <tr >
                                    <td class="text_reg">Ngày Sinh(<span style="color:#F00">*</span>)</td>
                                    <td style=" float:left;vertical-align:middle;" >Ngay
                                        <select id="ngay" name="ngay">
                                        </select>
                                        Thang
                                        <select id="thang" name="thang">
                                        </select>
                                        Nam
                                        <select id="nam" name="nam">
                                        </select></td>
                                </tr>
                                <tr>
                                    <td class="text_reg">Điện Thoại(<span style="color:#F00">*</span>)</td>
                                                 <td  ><input class="text_input" id="dienThoai" name="dienThoai" type="text" size="30" maxlength="50" value="<% if (info[7] != null) {
                                                         out.println(info[7]);
                                                     }%>" /></td>
                                </tr>
                                <tr>
                                    <td class="text_reg">Địa Chỉ(<span style="color:#F00">*</span>)</td>
                                                 <td  ><input class="text_input" id="diaChi" name="diaChi" type="text" size="30" maxlength="50" value="<% if (info[9] != null) {
                                                         out.println(info[9]);
                                                     }%>" /></td>
                                </tr>
                                <tr>
                                    <td class="text_reg">Thành Phố(<span style="color:#F00">*</span>)</td>
                                                 <td  ><input class="text_input" id="thanhPho" name="thanhPho" type="text" size="30" maxlength="50" value="<% if (info[8] != null) {
                                                         out.println(info[8]);
                                                     }%>" /></td>
                                </tr>
                            </table>
                        </div>



                        <div style="padding-left:210px;">
                            <input type="text" id="txtInput" name="inputCaptcha" width="10"/>
                            <input type="text" id="txtCaptcha" name="createdCaptcha"
                                   style="background-image:url(images/1.JPG); text-align:center; border:none;
                                   font-weight:bold; font-family:Modern; font-size:18px;"/>
                            <input type="button" id="btnrefresh" value="Refresh" onclick="DrawCaptcha();" />
                        </div>

                        <div id="control">
                            <input name="dangKy" type="submit" value="Đăng Ký"/>&nbsp;<a href="DangKyThanhVien.jsp"><input name="nhapLai" type="button" value="Nhập Lại"/></a>
                        </div>
                    </form>
                    <p>&nbsp;</p>
                    <p>&nbsp; </p>
                </td>
                <td width="4">&nbsp;</td>
            </tr>
            <!-- End of Main content -->
            <tr>
                <td colspan="3"><img src="images/footer1.jpg" width="1000" /></td>
            </tr>
        </table>
    </body>
</html>
