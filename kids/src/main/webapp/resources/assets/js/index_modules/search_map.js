//좌측 검색창***********************************************************************************************************************************************
//var ps = new kakao.maps.services.Places();

//searchPlaces();

//키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        //alert('키워드를 입력해주세요!');
        return false;
    }
	
    getSafetyArr(3,map)
}

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

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + '<a id=searchA'+index+' style="cursor:pointer;" onclick=onlyLogin(\''+places["kindername"]+'\',\''+places["kinderinfoId"]+'\',\''+places["subofficeedu"]+'\',3,'+index+')>'+places["kindername"]+'</a>' + '</h5>';
    
//    places["kindername"]
//    places["kinderinfoId"]
//    places["subofficeedu"]
    
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