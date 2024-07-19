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
    <title>Chi Tiết Hoá Đơn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</head>
<body class="container">
<h2 class="text-center mt-3 text-success">CHI TIẾT HÓA ĐƠN</h2>
<div class="row">
    <div class="col-6">
        <div class="form-floating mb-2">
            <input type="text" class="form-control" id="floatingPassword" placeholder="Password" readonly
                   name="maDanhMuc" value="${hd.id}"/>
            <label for="floatingPassword">ID CTSP</label>
        </div>

        <div class="form-floating mb-2">
            <input type="text" class="form-control" id="floatingPassword" placeholder="Password" readonly
                   name="maDanhMuc" value="${hd.khachHang.hoTen}"/>
            <label for="floatingPassword">Tên khách hàng</label>
        </div>

        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="floatingPassword" placeholder="Password" readonly
                   name="tenDanhMuc" value="${hd.diaChi}"/>
            <label for="floatingPassword">Địa chỉ</label>
        </div>

        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="floatingPassword" placeholder="Password" readonly
                   name="tenDanhMuc" value="${hd.soDienThoai}"/>
            <label for="floatingPassword">Số điện thoai</label>
        </div>
    </div>
    <div class="col-6">

        <div class="form-floating  mb-3">
            <input type="datetime-local" class="form-control" id="floatingPassword" placeholder="Password" readonly
                   name="ngayTao" value="${hd.ngayTao}"/>
            <label for="floatingPassword">Ngày tạo</label>
        </div>

        <div class="form-floating  mb-3">
            <input type="datetime-local" class="form-control" id="floatingPassword" placeholder="Password" readonly
                   name="ngaySua" value="${hd.ngaySua}"/>
            <label for="floatingPassword">Ngày sửa</label>
        </div>

        <div class="mb-3">
            <label for="">Trạng thái</label>
            <input style="pointer-events: none" type="radio" value="Đã giao" name="trangThai" ${hd.trangThai eq 'Đã giao' ? 'checked' : ''}>Đã
            giao
            <input style="pointer-events: none" class="ms-2" type="radio" value="Chưa giao"
                   name="trangThai" ${hd.trangThai eq 'Chưa giao' ? 'checked' : ''}>Chưa giao<br>
        </div>
    </div>
</div>

<a href="/admin?section=hd" class="btn btn-primary">Quay lại</a>
</body>
</html>