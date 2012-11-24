<%-- 
    Document   : DangNhap
    Created on : Oct 3, 2012, 2:52:06 PM
    Author     : THANHTUNG
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
  
    boolean rememberPassword = false;
    if (request.getAttribute("rememberPassword") != null) {

        rememberPassword = Boolean.parseBoolean(request.getAttribute("rememberPassword").toString());
    }
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
        <link href="css/dang_nhap.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery-1.8.2.min.js" type="text/javascript"></script>
        <script src="js/jquery.validate.js" type="text/javascript"></script>
        <script src="js/jquery.metadata.js" type="text/javascript"></script>
        <script type="text/javascript">
		
           
            function changeState() {
                //alert('yess');
                var ten = 'tung';
				
                if ($('#ckremeberPassword').is(':checked')) {
                    $("#rememberPassword").val('Yes');
                    //  alert( $("#rememberPassword").val());
                } else {
                    $("#rememberPassword").val('No');
                    //alert($("#rememberPassword").val());
                } 
               
            }
  			
            window.onload = function()
            {	
            <%
                    if (rememberPassword) {
                        out.println("$('#rememberPassword').val('Yes');");
                        out.println(" $('#ckremeberPassword').attr('checked',true);");
                    } else {
                        out.println("$('#rememberPassword').val('No');");
                    }
            %>
                }
		 $(document).ready(function() {
                $("#frmDangNhap").validate({
                    rules: {
                        
                        tenDangNhap: {
                            required: true,
                            minlength: 2
                        },
                        matKhau: {
                            required: true,
                            minlength: 5
                        }
			
                    },
                    messages: {
		
                        tenDangNhap: {
                            required: "Vui lòng nhập tên đăng nhập.",
                            minlength: "Tên đăng nhập phải dài tối thiểu 2 ký tự."
                        },
                        matKhau: {
                            required: "Vui lòng nhập mật khẩu.",
                            minlength: "Mật khẩu phải dài tối thiểu 5 ký tự."
                        }
			
                    }
                });
            }); 
       
            
          
        </script>
    </head>

    <body topmargin="-10px">
        <c:out value="${oke}"/>
        <table align="center" width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2">
                    <!-- Main content -->

                    <table width="506" border="0" cellpadding="0" cellspacing="0" style="margin-top:10px">
                        <form method="get" id="frmDangNhap" name="frmDangNhap" action="DangNhap.do" >
                            <tr>
                                <td height="48" colspan="4" id="dang_nhap_header">Đăng Nhập
                                   
                            </tr>
                            <tr>
                                <td height="27" class="text_reg" style="padding-left: 10px;">&nbsp;</td>
                                <td colspan="2"><label id="txt_error">
                                        <c:if test="${!oke}">
                                            <c:out value="Tên đăng nhập hoặc mật khẩu không đúng"/>
                                        </c:if>
                                       </label>  </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="153" height="41" class="text_reg" style="padding-left: 10px;"><label for="tenDangNhap">Tên Đăng Nhập</label></td>
                                <td colspan="2"><input name="tenDangNhap" id="tenDangNhap" type="text" dir="ltr" size="40px" maxlength="20" /></td>
                                <td width="18">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="36" class="text_reg" style="padding-left: 10px;">Mật Khẩu</td>
                                <td colspan="2"><input name="matKhau" id="matKhau" type="password" dir="ltr" size="40px" maxlength="20" /></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="28">&nbsp;</td>
                                <td colspan="2"><input name="ckremeberPassword" id="ckremeberPassword" type="checkbox" onclick="changeState()"  />
                                    <label for="ckremeberPassword">Nhớ mật khẩu</label>
                                    <input type="hidden" id="rememberPassword" name="rememberPassword" value="No" />
                                </td>
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
                                <td width="245" id="dang_ky"><a href="BanLapTop.do?Action=DangKyThanhVien">ĐĂNG KÝ</a></td>
                                <td>&nbsp;</td>
                            </tr>
                        </form>
                    </table></td>
                <td width="4">&nbsp;</td>
            </tr>
        </table>
        <!-- End of Main content -->
    </body>
</html>
