<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인/회원가입</title>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <link rel="stylesheet" href="../css/index.css" />

    <script src="../js/index.js"></script>
    <script src="../js/signup.js"></script> 
   <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <script type="text/javascript"> 

    function changePhone1(){
        const phone1 = document.getElementById("phone1").value
        if(phone1.length === 3) {
            document.getElementById("phone2").focus()
        }
    }
    
    function changePhone2(){
        const phone2 = document.getElementById("phone2").value
        if(phone2.length === 4) {
            document.getElementById("phone3").focus() 
       }
     } 
    
    function changePhone3(){
        const phone1 = document.getElementById("phone1").value
        const phone2 = document.getElementById("phone2").value
       const phone3 = document.getElementById("phone3").value
         if(phone1.length === 3 && phone2.length === 4 && phone3.length === 4){
            document.getElementById("token__button").style = "background-color: #FFFFFF; color: #0068FF; cursor: pointer;"
            document.getElementById("token__button").removeAttribute("disabled")
             let p_tel = phone1 + '-' + phone2 + '-' + phone3;
             document.getElementById("p_tel").value = p_tel;
         }
         else{
            document.getElementById("p_tel").value = '';
         }
    
     } 
     </script> 

<script type="text/javascript">

function send(f){
          
    var p_name 	= f.p_name.value.trim();
    var p_email = f.p_email.value.trim();

    var p_id = document.getElementById('o_id');

    var p_pwd = document.getElementById('p_pwd');

    var reg_pwd = /^[A-Za-z0-9]{6,12}$/;

    var p_personal      =f.p_personal.value.trim();
    var p_phone 	    = f.p_phone.value.trim();
  
    if(p_name==''){
        alert('이름을 입력하세요!!');
        f.p_name.value='';
        f.p_name.focus();
        return false;
    }
    if(p_email==''){
        alert('이메일을 입력하세요!!');
        f.p_email.value='';
        f.p_email.focus();
        return false;
    }
    if(p_pwd==''){
        alert('비밀번호를 입력하세요!!');
        f.p_pwd.value='';
        f.p_pwd.focus();
        return false;
    }
    if(!reg_pwd.test(p_pwd.vlaue)){
      alert('비밀번호는 영문, 숫자를 혼용하여 6~12자리로 입력해주세요.');
      f.p_pwd.value='';
      f.p_pwd.focus();
      return;
    }
    
    if(p_phone==''){
        alert('번호를 입력하세요!!');
        f.p_phone.value='';
        f.p_phone.focus();
        return false;
    }	 
    if(p_person==''){
        alert('좋아하는사이트를 입력하세요!!');
        f.p_personal.value='';
        f.p_personal.focus();
        return false;
    }	 
    f.action = "insert.do";
    f.submit(); 
}
</script> 

</head> 

  <body>
    전체 컨테이너
    <div class="Container">
      <!-- 여기서부터 회원가입 모달창 -->
       <div id="ModalContainer" onclick="CloseModal()"></div>
    <div id="SignupModalWrapper">
        <div class="SignupTitle">회원가입</div>
        <div class="SignupInputWrapper">
          <span class="SignupInputName">이름</span>
          <input
            id="SignupName"
            class="SignupInput"
            type="text"
            placeholder="이름을 입력해주세요"
          />
        </div> 
        <div class="SignupInputWrapper">
          <span class="SignupInputName">주민등록번호</span>
          <div style="display: flex; align-items: center">
            <input
              id="SignupPersonal1"
              style="width: 40%; text-align: center"
              class="SignupInput"
              type="text"
              maxlength="6"
            />
            <span
              style="
                text-align: center;
                color: #fff;
                padding: 0 5px 0 5px;
                font-size: 20px;
              "
              >-
            </span>
            <input
              id="SignupPersonal2"
              style="width: 40%; text-align: center"
              class="SignupInput"
              type="password"
              maxlength="7"
            />
          </div>
        </div>
        <div class="SignupInputWrapper">
          <span class="SignupInputName">핸드폰 번호</span>
          <div
            style="
              display: flex;
              justify-content: space-between;
              padding-bottom: 20px;
            "
          >
            <div style="display: felx">
              <input
                id="PhoneNumber01"
                class="SignupInput"
                type="text"
                maxlength="3"
                value="010"
                readonly
              /><span class="PhoneSlash">-</span
              ><input
                id="PhoneNumber02"
                class="SignupInput"
                type="text"
                maxlength="4"
              /><span class="PhoneSlash">-</span
              ><input
                id="PhoneNumber03"
                class="SignupInput"
                type="text"
                maxlength="4"
              />
            </div>
            <span class="NumberVailidationBtn" onclick="getValidationNumber()"
              >인증 번호 전송</span
            >
          </div>
          <div
            id="ValidationInputWrapper"
            style="display: none; align-items: center"
          >
            <input
              id="TokenInput"
              class="ValidationInput"
              type="text"
              placeholder="전송 받은 인증번호를 입력해주세요"
            />
            <span id="LimitTime">1:00</span>
            <div class="NumberVailidationBtn" onclick="submitToken()">
              인증 완료
            </div>
          </div>
        </div>
        <div class="SignupInputWrapper">
          <span class="SignupInputName">좋아하는 사이트</span>
          <input
            id="SignupPrefer"
            class="SignupInput"
            type="text"
            placeholder="좋아하는 사이트를 입력해주세요"
          />
        </div>
        <div class="SignupInputWrapper">
          <span class="SignupInputName">이메일</span>
          <input
            id="SignupEmail"
            class="SignupInput"
            type="text"
            placeholder="이메일을 입력해주세요"
          />
        </div>
        <div class="SignupInputWrapper">
          <span class="SignupInputName">비밀번호</span>
          <input
            id="SignupPwd"
            class="SignupInput"
            type="password"
            placeholder="비밀번호를 입력해주세요"
          />
        </div>
        <div class="ButtonWrapper">
          <div class="Signup" onclick="submitSignup()">회원 가입</div>
        </div>
      </div> -

      <!-- 여기까지가 회원가입 모달창 -->

      <!-- 본 컨텐츠 -->
      <div class="Wrapper">
        <div
          id="Navi_Wrapper"
          style="width: 100%; display: flex; justify-content: space-between"
        ></div>
        <div class="LogoWrapper">
          <div class="LogoTitle">CodeCamp</div>
          <img class="LogoImg" src="../img/codecampLogo.png" />
          <a href="../user/index.html" class="Menu_Button">유저 정보</a>
        </div>
        <div id="SocialLoginGoogle">
          <img class="SocialLoginButtonImg" src="../img/google.png" />
          <div class="SocialLoginButtonTitle">구글로 로그인</div>
        </div>
        <div id="SocialLoginNaver">
          <img class="SocialLoginButtonImg" src="../img/naver.png" />
          <div class="SocialLoginButtonTitle">네이버로 로그인</div>
        </div>
        <div id="SocialLoginKakao">
          <img class="SocialLoginButtonImg" src="../img/kakao.png" />
          <div class="SocialLoginButtonTitle">카카오톡으로 로그인</div>
        </div>
        <div id="SocialLoginFacebook">
          <img class="SocialLoginButtonImg" src="../img/facebook.png" />
          <div class="SocialLoginButtonTitle">페이스북으로 로그인</div>
        </div>
        <div class="SignupWrapper">
          아직 회원이 아니신가요?
          <span class="SignupButton" onclick="OpenModal()">가입 하기</span>
        </div>
      </div>
    </div>
  </body>
</html>
