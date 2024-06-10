<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Giỏ Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Giỏ Hàng Của ${sessionScope.username}</h2>
    <table class="table table-striped mt-4">
        <thead>
        <tr>
            <th scope="col">Tên Sản Phẩm</th>
            <th scope="col">Màu sắc</th>
            <th scope="col">Kích thước</th>
            <th scope="col">Giá</th>
            <th scope="col">Số Lượng</th>
            <th scope="col">Thành Tiền</th>
            <th scope="col">Thao Tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${products}">
            <tr>
                <td>${product.ctsp.sanPham.tenSP}</td>
                <td>${product.ctsp.mauSac.tenMau}</td>
                <td>${product.ctsp.size.tenSize}</td>
                <td>${product.giaBan} VND</td>
                <td>${product.soLuongMua}</td>
                <td>${product.giaBan * product.soLuongMua} VND</td>
                <c:set var="totalAmount" value="${totalAmount + product.giaBan * product.soLuongMua}" />
                <td>
                    <a href="/remove-from-cart/${product.id}" onclick="return confirm('Bạn chắc chắn muốn xóa không?')" class="btn btn-danger">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="d-flex justify-content-between">
        <div class="text-start">
            <h5>Tổng tiền phải thanh toán: <b>${totalAmount} VND</b></h5>
        </div>
        <div class="text-end">
            <a href="/home" class="btn btn-primary">Tiếp tục mua hàng</a>
            <a href="/checkout" class="btn btn-success">Thanh Toán</a>
        </div>
    </div>

</div>
</body>
</html>
