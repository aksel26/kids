<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NEWINFO</title>
</head>
<body>


<table style="height:700px; width:500px; border: 1px solid #000000;" >
    <tr align="center "><td colspan="2">유치원 명</td></tr>
    
    <tr align="center">
    <td style="width:30%;">주소</td>
    <td style="width:70%;">울산</td>
    </tr>
    
    <tr align="center">
    <td style="width:30%;">전화번호</td>
    <td style="width:70%;">010-7751-4688</td>
    </tr>
    
    <tr align="center">
    <td style="width:30%;">admin<br/>★★★★★</td>
    <td style="width:70%;">다양한 프로그램이 좋아요.</td>
    </tr>
    
    <tr align="center">
    <td style="width:30%;">admin<br/>★★★★★</td>
    <td style="width:70%;">다양한 프로그램이 좋아요.</td>
    </tr>
    
    <tr align="center">
    <td style="width:30%;">admin<br/>★★★★★</td>
    <td style="width:70%;">다양한 프로그램이 좋아요.</td>
    </tr>
    
    <tr >
    <td align="center"  style="display:flex; width:30%;">
					<select>
                      	  <option value="5" selected="selected">★★★★★</option>
						  <option value="4">★★★★</option>
						  <option value="3">★★★</option>
						  <option value="2">★★</option>
						  <option value="1">★</option>
					</select>
	</td>
	<td align="center" style="width:70%;"><input value=""><a>작성</a></td>
	</tr>
</table>


<div style="padding-left: 60px;">
 ip : <input id="your-ip-addr" type="text" />
 Geo : <input id="your-geo" type="text" />
<script type="text/javascript">
function loadScript(url, callback){
	var script = document.createElement("script")
	script.type = "text/javascript";
	
	if (script.readyState){//IE
		script.onreadystatechange = function(){
			if (script.readyState == "loaded" || script.readyState == "complete"){
				script.onreadystatechange = null;
				callback(); 
				} 
			}; 
			}
	else {
		//Others
		script.onload = function(){
			callback(); 
			}; 
			} 	
	script.src = url;
	document.getElementsByTagName("head")[0].appendChild(script); 
	} 
	loadScript("https://jsonip.com/?callback=ip", function(){
		var geoData, ipData = "${ip}";
		document.getElementById("your-ip-addr").value=ipData;
		document.getElementById("your-geo").value="Wait..";
		
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				geoData = JSON.parse(this.responseText); printDataOnThePage(); 
				} 
			}; 
			xhttp.open("GET", "http://ip-api.com/json/"+ipData, true);
			xhttp.send(); 
			function printDataOnThePage(){
				console.log(geoData.lat)
				console.log(geoData.lon)
				console.log(geoData.city)
				} 
			}); 
	</script> 
</div>

업데이트

</body>
</html>