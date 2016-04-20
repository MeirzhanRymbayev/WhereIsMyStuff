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

    <div class="row" id="categories">
        <h1>${question.title}</h1>
        <div class="separateLine"></div>
        <span class="questionDescription"><p>${question.description}</p></span>
        <span class="questionCategory">categories: </span>
        <c:forEach items="${question.categories}" var="category">
            ${category.name}
        </c:forEach>
        <span class="userName">
            <a href="${pageContext.request.contextPath}/users/${question.user.userName}">${question.user.userName}
            </a></span>
        <span class="questionDate">Publish date: ${question.dateOfQuestion.toLocaleString()}</span>
        <div class="separateLine"></div>
    </div>

    <c:if test="${not empty question.answers}">
        <c:forEach items="${question.answers}" var="answer">
            <div class="answers">
                <span class="questionDescription"><p>${answer.text}</p></span>
                <span class="userName">
                    <a href="${pageContext.request.contextPath}/users/${answer.user.userName}">${answer.user.userName}
                    </a></span>
                <span class="questionDate">Publish date: ${answer.dateOfAnswer}</span>
            </div>
        </c:forEach>
    </c:if>
    <form action="${pageContext.request.contextPath}/answer" method="post">
        <p><input type="hidden" name="action" value="create-voucher"/></p>
        <div class="container">
            <div class="form-block">
                <div class="form-group">
                    <label for="answer">Your answer</label>
                    <p><textarea name="answerText" id="answer" class="form-control"></textarea></p>
                </div>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="userName" value="${username}"/>
            <input type="hidden" name="questionId" value="${question.id}"/>
            <p>
                <button type="submit" class="btn btn-default">Post</button>
            </p>
        </div>
    </form>
    <div class="row">
        <div id="content">
        </div>
    </div>
</div>
</body>
</html>
