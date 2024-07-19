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
    <title>Chi Tiết Sản Phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</head>
<body class="container">
<h2 class="text-center mt-3 text-success">CHI TIẾT SẢN PHẨM</h2>
<div class="row">
    <div class="col-6">
        <div class="form-floating mb-2">
            <input type="text" class="form-control" id="floatingPassword" placeholder="Password" readonly
                   name="maDanhMuc" value="${ctsp.id}"/>
            <label for="floatingPassword">ID CTSP</label>
        </div>

        <div class="form-floating mb-2">
            <input type="text" class="form-control" id="floatingPassword" placeholder="Password" readonly
                   name="maDanhMuc" value="${ctsp.sanPham.tenSP}"/>
            <label for="floatingPassword">Tên sản phẩm</label>
        </div>

        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="floatingPassword" placeholder="Password" readonly
                   name="tenDanhMuc" value="${ctsp.mauSac.tenMau}"/>
            <label for="floatingPassword">Tên màu</label>
        </div>

        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="floatingPassword" placeholder="Password" readonly
                   name="tenDanhMuc" value="${ctsp.size.tenSize}"/>
            <label for="floatingPassword">Tên màu</label>
        </div>
    </div>
    <div class="col-6">
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="floatingPassword" placeholder="Password" readonly
                   name="tenDanhMuc" value="${ctsp.giaBan} VND"/>
            <label for="floatingPassword">Giá bán</label>
        </div>

        <div class="form-floating  mb-3">
            <input type="datetime-local" class="form-control" id="floatingPassword" placeholder="Password" readonly
                   name="ngayTao" value="${ctsp.ngayTao}"/>
            <label for="floatingPassword">Ngày tạo</label>
        </div>

        <div class="form-floating  mb-3">
            <input type="datetime-local" class="form-control" id="floatingPassword" placeholder="Password" readonly
                   name="ngaySua" value="${ctsp.ngaySua}"/>
            <label for="floatingPassword">Ngày sửa</label>
        </div>

        <div class="mb-3">
            <label for="">Trạng thái</label>
            <input style="pointer-events: none" type="radio" value="Hoạt động" name="trangThai" ${ctsp.trangThai eq 'Hoạt động' ? 'checked' : ''}>Hoạt
            động
            <input style="pointer-events: none" class="ms-2" type="radio" value="Không hoạt động"
                   name="trangThai" ${ctsp.trangThai eq 'Không hoạt động' ? 'checked' : ''}>Không hoạt động<br>
        </div>
    </div>
</div>

<a href="/admin?section=ctsp" class="btn btn-primary">Quay lại</a>
</body>
</html>