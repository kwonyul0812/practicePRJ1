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

        .active {
            background-color: lightgray;
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


<div style="text-align: center">

    <%-- 맨앞 으로 이동 --%>
    <c:if test="${pageInfo.currentPageNumber > 1}">
        <c:url value="/" var="firstPageLink">
            <c:param name="page" value="1"/>
        </c:url>
        <a href="${firstPageLink}">맨앞</a>
    </c:if>

    <%-- 이전 페이지로 이동 --%>
    <c:if test="${pageInfo.prevPageNumber > 0}">
        <c:url value="/" var="prevPageLink">
            <c:param name="page" value="${pageInfo.prevPageNumber}"/>
        </c:url>
        <a href="${prevPageLink}">이전</a>
    </c:if>


    <c:forEach begin="${pageInfo.beginPageNumber}" end="${pageInfo.endPageNumber}" var="pageNumber">


        <a href="/?page=${pageNumber}" style="margin-right: 10px;"
           class="${pageInfo.currentPageNumber == pageNumber ? 'active' : ''}">
                ${pageNumber}
        </a>


    </c:forEach>

    <%-- 다음 페이지로 이동 --%>
    <c:if test="${pageInfo.nextPageNumber < pageInfo.lastPageNumber}">
        <c:url value="/" var="nextPageLink">
            <c:param name="page" value="${pageInfo.nextPageNumber}"/>
        </c:url>
        <a href="${nextPageLink}">다음</a>
    </c:if>

    <%-- 맨뒤 페이지로 이동 --%>
    <c:if test="${pageInfo.currentPageNumber < pageInfo.lastPageNumber}">
        <c:url value="/" var="lastPageLink">
            <c:param name="page" value="${pageInfo.lastPageNumber}"/>
        </c:url>
        <a href="${lastPageLink}">맨뒤</a>
    </c:if>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
