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
    
    <script type="text/javascript">

      function send(f) {
          var p_name = f.p_name.value.trim();
          var p_email = f.p_email.value.trim();
          var p_phone = f.p_phone.value.trim();
          var p_personal = f.p_personal.value.trim();
          var p_pwd = f.p_pwd.value.trim();
          var p_prefer = f.p_prefer.value.trim();
  
          if (p_name == "") {
              alert('이름을 입력해주세요');
              f.p_name.value='';
              f.p_name.focus();
              return false;
          }
  
          if (p_email == "") {
              alert('이메일을 입력해주세요');
              f.p_email.value='';
              f.p_email.focus();
              return false;
          }
  
          if (p_personal == "") {
              alert('주민등록번호를 입력해주세요');
              f.p_personal.value='';
              f.p_personal.focus();
              return false;
          }

  
          if (p_pwd == "") {
              alert('비밀번호를 입력해주세요');
              f.p_pwd.value='';
              f.p_pwd.focus();
              return false;
          }
  
          if (p_prefer == "") {
              alert('좋아하는 사이트를 입력해주세요');
              f.p_prefer.value='';
              f.p_prefer.focus();
              return false;
          }
          if (p_phone == "") {
              alert('휴대폰번호입력');
              f.p_phone.value='';
              f.p_phone.focus();
              return false;
          }
  
          // 폼을 서버로 제출
          f.action = "insert.do";
          return true;
      }
  </script>

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
          //document.getElementById("token__button").style = "background-color: #FFFFFF; color: #0068FF; cursor: pointer;"
          //document.getElementById("token__button").removeAttribute("disabled")
          let p_phone = phone1 + '-' + phone2 + '-' + phone3;
          document.getElementById("p_phone").value = p_phone;
      }
      else{
          document.getElementById("p_phone").value = '';
      }
  
  }
  </script>
  </head>


  <body>

    <div class="Container">
      <form method="POST" onsubmit="return send(this);">
          <div id="ModalContainer" onclick="CloseModal()"></div>
  
          <div id="SignupModalWrapper">
              <div class="SignupTitle">회원가입</div>
  
              <div class="SignupInputWrapper">
                  <span class="SignupInputName">이름</span>
                  <input
                      name="p_name"
                      id="p_name"
                      class="SignupInput"
                      type="text"
                      placeholder="이름을 입력해주세요"
                  />
              </div>
              <div class="SignupInputWrapper">
                <span class="SignupInputName">이메일</span>
                <input
                    id="p_email" 
                    name="p_email"
                    class="SignupInput"
                    type="text"
                    placeholder="이메일을 입력해주세요"
                />
            </div>
  
              <div class="SignupInputWrapper">
                  <span class="SignupInputName">주민등록번호</span>
                  <input
                      id="p_personal"
                      name="p_personal"
                      class="SignupInput"
                      type="text"
                      maxlength="13"
                      placeholder="주민등록번호를 입력해주세요"
                  />
              </div>

              

              <div class="SignupInputWrapper">
                <span class="SignupInputName">비밀번호</span>
                <input
                    id="p_pwd"
                    name="p_pwd"
                    class="SignupInput"
                    type="password"
                    maxlength="11"
                    placeholder="비밀번호를 입력해주세요"
                />
            </div>

        <div class="SignupInputWrapper">
          <span class="SignupInputName">좋아하는 사이트</span>
          <input
              name="p_prefer"
              id="p_prefer"
              class="SignupInput"
              type="text"
              placeholder="좋아하는 사이트를 입력해주세요"
          />
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
          <input type="hidden" name="p_phone" id="p_phone">
          <div class="d-flex">
              <input class="SignupInput" id="phone1" style="width: 90px;" type="text" onkeyup="changePhone1()" /> - 
              <input class="SignupInput" id="phone2" style="width: 90px;" type="text" onkeyup="changePhone2()" /> - 
              <input class="SignupInput" id="phone3" style="width: 90px;" maxlength="4" onkeyup="changePhone3()" />
          </div>

            <!-- <div style="display: felx">
              <input
                id="phone1"
                class="SignupInput"
                type="text"
                onkeyup="changePhone1()"
                maxlength="3"
                value="010"
                readonly/><span class="PhoneSlash">-</span
              ><input
                id="phone2"
                class="SignupInput"
                type="text"
                onkeyup="changePhone2()"
                maxlength="4"
              /><span class="PhoneSlash">-</span
              ><input
                id="phone3"
                class="SignupInput"
                type="text"
                onkeyup="changePhone3()"
                maxlength="4"
              />
            </div> -->

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
      <!-- <div class="SignupInputWrapper">
          <span class="SignupInputName">이메일</span>
          <input
              id="p_email" 
              name="p_email"
              class="SignupInput"
              type="text"
              placeholder="이메일을 입력해주세요"
          />
      </div> -->

      <div class="ButtonWrapper">
          <input type="submit" class="Signup" value="회원 가입" />
      </div>
  </div>
</form>
      <!-- 여기까지가 회원가입 모달창 -->

      <!-- 본 컨텐츠 -->
      <div class="Wrapper">
        <div
          id="Navi_Wrapper"
          style="width: 100%; display: flex; justify-content: space-between"
        ></div>
        <div class="LogoWrapper">
          <div class="LogoTitle">왜 안되지</div>
          <img class="LogoImg" src="../img/codecampLogo.png" />
          <a href="../people/list.do"><i class="Menu_Button" aria-hidden="true"></i>유저정보</a>
          <!-- <a href="" class="Menu_Button">유저 정보</a> -->
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
