
<%@page import="lab.spring.controller.DetailController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

<script src="./resources/assets/js/index_modules/wordcloud.js" charset="UTF-8"></script>
<!-- wordcloud추가 -->
<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://rawgit.com/jasondavies/d3-cloud/master/build/d3.layout.cloud.js" type="text/JavaScript"></script>


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


 .CellWithComment{position:relative;}

 .CellComment
        {
 		 visibility: hidden;
            width: 500px;
            position:absolute; 
            z-index:100;
            text-align: center;
            opacity: 0.4;
            transition: opacity 1s;
            border-radius: 6px;
            background-color: #d0d0e1;
            padding:3px;
            top:-30px; 
            left:0px;
        }   
 .CellWithComment:hover span.CellComment {visibility: visible; opacity: 1;}

.indextag{
	margin-left: 50px;
}
#review {
width:600px;
}
#review tr{
margin-bottom: 30px;
border-bottom: 1px solid #444444;
padding: 30px;
height:50px;
}

#review tr .td1{
width:100px;
align-content: center;
}
#review tr .td2{

}
#review tr .td3{
text-align:inherit;
width:300px;
}
</style>
</head>

<body>

<script>
var lo = '${kindername}';
var score1 = '${score.score1}';
var score2 = '${score.score2}';
var score3 = '${score.score3}';
var check = "1";

var positive = '${positive}';
var negative = '${negative}';

var comments;
var staravg;
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
			</ul>
			</div>
		</nav>
	</aside>
	
<%@ include file="./header.jsp"%>

<article>
  <div class="page-wrapper">
            <div class="container-fluid">
                    
											<div class="namespace">
                        
												<h2 style="font-family: 'Gaegu'; display: block; margin-block-start: 1em;margin-inline-start: 0px; margin-inline-end: 0px;">${badkinder.kindername}<i class="far fa-kiss-wink-heart"></i></h2>
												<p style="font-family: 'Gaegu'">${badkinder.addr}</p>
												<img  id=star1 height=50 width=50 src="http://gahyun.wooga.kr/main/img/testImg/star.png">
												<img  id=star2 height=50 width=50 src="http://gahyun.wooga.kr/main/img/testImg/star.png">
												<img  id=star3 height=50 width=50 src="http://gahyun.wooga.kr/main/img/testImg/star.png">
												<img  id=star4 height=50 width=50 src="http://gahyun.wooga.kr/main/img/testImg/star.png">
												<img  id=star5 height=50 width=50 src="http://gahyun.wooga.kr/main/img/testImg/star.png">
												
												

											</div>
</div>
                 
                </div>

                <!-- ============================================================== -->
                <!-- 스파이더 차트 -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-lg-7"  >
                        <div class="card oh">
                            <div class="card-body"  style="height:600px"}>
                              <h5 class="card-title" style="font-family: 'Hanna'">종합지표</h5>   
                                <div class="d-flex m-b-30 align-items-center no-block"> 
					   				 <div id="body">
										  <div id="chart" ></div>
					    			</div>    
    				<script src="resources/assets/js/script.js"></script> 
                             </div>
                            </div>
                        </div>
                    </div>
                    
                <!-- ============================================================== -->
                <!-- 유치원 상세정보 -->
                <!-- ============================================================== -->
                  <div class="col-md-5">
                        <div class="card">
                            <div class="card-body" style="height:600px	">
                                <h5 class="card-title" style="font-family: 'Hanna'">유치원 상세정보</h5>
                             
                                    <div class="sl-item">
                                       	<table border=0 cellpadding=10% cellspacing=10%>
   	<tr>
    <td align=center bgcolor="#fbe204" height="58" style="font-family: 'Gaegu'"><font size="4px">유치원명</font></td>
    <td align=center bgcolor="ffffff" style="font-family: 'Hanna'">${badkinder.kindername}</td>
    </tr> 
    <tr>
    <td width=100 hegiht=500 align=center bgcolor= "#ffff66" height ="58" style="font-family: 'Gaegu'"><font size="4px">교육청명</font></td>
    <td width=240 hegiht=500 align=center bgcolor= "ffffff" style="padding-left:10; font-family: 'Hanna'">${badkinder.officeedu}</td>
    </tr>
    <tr>
    <td width=200 hegiht=500 align=center bgcolor= "#fbe204" height ="58" style="font-family: 'Gaegu'"><font size="4px">교육지원청명</font></td>
    <td width=100 hegiht=500 align=center bgcolor= "ffffff" style="padding-left:10; font-family: 'Hanna'">${badkinder.subofficeedu}</td>
    </tr>
    <tr>
    <td width=100 hegiht=500 align=center bgcolor= "#ffff66" height ="58" style="font-family: 'Gaegu'"><font size="4px">설립일</font></td>
    <td width=100 hegiht=500 align=center bgcolor= "ffffff" style="padding-left:10; font-family: 'Hanna'">${badkinder.edate}</td>
   </tr>
    <tr>
    <td width=100 hegiht=500 align=center bgcolor= "#fbe204" height ="58" style="font-family: 'Gaegu'"><font size="4px">개원일</font></td>
    <td width=100 hegiht=500 align=center bgcolor= "ffffff" style="padding-left:10; font-family: 'Hanna'">${badkinder.odate}</td>
    </tr>
    <tr>
    <td width=100 hegiht=500 align=center bgcolor= "#ffff66" height ="58" style="font-family: 'Gaegu'"><font size="4px">주소</font></td>
    <td width=500 hegiht=500 align=center bgcolor= "ffffff" style="padding-left:10; font-family: 'Hanna'">${badkinder.addr}</td>
    </tr>
    <tr>
    <td width=100 hegiht=500 align=center bgcolor= "#fbe204" height ="58" style="font-family: 'Gaegu'"><font size="4px">전화번호</font></td>
    <td width=100 hegiht=500 align=center bgcolor= "ffffff" style="padding-left:10; font-family: 'Hanna'">${badkinder.telno}</td>
    </tr>
    <tr>
    <td width=100 hegiht=500 align=center bgcolor= "#ffff66" height ="58" style="font-family: 'Gaegu'"><font size="4px">홈페이지</font></td>
    <td width=100 hegiht=500 align=center bgcolor= "ffffff" style="padding-left:10; font-family: 'Hanna'"><a href=${badkinder.hpaddr}>${badkinder.hpaddr}</a></td>
    </tr>
    <tr>
    <td width=100 hegiht=500 align=center bgcolor= "#fbe204" height ="58" style="font-family: 'Gaegu'"><font size="4px">운영시간</font></td>
    <td width=100 hegiht=500 align=center bgcolor= "ffffff" style="padding-left:10; font-family: 'Hanna'">${badkinder.opertime}</td>
    </tr>
     </table>
                                  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- 그래프 6개 -->
                <!-- ============================================================== -->
                      <div class="row">
                    <div class="col-lg-4"  >
                        <div class="card oh">
                            <div class="card-body" }>
                              <h5 class="card-title" style="font-family: 'Hanna'">블라블라 원아수 그래프 </h5>
                              
                              <h6 style="padding-left:35%; font-family: 'Hanna'; font-size:200%; color:#339933;">적합/부적합</h6>
                              <div>
                              
                              </div>
							</div>
						</div>  
						</div>
						  <div class="col-lg-4"  >
                        <div class="card oh">
                            <div class="card-body"}>
                              <h5 class="card-title" style="font-family: 'Hanna'">블라블라 원아수 그래프 </h5>
							</div>
						</div>  
						</div>
						  <div class="col-lg-4"  >
                        <div class="card oh">
                            <div class="card-body"}>
                              <h5 class="card-title" style="font-family: 'Hanna'">블라블라 원아수 그래프 </h5>
							</div>
						</div>  
						</div>
						</div>
                <!-- ============================================================== -->
                 <div class="row">
                    <div class="col-lg-4"  >
                        <div class="card oh">
                            <div class="card-body" }>
                              <h5 class="card-title" style="font-family: 'Hanna'">블라블라 원아수 그래프 </h5>
							</div>
						</div>  
						</div>
						  <div class="col-lg-4"  >
                        <div class="card oh">
                            <div class="card-body"}>
                              <h5 class="card-title" style="font-family: 'Hanna'">블라블라 원아수 그래프 </h5>
							</div>
						</div>  
						</div>
						  <div class="col-lg-4"  >
                        <div class="card oh">
                            <div class="card-body"}>
                              <h5 class="card-title" style="font-family: 'Hanna'">블라블라 원아수 그래프 </h5>
							</div>
						</div>  
						</div>
						</div>
				<!-- ============================================================== -->
                <div class="row">
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex">
                                    <div>
                                        <h5 class="card-title" style="font-family: 'Hanna'">비리유치원 분석</h5>
                                 
                                    </div>
                        
                                </div>
                            </div>
                            <div>
										<table class="table table-hover" width="100%">
											<thead>
												<tr width="auto">
													<th class="text-center">#</th>
													<th style="font-family: 'Gaegu'; font-size: 20px">유치원명</th>
													<th style="font-family: 'Gaegu'; font-size: 20px">운영</th>
													<th style="font-family: 'Gaegu'; font-size: 20px">프로그램</th>
													<th style="font-family: 'Gaegu'; font-size: 20px">급식</th>
													<th style="font-family: 'Gaegu'; font-size: 20px">원아관리</th>
													<th style="font-family: 'Gaegu'; font-size: 20px">교직원</th>
													<th style="font-family: 'Gaegu'; font-size: 20px">탈세</th>
													<th style="font-family: 'Gaegu'; font-size: 20px">시설관리</th>
													<th style="font-family: 'Gaegu'; font-size: 20px">비리지수</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td></td>
													<td class="txt-oflo" style="font-family: 'Hanna'">${badkinder.kindername}</td>
													<td class="CellWithComment" style="font-family: 'Hanna'">&ensp;${badkinder.bad_oper}
													<c:if test="${badDetail.bad_oper eq null}">
													</td>
													</c:if>
													<c:if test="${badDetail.bad_oper ne null}">
													<div>
													<span class="CellComment" style="font-family: 'Hanna'">${badDetail.bad_oper}</span></td>
													</c:if>
													<td class="CellWithComment" style="font-family: 'Hanna'">&emsp;&ensp;${badkinder.bad_program}
													<c:if test="${badDetail.bad_program eq null}">
													</td>
													</c:if>
													<c:if test="${badDetail.bad_program ne null}">
													<span class="CellComment" style="font-family: 'Hanna'">${badDetail.bad_program}</span></td>
													</c:if>
													<td class="CellWithComment" style="font-family: 'Hanna'">&ensp;${badkinder.bad_meal}
													<c:if test="${badDetail.bad_meal eq null}">
													</td>
													</c:if>
													<c:if test="${badDetail.bad_meal ne null}">
													<span class="CellComment" style="font-family: 'Hanna'">${badDetail.bad_meal}</span></td>
													</c:if>
													<td class="CellWithComment" style="font-family: 'Hanna'">&emsp;&ensp;${badkinder.bad_care}
													<c:if test="${badDetail.bad_care eq null}">
													</td>
													</c:if>
													<c:if test="${badDetail.bad_care ne null}">
													<span class="CellComment" style="max-width:600%;">${badDetail.bad_care}</span></td>
													</c:if>
													<td class="CellWithComment" style="font-family: 'Hanna'">&emsp;${badkinder.bad_emp}
													<c:if test="${badDetail.bad_emp eq null}">
													</td>
													</c:if>
													<c:if test="${badDetail.bad_emp ne null}">
													<span class="CellComment" style="max-width:800%; font-family: 'Hanna'">${badDetail.bad_emp}</span></td>
													</c:if>
													<td class="CellWithComment" style="font-family: 'Hanna'">&nbsp;&nbsp;${badkinder.bad_tax}
													<c:if test="${badDetail.bad_tax eq null}">
													</td>
													</c:if>
													<c:if test="${badDetail.bad_tax ne null}">
													<span class="CellComment" style="max-width:600%; font-family: 'Hanna'">${badDetail.bad_tax}</span></td>
													</c:if>
													<td class="CellWithComment" style="font-family: 'Hanna'">&emsp;&ensp;${badkinder.bad_build}
													<c:if test="${badDetail.bad_build eq null}">
													</td>
													</c:if>
													<c:if test="${badDetail.bad_build ne null}">
													<span class="CellComment" style="max-width:300%; font-family: 'Hanna'">${badDetail.bad_build}</span></td>
													</c:if>
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

                            <div class="card-body"><h4 class="card-title" style="font-family: 'Hanna'; font-size: 20px">엄마들의 목소리</h4>
                              <br>
						<table id=review>
						</table>

						<br>
						
						<table id=review_order >
					
						</table>
						
						<br>
						<table>
						<tr>
						<td style="align:center;padding-top: 20px;	">
						<div class="star-box">
						  <span class="star star_left on"></span>
						  <span class="star star_left on"></span>
						  <span class="star star_left on"></span>
						 <span class="star star_left"></span>
						 <span class="star star_left"></span>
						</div>
						</td>
						<td><input id=review_text style="width:300px;margin-left:50px"/></td>
						<td >
						<input id=star_point type=hidden value="3">
						<a onclick="addComment('${kinderinfoId}')" style="margin-left:50px; cursor:pointer" >등록</a></td>
						</tr>
						</table>
						
						
						
						</div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card" >
                            <div class="card-body" style="width:1024px;height:1024;">
                            
                                <h5 class="card-title" style="font-family: 'Hanna'; font-size: 20px">Review WordCloud</h5>
                                <div  style="text-align:inherit;">
                                <svg id = "mycloud"></svg>
                                </div>
                                
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
    </article>
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
	var C1 = document.getElementById("review");
	
	
	$.ajax({
			url:"commentList.do",
			method:"GET",
			async:false,
			traditional : true,
			data:{
				'kdid':id
			},
			success:function(data){
				
				
				var obj = JSON.parse(data);
				
				comments = obj;
				var sum = 0 ;
				
				showReview(obj,0);
				
				var length = Object.keys(obj.result).length;
				var maxAtag =length/10;
				if( maxAtag > 10){
					maxAtag = 10;
				}
				
				if(length>10){
					$('#review_order').empty();
					for(var i = 0;i<maxAtag;i++){
						var $div=$('<a class=indextag onclick="review('+i+')" style="cursor:pointer">'+(i+1)+'</a>');
						$('#review_order').append($div);
						
					}	
				}
				
				
				for(var j=0;j<Object.keys(obj.result).length;j++){
					sum =sum + parseInt(obj.result[j][2]["Score"]);
				}
				
				staravg = Math.floor(sum/Object.keys(obj.result).length);
				starmake(staravg);
				
				},
			 	error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    }
		});
}
function review(num){
	showReview(comments,num);
}

function showReview(obj,num){
	
	var maxValue =10;
	var length = Object.keys(obj.result).length; 
	var maxValue = length%(10*num)
	
	if(length>=(num+1)*10){
		maxValue = 10;	
	}
	else{
		maxValue = length%10;	
	}
	
	$('#review').empty();
	for(var i = 0;i<maxValue;i++){
 		var $div =$('<tr style="margin-bottom: 30px;border-bottom: 1px solid #444444; padding: 30px;">'+
 				'<td id=commentWriter'+i+'  class=td1>'+obj.result[(num*10)+i][1]["Writer"]+'</td>'+
 				'<td id=commentScore'+i+'   class=td2 style="width:150px;">'+imagemake(obj.result[(num*10)+i][2]["Score"])+'</td>'+
 				'<td id=commentContent'+i+'  class=td3>'+obj.result[(num*10)+i][0]["Contents"]+'</td>'+
 				'<hr>'+
 				'</tr>');
 		$('#review').append($div);
	};
}
//세부 홈페이지 상단에 보여지는 별
function starmake(staravg){
	for(var i = 1;i<=5;i++){
		if(i<=staravg){
			document.getElementById("star"+i).src = 'http://gahyun.wooga.kr/main/img/testImg/star_on.png'
		}
		else{
			document.getElementById("star"+i).src = 'http://gahyun.wooga.kr/main/img/testImg/star.png'
		}
	}
}

//댓글 내부에 들어가는 별
function imagemake(num){
	var imagetag1 = '<img  height=25 width=25 src="http://gahyun.wooga.kr/main/img/testImg/star_on.png">';
	var imagetag2 = '<img  height=25 width=25 src="http://gahyun.wooga.kr/main/img/testImg/star.png">';
	var result="";
	for(var i = 1;i<=5;i++){
		if(i<=num){
			result += imagetag1;
		}
		else{
			result += imagetag2;
		}
	}
	return result;
	
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
			SearchID(kdid);
			},
		 	error:function(request,status,error){
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		    }
	});	
	}
}



$(".star").on('click',function(){
	   var idx = $(this).index();
	   $(".star").removeClass("on");
	     for(var i=0; i<=idx; i++){
	        $(".star").eq(i).addClass("on");
	   }
		var pp = $('#star_point').val(idx+1);
	 });





</script>

</body>

</html>