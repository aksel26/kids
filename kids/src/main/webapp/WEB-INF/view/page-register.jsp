<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="lab.spring.dao.UserDAOImpl" %>
<!doctype html>
<script type="text/javascript"></script>

<!--   <script src='{% static "js/jquery-1.11.3.min.js" %}'></script> -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<head>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>


<!-- Compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<link
   href="https://fonts.googleapis.com/css?family=Gaegu:700&display=swap"
   rel="stylesheet">
<link rel="stylesheet" href="resources/assets/css/style2.css">
<link rel="stylesheet" href="resources/assets/css/materialize.css">

<link
   href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
   rel='stylesheet' type='text/css'>
<link
   href="https://fonts.googleapis.com/css?family=Single+Day&display=swap"
   rel="stylesheet">
</head>     


<script defer src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>


<script>         
 
 function checkValue() {
 
  if(!document.getElementById("username").value){ 
  
     sweetAlert("Oops...", "이름을 입력해주세요!", "error"); return false; } 
  
  
  if(!document.getElementById("userid").value){
  
     sweetAlert("Oops...", "ID를 입력해주세요!", "error"); return false; }
  
  if(!document.getElementById("userpwd").value){
     
     sweetAlert("Oops...", "비밀번호를 입력해주세요!", "error"); return false; } 
  
  if(!document.getElementById("email").value){
     
     sweetAlert("Oops...", "email을 입력해주세요!", "error"); return false; }
  
  if(!document.getElementById("location").value){
     
     sweetAlert("Oops...", "지역을 입력해주세요!", "error"); return false; } 
  
   
   
   // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인 
   
  } 
   
 </script>

 
 
<!--  //#########################  ID 확인    ############################# -->
 
<!-- //  function openConfirmID(inputid){ -->
    
<!-- //     if(document.getElementById("userid").value==""){ -->
       
<!-- //        alert("아이디를 입력하세요") -->
<!-- //        return; -->
<!-- //     } -->
    
<!-- //     url="confirmid2.jsp?id="+document.getElementById("userid").value -->
<!-- //     window.open(url,"confirm","toolbar=no, location=no, status=no, menubar=no, scrollbar=no, resizable=no, width=30, height=180"); -->
<!-- //  } -->

 
<script>

// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
console.log($('#userid'))
$(document).ready(function(){

   $("#userid").blur(function() {
      console.log($('#userid'))
      // id = "id_reg" / name = "userId"
      var user_id = $('#userid').val();
      console.log(user_id)
      
      $.ajax({
         url : '${pageContext.request.contextPath}/idCheck.do?userId='+ user_id,
               
         type : 'get',
         
         success : function(data) {
            console.log("1 = 중복o / 0 = 중복x : "+ data);                     
            
            if (data == 1) {
                  // 1 : 아이디가 중복되는 문구
                  $("#id_check").text("사용중인 아이디입니다 :p");
                  $("#id_check").css("color", "red");
                  $("#id_check").css("text-align", "center");
                  $("#reg_submit").attr("disabled", true);
               } else if(data==0) {
                  if(user_id==""){
                     $("#id_check").text("아이디를 입력하세요:p");
                     $("#id_check").css("color", "red");
                     $("#id_check").css("text-align", "center");
                     $("#reg_submit").attr("disabled", true);
                     
                  }else{
                     
                     $("#id_check").text("사용가능한 아이디입니다 :p");
                     $("#id_check").css("color", "blue");
                     $("#id_check").css("text-align", "center");
                     $("#reg_submit").attr("disabled", false);   
                  }
                  
               }
   
            }, error : function() {
                  console.log("실패");
            }
         });
      });

});

$(function(){

   //비밀번호 확인
      $('#password_a').blur(function(){
         if($('#userpwd').val() != $('#password_a').val()){
             if($('#password_a').val()!=''){
                $("#pwd_check").css("color", "red");
               $("#pwd_check").css("text-align", "center");
               $("#pwd_check").text("비밀번호가 일치하지 않습니다. :p");
               $("#reg_submit").attr("disabled", true);
                 $('#password_a').val('');
                $('#password_a').focus();
             }
          }
          else{
             $("#reg_submit").attr("disabled", false);
            $("#pwd_check").text("");
          }
      })        
   });



$(document).ready(function(){
    $('select').formSelect();
  });

 


   
</script>
   

 
 
 
 

        
            
<style>
body{
   display: table-cell;
   vertical-align: middle;
/*      background-color: #e0f2f1 !imsportant;  */
background-image: url('resources/images/children.jpg');
 min-height: 50%;
    background-position: center;
    background-size: cover;
   
}

html {
    display: table;
    margin: auto;
}

html, body {
    height: 100%;
}

.medium-small {
    font-size: 0.9rem;
    margin: 0;
    padding: 0;
}

.login-form {
    width: 340px;
}

.login-form-text {
    text-transform: uppercase;
    letter-spacing: 2px;
    font-size: 0.8rem;
}

.login-text {
    margin-top: -6px;
    margin-left: -6px !important;
}

.margin {
    margin: 0 !important;
}

.pointer-events {
    pointer-events: auto !important;
}

.input-field >.material-icons  {
    padding-top:10px;
}

.input-field div.error{
    position: relative;
    top: -1rem;
    left: 3rem;
    font-size: 0.8rem;
    color:#FF4081;
    -webkit-transform: translateY(0%);
    -ms-transform: translateY(0%);
    -o-transform: translateY(0%);
    transform: translateY(0%);
}
</style>


<body>
<div id="login-page" style="font-family: Hanna;" class="row">
  <div class="col s12 z-depth-4 card-panel">
    <form class="login-form" method="post" action="./page-register1.do" name="userinfo"  onSubmit="return checkValue()" >
      <div class="row">
        <div class="input-field col s12 center">
          <h4>회원가입</h4>
          <p class="center">실속있는 엄마가 되어보세요!</p>
        
    </div>
    
      </div>
<div class="row1" style="font-family: Gaegu;">
      <div class="row margin">
        <div class="input-field col s12">
          <!-- <i class="mdi-social-person-outline prefix"></i> -->
          <i class="material-icons prefix">account_circle</i>
          <input id="username" name="username" type="text" />
          <label for="username">성함</label>
        </div>
      </div>
      
       <div class="row margin">
        <div class="input-field col s12">
          <!-- <i class="mdi-social-person-outline prefix"></i> -->
         
          <i class="material-icons prefix">account_circle</i>
          <input id="userid" name="userid" type="text"/>
          <label for="userid">아이디</label>
          <div class="check_font" id="id_check"></div>
             
<!--                 <input type="button" name="confirm_id" value="중복확인" Onclick="openConfirmID(this.form)"/> -->
        </div>
      </div>

      <div class="row margin">
        <div class="input-field col s12">
          <!-- <i class="mdi-social-person-outline prefix"></i> -->
          <i class="material-icons prefix">email</i>
          <input id="email" name="email" type="text" style="cursor: auto;" />
          <label for="email">Email</label>
        </div>
      </div>

      <div class="row margin">
        <div class="input-field col s12">
          <!-- <i class="mdi-action-lock-outline prefix"></i> -->
          <i class="material-icons prefix">vpn_key</i>
          <input id="userpwd" name="userpwd" type="password" />
          <label for="userpwd">Password</label>
          <div class="check_font" id="pwd_check"></div>


          
        </div>
      </div>

      <div class="row margin">
        <div class="input-field col s12">
          <i class="mdi-action-lock-outline prefix"></i>
          <i class="material-icons prefix">vpn_key</i>
          <input id="password_a" name="cpassword" type="password" />
<!--           <div class="check_font" id="pw_check"></div> -->
         <label for="password_a">Password</label>
        </div>
      </div>
      
       <div class="row margin">
        <div class="input-field col s12">
          <!-- <i class="mdi-social-person-outline prefix"></i> -->
          <i class="material-icons prefix">map</i>
<!--           <input id="location" name="location" type="text"/> -->
            <select id="location" name="location" type="text">
            <option value="" disabled selected>지역선택</option>
            <option value="광진구">광진구</option>
            <option value="서초구">서초구</option>
            <option value="동작구">동작구</option>
            <option value="양천구">양천구</option>
            <option value="용산구">용산구</option>
            <option value="서대문구">서대문구</option>
            <option value="관악구">관악구</option>
            <option value="강북구">강북구</option>
            <option value="성북구">성북구</option>
            <option value="중랑구">중랑구</option>
            <option value="강남구">강남구</option>
            <option value="영등포구">영등포구</option>
            <option value="종로구">종로구</option>
            <option value="강서구">강서구</option>
            <option value="강동구">강동구</option>
            <option value="성동구">성동구</option>
            <option value="도봉구">도봉구</option>
            <option value="구로구">구로구</option>
            <option value="노원구">노원구</option>
            <option value="마포구">마포구</option>
            <option value="송파구">송파구</option>
            <option value="동대문구">동대문구</option>
           </select>
           
           
           
           
           
           
             <label>지역선택</label>
        </div>
      </div>

      <div class="row">
        <div class="input-field col s12">
        <button type="submit"  style="font-family: Hanna; font-color:black;" id="reg_submit" class="btn waves-effect waves-light col s12">가입하기</button>
          <!-- <a href="./page.do" class="btn btn-primary">회원가입</a> -->
        </div>
        <div class="input-field col s12">
          <p class="margin center medium-small sign-up"><a href="./index.do">메인페이지</a></p>
        </div>
      </div>
      
      
      
      
      
      
      
      </form>
      </div>
      </div>
      

      
</body>

</html>