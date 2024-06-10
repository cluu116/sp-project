<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: CHIEN
  Date: 09/04/2024
  Time: 07:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f0f0;
        }

        .login-container {
            max-width: 400px;
            margin: 0 auto;
            margin-top: 100px;
            background-color: #fff;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<div class="container">
    <c:if test="${not empty UserSuccess}">
        <div class="alert alert-success" role="alert">
            <span class="text-success">${UserSuccess}</span>
        </div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-success" role="alert">
            <span class="text-success">${error}</span>
        </div>
    </c:if>
    <div class="login-container">
        <h2 class="text-center mb-4">Login</h2>
        <form:form action="login" method="post">
            <div class="mb-3">
                <input type="text" class="form-control" name="username" placeholder="Username" required>
            </div>
            <div class="mb-3">
                <input type="password" class="form-control" name="password" placeholder="Password" required>
            </div>
            <button type="submit" class="btn btn-success btn-block">Sign in</button>
            <a class="btn btn-primary" href="/signup">Sign Up</a>
        </form:form>
    </div>
</div>
</body>
</html>
