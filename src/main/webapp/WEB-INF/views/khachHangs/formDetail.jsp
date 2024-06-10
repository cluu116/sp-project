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
    <title>Chi Tiết Khách Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</head>
<body class="container">
    <h2 class="text-center mt-3 text-success">CHI TIẾT KHÁCH HÀNG</h2>
    <div class="form-floating mb-2">
        <input type="text" class="form-control" id="floatingPassword" value="${khachHangs.khachHang.hoTen}" placeholder="Password" readonly
               name="maSP"/>
        <label for="floatingPassword">Tên khách hàng</label>
    </div>

    <div class="form-floating mb-2">
        <input type="text" class="form-control" id="floatingPassword" value="${khachHangs.khachHang.diaChi}" placeholder="Password" readonly
               name="tenSP"/>
        <label for="floatingPassword">Địa chỉ</label>
    </div>

    <div class="form-floating mb-2">
        <input type="text" class="form-control" id="floatingPassword" value="${khachHangs.khachHang.sdt}" placeholder="Password" readonly
               name="tenSP"/>
        <label for="floatingPassword">Số điện thoại</label>
    </div>

    <div class="form-floating mb-2">
        <input type="datetime-local" class="form-control" id="floatingPassword" value="${khachHangs.khachHang.ngayTao}" placeholder="Password" readonly
               name="tenSP"/>
        <label for="floatingPassword">Ngày tạo</label>
    </div>

    <div class="form-floating mb-2">
        <input type="datetime-local" class="form-control" id="floatingPassword" value="${khachHangs.khachHang.ngaySua}" placeholder="Password" readonly
               name="tenSP"/>
        <label for="floatingPassword">Ngày sửa</label>
    </div>

    <div class="mb-2">
        <label for="">Trạng thái</label>
        <input class="disabled-radio" style="pointer-events: none" type="radio" value="Còn hàng" ${khachHangs.khachHang.trangThai=="Kích hoạt" ? "checked" : ""} name="trangThaiSP">Kích hoạt
        <input class="disabled-radio ms-2" style="pointer-events: none" type="radio" value="Hết hàng" ${khachHangs.khachHang.trangThai=="Vô hiệu hóa" ? "checked" : ""}
               name="trangThaiSP">Vô hiệu hóa<br>
    </div>

    <div>
        <label for="">Role</label>
        <input style="pointer-events: none" type="radio" value="admin" ${khachHangs.role=="admin" ? "checked" : ""} name="role">Admin
        <input style="pointer-events: none" class="ms-2" type="radio" value="user" ${khachHangs.role=="user" ? "checked" : ""}
               name="role">User<br>
    </div>
    <a class="btn btn-primary mt-3" href="/admin?section=khachHang">Quay lại</a>
    <hr>
</body>
</html>