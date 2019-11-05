<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
  <head>
    <style>
     .text-wrapper {
  position: auto;
  display: inline-block;

  overflow: hidden;
  font-family: 'Gaegu';
}

.text-wrapper td{
display: inline-block; 
  line-height: 30px;
  transform-origin: 0 0;

}


.waves-effect.waves-light .waves-ripple { */
    background-color: rgba(255,255,255,0.45) 
 }
 .CellWithComment{position:relative;}

 .CellComment
        {
 		 visibility: hidden;
            width: 550px;
            position:absolute; 
            z-index:100;
            text-align:center;
            opacity: 0.4;
            transition: opacity 1s;
            border-radius: 6px;
            background-color: #b3b3cc;
            padding:3px;
            top:-30px; 	
            left:0px;
        }   
 .CellWithComment:hover span.CellComment {visibility: visible; opacity: 1;}

    </style>
    </head>
    <body>
      
               <h3 class="menu-title">카테고리<a class="CellWithComment"><i class="fas fa-question-circle" style="font-size:2px"><span class="CellComment" width=700px style="font-size:15px" >
           <img src="resources/images/public1.png" width=40px height=40px/><b style="font-family:'Hanna'">공립(단설)</b><img src="resources/images/public2.png" width=40px height=40px/><b style="font-family:'Hanna'">공립(병설)</b><img src="resources/images/private1.png" width=40px height=40px/>
           <b style="font-family:'Hanna'">사립(법인)</b><img src="resources/images/private2.png"width=40px height=40px/><b style="font-family:'Hanna'">사립(사인)</b></span></i></a></h3>
               <!-- /.menu-title -->

            <li class="menu-item-has-children dropdown">
               <input id=drop_val type="hidden" value="" />
               <a href="#" onclick="selectVal(1)"
                  class="dropdown-toggle" data-toggle="dropdown"

                  aria-haspopup="true" aria-expanded="false"> <i
                     class="menu-icon fa fa-heart"></i>안전
               </a>
                  <ul class="sub-menu children dropdown-menu">
                     <form method="post" name="multiple_check">
                        <ul style="font-family: 'Gaegu', cursive; font-size: 20px";>
                           <li class="custom-control custom-checkbox mb-3"><input
                              type="checkbox" class="custom-control-input" id="customCheck"
                              value="fire_avd_dt" name="safety"> <label
                              class="custom-control-label" for="customCheck">소방 검사</label></li>
                           <li class="custom-control custom-checkbox mb-3"><input
                              type="checkbox" class="custom-control-input" id="customCheck2"
                              value="gas_ck_dt" name="safety"> <label
                              class="custom-control-label" for="customCheck2">가스 검사</label>
                           </li>
                           <li class="custom-control custom-checkbox mb-3"><input
                              type="checkbox" class="custom-control-input" id="customCheck3"
                              value="elect_ck_dt" name="safety"> <label
                              class="custom-control-label" for="customCheck3">전기 검사</label>
                           </li>
                           <li class="custom-control custom-checkbox mb-3"><input
                              type="checkbox" class="custom-control-input" id="customCheck4"
                              name="safety" value="plyg_ck_dt"> <label
                              class="custom-control-label" for="customCheck4">놀이 시설
                                 검사</label></li>
                        </ul></li>
               </form>
            </ul>
            </li>

            <li class="menu-item-has-children dropdown">

            <input id=drop_val type="hidden" value="" />
            <a href="#" onclick="selectVal(2)"
               class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false"> <i class="menu-icon fa fa-heart"></i>위생
            </a>
               <ul class="sub-menu children dropdown-menu">

                  <form method="post" name="multiple_check">
                     <ul style="font-family: 'Gaegu', cursive; font-size: 20px";>
                        <li class="custom-control custom-checkbox mb-3"><input
                           type="checkbox" class="custom-control-input" id="customCheck6"
                           name="sanitary" value="arql_chk_dt"> <label
                           class="custom-control-label" for="customCheck6">실내공기질</label></li>

                        <li class="custom-control custom-checkbox mb-3"><input
                           type="checkbox" class="custom-control-input" id="customCheck7"
                           name="sanitary" value="fxtm_dsnf_chk_dt"> <label
                           class="custom-control-label" for="customCheck7">정기소독</label></li>
                        <li class="custom-control custom-checkbox mb-3"><input
                           type="checkbox" class="custom-control-input" id="customCheck8"
                           name="sanitary" value="mdst_chk_dt"> <label
                           class="custom-control-label" for="customCheck8">미세먼지</label></li>
                        <li class="custom-control custom-checkbox mb-3"><input
                           type="checkbox" class="custom-control-input" id="customCheck9"
                           name="sanitary" value=ilmn_chk_dt"> <label
                           class="custom-control-label" for="customCheck9">조도관리</label></li>


                     </ul>
                  </form>

               </ul></li>
            <li class="menu-item-has-children dropdown">
            <input id=drop_val type="hidden" value="" />
            <a href="#" onclick="selectVal(3)"
               class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"

               aria-expanded="false"> <i class="menu-icon fa fa-heart"></i>시설정보
            </a>
               <ul class="sub-menu children dropdown-menu">

                  <form method="post" name="multiple_check">
                     <ul style="font-family: 'Gaegu', cursive; font-size: 20px";>
                        <li class="custom-control custom-checkbox mb-3"><input
                           type="checkbox" class="custom-control-input" id="customCheck10"

                           name="buildinfo" value="big_clsrarea"> <label
                           class="custom-control-label" for="customCheck10">대규모 유치원</label></li>

                        <li class="custom-control custom-checkbox mb-3"><input
                           type="checkbox" class="custom-control-input" id="customCheck11"
                           name="buildinfo" value="small_clsrarea"> <label class="custom-control-label"
                           for="customCheck11">소규모 유치원</label></li>
                        <li class="custom-control custom-checkbox mb-3"><input
                           type="checkbox" class="custom-control-input" id="customCheck12"
                           name="buildinfo" value="phgrindrarea"> <label
                           class="custom-control-label" for="customCheck12">체육장</label></li>
                        <li class="custom-control custom-checkbox mb-3"><input
                           type="checkbox" class="custom-control-input" id="customCheck13"
                           name="buildinfo" value="ktchmssparea"> <label
                           class="custom-control-label" for="customCheck13">조리실/급식공간</label></li>
                           <li class="custom-control custom-checkbox mb-3"><input
                           type="checkbox" class="custom-control-input" id="customCheck14"
                           name="buildinfo" value="hlsparea"> <label
                           class="custom-control-label" for="customCheck14">보건/위생공간</label></li>

                     </ul></li>
            </form>

            </ul>
            </li>

            <li class="menu-item-has-children dropdown">
            <input id=drop_val type="hidden" value="" />
            <a href="#" onclick="selectVal(4)"
               class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"

               aria-expanded="false"> <i class="menu-icon fa fa-heart"></i>교육환경
            </a>
               <ul class="sub-menu children dropdown-menu">

                  <form method="post" name="multiple_check">
                     <ul style="font-family: 'Gaegu', cursive; font-size: 20px";>
                        <li class="custom-control custom-checkbox mb-3"><input
                           type="checkbox" class="custom-control-input" id="customCheck15"
                           name="environment" value="spcn_thcnt"> <label
                           class="custom-control-label" for="customCheck15">특수 교사</label></li>

                        <li class="custom-control custom-checkbox mb-3"><input
                           type="checkbox" class="custom-control-input" id="customCheck16"
                           name="environment" value="ntcnt"> <label
                           class="custom-control-label" for="customCheck16">보건 교사</label></li>
                        <li class="custom-control custom-checkbox mb-3"><input
                           type="checkbox" class="custom-control-input" id="customCheck17"
                           name="environment" value="ntrt_thcnt"> <label
                           class="custom-control-label" for="customCheck17">영양 교사</label></li>
                        <li class="custom-control custom-checkbox mb-3"><input
                           type="checkbox" class="custom-control-input" id="customCheck18"
                           name="environment" value="vhcl_oprn_yn"> <label
                           class="custom-control-label" for="customCheck18">통학버스운영</label></li>
                        
                     </ul></li>
            </ul>
            </li>	
        
        
   
            <h3 class="menu-title" style="font-size:17px"><a style="color:#ff0066;">우리동네</a> 유치원 순위<a class="CellWithComment" style="font-family: 'Hanna'"><i class="fas fa-question-circle" style="font-size:2px"><span class="CellComment" style="font-size:15px">
           <b style="color:#800040">안전점수</b>+<b style="color:#800040">위생점수</b>+<b style="color:#800040">시설점수</b>의 총합으로 산출된 결과입니다.</span></i></a></h3>
          
            <!-- /.menu-title -->
 
         <form action="/action_page.php">
		 <table class="text-wrapper">
		  	<c:forEach items="${rankSet}" var="rank" varStatus="status">
		  		<tr>
		  		<td></td>
 		  	<td>${status.count}.</td>
			<td><a id =rankA${status.index} onclick="onlyLogin('${rank.kindername}','${rank.kinderinfoId}','${rank.subofficeedu}',1,${status.index})" style="cursor:pointer"> ${rank.kindername}</a></td>
				</tr>
			</c:forEach>
		</table>
      </form>
            
             <script>
             
      var textWrapper = document.querySelector('.text-wrapper td');
      textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<td>");

      anime.timeline({loop: true})
        .add({
          targets: '.text-wrapper td',
          rotateY: [-90, 0],
          duration: 5000,
          delay: (el, i) => 50 * i
        }).add({
          targets: '.text-wrapper',
          opacity: 0,
          duration: 2000,
          delay: 2000
        });
      
      function onlyLogin(name,id,subo,select,tagid){
    	  
    		 if(${authInfo.userid eq null}){
    			 alert("로그인이 필요한 기능입니다.");
    			 $("#userid").focus();
    		 }
    		 else{
    			 if(select == 1){
    				 $("#rankA"+tagid).attr("href","detail.do?kindername="+name+"&kinderinfoId="+id+"&subofficeedu="+subo);	 
    			 }
    			 else if(select == 2){
    				 $("#detailA").attr("href","detail.do?kindername="+name+"&kinderinfoId="+id+"&subofficeedu="+subo);
    			 }
    			 else if(select == 3){
    				 $("#searchA"+tagid).attr("href","detail.do?kindername="+name+"&kinderinfoId="+id+"&subofficeedu="+subo);
    			 }
    		 }	 
    	}
      </script> 
        
            	<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
         </div>
         <!-- /.navbar-collapse -->
      </nav>
   </aside>
   
</body>