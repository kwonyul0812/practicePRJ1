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

<h3>${board.id}번 게시물</h3>
<div>
    제목
    <input type="text" value="${board.title}" readonly>
</div>
<div>
    내용
    <textarea cols="30" rows="10" readonly>${board.content}</textarea>
</div>
<div>
    작성자
    <input type="text" value="${board.writer}" readonly>
</div>
<div>
    작성시기
    <input type="datetime-local" value="${board.inserted}" readonly>
</div>


<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.member" var="member"/>
    <c:if test="${member.id eq board.memberId}">
        <div>
            <a href="/modify?id=${board.id}" class="btn btn-secondary">수정</a>
            <button class="btn btn-danger" form="formDelete">삭제</button>
        </div>
    </c:if>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.member" var="member"/>
    <c:if test="${member.id eq board.memberId}">
        <div style="display: none">
            <form action="/delete" method="post" id="formDelete" onsubmit="return confirm('삭제 하시겠습니까?')">
                <input type="hidden" name="id" value="${board.id}">
            </form>
        </div>
    </c:if>
</sec:authorize>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
