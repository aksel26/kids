<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="stylesheet" -->
<!--    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" -->
<!--    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" -->
<!--    crossorigin="anonymous"> -->

<script src="https://kit.fontawesome.com/30d97172a4.js"
   crossorigin="anonymous"></script>




</head>

<body>
<!--          <script src="https://code.jquery.com/jquery-3.3.1.slim.mi   n.js" -->
<!--             integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" -->
<!--             crossorigin="anonymous"></script> -->
<!--       <script -->
<!--          src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" -->
<!--          integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" -->
<!--          crossorigin="anonymous"></script> -->
<!--       <script -->
<!--          src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" -->
<!--          integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" -->
<!--          crossorigin="anonymous"></script> -->


   <div id="right-panel" class="   ">
      <!--   왼쪽 메뉴 접는 버튼   -->
      <header id="header" class="header" style="width: 1400px;">
  

         <div id="LOL" align="right"
            style="width: 85%; width:1400px; font-family: hanna; word-spacing: 13px;">

            <c:if test="${authInfo.userid eq null}">

               <div class="row">
                  <form action="login.do" method="post"
                     style="height: 70px; width: 600px;" class="col s12">

                     <div class="row" style="height: 30px;width: 1330px;margin-top: 15px;">
                        <i class="fas fa-child fa-2x"></i>
                        <div class="input-field col s2">
                           <input type="text" class="form-control" name="userid"
                              placeholder="아이디">

                        </div>
                        <i class="fas fa-user-lock fa-2x"></i>
                        <div class="input-field col s2">
                           <input type="password" class="form-control" name="userpwd"
                              placeholder="비밀번호">
                        </div>

                        <button type="submit" class="btn btn-warning" id="login"
                           name="action">로그인</button>

                        <a href="./page-register.do" class="btn btn-primary">회원가입</a>
                     </div>
                  </form>
               </div>

            </c:if>

            <c:if test="${authInfo.userid ne null}">            
            
                  ${authInfo.userid}님 환영합니다.
                     <form action="logout.do" method="post">
                  <input type="submit" id="logout" value="로그아웃" />
               </form>
            </c:if>
            
         </div>
      </header>
</body>