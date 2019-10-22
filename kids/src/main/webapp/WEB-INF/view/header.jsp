<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
    .waves-effect {
    position: relative;
    cursor: pointer;
    display: inline-block;
    overflow: hidden;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -webkit-tap-highlight-color: transparent;
    vertical-align: middle;
    z-index: 1;
    -webkit-transition: .3s ease-out;
    transition: .3s ease-out
}

.waves-effect.waves-light .waves-ripple {
    background-color: rgba(255,255,255,0.45)
}

.material-icons {
    text-rendering: optimizeLegibility;
    -webkit-font-feature-settings: 'liga';
    -moz-font-feature-settings: 'liga';
    font-feature-settings: 'liga'
}


.input-field .prefix {
    position: absolute;
    width: 3rem;
    font-size: 2rem;
    -webkit-transition: color .2s;
    transition: color .2s;
    top: .5rem
}

.input-field .prefix ~ input,.input-field .prefix ~ textarea,.input-field .prefix ~ label,.input-field .prefix ~ .validate ~ label,.input-field .prefix ~ .helper-text,.input-field .prefix ~ .autocomplete-content {
    margin-left: 3rem;
    width: 92%;
    width: calc(100% - 3rem)
}
.row .col.s6 {
    width: 50%;
    margin-left: auto;
    left: auto;
    right: auto
}

.btn,.btn-large,.btn-small,.btn-flat {
    border: none;
    border-radius: 2px;
    display: inline-block;
    height: 36px;
    line-height: 36px;
    padding: 0 16px;
    text-transform: uppercase;
    vertical-align: middle;
    -webkit-tap-highlight-color: transparent
}
    </style>
    
    <body>
  <div id="right-panel" class="right-panel">
      <!--   왼쪽 메뉴 접는 버튼   -->
 <header id="header" class="header">
         <div  id="col-sm-7" class="col-sm-7" width="10%">
            <a id="menuToggle" class="menutoggle pull-left"><i
               class="fa fa fa-tasks"></i></a>
         </div>
            <div id = "LOL" align ="right"  style ="width: 85%; font-family:hanna; word-spacing:13px;">
               
             <c:if test="${authInfo.userid eq null}">
               <form action="login.do" method ="post" style="height: 25px;width: 600px;">

                     <div class="row">
                       <div class="input-field col s6">
                         <i class="material-icons prefix">account_circle</i>
                         <input id="icon_prefix" type="text" class="validate" name="userid">
                         <label for="icon_prefix">아이디</label>
                       </div>
                       <div class="input-field col s6">
                         <i class="material-icons prefix">lock_outline</i>
                         <input id="icon_telephone" type="password" class="validate" name="userpwd" >
                         <label for="icon_telephone">패스워드</label>
                       </div>
         

                      <button class="btn waves-effect waves-light"  type="submit"  id="login" name="action" >로그인
                      
                      </button>
            <a href="./page-register.do" class="btn btn-primary">회원가입</a>
            </div>
            </form>
            </c:if>
            
            
            <c:if test="${authInfo.userid ne null}">
            
               ${authInfo.userid}님 환영합니다.
               
               <form action="logout.do" method ="post">
               <input type="submit" id="logout" value="로그아웃" />
               </form>
            </c:if>
         </div>
      </header>
      </body>