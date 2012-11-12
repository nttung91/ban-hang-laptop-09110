<%-- 
    Document   : test
    Created on : Nov 9, 2012, 7:18:16 PM
    Author     : THANHTUNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
      
        <script src="js/jquery-1.8.2.min.js" language="javascript" type="text/javascript"></script>
    
        <script type="text/javascript" src="js/jquery.fancybox.js?v=2.1.3"></script>
	<link rel="stylesheet" type="text/css" href="css/jquery.fancybox.css?v=2.1.2" media="screen" />
       
        <script language="javascript" type="text/javascript">
     
			$(document).ready(function() {
			
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
    <body>
      <p>
		<a class="fancybox-effects-b" href="images/lap2.jpg" title="Ten san pham"><img src="images/lap2.jpg" alt="" /></a>	
	</p>
    </body>
</html>
