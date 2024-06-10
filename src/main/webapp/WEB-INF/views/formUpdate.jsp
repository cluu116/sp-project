<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: CHIEN
  Date: 15/05/2024
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cập Nhật Sản Phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</head>
<body class="container-fluid">
<form action="/san-pham/update" method="post" enctype="multipart/form-data">
    <h2 class="text-center mt-3 text-success">CẬP NHẬT SẢN PHẨM</h2>
    <div class="row">
        <div class="col-6">
            <div class="form-floating mb-2">
                <input type="text" class="form-control" id="floatingPassword" value="${sanPham.id}"
                       placeholder="Password" disabled
                       name="id"/>
                <label for="floatingPassword">Mã SP</label>
            </div>

            <div class="form-floating mb-2">
                <input type="text" class="form-control" id="floatingPassword" value="${sanPham.maSP}"
                       placeholder="Password"
                       name="maSP"/>
                <label for="floatingPassword">Mã SP</label>
            </div>

            <div class="form-floating">
                <input type="text" class="form-control" id="floatingPassword" value="${sanPham.tenSP}"
                       placeholder="Password"
                       name="tenSP"/>
                <label for="floatingPassword">Tên SP</label>
            </div>

            <div class="form-floating mt-2">
                <input type="number" min="100" max="1000000000" class="form-control" id="floatingPassword"
                       value="${sanPham.giaSP}" placeholder="Password"
                       name="giaSP"/>
                <label for="floatingPassword">Giá bán</label>
            </div>

            <div>
                <label for="id_danh_muc">Danh mục</label>
                <select name="danhMuc.id" id="id_danh_muc" class="form-select">
                    <c:forEach items="${listDanhMuc}" var="dm">
                        <option value="${dm.id}" ${dm.id eq sanPham.danhMuc.id ? "selected" : ""}>${dm.tenDanhMuc}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="col-6">

            <div>
                <label for="">Trạng thái</label>
                <input type="radio" value="Còn hàng" ${sanPham.trangThaiSP=="Còn hàng" ? "checked" : ""}
                       name="trangThaiSP">Còn hàng
                <input class="ms-2" type="radio" value="Hết hàng" ${sanPham.trangThaiSP=="Hết hàng" ? "checked" : ""}
                       name="trangThaiSP">Hết hàng<br>
            </div>

            <div class="mb-3">
                <label for="image" class="col-form-label">Hình ảnh:</label>
                <img src="/images/${sanPham.hinhAnh}" class="d-block" style="width: 200px" alt="">
                <input type="file" name="file" class="form-control" id="image">
            </div>
        </div>
    </div>
    <input type="submit" class="btn btn-primary mt-3" onclick="return confirm('Bạn chắc chắn muốn sửa?')" value="Lưu">
    <hr>
</form>
</body>
</html>