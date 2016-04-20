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
        <h1>Where is my stuff??</h1>

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

    <div class="row" id="categories">
        categories:
        <c:forEach items="${categories}" var="category">
            <a href="${pageContext.request.contextPath}/sort/${category.name}">${category.name}</a>
        </c:forEach>

        <span id="askButton">
            <a href="${pageContext.request.contextPath}/question">
                <button>Ask question</button>
            </a>
        </span>
    </div>

    <div class="row">
        <div id="content">
            <c:if test="${not empty questions}">
                <c:forEach items="${questions}" var="question">
                    <div class="questionBlock">
                        <span class="answersLabel">${question.answers.size()} answer(s)</span>
                        <span class="questionTitle">
                            <a href="${pageContext.request.contextPath}/question/${question.id}">${question.title}</a>
                        </span><br/>
                        <span class="questionCategory">categories: </span>
                        <c:forEach items="${question.categories}" var="category">
                            ${category.name}
                        </c:forEach>
                        <span class="userName">
                            <a href="${pageContext.request.contextPath}/users/${question.user.userName}">${question.user.userName}
                            </a></span>
                        <span class="questionDate">Publish date: ${question.dateOfQuestion.toLocaleString()}</span>
                    </div>
                    <div class="separateLine"></div>
                </c:forEach>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
