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
    <title>Cập Nhật Khách Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</head>
<body class="container">
<form action="/khach-hang/update" method="post" class="mt-4">
    <h2 class="text-center mt-3 text-success">CẬP NHẬT KHÁCH HÀNG</h2>
    <div class="form-floating mb-2">
        <input type="text" class="form-control" id="floatingPassword" value="${khachHangs.khachHang.hoTen}" placeholder="Password"
               name="khachHang.hoTen"/>
        <label for="floatingPassword">Tên khách hàng</label>
    </div>

    <div class="form-floating mb-2">
        <input type="text" class="form-control" id="floatingPassword" value="${khachHangs.khachHang.diaChi}" placeholder="Password"
               name="khachHang.diaChi"/>
        <label for="floatingPassword">Địa chỉ</label>
    </div>

    <div class="form-floating mb-2">
        <input type="text" class="form-control" id="floatingPassword" value="${khachHangs.khachHang.sdt}" placeholder="Password"
               name="khachHang.sdt"/>
        <label for="floatingPassword">Số điện thoại</label>
    </div>

    <div class="mb-2">
        <label for="">Trạng thái</label>
        <input type="radio" value="Kích hoạt" ${khachHangs.khachHang.trangThai=="Kích hoạt" ? "checked" : ""} name="khachHang.trangThai">Kích hoạt
        <input class="ms-2" type="radio" value="Vô hiệu hóa" ${khachHangs.khachHang.trangThai=="Vô hiệu hóa" ? "checked" : ""}
               name="khachHang.trangThai">Vô hiệu hóa<br>
    </div>

    <div>
        <label for="">Role</label>
        <input type="radio" value="admin" ${khachHangs.role=="admin" ? "checked" : ""} name="role">Admin
        <input class="ms-2" type="radio" value="user" ${khachHangs.role=="user" ? "checked" : ""}
               name="role">User<br>
    </div>
    <input type="submit" class="btn btn-primary mt-3" value="Lưu">
    <hr>
</form>
</body>
</html>