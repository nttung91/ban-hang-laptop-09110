<%--
    Document   : DangKyThanhVien
    Created on : Sep 30, 2012, 6:36:35 PM
    Author     : THANHTUNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
       
        <script language="javascript" type="text/javascript">
		      $().ready(function() {
                $("#signupForm").validate({
                    rules: {
                       
                       matKhauCu: {
                            required: true,
                            minlength: 5
                        },
                        matKhau: {
                            required: true,
                            minlength: 5
                        },
                        nhapLaiMatKhau: {
                            required: true,
                            minlength: 5,
                            equalTo: "#matKhau"
                        }
			
                    },
                    messages: {
		
                       matKhauCu: {
                           required: "Vui lòng nhập mật khẩu.",
                            minlength: "Mật khẩu phải dài tối thiểu 5 ký tự."
                        },
                        matKhau: {
                            required: "Vui lòng nhập mật khẩu.",
                            minlength: "Mật khẩu phải dài tối thiểu 5 ký tự."
                        },
                        nhapLaiMatKhau: {
                            required: "Vui lòng nhập mật khẩu.",
                            minlength: "Mật khẩu phải dài tối thiểu 5 ký tự.",
                            equalTo: "Mật khẩu không trùng khớp."
                        }
			
                    }
                });
            });           
        </script>
    </head>

    <body topmargin="-10px">
        <c:out value="${sessionScope.tenDangNhap}"/>
    <table align="center" width="1000px" border="0" cellpadding="0" cellspacing="0">
<tr>
                <td colspan="2">
                    <!-- Main content -->
                    <form  id="signupForm" method="post" action="DoiMatKhau.do">
                        <div id="dangky_info" >
                            <table width="100%" style="margin-top:10px">
                                <tr>
                                    <td colspan="2" class="login_header_td">Đổi thông mật khẩu</td>
                                </tr>

                                <tr>
                                  <td class="text_reg">&nbsp;</td>
                                  <td ><c:out value="${loi}"/></td>
                                </tr>
                                <tr>
                                    <td class="text_reg">Mật Khẩu Cũ</td>
                                    <td ><input id="matKhauCu" class="text_input" name="matKhauCu" type="password" size="30" maxlength="50" /></td>
                                </tr>
                                <tr>
                                    <td class="text_reg"><label for="matKhau">Mật Khẩu</label></td>
                                    <td  ><input id="matKhau" class="text_input" name="matKhau" type="password" size="30" maxlength="50" /></td>
                                </tr>
                                <tr>
                                    <td class="text_reg"><label for="nhapLaiMatKhau">Nhập lại mật khẩu</label></td>
                                    <td  ><input id="nhapLaiMatKhau" class="text_input" name="nhapLaiMatKhau" type="password" size="30" maxlength="50" /></td>
                                </tr>
                            </table>
                  </div>
                       
                        <div id="control">
                            <input name="dangKy" class="control_button" type="submit"  value="Lưu" style="width:100px;height:30px;font-weight:bold;"/> <input class="control_button" name="nhapLai" type="reset" value="Nhập Lại" id="resetForm" style="width:100px;height:30px;font-weight:bold;"/>
                        </div>
                    </form>
                </td>
                <td width="4">&nbsp;</td>
            </tr>
            <tr>
  <td colspan="2"><a href="TrangCaNhan.do"><< Trở Lại</a></td>
</tr>
            <!-- End of Main content -->
      </table>

    </body>
</html>
