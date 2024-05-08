<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>

<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<h3>회원정보</h3>
<div>
    이메일
    <input type="text" value="${member.email}" readonly>
</div>
<div>
    비밀번호
    <input type="password" value="${member.password}" readonly>
</div>
<div>
    별명
    <input type="text" value="${member.nickName}" readonly>
</div>
<div>
    가입시기
    <input type="text" value="${member.inserted}" readonly>
</div>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.member" var="authMember"/>
    <c:if test="${authMember.id eq member.id}">
        <div>
            <a href="/member/modify?id=${member.id}" class="btn btn-secondary">수정</a>
            <button class="btn btn-danger" form="formDelete">탈퇴</button>
        </div>
    </c:if>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.member" var="authMember"/>
    <c:if test="${authMember.id eq member.id}">
        <div style="display: none">
            <form action="/member/delete" id="formDelete" onsubmit="return confirm('탈퇴 하시겠습니까?')">
                <input type="text" name="id" value="${member.id}">
            </form>
        </div>
    </c:if>
</sec:authorize>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
