<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Where's my stuff?</title>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="container">
    <div class="row">
        <a href="${pageContext.request.contextPath}/"><h1>Where is my stuff??</h1></a>

        <sec:authorize access="hasRole('USER')">
            <span id="signIn">
                <sec:authentication property="principal.username" var="username" scope="session"/>
                <a href="${pageContext.request.contextPath}/users/${username}">
                        ${username}</a>
                <a href="<c:url value="/logout" />">Logout</a>
            </span>
        </sec:authorize>
        <sec:authorize access="!hasRole('USER')">
            <span id="signIn"><a href="${pageContext.request.contextPath}/login">sign in</a></span>
        </sec:authorize>
    </div>
    <div class="separateLine"></div>
    <div style="padding: 20px 20px 7px 10px;">
        <span style="float:left">${user.userName}'s profile</span>
        <sec:authorize access="hasRole('USER')">
            <c:if test="${username == user.userName}">
                <a href="${pageContext.request.contextPath}/users/${user.userName}/edit" style="margin-left: 970px;">edit</a>
            </c:if>
        </sec:authorize>
        <br/>
    </div>
    <div class="separateLine"></div>
    <div class="row">
        <div style="padding: 20px 20px;">
            <p><img src="${pageContext.request.contextPath}/resources/images/${user.userName}.jpg"
                    width="300px" height="300px"/></p>
            <p>username: ${user.userName}</p>
            <p>email: ${user.email}</p>
        </div>
    </div>
</div>
</body>
</html>
