<%-- 
    Document   : template_1
    Created on : Nov 5, 2012, 8:25:46 AM
    Author     : MRKYT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <tiles:insertAttribute name="Title"/>
            
        </title>
        <link href="css/danh_sach_san_pham.css" rel="stylesheet" type="text/css" />
        <script language="javascript" type="text/javascript">
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
            #bo{
                background: #85b4c6; /* Old browsers */
                background: -moz-linear-gradient(-45deg,  #85b4c6 5%, #fcfff4 14%, #fcfff4 85%, #e9e9ce 100%); /* FF3.6+ */
                background: -webkit-gradient(linear, left top, right bottom, color-stop(5%,#85b4c6), color-stop(14%,#fcfff4), color-stop(85%,#fcfff4), color-stop(100%,#e9e9ce)); /* Chrome,Safari4+ */
                background: -webkit-linear-gradient(-45deg,  #85b4c6 5%,#fcfff4 14%,#fcfff4 85%,#e9e9ce 100%); /* Chrome10+,Safari5.1+ */
                background: -o-linear-gradient(-45deg,  #85b4c6 5%,#fcfff4 14%,#fcfff4 85%,#e9e9ce 100%); /* Opera 11.10+ */
                background: -ms-linear-gradient(-45deg,  #85b4c6 5%,#fcfff4 14%,#fcfff4 85%,#e9e9ce 100%); /* IE10+ */
                background: linear-gradient(135deg,  #85b4c6 5%,#fcfff4 14%,#fcfff4 85%,#e9e9ce 100%); /* W3C */
                filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#85b4c6', endColorstr='#e9e9ce',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */

            }
            #MainContainer{

                background: #ffffff; /* Old browsers */
                background: -moz-linear-gradient(-45deg,  #ffffff 0%, #f1f1f1 78%, #e1e1e1 79%, #f6f6f6 100%); /* FF3.6+ */
                background: -webkit-gradient(linear, left top, right bottom, color-stop(0%,#ffffff), color-stop(78%,#f1f1f1), color-stop(79%,#e1e1e1), color-stop(100%,#f6f6f6)); /* Chrome,Safari4+ */
                background: -webkit-linear-gradient(-45deg,  #ffffff 0%,#f1f1f1 78%,#e1e1e1 79%,#f6f6f6 100%); /* Chrome10+,Safari5.1+ */
                background: -o-linear-gradient(-45deg,  #ffffff 0%,#f1f1f1 78%,#e1e1e1 79%,#f6f6f6 100%); /* Opera 11.10+ */
                background: -ms-linear-gradient(-45deg,  #ffffff 0%,#f1f1f1 78%,#e1e1e1 79%,#f6f6f6 100%); /* IE10+ */
                background: linear-gradient(135deg,  #ffffff 0%,#f1f1f1 78%,#e1e1e1 79%,#f6f6f6 100%); /* W3C */
                filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#f6f6f6',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */

            }
            #cuter{
                background: #7db4e8; /* Old browsers */
                background: -moz-linear-gradient(top,  #7db4e8 0%, #f1f1f1 46%, #f1f1f1 100%); /* FF3.6+ */
                background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#7db4e8), color-stop(46%,#f1f1f1), color-stop(100%,#f1f1f1)); /* Chrome,Safari4+ */
                background: -webkit-linear-gradient(top,  #7db4e8 0%,#f1f1f1 46%,#f1f1f1 100%); /* Chrome10+,Safari5.1+ */
                background: -o-linear-gradient(top,  #7db4e8 0%,#f1f1f1 46%,#f1f1f1 100%); /* Opera 11.10+ */
                background: -ms-linear-gradient(top,  #7db4e8 0%,#f1f1f1 46%,#f1f1f1 100%); /* IE10+ */
                background: linear-gradient(to bottom,  #7db4e8 0%,#f1f1f1 46%,#f1f1f1 100%); /* W3C */
                filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#7db4e8', endColorstr='#f1f1f1',GradientType=0 ); /* IE6-9 */

            }
            #foot{
                background: #e1e1e1; /* Old browsers */
                background: -moz-linear-gradient(top,  #e1e1e1 0%, #f1f1f1 46%, #ffffff 100%); /* FF3.6+ */
                background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#e1e1e1), color-stop(46%,#f1f1f1), color-stop(100%,#ffffff)); /* Chrome,Safari4+ */
                background: -webkit-linear-gradient(top,  #e1e1e1 0%,#f1f1f1 46%,#ffffff 100%); /* Chrome10+,Safari5.1+ */
                background: -o-linear-gradient(top,  #e1e1e1 0%,#f1f1f1 46%,#ffffff 100%); /* Opera 11.10+ */
                background: -ms-linear-gradient(top,  #e1e1e1 0%,#f1f1f1 46%,#ffffff 100%); /* IE10+ */
                background: linear-gradient(to bottom,  #e1e1e1 0%,#f1f1f1 46%,#ffffff 100%); /* W3C */
                filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e1e1e1', endColorstr='#ffffff',GradientType=0 ); /* IE6-9 */

            }
        </style>

    </head>
    <body id="bo" >
        <table align="center" width="1000px" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td height="180px" colspan="3">

                    <tiles:insertAttribute name="Header"/>
                </td>
            </tr>
            <tr id="cuter">
                <td height="5px" colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td width="160px" height="448">

                    <tiles:insertAttribute name="Left"/>

                </td>
                <td width="2px" >&nbsp;</td>
                <td style="vertical-align: text-top;" id="MainContainer">


                    <tiles:insertAttribute name="MainContent"/>

                </td>
            </tr>
            <tr>
                <td height="5px" colspan="3" id="foot">&nbsp;</td>
            </tr>
            <tr>
                <td height="144px" colspan="3" >

                    <tiles:insertAttribute name="Footer"/>
                </td>
            </tr>
        </table>

    </body>
</html>
