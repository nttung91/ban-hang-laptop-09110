<%-- 
    Document   : test2
    Created on : Nov 10, 2012, 6:17:00 PM
    Author     : THANHTUNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/jquery-1.8.2.min.js"></script>
        <script src="js/jquery.webticker.js"></script>
      

<link rel="stylesheet" href="css/webticker.css" type="text/css" media="screen"> 
<script type="text/javascript">
$(function(){
	$("#webticker").webTicker();
	$("#webticker2").webTicker({travelocity: 0.2, direction: -1});
	
	$("#stop").click(function(){
		$("#webticker").webTicker('stop');
	});
	
	$("#continue").click(function(){
		$("#webticker").webTicker('cont');
	});
	
	$("#stop2").click(function(){
		$("#webticker2").webTicker('stop');
	});
	
	$("#continue2").click(function(){
		$("#webticker2").webTicker('cont');
	});
});
</script>



</head>
<body style='margin-left:100px'>
<h1>jQuery - webTicker v1.3 example</h1>
<!-- first ticker -->
<ul id="webticker" >	
					<li >
					  <table width="200" border="0" cellspacing="0" cellpadding="0">
					    <tr>
					      <td><img src="images/lap2.jpg" width="200" height="200"></td>
				        </tr>
					    <tr>
					      <td>Tenfd fđấ</td>
				        </tr>
					    <tr>
					      <td>Gia fsdddddfádfads</td>
				        </tr>
				      </table>
						
					</li>
					<li >
						 <table width="200" border="0" cellspacing="0" cellpadding="0">
					    <tr>
					      <td><img src="images/lap2.jpg" width="200" height="200"></td>
				        </tr>
					    <tr>
					      <td>Tenfd fđấ</td>
				        </tr>
					    <tr>
					      <td>Gia fsdddddfádfads</td>
				        </tr>
				      </table>
					</li>
					<li >
						 <table width="200" border="0" cellspacing="0" cellpadding="0">
					    <tr>
					      <td><img src="images/lap2.jpg" width="200" height="200"></td>
				        </tr>
					    <tr>
					      <td>Tenfd fđấ</td>
				        </tr>
					    <tr>
					      <td>Gia fsdddddfádfads</td>
				        </tr>
				      </table>
					</li>
					<li >
						 <table width="200" border="0" cellspacing="0" cellpadding="0">
					    <tr>
					      <td><img src="images/lap2.jpg" width="200" height="200"></td>
				        </tr>
					    <tr>
					      <td>Tenfd fđấ</td>
				        </tr>
					    <tr>
					      <td>Gia fsdddddfádfads</td>
				        </tr>
				      </table>
					</li>
					<li >
						 <table width="200" border="0" cellspacing="0" cellpadding="0">
					    <tr>
					      <td><img src="images/lap2.jpg" width="200" height="200"></td>
				        </tr>
					    <tr>
					      <td>Tenfd fđấ</td>
				        </tr>
					    <tr>
					      <td>Gia fsdddddfádfads</td>
				        </tr>
				      </table>
					</li>
					<li >
						 <table width="200" border="0" cellspacing="0" cellpadding="0">
					    <tr>
					      <td><img src="images/lap2.jpg" width="200" height="200"></td>
				        </tr>
					    <tr>
					      <td>Tenfd fđấ</td>
				        </tr>
					    <tr>
					      <td>Gia fsdddddfádfads</td>
				        </tr>
				      </table>
					</li>
					<li >
						 <table width="200" border="0" cellspacing="0" cellpadding="0">
					    <tr>
					      <td><img src="images/lap2.jpg" width="200" height="200"></td>
				        </tr>
					    <tr>
					      <td>Tenfd fđấ</td>
				        </tr>
					    <tr>
					      <td>Gia fsdddddfádfads</td>
				        </tr>
				      </table>
					</li>
					<li >
						 <table width="200" border="0" cellspacing="0" cellpadding="0">
					    <tr>
					      <td><img src="images/lap2.jpg" width="200" height="200"></td>
				        </tr>
					    <tr>
					      <td>Tenfd fđấ</td>
				        </tr>
					    <tr>
					      <td>Gia fsdddddfádfads</td>
				        </tr>
				      </table>
					</li>
					
</ul>	

<button id='stop'>Stop First Ticker</button>
<button id='continue'>Continue First Ticker</button>
<button id='stop2'>Stop Second Ticker</button>
<button id='continue2'>Continue Second Ticker</button>

</div>

</body></html>
