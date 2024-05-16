<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div>
    <ul style="display: flex;">
        <li style="margin-right: 20px;">
            <a href="/">글목록</a>
        </li>
        <sec:authorize access="isAuthenticated()">
            <li style="margin-right: 20px;">
                <a href="/add">글쓰기</a>
            </li>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <li style="margin-right: 20px;">
                <a href="/member/list">회원목록</a>
            </li>
        </sec:authorize>
        <sec:authorize access="not isAuthenticated()">
            <li style="margin-right: 20px;">
                <a href="/member/signup">회원가입</a>
            </li>
        </sec:authorize>
        <sec:authorize access="not isAuthenticated()">
            <li style="margin-right: 20px;">
                <a href="/member/login">로그인</a>
            </li>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <li style="margin-right: 20px;">
                <a href="/member/logout">로그아웃</a>
            </li>
        </sec:authorize>
    </ul>
</div>

<hr>