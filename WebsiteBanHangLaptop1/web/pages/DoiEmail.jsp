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
        
        <script src="js/jquery-1.8.2.min.js" language="javascript" type="text/javascript"></script>
        <script src="js/jquery.validate.js" type="text/javascript"></script>
        <script src="js/jquery.metadata.js" type="text/javascript"></script>
       
       	

        <script language="javascript" type="text/javascript">
		
          
         
										
            $.metadata.setType("attr", "validate");     
            $().ready(function() {
                $("#signupForm").validate({
                    rules: {
                       
                        email: {
                            required: true,
                            email: true
                        },
                        nhapLaiEmail: {
                            required: true,
                            email: true,
                            equalTo: "#email"
                        }
			
                    },
                    messages: {
		
                      
                        email: "Vui lòng nhập Email hợp lệ.",
                        nhapLaiEmail :{
                            required: "Vui lòng nhập Email",
                            email: "Email không hợp lệ.",
                            equalTo: "Email không trùng khớp."
				
                        }
			
                    }
                });
            });           
        </script>
    </head>

    <body topmargin="-10px">
    <table align="left" width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
                <td colspan="2">
                    <!-- Main content -->
                    <form  id="signupForm" method="post" action="DoiEmail.do">
                        <div id="dangky_info" >
                            <table width="100%" style="margin-top:10px">
                                <tr>
                                    <td colspan="2" class="login_header_td">Đổi Email</td>
                                </tr>
                                <tr>
                                  <td class="text_reg">&nbsp;</td>
                                  <td  ><label id="errorList"><c:out value="${loi}"/></label></td>
                                </tr>
                                <tr>
                                    <td class="text_reg"><label for="email">Địa chỉ email</label></td>
                                    <td  ><input id="email" class="text_input" name="email" type="email" size="30" maxlength="50" value="${param.email}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text_reg"><label for="nhapLaiEmail">Nhập Lại Địa chỉ email</label></td>
                                    <td  ><input id="nhapLaiEmail" class="text_input" name="nhapLaiEmail" type="email" size="30" maxlength="50" value="${param.nhapLaiEmail}"/></td>
                                </tr>
                            </table>
                </div>
                       
                        <div id="control">
                            <input name="dangKy" class="control_button" type="submit"  value="Lưu" style="width:100px;height:30px;font-weight:bold;"/> <input class="control_button" name="nhapLai" type="reset" value="Nhập Lại" style="width:100px;height:30px;font-weight:bold;"/>
                        </div>
                    </form>
                </td>
                <td width="4">&nbsp;</td>
            </tr>
            <tr>
  <td colspan="2"><a href="BanLapTop.do?Action=TrangCaNhan"><< Trở Lại</a></td>
</tr>
            <!-- End of Main content -->
      </table>

    </body>
</html>
