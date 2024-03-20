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
          var p_personal = f.p_personal.value.trim();
          var p_pwd = f.p_pwd.value.trim();
          var p_prefer = f.p_prefer.value.trim();
  
          if (p_name == "") {
              alert('이름을 입력해주세요');
              f.p_name.focus();
              return false;
          }
  
          if (p_email == "") {
              alert('이메일을 입력해주세요');
              f.p_email.focus();
              return false;
          }
  
          if (p_personal == "") {
              alert('주민등록번호를 입력해주세요');
              f.p_personal.focus();
              return false;
          }
  
          if (p_pwd == "") {
              alert('비밀번호를 입력해주세요');
              f.p_pwd.focus();
              return false;
          }
  
          if (p_prefer == "") {
              alert('좋아하는 사이트를 입력해주세요');
              f.p_prefer.focus();
              return false;
          }
  
          // 폼을 서버로 제출
          f.action = "insert.do";
          return true;
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
              name="p_prefer"
              id="p_prefer"
              class="SignupInput"
              type="text"
              placeholder="좋아하는 사이트를 입력해주세요"
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
          <span class="SignupInputName">비밀번호</span>
          <input
              id="p_pwd"
              name="p_pwd"
              class="SignupInput"
              type="password"
              placeholder="비밀번호를 입력해주세요"
          />
      </div>

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
