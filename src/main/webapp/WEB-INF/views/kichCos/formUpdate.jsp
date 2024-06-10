<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--
  Created by IntelliJ IDEA.
  User: CHIEN
  Date: 29/05/2024
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <title>Cập Nhật Kích Cỡ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</head>
<body class="container">
<form action="/size/update" method="post" class="mt-4" enctype="multipart/form-data">
    <h2 class="text-center mt-3 text-success">CẬP NHẬT KÍCH CỠ</h2>
    <div class="form-floating mb-2">
        <input type="text" class="form-control" id="floatingPassword" placeholder="Password"
               name="maSize" value="${Size.maSize}"/>
        <label for="floatingPassword">Mã size</label>
    </div>

    <div class="form-floating">
        <input type="text" class="form-control" id="floatingPassword" placeholder="Password"
               name="tenSize" value="${Size.tenSize}"/>
        <label for="floatingPassword">Tên size</label>
    </div>

    <div>
        <label for="">Trạng thái</label>
        <input type="radio" value="Hoạt động" name="trangThai" ${Size.trangThai eq 'Hoạt động' ? 'checked' : ''}>Hoạt động
        <input class="ms-2" type="radio" value="Không hoạt động" name="trangThai" ${Size.trangThai eq 'Không hoạt động' ? 'checked' : ''}>Không hoạt động<br>
    </div>

    <input type="submit" class="btn btn-primary mt-3" value="Lưu">
    <hr>
</form>
</body>
</html>