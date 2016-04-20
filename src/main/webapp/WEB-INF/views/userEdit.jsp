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
    <div style="padding: 20px 20px 7px 10px;">
        <span style="float:left">${user.userName}'s profile</span>
        <a href="${pageContext.request.contextPath}/${user.userName}/edit" style="margin-left: 970px;">edit</a>
    </div>
    <div class="separateLine"></div>
    <div class="row">
        <div style="padding: 20px 20px; width: 300px;">
            <form action="${pageContext.request.contextPath}/users/${user.userName}/edit" method="post">
                <div class="container">
                    <div id="simple-inputs">
                        <div class="form-block" style="width: 200px;">
                            <div class="form-group">
                                <label for="username">username:</label>
                                <p><input type="text" name="username" id="username" class="form-control"
                                          value="${user.userName}"/></p>
                            </div>
                            <div class="form-group">
                                <label for="email">email:</label>
                                <p><input type="text" name="email" id="email" class="form-control"
                                          value="${user.email}"/></p>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="userName" value="${username}"/>
                    <p>
                        <button type="submit" class="btn btn-default">Save</button>
                    </p>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
