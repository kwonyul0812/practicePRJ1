<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        table, tr, th, td {
            border-collapse: collapse;
            border: 1px solid black;
        }
    </style>
</head>
<body>

<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<h3>게시판</h3>
<table class="table">
    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성시간</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${boardList}" var="board">
        <tr>
            <td>${board.id}</td>
            <td>
                <a href="/board?id=${board.id}">
                        ${board.title}
                </a>
            </td>
            <td>${board.writer}</td>
            <td>${board.inserted}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<c:if test="${pageInfo.currentPage > 1}">
    <a href="/?page=1">맨앞</a>
</c:if>

<c:if test="${pageInfo.prevPageNumber > 0}" >
    <a href="/?page=${pageInfo.prevPageNumber}">이전</a>
</c:if>

<c:forEach begin="${pageInfo.beginPageNumber}" end="${pageInfo.endPageNumber}" var="page">
    <a href="/?page=${page}">${page}</a>
</c:forEach>

<c:if test="${pageInfo.nextPageNumber < pageInfo.lastPageNumber}">
    <a href="/?page=${pageInfo.nextPageNumber}">다음</a>
</c:if>

<c:if test="${pageInfo.currentPage < pageInfo.lastPageNumber}">
    <a href="/?page=${pageInfo.lastPageNumber}">맨뒤</a>
</c:if>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
