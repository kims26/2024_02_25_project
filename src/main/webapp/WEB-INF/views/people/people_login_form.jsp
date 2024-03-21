<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../css/user_index.css" />
    <script src="../js/user_index.js"></script>
    <script src="../js/user.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <title>유저 리스트</title>
  </head>
  <body>
    <div class="Container">
      <div id="Wrapper">
        <div id="Navi_Wrapper" style="width: 100%">
          <a href="../login/index.html" class="Back_Button"> 🔙로그인 </a>
        </div>
        <div id="Content_Wrapper">
          <img
            id="Logo_wrapper"
            class="LogoImg"
            src="../img/codecampLogo.png"
          />

          <div id="Title_Wrapper">유저 리스트</div>
          <div onclick="openMenu()" id="Open_Menu_Btn">유저 리스트 열기</div>

          <div class="CloseBtnWrapper">
            <span id="CloseBtn" onclick="closeMenu()">X</span>
          </div>
          <div id="Menu_Background">
            <div class="User_Table_Item">
              <div class="Item_Info" id="name">이름</div>
              <div class="Item_Info" id="email">이메일</div>
              <div class="Item_Info" id="personal">주민번호</div>
              <div class="Item_Info" id="phone">전화번호</div>
              <div class="Item_Info" id="prefer">좋아하는 사이트</div>
            </div>
            <div id="User_Data_Wrapper"></div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>