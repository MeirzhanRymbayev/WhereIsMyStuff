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
        <a href="${pageContext.request.contextPath}/"><h1>Where is my stuff??</h1></a><br/>

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
        Create a question
    </div>
    <div class="row">
        <div class="my-forms">
            <form action="${pageContext.request.contextPath}/question" method="post">
                <div class="container">
                    <div id="simple-inputs">
                        <div class="form-block">
                            <div class="form-group">
                                <label for="title">Title</label>
                                <p><input type="text" name="title" id="title" class="form-control"/></p>
                            </div>
                            <div class="form-group">
                                <label for="description">What it's all about</label>
                                <p><textarea name="description" id="description" class="form-control"></textarea></p>
                            </div>
                            <div class="form-group">
                                <p><input type="checkbox" name="category" value="clothes"/>clothes</p>
                                <p><input type="checkbox" name="category" value="electronics"/>electronics</p>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="userName" value="${username}"/>
                    <p>
                        <button type="submit" class="btn btn-default">Post your question</button>
                    </p>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>