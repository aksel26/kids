
<%@page import="lab.spring.controller.DetailController"%>
<%@page import="lab.spring.controller.Popo"%>
<%@page import="com.sun.org.apache.xml.internal.security.utils.Base64"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>엄마의지도</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
   href="resources/vendors/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
   href="resources/vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
   href="resources/vendors/themify-icons/css/themify-icons.css">
<link rel="stylesheet"
   href="resources/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"
   href="resources/vendors/selectFX/css/cs-skin-elastic.css">
<link rel="stylesheet"
   href="resources/vendors/jqvmap/dist/jqvmap.min.css">
<link rel="stylesheet" href="resources/assets/css/style.css">
<link rel="stylesheet" href="resources/assets/css/index.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gaegu:700&display=swap" rel="stylesheet">
<link
   href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
   rel='stylesheet' type='text/css'>
 <link rel="stylesheet" href="resources/assets/css/detail.css">
 <script src="https://kit.fontawesome.com/a166115fd2.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript"
   src="resources/vendors/bootstrap/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="resources/assets/js/RadarChart.js"></script>

<style>
<!-- 별점만들기 스타일소스  -->
*{margin:0; padding:0;}
.star{
  display:inline-block;
  width: 30px;height: 60px;
  cursor: pointer;
  padding-left: 30px;
}
.star_left{
  background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat 0 0; 
  background-size: 120%; 
  margin-right: 0px;
}
.star.on{
  background-image: url(http://gahyun.wooga.kr/main/img/testImg/star_on.png);
}
</style>
</head>

<body>

<%
	DetailController popo = new DetailController();
%>

<script>
var lo = '${kindername}';
var score1 = '${score.score1}';
var score2 = '${score.score2}';
var score3 = '${score.score3}';
<%-- var cloudimg = <%=Base64.encode(popo.getCloud(request.getAttribute("kinderinfoId").toString()))%>; --%>
// console.log(cloudimg);
</script>

<aside id="left-panel" class="left-panel">
      <nav class="navbar navbar-expand-sm navbar-default">
         <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
               <li class="active"><a href="index.do"> 
               <img id="title_img"alt="엄마의 지도" src="resources/images/title.png" width ="130%" height="130%">
               </a>
               </li>
 	<!-- Left Panel -->
	 <%@ include file="./widget.jsp" %>


  <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
               <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                             
											<div class="namespace">
												<h2>${kindername}<i class="far fa-kiss-wink-heart"></i></h2>
												<p>${badkinder.addr}</p>
											</div>
</div>
                                    </div>
                    </div>
                </div>

                <!-- ============================================================== -->
                <!-- Yearly Sales -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-lg-8" >
                        <div class="card oh">
                            <div class="card-body">
                              <h5 class="card-title">종합지표</h5>   
                                <div class="d-flex m-b-30 align-items-center no-block"> 
   				 <div id="body">
					  <div id="chart" ></div>
    					</div>    
    				<script src="resources/assets/js/script.js"></script> 
                             </div>
                            </div>
                        </div>
                    </div>
                  <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">유치원 상세정보</h5>
                             
                                    <div class="sl-item">
                                       	<table border=0 cellpadding=10% cellspacing=10%>
   	<tr>
    <td align=center bgcolor="E6ECDE" height="35">유치원명</td>
    <td align=center bgcolor="ffffff">${badkinder.kindername}</td>
    </tr> 
    <tr>
    <td width=100 hegiht=500 align=center bgcolor= "E6ECDE" height ="35">교육청명</td>
    <td width=240 hegiht=500 align=center bgcolor= "ffffff" style="padding-left:10">${badkinder.officeedu}</td>
    </tr>
    <tr>
    <td width=200 hegiht=500 align=center bgcolor= "E6ECDE" height ="35">교육지원청명</td>
    <td width=100 hegiht=500 align=center bgcolor= "ffffff" style="padding-left:10">${badkinder.subofficeedu}</td>
    </tr>
    <tr>
    <td width=100 hegiht=500 align=center bgcolor= "E6ECDE" height ="35">설립일</td>
    <td width=100 hegiht=500 align=center bgcolor= "ffffff" style="padding-left:10">${badkinder.edate}</td>
   </tr>
    <tr>
    <td width=100 hegiht=500 align=center bgcolor= "E6ECDE" height ="35">개원일</td>
    <td width=100 hegiht=500 align=center bgcolor= "ffffff" style="padding-left:10">${badkinder.odate}</td>
    </tr>
    <tr>
    <td width=100 hegiht=500 align=center bgcolor= "E6ECDE" height ="35">주소</td>
    <td width=500 hegiht=500 align=center bgcolor= "ffffff" style="padding-left:10">${badkinder.addr}</td>
    </tr>
    <tr>
    <td width=100 hegiht=500 align=center bgcolor= "E6ECDE" height ="35">전화번호</td>
    <td width=100 hegiht=500 align=center bgcolor= "ffffff" style="padding-left:10">${badkinder.telno}</td>
    </tr>
    <tr>
    <td width=100 hegiht=500 align=center bgcolor= "E6ECDE" height ="35">홈페이지</td>
    <td width=100 hegiht=500 align=center bgcolor= "ffffff" style="padding-left:10"><a href=${badkinder.hpaddr}>${badkinder.hpaddr}</a></td>
    </tr>
    <tr>
    <td width=100 hegiht=500 align=center bgcolor= "E6ECDE" height ="35">운영시간</td>
    <td width=100 hegiht=500 align=center bgcolor= "ffffff" style="padding-left:10">${badkinder.opertime}</td>
    </tr>
     </table>
                                  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- News -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex">
                                    <div>
                                        <h5 class="card-title">비리유치원 분석</h5>
                                        <h6 class="card-subtitle">참고만 해주세요. </h6>
                                    </div>
                        
                                </div>
                            </div>
                            <div>
										<table class="table table-hover" width="100%">
											<thead>
												<tr width="auto">
													<th class="text-center">#</th>
													<th>유치원명</th>
													<th>운영</th>
													<th>프로그램</th>
													<th>급식</th>
													<th>원아관리</th>
													<th>교직원</th>
													<th>탈세</th>
													<th>시설관리</th>
													<th>비리지수</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td></td>
													<td class="txt-oflo">${kindername}</td>
													<td class="txt-oflo">&ensp;${badkinder.bad_oper}</td>
													<td class="txt-oflo">&emsp;&ensp;${badkinder.bad_program}</td>
													<td class="txt-oflo">&ensp;${badkinder.bad_meal}</td>
													<td class="txt-oflo">&emsp;&ensp;${badkinder.bad_care}</td>
													<td class="txt-oflo">&emsp;${badkinder.bad_emp}</td>
													<td class="txt-oflo">&nbsp;&nbsp;${badkinder.bad_tax}</td>
													<td class="txt-oflo">&emsp;&ensp;${badkinder.bad_build}</td>
													<td class="txt-oflo">&emsp;<img src=${badkinder.image} width="8%" height="16%"></td>
												</tr>

											</tbody>
										</table>
									</div>
                        </div>
                    </div>
                </div>
             
                <!-- ============================================================== -->
                <!-- To do chat and message -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body"><h4 class="card-title">Feeds</h4></div>
						
						<div id=review>
						</div>
						<div class="star-box">
						  <span class="star star_left"></span>
						  <span class="star star_left"></span>
						  <span class="star star_left"></span>
						 <span class="star star_left"></span>
						 <span class="star star_left"></span>
						 <input id=review_text />
						<input id=star_point type=hidden>
						<a onclick="addComment('${kinderinfoId}')">등록</a>
						</div>
						
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Review WordCloud</h5>
<%--                                  <img src="data:image/jpg;base64, <%=Base64.encode(popo.getCloud(request.getAttribute("kinderinfoId").toString() )) %>" width="500" height="500"/> --%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
  <script src="resources/vendors/jquery/dist/jquery.min.js"></script>
   <script src="resources/vendors/popper.js/dist/umd/popper.min.js"></script>
   <script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
   <script src="resources/assets/js/main.js"></script>

   <script src="resources/vendors/jqvmap/dist/jquery.vmap.min.js"></script>
   <script
      src="resources/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
   <script src="resources/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script>

$(document).ready(function(){
	SearchID("${kinderinfoId}");
});

function SearchID (id){
	var C1 = document.getElementById("review")
	C1.innerHTML= "<br>"
	
	$.ajax({
			url:"commentList.do",
			method:"GET",
			async:false,
			traditional : true,
			data:{
				'kdid':id
			},
			success:function(data){
				
				console.log(data);
				
				var obj = JSON.parse(data);
				var sum = 0 ;
				for(var i = 0;i<Object.keys(obj.result).length;i++){
		 		var $div = $('<span> '+ obj.result[i][1]["Writer"]+' ('+obj.result[i][2]["Score"]+'점):'+obj.result[i][0]["Contents"]+'</span><hr>');
		 		$('#review').append($div);
		 		sum =sum + parseInt(obj.result[i][2]["Score"]);
				};
				var staravg = Math.floor(sum/Object.keys(obj.result).length);
				
				for(var i = 1;i<=5;i++){
					if(i<=staravg){
						var $div = $('<img  height=50 width=50 src="http://gahyun.wooga.kr/main/img/testImg/star_on.png">');
						$('.namespace').append($div);
					}
					else{
						var $div = $('<img  height=50 width=50 src="http://gahyun.wooga.kr/main/img/testImg/star.png">');
						$('.namespace').append($div);
					}
				}				
				},
			 	error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    }
		});
}

function addComment(id){
	if(${authInfo eq null}){
		alert("로그인이 필요한 기능입니다.");	
	}
	else{
		var contents = $('#review_text').val();
		var star = $('#star_point').val();
		var kdid = id;
		var user = "${authInfo.userid}";
	$.ajax({
		url:"addCommnet.do",
		method:"GET",
		async:false,
		traditional : true,
		data:{
			'kdid':kdid,
			'contents':contents,
			'star':star,
			'user':user
		},
		success:function(data){
			SearchID(id);
			},
		 	error:function(request,status,error){
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		    }
	});	
	}
}

function returnname(){
	return ${kindername};
}


$(".star").on('click',function(){
	   var idx = $(this).index();
	   $(".star").removeClass("on");
	     for(var i=0; i<=idx; i++){
	        $(".star").eq(i).addClass("on");
	   }
		$('#star_point').val(idx+1);
	 });

</script>
</body>

</html>