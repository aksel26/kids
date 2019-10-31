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

    </style>
    </head>
    <body>
      
               <h3 class="menu-title">카테고리</h3>
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
        
        
   
            <h3 class="menu-title">유치원 순위</h3>
            <!-- /.menu-title -->
 
         <form action="/action_page.php">
		 <table class="text-wrapper">
		  	<c:forEach items="${rankSet}" var="rank" varStatus="status">
		  		<tr>
		  		<td></td>
 		  	<td>${status.count}.</td>
			<td><a href="detail.do?kindername=${rank.kindername}&kinderinfoId=${rank.kinderinfoId}&subofficeedu=${rank.subofficeedu}">${rank.kindername}</a></td>
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
      </script> 
        
            	<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
         </div>
         <!-- /.navbar-collapse -->
      </nav>
   </aside>
   
<!--    <div id="right-panel" class="right-panel"> -->
<!--         왼쪽 메뉴 접는 버튼   -->
<!--  <header id="header" class="header"> -->
<!--          <div  id="col-sm-7" class="col-sm-7" width="10%"> -->
<!--             <a id="menuToggle" class="menutoggle pull-left"><i -->
<!--                class="fa fa fa-tasks"></i></a> -->
<!--          </div> -->
<!--             <div id = "LOL" align ="right"  style ="width: 85%; font-family:hanna; word-spacing:13px;"> -->
               
<%--              <c:if test="${authInfo.userid eq null}"> --%>
<!--                <form action="login.do" method ="post" style="height: 25px;width: 600px;"> -->

<!--                      <div class="row"> -->
<!--                        <div class="input-field col s6"> -->
<!--                          <i class="material-icons prefix">account_circle</i> -->
<!--                          <input id="icon_prefix" type="text" class="validate" name="userid"> -->
<!--                          <label for="icon_prefix">아이디</label> -->
<!--                        </div> -->
<!--                        <div class="input-field col s6"> -->
<!--                          <i class="material-icons prefix">lock_outline</i> -->
<!--                          <input id="icon_telephone" type="password" class="validate" name="userpwd" > -->
<!--                          <label for="icon_telephone">패스워드</label> -->
<!--                        </div> -->
         

<!--                       <button class="btn waves-effect waves-light"  type="submit"  id="login" name="action" >로그인 -->
                      
<!--                       </button> -->
<!--             <a href="./page-register.do" class="btn btn-primary">회원가입</a> -->
<!--             </div> -->
<!--             </form> -->
<%--             </c:if> --%>
            
            
<%--             <c:if test="${authInfo.userid ne null}"> --%>
            
<%--                ${authInfo.userid}님 환영합니다. --%>
               
<!--                <form action="logout.do" method ="post"> -->
<!--                <input type="submit" id="logout" value="로그아웃" /> -->
<!--                </form> -->
<%--             </c:if> --%>
<!--          </div> -->
<!--       </header> -->
</body>