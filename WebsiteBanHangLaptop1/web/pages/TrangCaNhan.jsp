<%--
    Document   : DangKyThanhVien
    Created on : Sep 30, 2012, 6:36:35 PM
    Author     : THANHTUNG
--%>

<%@page import="Gobal.Parameters"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
        <link href="css/trangcanhan.css" rel="stylesheet" type="text/css" />
        <link href="css/cmxform.css" rel="stylesheet" type="text/css" />
        <link href="css/jquery.realperson.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery-1.8.2.min.js" language="javascript" type="text/javascript"></script>
        <script src="js/jquery.validate.js" type="text/javascript"></script>
        <script src="js/jquery.metadata.js" type="text/javascript"></script>
        <script src="js/dangky.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/jquery.realperson.js"></script>
        <link rel="stylesheet" href="css/jquery-ui.css" />

        <script src="js/jquery-ui.js"></script>

        <script language="javascript" type="text/javascript">
		
            function processResetForm(){
                //alert("tung"); 
                $("#signupForm").find("input[type=text]").val("");
                $("#signupForm").find("input[type=email]").val("");
				
            }
            window.onload = function()
            {
                if ($('#khachhang_info').css('display') == 'none'){
                    
                    $('#btn_More').val("Nhập thông tin");
                                        
                }
                else
                {
                    if ($('#khachhang_info').css('display') == 'block') {
                        $('#btn_More').val("Nhập sau");
                    }
                }
            }
            function optionCustomerInfo(){
                if ($('#khachhang_info').css('display') == 'none'){
                    $('#khachhang_info').show('slow');
                    $('#More').val("More");
                    $('#btn_More').val("Nhập sau");
                                        
                }
                else
                {
                    if ($('#khachhang_info').css('display') == 'block') {
                        $('#khachhang_info').hide('slow');
                        $('#More').val("noMore");
                        $('#btn_More').val("Nhập thông tin");
                    }
                }
             
            }
            $(function() {
                $( "#datepicker" ).datepicker({ dateFormat: "dd/mm/yy",changeYear:true,nextText: "Tiếp",prevText: "Trước",constrainInput: true });
            });
             
			
            $(function() {
                $('#defaultReal').realperson({length: 4,includeNumbers:true,regenerate:'Tạo mới'});
            });
										
            $.metadata.setType("attr", "validate");     
            $().ready(function() {
                $("#signupForm").validate({
                    rules: {
                        firstnamea: "required",
                        tenDangNhap: {
                            required: true,
                            minlength: 2
                        },
                        matKhau: {
                            required: true,
                            minlength: 5
                        },
                        nhapLaiMatKhau: {
                            required: true,
                            minlength: 5,
                            equalTo: "#matKhau"
                        },
                        email: {
                            required: true,
                            email: true
                        },
                        nhapLaiEmail: {
                            required: true,
                            email: true,
                            equalTo: "#email"
                        },
                        tenKhachHang:{
                            required: true,
                            minlength: 2
                        },
                        dienThoai:{
                            required: true,
                            digits:true
                        },
                        datepicker:{
                            required: true,
                            date:true
                        },
                        defaultReal:"required"
			
                    },
                    messages: {
		
                        tenDangNhap: {
                            required: "Vui lòng nhập tên đăng nhập.",
                            minlength: "Tên đăng nhập phải dài tối thiểu 2 ký tự."
                        },
                        matKhau: {
                            required: "Vui lòng nhập mật khẩu.",
                            minlength: "Mật khẩu phải dài tối thiểu 5 ký tự."
                        },
                        nhapLaiMatKhau: {
                            required: "Vui lòng nhập mật khẩu.",
                            minlength: "Mật khẩu phải dài tối thiểu 5 ký tự.",
                            equalTo: "Mật khẩu không trùng khớp."
                        },
                        email: "Vui lòng nhập Email hợp lệ.",
                        nhapLaiEmail :{
                            required: "Vui lòng nhập Email",
                            email: "Email không hợp lệ.",
                            equalTo: "Email không trùng khớp."
				
                        },
                        tenKhachHang:{
                            required: "Vui lòng cung cấp tên khách hàng.",
                            minlength: "Độ dài tối thiểu là 2 ký tự."
                        },
                        dienThoai:{
                            required: "vui lòng nhập số điện thoại",
                            digits:"Số điện thoại không hợp lệ"
                        },
                        datepicker:{
                            required: "vui lòng nhập ngày sinh",
                            date:"Ngày sinh không hợp lệ."
                        },
                        defaultReal:"Bạn chưa nhập mã xác nhận"
			
                    }
                });
            });           
        </script>
    </head>

    <body topmargin="-10px">	
        <table width="90%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td colspan="2">Xin chào, ${khachhang.getUsername()}</td>
            </tr>
            <tr>
                <td colspan="2" style="color: red;">${thongbao}</td>
            </tr>
            <tr>
                <td colspan="2" class="login_header_td">Thông tin tài khoản</td>
            </tr>
            <tr>
                <td width="157">&nbsp;</td>
                <td width="543">&nbsp;</td>
            </tr>
            <tr>
                <td class="text_reg underline">Tên đăng nhập</td>
                <td class="underline">${khachhang.getUsername()}</td>
            </tr>
            <tr>
                <td class="text_reg underline">Email</td>
                <td class="underline">${khachhang.getEmail()}</td>
            </tr>
            <tr>
                <td class="text_reg underline">Họ Tên</td>
                <td class="underline">${khachhang.khachHang.getTenKhachHang()}</td>
            </tr>
            <tr>
                <td class="text_reg underline">Ngày Sinh</td>
                <td class="underline"><fmt:formatDate value="${khachhang.khachHang.getNgaySinh()}" pattern="dd/MM/yyyy"/> </td>
            </tr>
            <tr>
                <td class="text_reg underline">Giới Tính</td>
                <td class="underline">

                    ${(khachhang.khachHang.getGioiTinh()==0)?"Nam":"Nữ"}</td>
            </tr>
            <tr>
                <td class="text_reg underline">Điện thoại</td>
                <td class="underline">${khachhang.khachHang.getDienThoai()}</td>
            </tr>
            <tr >
                <td class="text_reg underline">Địa chỉ giao hàng</td>
                <td class="underline">${khachhang.khachHang.getDiaChi()}</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><a href="BanLapTop.do?Action=DoiMatKhau">Đổi mật khẩu</a></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><a href="BanLapTop.do?Action=DoiEmail">Đổi email</a></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><a href="BanLapTop.do?Action=DoiThongTin">Đổi Thông Tin</a></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" class="login_header_td">Lịch sử giao dịch</td>
            </tr>
            <tr>
                <td colspan="2"><table width="100%" border="1" cellspacing="0" cellpadding="0">
                        <tr class="td_header_giao_dich">
                            <td width="3%">STT</td>
                            <td width="20%">&nbsp;Người Nhận</td>
                            <td width="35%">&nbsp;Địa Chỉ</td>
                            <td width="15%">&nbsp;Ngày đặt</td>
                            <td width="15%">Tình Trạng</td>
                            <td ></td>
                        </tr>
                        <c:choose>
                            <c:when test="${dhs.size()==0}">
                                <tr>
                                    <td colspan="6">BẠN CHƯA CÓ GIAO DỊCH NÀO</td>

                                </tr>

                            </c:when>
                            <c:otherwise>
                                <c:set var="i" value="1"/>
                                <c:forEach var="dh" items="${dhs}">
                                    <tr>
                                        <td align="center">${i}</td>
                                        <td> ${dh.getNguoiNhan()}</td>
                                        <td> ${dh.getDiaChiGiaoHang()}</td>
                                        <td> <fmt:formatDate value="${dh.getNgayDat()}" pattern="dd/MM/yyyy hh:mm:ss" /> </td>
                                        <td align="center">${dh.getTinhTrangDonDatHang().getMota()}</td>
                                        <td align="center"><a href="BanLapTop.do?Action=ChiTietDonHang&MaDonHang=${dh.getMaDonHang()}">Chi Tiết</a>
                                            <c:if test="${dh.getTinhTrangDonDatHang().getMaTinhTrang()==TTDH_CHUA_DUYET}">
                                               | <a href="BanLapTop.do?Action=TrangCaNhan&ThaoTac=HuyDonHang&MaDonHang=${dh.getMaDonHang()}">Huỷ</a></td>
                                            </c:if>
                                    </tr>
                                    <c:set var="i" value="${i+1}"/>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>

                    </table></td>
            </tr>
        </table>
    </body>
</html>
