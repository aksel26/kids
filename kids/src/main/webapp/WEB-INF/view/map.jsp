<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<script type="test/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>


<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:20px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;} 
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}



  .wrap {position: relative;left: -1px;bottom:1px;width: auto;height: auto;margin-left: 0px;text-align: center;overflow: hidden;font-size: 12px;font-family: 'Hanna', dotum, '돋움', sans-serif;line-height: 1.3;} 
     .wrap * {padding: 0;margin: 0;} 
     .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;} 
     .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;} 
     .info .title {padding: 5px 0 0 10px;height: 30px;font-family: 'Hanna';background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;} 
     .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');} 
     .info .close:hover {cursor: pointer;} 
     .info .body {position: relative;overflow: hidden;} 
     .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;} 
     .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;} 
     .desc .jibun {font-size: 11px;margin-top: -2px;} 
     .info .img {position: absolute;top: 6px;left: 30px;width: 73px;height: 71px;border: 0px solid #ddd;color: #888;overflow: hidden;} 
     .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')} 
     .info .link {color: #5085BB;} 

/* .radius_border { */
/* 	border: 1px solid #919191; */
/* 	border-radius: 5px; */
/* } */

</style>
</head>
<body>
<article>
<div class="map_wrap">

	<div id="map"
		style="width: 100%; height: 180%; position:relative; overflow: hidden;"></div>

		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						키워드 : <input type="text" value="" id="keyword" size="15">
						<button type="submit">검색하기</button>
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>

</article>
<script>

var count;
var NameList;
var IDList;
var EduList;
var SubEduList;
var EdateList;
var OdateList;
var AddList;
var TelList;
var HomeList;
var TimeList;
var message;

var markerImage; // 마크 이미지 바꾸기
var markerList; // 마커 보이기,숨기기용 배열
var tempList;

var default_x;
var default_y;
var default_level;

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(default_x, default_y), // 지도의 중심좌표
    level: default_level // 지도의 확대 레벨
};


var markers;
var map; // 지도를 생성합니다

var markerImageSize;
//마커 이미지를 생성한다
var markerImage1;
var markerImage2;
var markerImage3;
var markerImage4;

//줌 컨트롤
var zoomControl;


function default_setting(){
	count = 0;
	NameList= [];
	IDList =[];
	EduList=[];
	SubEduList=[];
	EdateList=[];
	OdateList=[];
	AddList=[];
	TelList=[];
	HomeList=[];
	TimeList=[];
	message = {};

	markerImage; // 마크 이미지 바꾸기
	markerList = []; // 마커 보이기,숨기기용 배열
	tempList =[];

	default_level = 5;
	
	mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(default_x, default_y), // 지도의 중심좌표
	    level: default_level // 지도의 확대 레벨
	};

	markers = [];
	map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	markerImageSize = new kakao.maps.Size(40, 42),markerImageOptions = {offset : new kakao.maps.Point(20, 42)};
	
	markerImage1 = new kakao.maps.MarkerImage("resources/images/사립(법인).png", markerImageSize, markerImageOptions);
	markerImage2 = new kakao.maps.MarkerImage("resources/images/사립(사인).png", markerImageSize, markerImageOptions);
	markerImage3 = new kakao.maps.MarkerImage("resources/images/공립(단설)빨강.png", markerImageSize, markerImageOptions);
	markerImage4 = new kakao.maps.MarkerImage("resources/images/공립(병설)빨강.png", markerImageSize, markerImageOptions);
	
	zoomControl = new kakao.maps.ZoomControl(); 
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
}

function ip_result(){
	var geoData, ipData = "${ip}";
	var xhttp = new XMLHttpRequest();
	
	xhttp.open("GET", "http://ip-api.com/json/"+ipData, true);
	xhttp.send(); 
	xhttp.onreadystatechange = function(){	
		if (this.readyState == 4 && this.status == 200) {
			geoData = JSON.parse(this.responseText);
			default_x=geoData.lat;
			default_y=geoData.lon;
			}
	};
}

$(document).ready(function(){
	if("${authInfo.userid}"==""){
		ip_result();
	}
	else{
		default_x="${authInfo.POINT_X}";
		default_y="${authInfo.POINT_Y}";
	}
	
	setTimeout(()=>{
		default_setting();
		getSafetyArr(1,map);	
		
	}, 1000);	
});

function reviewFunction(n){   //리뷰
   SearchID(IDList[n],n)
}

function scoreFunction(n){   //점수
   var C1 = document.getElementById("clean")
   C1.innerHTML=NameList[n]
}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) { 
     return function() {
        infowindow.open(map, marker);
    	 
     };
  }
//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
function setMarkerList(map) {
      for (var i = 0; i < markerList.length; i++) {
           markerList[i].setMap(map);
       }         
}

// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
function hideMarkers() {
    setMarkerList(null);    
}

function imageChange(n){
   if(n=="공립(병설)") { markerImage = markerImage4; }
   else if(n=="공립(단설)") { markerImage = markerImage3; }
   else if(n=="사립(사인)") { markerImage = markerImage2; }
   else if(n=="사립(법인)") { markerImage = markerImage1; }
   return markerImage;
}

//******************************getCategory***********************************************

function selectVal(flag){
	if(flag==1){
		$('#drop_val').val('1');
	}
	else if(flag==2){
		$('#drop_val').val('2');
	}
	else if(flag==3){
		$('#drop_val').val('3');
	}
	else if(flag==4){
		$('#drop_val').val('4');
	}
	else{
		$('#drop_val').val('0');
	}
}


function getSafetyArr(select,map){
	   
	   if(select==1){
	      var sevletDo = './search.do/allSearch.do';  
	   }

	    else if(select == 2){
	      message={};
	      hideMarkers();
	      
	      //var sevletDo = './search.do';
	      
	      if($('#drop_val').val()==1){
	         var sevletDo = './search.do/safety.do';
	          $('input:checkbox[name=safety]:checked').each(function(i){
	            
	              var key = $(this).val()
	               message[key]=  key;
	              
	             
	          }); // 체크된 것만 뽑아 배열에 push
	          }
	          else  if($('#drop_val').val()==2){
	             var sevletDo = './search.do/sanitary.do';
	              $('input:checkbox[name=sanitary]:checked').each(function(i){
	                   
	                     var key = $(this).val()
	                      message[key]=  key;
	                     
	                    
	                 }); // 체크된 것만 뽑아 배열에 push
	          }
	         else  if($('#drop_val').val()==3){
	            var sevletDo = './search.do/build.do';
	            $('input:checkbox[name=buildinfo]:checked').each(function(i){
	                  
	                 var key = $(this).val()
	                  message[key]=  key;
	                 
	                
	             }); // 체크된 것만 뽑아 배열에 push
	             }
	         else  if($('#drop_val').val()==4){
	            var sevletDo = './search.do/environment.do';
	            $('input:checkbox[name=environment]:checked').each(function(i){
	                  
	                 var key = $(this).val()
	                  message[key]=  key;
	                 
	                
	             }); // 체크된 것만 뽑아 배열에 push
	         }else  if($('#drop_val').val()==0){
	        	 
	              var sevletDo = './search.do/allSearch.do';  
	            
	                  
	              }; // 체크된 것만 뽑아 배열에 push
	      
	      
	   }
	   else if(select == 3){
	      
	      hideMarkers();
	      
	      var keyword = document.getElementById('keyword').value;
	      
	      message["keyword"]=  keyword;
	      
	      var sevletDo = './search.do/keywordSearch.do';
	   
	   }
	   
	   var realData = JSON.stringify(message);
	   
	    $.ajax({
	        type: 'POST',
	        url:sevletDo,
	        dataType: 'json',
	        contentType:'application/json',
	        data: realData, //메시지에 셀렉트 된 인자 정보를 받아서 컨트롤러단으로 넘김.
	        traditional : true,
	        async:false,
	        success: function(data) {
	        	
	        if(select ==3){
	        	
	        	console.log("들어감");

	    		displayPlaces(data);
	    		var keyword = document.getElementById('keyword').value;
	    		var moveLatLon;
	    		var level = 7;
	    		if(keyword=="광진구"){var moveLatLon = new kakao.maps.LatLng(37.545249,127.083211);map.panTo(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="서초구"){moveLatLon = new kakao.maps.LatLng(37.495774,127.006647);map.panTo(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="동작구"){moveLatLon = new kakao.maps.LatLng(37.503169,126.951332);map.panTo(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="양천구"){moveLatLon = new kakao.maps.LatLng(37.522783,126.855652);map.setCenter(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="용산구"){moveLatLon = new kakao.maps.LatLng(37.536252,126.982931);map.setCenter(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="서대문구"){moveLatLon = new kakao.maps.LatLng(37.575935,126.935828);map.setCenter(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="관악구"){moveLatLon = new kakao.maps.LatLng(37.481487,126.940439);map.setCenter(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="강북구"){moveLatLon = new kakao.maps.LatLng(37.634510,127.021930);map.setCenter(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="성북구"){moveLatLon = new kakao.maps.LatLng(37.598600,127.022138);map.setCenter(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="중랑구"){moveLatLon = new kakao.maps.LatLng(37.598088,127.092722);map.setCenter(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="강남구"){moveLatLon = new kakao.maps.LatLng(37.503173,127.050169);map.setCenter(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="영등포구"){moveLatLon = new kakao.maps.LatLng(37.517285,126.907831);map.setCenter(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="종로구"){moveLatLon = new kakao.maps.LatLng(37.584256,126.972959);map.setCenter(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="강서구"){moveLatLon = new kakao.maps.LatLng(37.554956,126.832973);map.setCenter(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="강동구"){moveLatLon = new kakao.maps.LatLng(37.554956,126.832973);map.setCenter(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="성동구"){moveLatLon = new kakao.maps.LatLng(37.554541,127.041052);map.setCenter(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="도봉구"){moveLatLon = new kakao.maps.LatLng(37.661328,127.035878);map.setCenter(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="구로구"){moveLatLon = new kakao.maps.LatLng(37.498454,126.856539);map.setCenter(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="노원구"){moveLatLon = new kakao.maps.LatLng(37.650681,127.068601);map.setCenter(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="마포구"){moveLatLon = new kakao.maps.LatLng(37.559956,126.907613);map.setCenter(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="송파구"){moveLatLon = new kakao.maps.LatLng(37.504126,127.115071);map.setCenter(moveLatLon);map.setLevel(level);}
	    		else if(keyword=="동대문구"){console.log("동대문구 들어감");moveLatLon = new kakao.maps.LatLng(37.581223,127.056578);map.setCenter(moveLatLon);map.setLevel(level);}
	    	
	        }	
			 markerList = []; // 마커 보이기,숨기기용 배열
	         count=0;
	         $.each(data, function(key, value){
	            
	         NameList.push(value["kindername"]);
	         IDList.push(value["kinderinfoId"]);
	         EduList.push(value["officeedu"]);
	         SubEduList.push(value["subofficeedu"]);
	         EdateList.push(value["edate"]);
	         OdateList.push(value["odate"]);
	         AddList.push(value["addr"]);
	         TelList.push(value["telno"]);
	         HomeList.push(value["hpaddr"]);
	         TimeList.push(value["opertime"]);
	            
	         
	            var point_x = value["point_X"];
	            var point_y = value["point_Y"];

	            var markerImage; // 마크 이미지 바꾸기
	           
	            
	            
	            var marker = new kakao.maps.Marker({
	                map: map, // 마커를 표시할 지도
	                position: new kakao.maps.LatLng(point_x,point_y), // 마커를 표시할 위치
	                title :value["kindername"], // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	                image :  imageChange(value["establish"]), // 마커 이미지 
	                clickable : true
	            });
	        
	            
	            
	            
	            
	       var iwContent= getiwContent(count,value);
	      
	       
	       var infowindow = new kakao.maps.InfoWindow({
	           content : iwContent,
	           removable : true,
	           
	       });

	       kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow)); 


	       marker.setMap(map);
	       markerList.push(marker);
	       count++;
	       
	       if($('#drop_val').val()==1){
	           var fire_avd_dt='';
	           var gas_ck_dt='';
	           var elect_ck_dt='';
	           var plyg_ck_dt='';
	    
	           if(value["fire_avd_dt"] = 'null'){
	              fire_avd_dt='준비중입니다.';
	           } else {
	              fire_avd_dt = value["fire_avd_dt"];
	           }
	           
	           if(value["gas_ck_dt"] = 'null'){
	              gas_ck_dt='준비중입니다.';
	           } else {
	              gas_ck_dt = value["gas_ck_dt"];
	           }
	           
	           if(value["elect_ck_dt"] = 'null'){
	              elect_ck_dt='준비중입니다.';
	           } else {
	              elect_ck_dt = value["elect_ck_dt"];
	           }
	           if(value["plyg_ck_dt"] = 'null'){
	              plyg_ck_dt='준비중입니다.';
	           } else {
	              plyg_ck_dt = value["plyg_ck_dt"];
	           }
	       }
	       
	       else  if($('#drop_val').val()==2){
	       
	           var arql_chk_dt='';
	           var fxtm_dsnf_chk_dt='';
	           var mdst_chk_dt='';
	           var ilmn_chk_dt='';
	           
	           
	           if(value["arql_chk_dt"] = 'null'){
	              arql_chk_dt='준비중입니다.';
	           } else {
	              arql_chk_dt = value["arql_chk_dt"];
	           }
	           
	           if(value["fxtm_dsnf_chk_dt"] = 'null'){
	              fxtm_dsnf_chk_dt='준비중입니다.';
	           } else {
	              fxtm_dsnf_chk_dt = value["fxtm_dsnf_chk_dt"];
	           }
	           
	           if(value["mdst_chk_dt"] = 'null'){
	              mdst_chk_dt='준비중입니다.';
	           } else {
	              mdst_chk_dt = value["mdst_chk_dt"];
	           }
	           if(value["ilmn_chk_dt"] = 'null'){
	              ilmn_chk_dt='준비중입니다.';
	           } else {
	              ilmn_chk_dt = value["ilmn_chk_dt"];
	           }
	       }
	        
	         else  if($('#drop_val').val()==3){
	            var big_clsrarea='';
	            var small_clsrarea='';
	            var phgrindrarea='';
	            var hlsparea='';
	            var ktchmssparea='';
	            
	            if(value["big_clsrarea"] = 'null'){
	               big_clsrarea='준비중입니다.';
	                } else {
	                   big_clsrarea = value["big_clsrarea"];
	                }
	                
	                if(value["small_clsrarea"] = 'null'){
	                   small_clsrarea='준비중입니다.';
	                } else {
	                   small_clsrarea = value["small_clsrarea"];
	                }
	                
	                if(value["phgrindrarea"] = 'null'){
	                   phgrindrarea='준비중입니다.';
	                } else {
	                   phgrindrarea = value["phgrindrarea"];
	                }
	                if(value["hlsparea"] = 'null'){
	                   hlsparea='준비중입니다.';
	                } else {
	                   hlsparea = value["hlsparea"];
	                }
	                if(value["ktchmssparea"] = 'null'){
	                   ktchmssparea='준비중입니다.';
	                } else {
	                   ktchmssparea = value["ktchmssparea"];
	                }
	            }
	            
	         else  if($('#drop_val').val()==4){
	            var vhcl_oprn_yn='';
	            var spcn_thcnt='';
	            var ntcnt='';
	            var ntrt_thcnt='';
	            
	            if(value["vhcl_oprn_yn"] = 'null'){
	               vhcl_oprn_yn='준비중입니다.';
	                } else {
	                   vhcl_oprn_yn = value["vhcl_oprn_yn"];
	                }
	                
	                
	                if(value["spcn_thcnt"] = 'null'){
	                   spcn_thcnt='준비중입니다.';
	                } else {
	                   spcn_thcnt = value["spcn_thcnt"];
	                }
	                if(value["ntcnt"] = 'null'){
	                   ntcnt='준비중입니다.';
	                } else {
	                   ntcnt = value["ntcnt"];
	                }
	                if(value["ntrt_thcnt"] = 'null'){
	                   ntrt_thcnt='준비중입니다.';
	                } else {
	                   ntrt_thcnt = value["ntrt_thcnt"];
	                }
	           };
	            
	            
	          });
	  },
	    error:function(request,status,error){
	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	    }
	    });
	}

function getiwContent(count,value){//인포 윈도우 얻어오기
	
	var tag = '<div class="wrap">' + 
    '    <div class="info">' + 
    '        <div class="title">' + 
    			value["kindername"] + 
    '        </div>' + 
    '        <div class="body">' + 
    '            <div class="img">' +
    '                <img src="resources/images/baby.png" width="73" height="70">' +
    '           </div>' + 
    '            <div class="desc">' + 
    '				<p style="font-family: Hanna; color:black; text-align:center;">'+value["telno"]+'</p>';
	
      if(value["hpaddr"]==null){
    	  tag += '				<a style="font-family: Hanna; color:blue; text-align:center;"/>홈페이지가 없어요<br/>';
      }
      else{
    	  tag += '				<a style="font-family: Hanna; color:blue; text-align:center;" href='+value["hpaddr"]+'/>'+value["hpaddr"]+'<br/>'
      }
      
      tag +='				<a id=detailA style="font-family: Hanna; text-align:center;" onclick=onlyLogin(\''+value["kindername"]+'\',\''+value["kinderinfoId"]+'\',\''+value["subofficeedu"]+'\',2) />'+'>>>상세보기'+
	     '            </div>' + 
	     '        </div>' + 
	     '    </div>' +    
	     '</div>';
		     
	
	     return tag;
    
           }
function onlyLogin(name,id,subo,select){
	 
	 console.log(name,id,subo,select);
	 
	 if(${authInfo.userid eq null}){
		 alert("로그인이 필요한 기능입니다.");
	 }
	 else{
		 if(select == 1){
			 $("#rankA").attr("href","detail.do?kindername="+name+"&kinderinfoId="+id+"&subofficeedu="+subo);	 
		 }
		 else if(select == 2){
			 $("#detailA").attr("href","detail.do?kindername="+name+"&kinderinfoId="+id+"&subofficeedu="+subo);
// 			 $("#detailA").get(0).click();
		 }
		 else if(select == 3){
			 $("#searchA").attr("href","detail.do?kindername="+name+"&kinderinfoId="+id+"&subofficeedu="+subo);
		 }
		 	 
		 
		 
		 
		 
	 }	 
}  
//**********************************************************************************


</script>
</body>
<!-- 	<script src="./resources/assets/js/index_modules/getCategory.js" charset="UTF-8"></script> -->
	<script src="./resources/assets/js/index_modules/search_map.js" charset="UTF-8"></script>
