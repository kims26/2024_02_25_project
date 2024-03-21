<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <a href="../people/login_form.do" class="Back_Button"> 🔙로그인 </a>
        </div>
        <div id="Content_Wrapper">
            <img id="Logo_wrapper" class="LogoImg" src="../img/codecampLogo.png" />
            <div id="Title_Wrapper">유저 리스트</div>
            <div onclick="openMenu()" id="Open_Menu_Btn">유저 리스트 열기</div>
            <div class="CloseBtnWrapper">
                <span id="CloseBtn" onclick="closeMenu()">X</span>
            </div>

            <div id="Menu_Background">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    
                    <thead>
                    <tr>
                        <th>이름</th>
                        <th>이메일</th>
                        <th>주민번호</th>
                        <th>전화번호</th>
                        <th>좋아하는 사이트</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${empty list}">
                            <tr>
                                <td colspan="5">
                                    <div id="empty_message">가입된 회원정보가 없습니다</div>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="vo" items="${list}">
                                <tr>
                                    <td>${vo.p_name}</td>
                                    <td>${vo.p_email}</td>
                                    <td>${vo.p_personal}</td>
                                    <td>${vo.p_phone}</td>
                                    <td>${vo.p_prefer}</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                    
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
