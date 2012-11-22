<%-- 
    Document   : SuaThongTinSanPham
    Created on : Nov 21, 2012, 9:14:04 PM
    Author     : MRKYT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/jquery-1.8.2.min.js" type="text/javascript"></script>
        <script src="js/jquery.validate.js" type="text/javascript"></script>
        <script src="js/ajaxfileupload.js" type="text/javascript"></script>
        <link href="css/themsanpham.css" rel="stylesheet" type="text/css" />
        <link href="css/cmxform.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript">
            function refreshimg(){
                $("#imgsp").attr("src",$("#imgsp").src );
            }
            function ajaxFileUpload()
            {
                //starting setting some animation when the ajax starts and completes
                $("#loading")
                .ajaxStart(function(){
                    $(this).show();
                })
                .ajaxComplete(function(){
                    $(this).hide();
                });
        
                /*
            prepareing ajax file upload
            url: the url of script file handling the uploaded files
                        fileElementId: the file type of input element id and it will be the index of  $_FILES Array()
            dataType: it support json, xml
            secureuri:use secure protocol
            success: call back function when the ajax complete
            error: callback function when the ajax failed
            
                 */
                $.ajaxFileUpload
                (
                {
                    url:'UploadFile.do', 
                    secureuri:false,
                    fileElementId:'hinhAnh',
                    dataType: 'json',
                    success: function (data, status)
                    {
                        if(typeof(data.error) != 'undefined')
                        {
                            if(data.error != '')
                            {
                                alert(data.error);
                            }else
                            {
                                alert(data.msg);
                                $("#imgPath").val("images/hinh_san_pham/"+data.filename);
                                //	$("#imgsp").val("images/hinh_san_pham/"+data.filename);
                                $("#imgsp").attr("src", "images/hinh_san_pham/"+data.filename);
                                //alert($("#imgPath").val());
							
                            }
                        }
                    },
                    error: function (data, status, e)
                    {
                        alert(e);
                    }
                }
            )
        
                return false;

            } 
		
            $(function(ready){
                $("#loaiSanPham").change(function() {
                    if ($("#loaiSanPham").val()=='laptop'){
                        $("#thong_tin_laptop").show('slow');
                        $("#thong_tin_linhkien").hide('slow');
                    }
                    else {
                        $("#thong_tin_laptop").hide('slow');
                        $("#thong_tin_linhkien").show('slow');
                    }
                });
            });
            $().ready(function() {
                $("#frmThemSanPham").validate({
                    rules: {
                        tenSanPham: {
                            required: true
                            
                        },
                        hangSanXuat: {
                            required: true
                        },
                        thoiGianBaoHanh: {
                            required: true,
                            digits: true                  
                        },
                        loaiSanPham: {
                            required: true
                            
                        },
                        cpu: {
                            required: true
                            
                        },
                        kichThuocManHinh: {
                            required: true
                            
                        },
                        ram: {
                            required: true
                            
                        },
                        oCung: {
                            required: true
                            
                        },
                        diaQuang: {
                            required: true
                            
                        },
                        cardManHinh: {
                            required: true
                            
                        },
                        wireless: {
                            required: true
                            
                        },
                        pin: {
                            required: true
                            
                        },
                        cannang: {
                            required: true
                            
                        },
                       
                        linhKien_info:{
                            required: true
                           
                        },
                        soLuong:{
                            required: true,
                            digits:true
                        },
                        gia:{
                            required: true,
                            digits:true
                        },
                        os:{
                            required: true
                           
                        }
						
                        
			
                    },
                    messages: {
		
                        tenSanPham: {
                            required: "không được bỏ trống",
                            minlength: 2
                        },
                        hangSanXuat: {
                            required: "bạn chưa chọn"
                        },
                        thoiGianBaoHanh: {
                            required: "không được bỏ trống",
                            digits: "vui lòng nhập số"                  
                        },
                        loaiSanPham: {
                            required: "không được bỏ trống"
                            
                        },
                        cpu: {
                            required: "không được bỏ trống"
                            
                        },
                        kichThuocManHinh: {
                            required: "không được bỏ trống"
                            
                        },
                        ram: {
                            required: "không được bỏ trống"
                            
                        },
                        oCung: {
                            required: "không được bỏ trống"
                            
                        },
                        diaQuang: {
                            required: "không được bỏ trống"
                            
                        },
                        cardManHinh: {
                            required: "không được bỏ trống"
                            
                        },
                        wireless: {
                            required: "không được bỏ trống"
                            
                        },
                        pin: {
                            required: "không được bỏ trống"
                            
                        },
                        cannang: {
                            required: "không được bỏ trống"
                            
                        },
                       
                        linhKien_info:{
                            required: "không được bỏ trống"
                           
                        },
                        soLuong:{
                            required: "không được bỏ trống",
                            digits:"vui lòng nhập số"
                        },
                        gia:{
                            required: "không được bỏ trống",
                            digits:"vui lòng nhập số"
                        },
                        os:{
                            required: "không được bỏ trống"
                           
                        }
			
                    }
                });
            });
            $(document).ready(function() {
                $("#uploadbutton").jsupload({ 
                    action: "UploadFile.do",
                    onComplete: function(response){
                        alert( "server response: " + response);
                    }
                });
            });
        </script>

    </head>
    <body>

        <h1>Thêm Sản Phẩm</h1>
        <p>${loi}</p>
        <form method="get" action="ThemSanPham.do" id="frmThemSanPham">

            <p><label for="tenSanPham" class="labelsp">Tên Sản Phẩm :</label>
                <input type="text" id="tenSanPham" name="tenSanPham" class="textsp" value="${param.tenSanPham}"/>
            </p>

            <p><label for="hangSanXuat" class="labelsp">Hãng Sản Xuất :</label>
                <select id="hangSanXuat" name="hangSanXuat" class="textsp">
                    <option value="HA001">Dell</option>
                    <option value="HA002">Linh Kiện</option>
                </select>
            </p>
            <p><label for="thoiGianBaoHanh" class="labelsp">Thời gian bảo hành :</label>
                <input type="text" id="thoiGianBaoHanh" name="thoiGianBaoHanh" class="textsp" value="${param.thoiGianBaoHanh}"/>
                tháng</p>
            <p><label for="loaiSanPham" class="labelsp">Loại Sản Phẩm :</label>
                <select id="loaiSanPham" name="loaiSanPham" class="textsp">
                    <option value="laptop">Laptop</option>
                    <option value="linhkien">Linh Kiện</option>
                </select>
            </p>
            <div id="thong_tin_laptop">
                <p><label for="cpu" class="labelsp">Chip CPU:</label>
                    <input type="text" id="cpu" name="cpu" class="textsp" value="${param.cpu}"/>
                </p>
                <p>
                    <label for="kichThuocManHinh" class="labelsp">Kích Thước Màn Hình (inch):</label>
                    <input type="text" id="kichThuocManHinh" name="kichThuocManHinh" class="textsp" value="${param.tenSanPham}"/>
                </p>
                <p><label for="ram" class="labelsp">Ram :</label>
                    <input type="text" id="ram" name="ram" class="textsp" value="${param.ram}"/>
                </p>
                <p><label for="oCung" class="labelsp">Ổ cứng (HDD) :</label>
                    <input type="text" id="oCung" name="oCung" class="textsp" value="${param.oCung}"/> 
                    (GB)
                </p>
                <p><label for="diaQuang" class="labelsp">Đĩa Quang :</label>
                    <input type="text" id="diaQuang" name="diaQuang" class="textsp" value="${param.diaQuang}"/>
                </p>
                <p><label for="cardManHinh" class="labelsp">Card Màn Hình :</label>
                    <input type="text" id="cardManHinh" name="cardManHinh" class="textsp" value="${param.cardManHinh}"/>
                </p>
                <p><label for="wireless" class="labelsp">Wireless :</label>
                    <input type="text" id="wireless" name="wireless" class="textsp" value="${param.wireless}"/>
                </p>
                <p><label for="os" class="labelsp">Hệ Điều Hành:</label>
                    <input type="text" id="os" name="os" class="textsp" value="${param.os}"/>
                </p>
                <p><label for="pin" class="labelsp">Thông tin Pin:</label>
                    <input type="text" id="pin" name="pin" class="textsp" value="${param.pin}"/>
                </p>
                <p><label for="cannang" class="labelsp">Cân nặng:</label>
                    <input type="text" id="cannang" name="cannang" class="textsp" value="${param.cannang}"/>
                </p>
                <p><label for="tinhNangKhac" class="labelsp">Tính Năng Khác:</label>
                    <input type="text" id="tinhNangKhac" name="tinhNangKhac" class="textsp" value="${param.tinhNangKhac}"/>
                </p>
            </div>
            <div id="thong_tin_linhkien">
                <p><label for="linhKien_info" class="labelsp">Tính Năng Khác:</label>
                    <textarea id="linhKien_info" name="linhKien_info" class="textsp" value="${param.linhKien_info}"></textarea>
                </p>

            </div>

            <p><label for="gia" class="labelsp">Giá Sản phẩm :</label>
                <input type="text" id="gia" name="gia" class="textsp" value="${param.gia}"/>
                (nghìn đồng)</p>
            <p><label for="soLuong" class="labelsp">Số Lượng :</label>
                <input type="text" id="soLuong" name="soLuong" class="textsp" value="${param.soLuong}"/>
                cái</p>
            <p>
                <img src="" id="imgsp" alt="no img" width="200" height="200"/>
            </p>
            <p><label for="hinhAnh" class="labelsp">Hình Sản Phẩm :</label>
                <input type="file" id="hinhAnh" name="hinhAnh" class="textsp" />
                <input type="button" value="Tải ảnh" name="sub" id="uploadbutton" onClick="ajaxFileUpload()"/>
                <input type="button" value="Refresh" name="sub" id="uploadbutton" onClick="refreshimg()"/>
                <input type="hidden" name="imgPath" id="imgPath" value=""/>
            </p>

            <p>
                <input type="submit" id="submit" name="submit" class="textsp" value="Them"/>
            </p>
        </form>
    </body>
</html>


