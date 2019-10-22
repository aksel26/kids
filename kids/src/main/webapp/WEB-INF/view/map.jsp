<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    /* .radius_border{border:1px solid #919191;border-radius:5px;}  */     
.custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}         
/* html, body {width:100%;height:100%;margin:0;padding:0;}  */
    
    </style>
 <div class="map_wrap">
         
         <div id="map" style="width: 110%; height: 700px;position:relative; overflow:hidden;"></div>
          <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
          <div class="custom_zoomcontrol radius_border"> 
                 <span onclick="zoomIn()">
                 <img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"/></span>  
              <span onclick="zoomOut()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"/></span>
          </div>
          
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
         <div id="clickLatlng"></div>
         <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=048d3839f2032025c0d6225330618498&libraries=services,clusterer"></script>
            </div>
<script>

$(document).ready(function(){
   getSafetyArr(1,map);
})   

var default_x = 37.5663;
var default_y = 126.9779;
var default_level = 3;


if("${authInfo.userid}"!=""){
   var userlocation = "${authInfo.location}"
      userlocation = userlocation.split(',');
      default_x = userlocation[0];
      default_y = userlocation[1];
      default_level = 6
}

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(default_x, default_y), // 지도의 중심좌표
    level: default_level // 지도의 확대 레벨
};

var markers = [];

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var markerImageUrl = 'resources/images/사립(법인).png', 
markerImageUrl2 = 'resources/images/사립(사인).png',
markerImageUrl3 = 'resources/images/공립(단설)빨강.png',
markerImageUrl4 = 'resources/images/공립(병설)빨강.png',
markerImageSize = new kakao.maps.Size(40, 42), // 마커 이미지의 크기
markerImageOptions = { 
offset : new kakao.maps.Point(20, 42)// 마커 좌표에 일치시킬 이미지 안의 좌표
};

//마커 이미지를 생성한다
var markerImage1 = new kakao.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);
var markerImage2 = new kakao.maps.MarkerImage(markerImageUrl2, markerImageSize, markerImageOptions);
var markerImage3 = new kakao.maps.MarkerImage(markerImageUrl3, markerImageSize, markerImageOptions);
var markerImage4 = new kakao.maps.MarkerImage(markerImageUrl4, markerImageSize, markerImageOptions);

var markerImage; // 마크 이미지 바꾸기
var markerList = []; // 마커 보이기,숨기기용 배열
var markerPosition3;
var marker3;

//지도에 클릭 이벤트를 등록합니다
//지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
// 클릭한 위도, 경도 정보를 가져옵니다 
var latlng = mouseEvent.latLng; 
var Map_x = latlng.getLat();
var Map_y = latlng.getLng();
}); // 지도에서 클릭 이벤트 엔드

var count = 0;
var NameList= [];
var IDList =[];
var EduList=[];
var SubEduList=[];
var EdateList=[];
var OdateList=[];
var AddList=[];
var TelList=[];
var HomeList=[];
var TimeList=[];
var message = {};



function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}

function addComment(n){
   if(${authInfo eq null}){
      alert("로그인이 필요한 기능입니다.");   
   }
   else{
      var contents = $('#contents').val();
      var kdid = IDList[n];
      
      
   $.ajax({
      url:"addCommnet.do",
      method:"GET",
      async:false,
      traditional : true,
      data:{
         'kdid':kdid,
         'contents':contents
      },
      success:function(data){
         
         reviewFunction(n);
         },
          error:function(request,status,error){
              alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
          }
   });
   
   }
}
function reviewFunction(n){   //리뷰
   SearchID(IDList[n],n)
}

function scoreFunction(n){   //점수
   var C1 = document.getElementById("clean")
   C1.innerHTML=NameList[n]
}

function SearchID (n,count){//리뷰보기를 누르면 목록을 받아오는 부분
   var C1 = document.getElementById("clean")
   C1.innerHTML= "<br>"
   
   $.ajax({
         url:"commentList.do",
         method:"GET",
         async:false,
         traditional : true,
         data:{
            'kdid':n
         },
         success:function(data){
            var obj = JSON.parse(data);
            for(var i = 0;i<Object.keys(obj.result).length;i++){
             var $div = $('<span> '+ obj.result[i][1]["Writer"]+' ('+obj.result[i][2]["Score"]+'점):'+obj.result[i][0]["Contents"]+'</span><hr>');
             $('#clean').append($div);
            };
            },
             error:function(request,status,error){
                 alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
             }
      });
   var $div = $("<input type='button' value='등 록' id = but style='font-family: Hanna;' onclick='reviewAddFunction(" + count + ");' >");
      $('#clean').append($div);
}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker3, infowindow) { 
     return function() {
        infowindow.open(map, marker3);
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
         }else if($('#drop_val').val()==null){
            
                  getSafetyArr(1, map);
                 
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
           removable : true
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
   return '<div style="padding:5px; width : 360px; height : 380px;">' +
   '<table border=0 cellpadding=0 cellspacing=0>'+'<tr>'+'<td>'+
    '<div id = "clean">'+
   '<div>'+

    '<h3>'+value["kindername"]+'</h3>'+'<br/>'+
    '</div>'+ 
    '<div>'+
      '<p>'+value["telno"]+'</p>'+
    '<a href='+value["hpaddr"]+'/>'+value["hpaddr"]+
    '</div>'+
    '</div>'+
    '</table>'+
    '</div>'
}


//좌측 검색창***********************************************************************************************************************************************
//var ps = new kakao.maps.services.Places();

searchPlaces();

//키워드 검색을 요청하는 함수입니다
function searchPlaces() {

  var keyword = document.getElementById('keyword').value;

  if (!keyword.replace(/^\s+|\s+$/g, '')) {
      //alert('키워드를 입력해주세요!');
      return false;
  }
   
  keywordSearch(keyword);
  getSafetyArr(3,map)
  // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
  //ps.keywordSearch( keyword, placesSearchCB); 
}

//********************************만든함수
function keywordSearch(keyword){

   
   
   message["keyword"]=  keyword;
   realData = JSON.stringify(message);
   
   $.ajax({
      type: 'POST',
      url:"./search.do/keywordSearch.do",
      dataType: 'json',
      contentType:'application/json',
      data:realData,
      traditional : true,
      async:false,
      success: function(data) {
         displayPlaces(data);
  },
  error:function(request,status,error){
      alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
  }
  });
   
}

//************************************************************************************************************
//장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
  if (status === kakao.maps.services.Status.OK) {
      // 정상적으로 검색이 완료됐으면
      
      // 검색 목록과 마커를 표출합니다
      displayPlaces(data);
     

  } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

      alert('검색 결과가 존재하지 않습니다.');
      return;

  } else if (status === kakao.maps.services.Status.ERROR) {

      alert('검색 결과 중 오류가 발생했습니다.');
      return;

  }
}

function displayPlaces(places) {

  var listEl = document.getElementById('placesList'), 
  menuEl = document.getElementById('menu_wrap'),
  fragment = document.createDocumentFragment(), 
  bounds = new kakao.maps.LatLngBounds(), 
  listStr = '';
  
  // 검색 결과 목록에 추가된 항목들을 제거합니다
  removeAllChildNods(listEl);

  for ( var i=0; i<places.length; i++ ) {

      // 마커를 생성하고 지도에 표시합니다
      var placePosition = new kakao.maps.LatLng(places[i]["point_Y"], places[i]["point_X"]),
          itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
   
      // LatLngBounds 객체에 좌표를 추가합니다
      bounds.extend(placePosition);
      fragment.appendChild(itemEl);
  }

  // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
  listEl.appendChild(fragment);
  menuEl.scrollTop = 0;

}

//검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

  var el = document.createElement('li'),
  itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
              '<div class="info">' +
              '   <h5>' + places["kindername"] + '</h5>';

  if (places.road_address_name) {
      itemStr += '    <span>' + places["addr"] + '</span>' +
                  '   <span class="jibun gray">' +  places["addr"]  + '</span>';
  } else {
      itemStr += '    <span>' +  places["addr"]  + '</span>'; 
  }
               
    itemStr += '  <span class="tel">' + places["telno"]  + '</span>' +
              '</div>';           

  el.innerHTML = itemStr;
  el.className = 'item';

  return el;
}
// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
  while (el.hasChildNodes()) {
      el.removeChild (el.lastChild);
  }
}

//************************************************************************************************************************************************


</script>
      </div>

</div>