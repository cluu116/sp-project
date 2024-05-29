<%--
  Created by IntelliJ IDEA.
  User: CHIEN
  Date: 29/05/2024
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
    <title>Trang chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</head>
<body class="container">
<nav class="navbar navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand">Trang chủ</a>
        <form class="d-flex" action="home" method="get">
            <input class="form-control me-2" type="search" placeholder="Search" value="${param.key}" name="key"
                   aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>
</nav>
<h2 class="text-center mt-3 text-success">DANH SÁCH SẢN PHẨM</h2>
<table class="table table-hover">
    <thead>
    <tr>
        <th>STT</th>
        <th>Mã SP</th>
        <th>Tên SP</th>
        <th>Trạng thái</th>
        <th>Ngày tạo</th>
        <th>Danh mục</th>
        <th>Chức năng</th>
    </thead>
    <tbody>
    <c:forEach items="${sanPhamList}" var="sp" varStatus="status">
        <tr>
            <td>${status.index + 1}</td>
            <td>${sp.maSP}</td>
            <td>${sp.tenSP}</td>
            <td>${sp.trangThaiSP}</td>
            <td>
                <fmt:formatDate value="${sp.ngayTaoSP}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>${sp.danhMuc.tenDanhMuc}</td>
            <td>
                <a href="/san-pham/formUpdate/${sp.id}" class="btn btn-primary">Sửa</a>
                <a href="/san-pham/delete/${sp.id}" class="btn btn-danger">Xóa</a>
            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>
</body>
</html>
