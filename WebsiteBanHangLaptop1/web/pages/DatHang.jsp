<%-- 
    Document   : DatHang
    Created on : Nov 25, 2012, 8:56:51 AM
    Author     : THANHTUNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
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
       	
        <link rel="stylesheet" href="css/jquery-ui.css" />

        <script src="js/jquery-ui.js"></script>

        <script language="javascript" type="text/javascript">
		
            function processResetForm(){
                //alert("tung"); 
                $("#signupForm").find("input[type=text]").val("");
                $("#signupForm").find("input[type=email]").val("");
				
            }
            
            
            $(function() {
                $( "#datepicker" ).datepicker({ dateFormat: "dd/mm/yy",changeYear:true,nextText: "Tiếp",prevText: "Trước",constrainInput: true });
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
    <body>
        <h1>Hello World!</h1>
         <table width="100%" border="0" cellpadding="0" cellspacing="0" align="left" >

<tr>
                <td colspan="2">
                    <!-- Main content -->
                    <form  id="signupForm" method="get" action="DatHang.do">
                      <div id="khachhang_info" >
      <table width="100%">
                                <tr>
                                    <td colspan="2" class="login_header_td">Thông tin giao hàng</td>
                                </tr>
                                <tr>
                                    <td colspan="2" >Vui lòng nhập chính xác thông tin để việc giao hàng được thuận lợi</td>
                                </tr>
                                <tr>
                                  <td class="text_reg">&nbsp;</td>
                                  <td  ><label id="errorList"><c:out value="${loi}"/></label></td>
                                </tr>
                                <tr>
                                    <td width="311" class="text_reg"><label for="tenKhachHang">Họ tên người nhận</label></td>
                                    <td width="673"  ><input class="text_input" id="tenKhachHang" name="tenKhachHang" type="text" size="30" maxlength="50" value="${kh.getTenKhachHang()}"/></td>
                                </tr>
                              
                                <tr>
                                    <td class="text_reg"><label for="dienThoai">Điện Thoại</label></td>
                                    <td  ><input class="text_input" id="dienThoai" name="dienThoai" type="text" size="30" maxlength="50" value="${kh.getDienThoai()}" /></td>
                                </tr>
                                <tr>
                                    <td class="text_reg">Địa chỉ giao hàng</td>
                                    <td  ><input class="text_input" id="diaChi" name="diaChi" type="text" size="30" maxlength="50" value="${kh.getDiaChi()}" /></td>
                                </tr>
                                
                            </table>
                        </div>
                    <p></p>
                        <div id="captcha" style="padding-left:210px;"></div>

                        <div id="control">
                            <input name="dangKy" class="control_button" type="submit"  value="Xác nhận"/> <input class="control_button" name="nhapLai" type="button" value="Nhập Lại" id="resetForm" onclick="processResetForm()"/>
                        </div>
                    </form>
                </td>
        
            </tr>
            <tr>
  <td colspan="2"><a href="BanLapTop.do?Action=TrangCaNhan"><< Trở Lại</a></td>
</tr>
            <!-- End of Main content -->
      </table>
    </body>
</html>
