<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }

        .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .list-group-item {
            transition: background-color 0.3s;
        }

        .list-group-item:hover {
            background-color: #e9ecef;
        }

        .card {
            margin-top: 20px;
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: bold;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Trang điều khiển</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/home">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Đặc trưng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Giới thiệu</a>
                </li>
            </ul>
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <c:if test="${empty sessionScope.username}">
                        <a class="nav-link active" aria-current="page" href="/login"><i
                                class="fa-solid fa-circle-user"></i> Đăng nhập</a>
                    </c:if>
                    <c:if test="${not empty sessionScope.username}">
                        <a class="nav-link active" aria-current="page" href="/logout"><i
                                class="fa-solid fa-right-to-bracket"></i> Đăng xuất</a>
                    </c:if>
                </li>
            </ul>
        </div>
    </div>
</nav>

<c:if test="${not empty sessionScope.username}">
    <div class="container mt-4">
        <h1>Chào mừng, <b>${sessionScope.username}</b></h1>
        <div class="row mt-4">
            <div class="col-md-3">
                <div class="list-group">
                    <a href="?section=dashboard"
                       class="list-group-item list-group-item-action ${param.section == 'dashboard' ? 'active' : ''}">Tổng
                        Quan</a>
                    <a href="?section=sanPham"
                       class="list-group-item list-group-item-action ${param.section == 'sanPham' ? 'active' : ''}">Sản
                        Phẩm</a>
                    <a href="?section=danhMuc"
                       class="list-group-item list-group-item-action ${param.section == 'danhMuc' ? 'active' : ''}">Danh
                        Mục</a>
                    <a href="?section=khachHang"
                       class="list-group-item list-group-item-action ${param.section == 'khachHang' ? 'active' : ''}">Khách
                        Hàng</a>
                    <a href="?section=mauSac"
                       class="list-group-item list-group-item-action ${param.section == 'mauSac' ? 'active' : ''}">Màu
                        Sắc</a>
                    <a href="?section=kichCo"
                       class="list-group-item list-group-item-action ${param.section == 'kichCo' ? 'active' : ''}">Kích
                        Cỡ</a>
                    <a href="?section=ctsp"
                       class="list-group-item list-group-item-action ${param.section == 'ctsp' ? 'active' : ''}">Chi
                        Tiết Sản Phẩm</a>
                    <a href="?section=hd"
                       class="list-group-item list-group-item-action ${param.section == 'hd' ? 'active' : ''}">Hóa
                        Đơn</a>
                    <a href="?section=hdct"
                       class="list-group-item list-group-item-action ${param.section == 'hdct' ? 'active' : ''}">Chi
                        Tiết Hóa Đơn</a>

                </div>
            </div>
            <div class="col-md-9">
                <c:choose>
                    <c:when test="${param.section == 'dashboard' || param.section == null}">
                        <div class="card">
                            <div class="card-header">
                                Tổng quan
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Về bảng điều khiển</h5>
                                <p class="card-text">Chào mừng bạn đến với bảng điều khiển. Tại đây bạn có thể tìm thấy
                                    thông tin tổng quan về ứng dụng của mình.</p>
                            </div>
                        </div>
                    </c:when>


                    <c:when test="${param.section == 'sanPham'}">
                        <div class="card">
                            <div class="card-header">
                                DANH SÁCH SẢN PHẨM
                            </div>
                            <div class="card-body">
                                <c:if test="${not empty themSuc}">
                                    <div class="alert alert-success mt-2" role="alert">
                                        <span class="text-success">${themSuc}</span>
                                    </div>
                                </c:if>
                                <c:if test="${not empty sessionScope.username}">
                                    <a href="/san-pham/form-add" class="btn btn-outline-primary">Thêm mới</a>
                                </c:if>
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Mã SP</th>
                                        <th>Tên SP</th>
                                        <th>Giá SP</th>
                                        <th>Trạng thái</th>
                                        <th>Ngày tạo</th>
                                        <th>Tên danh mục</th>
                                        <th>Chức năng</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${sanPhamList.content}" var="sp" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${sp.maSP}</td>
                                            <td>${sp.tenSP}</td>
                                            <td>${sp.giaSP}</td>
                                            <td>${sp.trangThaiSP}</td>
                                            <td>
                                                <fmt:formatDate value="${sp.ngayTaoSP}" pattern="yyyy-MM-dd    "/>
                                            </td>
                                            <td>${sp.danhMuc.tenDanhMuc}</td>
                                            <td>
                                                <a href="/san-pham/detail/${sp.id}" class="btn btn-info">Chi tiết</a>
                                                <a href="/san-pham/formUpdate/${sp.id}" class="btn btn-primary">Sửa</a>
                                                <a href="/san-pham/delete/${sp.id}" class="btn btn-danger"
                                                   onclick="return confirm('Bạn chắc chắn muốn xóa?')">Xóa</a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                                <div class="d-flex justify-content-between">
                                    <c:if test="${sanPhamList.number > 0}">
                                        <a href="/admin?section=sanPham&page=${sanPhamList.number - 1}&key=${param.key}"
                                           class="btn btn-primary">Previous</a>
                                    </c:if>
                                    <div>
                                        Page ${sanPhamList.number + 1} of ${sanPhamList.totalPages}
                                    </div>
                                    <c:if test="${!sanPhamList.last}">
                                        <a href="/admin?section=sanPham&page=${sanPhamList.number + 1}&key=${param.key}"
                                           class="btn btn-primary">Next</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:when>


                    <c:when test="${param.section == 'danhMuc'}">
                        <div class="card">
                            <div class="card-header">
                                DANH SÁCH DANH MỤC
                            </div>
                            <div class="card-body">
                                <c:if test="${not empty addDanhMuc}">
                                    <div class="alert alert-success mt-2" role="alert">
                                        <span class="text-success">${addDanhMuc}</span>
                                    </div>
                                </c:if>
                                <c:if test="${not empty sessionScope.username}">
                                    <a href="/danh-muc/form-add" class="btn btn-outline-primary">Thêm mới</a>
                                </c:if>
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Mã DM</th>
                                        <th>Tên DM</th>
                                        <th>Trạng thái</th>
                                        <th>Ngày tạo</th>
                                        <th>Chức năng</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${danhMucList.content}" var="dm" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${dm.maDanhMuc}</td>
                                            <td>${dm.tenDanhMuc}</td>
                                            <td>${dm.trangThai}</td>
                                            <td>
                                                <fmt:formatDate value="${dm.ngayTao}" pattern="yyyy-MM-dd    "/>
                                            </td>
                                            <td>
                                                <a href="/danh-muc/detail/${dm.id}" class="btn btn-info">Chi tiết</a>
                                                <a href="/danh-muc/formUpdate/${dm.id}" class="btn btn-primary">Sửa</a>
                                                <a href="/danh-muc/delete/${dm.id}" class="btn btn-danger"
                                                   onclick="return confirm('Bạn chắc chắn muốn xóa?')">Xóa</a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                                <div class="d-flex justify-content-between">
                                    <c:if test="${danhMucList.number > 0}">
                                        <a href="/admin?section=danhMuc&page=${danhMucList.number - 1}&key=${param.key}"
                                           class="btn btn-primary">Previous</a>
                                    </c:if>
                                    <div>
                                        Page ${danhMucList.number + 1} of ${danhMucList.totalPages}
                                    </div>
                                    <c:if test="${!danhMucList.last}">
                                        <a href="/admin?section=danhMuc&page=${danhMucList.number + 1}&key=${param.key}"
                                           class="btn btn-primary">Next</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:when>


                    <c:when test="${param.section == 'khachHang'}">
                        <div class="card">
                            <div class="card-header">
                                DANH SÁCH KHÁCH HÀNG
                            </div>
                            <div class="card-body">
                                <c:if test="${not empty delFail}">
                                    <div class="alert alert-success" role="alert">
                                        <span class="text-success">${delFail}</span>
                                    </div>
                                </c:if>
                                <c:if test="${not empty errorMessage}">
                                    <div class="alert alert-success" role="alert">
                                        <span class="text-success">${errorMessage}</span>
                                    </div>
                                </c:if>
                                <c:if test="${not empty sessionScope.username}">
                                    <a href="/signup" class="btn btn-outline-primary">Thêm mới</a>
                                </c:if>
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Tên KH</th>
                                        <th>Địa chỉ</th>
                                        <th>Số điện thoại</th>
                                        <th>Trạng thái</th>
                                        <th>Vai trò</th>
                                        <th>Ngày tạo</th>
                                        <th>Chức năng</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${khachHangList.content}" var="kh" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${kh.hoTen}</td>
                                            <td>${kh.diaChi}</td>
                                            <td>${kh.sdt}</td>
                                            <td>${kh.trangThai}</td>
                                            <c:forEach items="${userList}" var="us">
                                                <c:if test="${kh.id eq us.khachHang.id}">
                                                    <td>${us.role}</td>
                                                </c:if>
                                            </c:forEach>
                                            <td>
                                                <fmt:formatDate value="${kh.ngayTao}" pattern="yyyy-MM-dd"/>
                                            </td>
                                            <td>
                                                <a href="/khach-hang/detail/${kh.id}" class="btn btn-info">Chi tiết</a>
                                                <a href="/khach-hang/formUpdate/${kh.id}"
                                                   class="btn btn-primary">Sửa</a>
                                                <a href="/khach-hang/delete/${kh.id}" class="btn btn-danger"
                                                   onclick="return confirm('Bạn chắc chắn muốn xóa?')">Xóa</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="d-flex justify-content-between">
                                    <c:if test="${khachHangList.number > 0}">
                                        <a href="/admin?section=khachHang&page=${khachHangList.number - 1}&key=${param.key}"
                                           class="btn btn-primary">Previous</a>
                                    </c:if>
                                    <div>
                                        Page ${khachHangList.number + 1} of ${khachHangList.totalPages}
                                    </div>
                                    <c:if test="${!khachHangList.last}">
                                        <a href="/admin?section=khachHang&page=${khachHangList.number + 1}&key=${param.key}"
                                           class="btn btn-primary">Next</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:when>

                    <c:when test="${param.section == 'mauSac'}">
                        <div class="card">
                            <div class="card-header">
                                DANH SÁCH MÀU SẮC
                            </div>
                            <div class="card-body">
                                <c:if test="${not empty addMauSac}">
                                    <div class="alert alert-success" role="alert">
                                        <span class="text-success">${addMauSac}</span>
                                    </div>
                                </c:if>
                                <c:if test="${not empty sessionScope.username}">
                                    <a href="/mau-sac/form-add" class="btn btn-outline-primary">Thêm mới</a>
                                </c:if>
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Mã màu</th>
                                        <th>Tên màu</th>
                                        <th>Trạng thái</th>
                                        <th>Ngày tạo</th>
                                        <th>Chức năng</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${mauSacList.content}" var="ms" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${ms.maMau}</td>
                                            <td>${ms.tenMau}</td>
                                            <td>${ms.trangThai}</td>
                                            <td>
                                                <fmt:formatDate value="${ms.ngayTao}" pattern="yyyy-MM-dd"/>
                                            </td>
                                            <td>
                                                <a href="/mau-sac/detail/${ms.id}" class="btn btn-info">Chi tiết</a>
                                                <a href="/mau-sac/formUpdate/${ms.id}" class="btn btn-primary">Sửa</a>
                                                <a href="/mau-sac/delete/${ms.id}" class="btn btn-danger"
                                                   onclick="return confirm('Bạn chắc chắn muốn xóa?')">Xóa</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="d-flex justify-content-between">
                                    <c:if test="${mauSacList.number > 0}">
                                        <a href="/admin?section=mauSac&page=${mauSacList.number - 1}&key=${param.key}"
                                           class="btn btn-primary">Previous</a>
                                    </c:if>
                                    <div>
                                        Page ${mauSacList.number + 1} of ${mauSacList.totalPages}
                                    </div>
                                    <c:if test="${!mauSacList.last}">
                                        <a href="/admin?section=mauSac&page=${mauSacList.number + 1}&key=${param.key}"
                                           class="btn btn-primary">Next</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:when>

                    <c:when test="${param.section == 'kichCo'}">
                        <div class="card">
                            <div class="card-header">
                                DANH SÁCH KÍCH CỠ
                            </div>
                            <div class="card-body">
                                <c:if test="${not empty addSize}">
                                    <div class="alert alert-success" role="alert">
                                        <span class="text-success">${addSize}</span>
                                    </div>
                                </c:if>
                                <c:if test="${not empty sessionScope.username}">
                                    <a href="/size/form-add" class="btn btn-outline-primary">Thêm mới</a>
                                </c:if>
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Mã size</th>
                                        <th>Tên size</th>
                                        <th>Trạng thái</th>
                                        <th>Ngày tạo</th>
                                        <th>Chức năng</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${sizeList.content}" var="s" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${s.maSize}</td>
                                            <td>${s.tenSize}</td>
                                            <td>${s.trangThai}</td>
                                            <td>
                                                <fmt:formatDate value="${s.ngayTao}" pattern="yyyy-MM-dd"/>
                                            </td>
                                            <td>
                                                <a href="/size/detail/${s.id}" class="btn btn-info">Chi tiết</a>
                                                <a href="/size/formUpdate/${s.id}" class="btn btn-primary">Sửa</a>
                                                <a href="/size/delete/${s.id}" class="btn btn-danger"
                                                   onclick="return confirm('Bạn chắc chắn muốn xóa?')">Xóa</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="d-flex justify-content-between">
                                    <c:if test="${sizeList.number > 0}">
                                        <a href="/admin?section=kichCo&page=${sizeList.number - 1}&key=${param.key}"
                                           class="btn btn-primary">Previous</a>
                                    </c:if>
                                    <div>
                                        Page ${sizeList.number + 1} of ${sizeList.totalPages}
                                    </div>
                                    <c:if test="${!sizeList.last}">
                                        <a href="/admin?section=kichCo&page=${sizeList.number + 1}&key=${param.key}"
                                           class="btn btn-primary">Next</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${param.section == 'ctsp'}">
                        <div class="card">
                            <div class="card-header">
                                CHI TIẾT SẢN PHẨM
                            </div>
                            <div class="card-body">
                                <c:if test="${not empty addCTSP}">
                                    <div class="alert alert-success" role="alert">
                                        <span class="text-success">${addCTSP}</span>
                                    </div>
                                </c:if>
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Tên SP</th>
                                        <th>Tên màu</th>
                                        <th>Tên size</th>
                                        <th>Giá bán</th>
                                        <th>Trạng thái</th>
                                        <th>Ngày tạo</th>
                                        <th>Chức năng</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${ctspList.content}" var="s" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${s.sanPham.tenSP}</td>
                                            <td>${s.mauSac.tenMau}</td>
                                            <td>${s.size.tenSize}</td>
                                            <td>${s.giaBan}</td>
                                            <td>${s.trangThai}</td>
                                            <td>
                                                <fmt:formatDate value="${s.ngayTao}" pattern="yyyy-MM-dd"/>
                                            </td>
                                            <td>
                                                <a href="/ctsp/detail/${s.id}" class="btn btn-info">Chi tiết</a>
                                                <a href="/ctsp/delete/${s.id}" class="btn btn-danger"
                                                   onclick="return confirm('Bạn chắc chắn muốn xóa?')">Xóa</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="d-flex justify-content-between">
                                    <c:if test="${ctspList.number > 0}">
                                        <a href="/admin?section=ctsp&page=${ctspList.number - 1}&key=${param.key}"
                                           class="btn btn-primary">Previous</a>
                                    </c:if>
                                    <div>
                                        Page ${ctspList.number + 1} of ${ctspList.totalPages}
                                    </div>
                                    <c:if test="${!ctspList.last}">
                                        <a href="/admin?section=ctsp&page=${ctspList.number + 1}&key=${param.key}"
                                           class="btn btn-primary">Next</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${param.section == 'hd'}">
                        <div class="card">
                            <div class="card-header">
                                DANH SÁCH HÓA ĐƠN
                            </div>
                            <div class="card-body">
                                <c:if test="${not empty addHD}">
                                    <div class="alert alert-success" role="alert">
                                        <span class="text-success">${addHD}</span>
                                    </div>
                                </c:if>
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Tên KH</th>
                                        <th>Địa chỉ</th>
                                        <th>SDT</th>
                                        <th>Trạng thái</th>
                                        <th>Ngày tạo</th>
                                        <th>Chức năng</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${hoaDonList.content}" var="s" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${s.khachHang.hoTen}</td>
                                            <td>${s.diaChi}</td>
                                            <td>${s.soDienThoai}</td>
                                            <td>${s.trangThai}</td>
                                            <td>
                                                <fmt:formatDate value="${s.ngayTao}" pattern="yyyy-MM-dd"/>
                                            </td>
                                            <td>
                                                <a href="/hd/detail/${s.id}" class="btn btn-info">Chi tiết</a>
                                                <a href="/hd/delete/${s.id}" class="btn btn-danger"
                                                   onclick="return confirm('Bạn chắc chắn muốn xóa?')">Xóa</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="d-flex justify-content-between">
                                    <c:if test="${hoaDonList.number > 0}">
                                        <a href="/admin?section=hd&page=${hoaDonList.number - 1}&key=${param.key}"
                                           class="btn btn-primary">Previous</a>
                                    </c:if>
                                    <div>
                                        Page ${hoaDonList.number + 1} of ${hoaDonList.totalPages}
                                    </div>
                                    <c:if test="${!hoaDonList.last}">
                                        <a href="/admin?section=hd&page=${hoaDonList.number + 1}&key=${param.key}"
                                           class="btn btn-primary">Next</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${param.section == 'hdct'}">
                        <div class="card">
                            <div class="card-header">
                                CHI TIẾT HÓA ĐƠN
                            </div>
                            <div class="card-body">
                                <c:if test="${not empty addHDCT}">
                                    <div class="alert alert-success" role="alert">
                                        <span class="text-success">${addHDCT}</span>
                                    </div>
                                </c:if>
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>ID hóa đơn</th>
                                        <th>ID CTSP</th>
                                        <th>Số lượng</th>
                                        <th>Giá bán</th>
                                        <th>Tổng tiền</th>
                                        <th>Trạng thái</th>
                                        <th>Ngày tạo</th>
                                        <th>Chức năng</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${hdctList.content}" var="s" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${s.hoaDon.id}</td>
                                            <td>${s.ctsp.id}</td>
                                            <td>${s.soLuongMua}</td>
                                            <td>${s.giaBan}</td>
                                            <td>${s.tongTien}</td>
                                            <td>${s.trangThai}</td>
                                            <td>
                                                <fmt:formatDate value="${s.ngayTao}" pattern="yyyy-MM-dd"/>
                                            </td>
                                            <td>
                                                <a href="/hdct/detail/${s.id}" class="btn btn-info">Chi tiết</a>
                                                <a href="/hdct/delete/${s.id}" class="btn btn-danger"
                                                   onclick="return confirm('Bạn chắc chắn muốn xóa?')">Xóa</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="d-flex justify-content-between">
                                    <c:if test="${hdctList.number > 0}">
                                        <a href="/admin?section=hdct&page=${hdctList.number - 1}&key=${param.key}"
                                           class="btn btn-primary">Previous</a>
                                    </c:if>
                                    <div>
                                        Page ${hdctList.number + 1} of ${hdctList.totalPages}
                                    </div>
                                    <c:if test="${!hdctList.last}">
                                        <a href="/admin?section=hdct&page=${hdctList.number + 1}&key=${param.key}"
                                           class="btn btn-primary">Next</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
</c:if>
<c:if test="${empty sessionScope.username}">
    <div class="alert alert-success" role="alert">
        <span class="text-success">Vui lòng đăng nhập để sử dụng các chức năng!</span>
    </div>
</c:if>
</body>
</html>
