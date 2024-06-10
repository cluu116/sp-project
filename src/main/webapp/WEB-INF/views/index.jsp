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
<!doctype html>
<html lang="en">

<head>
    <title>Title</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>
    <link rel="stylesheet" href="all.css">
</head>
<body>
<div class="row">
    <div class="col-12">
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                        class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="images/img/nen2.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="images/img/nen1.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="images/img/nen3.jpg" class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
                <div class="container-fluid px-4 px-lg-5">
                    <a class="navbar-brand" href="#!">PH35388-STORE</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation"><span
                            class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                            <li class="nav-item"><a class="nav-link active" aria-current="page"
                                                    href="/home">Trang
                                chủ</a></li>
                            <li class="nav-item"><a class="nav-link" href="#!">Giới thiệu</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">Danh sách sản phẩm</a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#sp">Tất cả sản phẩm</a></li>
                                    <li>
                                        <hr class="dropdown-divider"/>
                                    </li>
                                    <li><a class="dropdown-item" href="#!">Mặt hàng phổ biến</a></li>
                                    <li><a class="dropdown-item" href="#!">Sản phẩm mới</a></li>
                                </ul>
                            </li>
                        </ul>
                        <form class="d-flex">
                            <button class="btn btn-outline-dark" type="submit">
                                <i class="bi-cart-fill me-1"></i>
                                <a href="/gio-hang">Giỏ Hàng</a>
                                <span class="badge bg-dark text-white ms-1 rounded-pill">
                                    <c:choose>
                                        <c:when test="${empty sessionScope.count}">
                                            0
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${sessionScope.count}" varStatus="c">
                                                <c:if test="${c.last}">
                                                    ${c.index + 1}
                                                </c:if>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </button>
                            <ul class="navbar-nav mb-2 mb-lg-0 me-2">
                                <c:if test="${empty sessionScope.username}">
                                    <a class="nav-link active" aria-current="page" href="/login"><i
                                            class="fa-solid fa-circle-user"></i> Đăng nhập</a>
                                </c:if>
                                <c:if test="${not empty sessionScope.username}">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                           data-bs-toggle="dropdown" aria-expanded="false">
                                            <c:if test="${not empty sessionScope.username}">
                                                Xin chào: <b>${sessionScope.username}</b>
                                            </c:if>
                                        </a>
                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <c:if test="${not empty sessionScope.username}">
                                                <c:if test="${sessionScope.role eq 'admin'}">
                                                    <a class="nav-link active" aria-current="page" href="/admin"><i
                                                            class="fa-solid fa-circle-user"></i> Trang Admin</a>
                                                </c:if>
                                            </c:if>
                                            <c:if test="${not empty sessionScope.username}">
                                                <a class="nav-link active" aria-current="page" href="/logout"><i
                                                        class="fa-solid fa-right-to-bracket"></i> Đăng xuất</a>
                                            </c:if>
                                        </ul>
                                    </li>
                                </c:if>
                            </ul>
                        </form>
                    </div>
                </div>
            </nav>
        </div>
    </div>

    <div class="row">
        <div class="col-3">
            <div class="card-body mt-5" style="border: 1px solid rgb(219, 219, 219);">
                <div class="card">
                    <div class="panel-body">
                        <form action="${pageContext.request.contextPath}/home" class="d-flex" method="GET">
                            <input class="form-control" type="search" placeholder="Search" aria-label="Search"
                                   name="key"
                                   value="${param.key}">
                            <input type="hidden" name="page" value="0"/>
                            <button class="btn btn-outline-success" type="submit"><i
                                    class="fa-solid fa-magnifying-glass"></i></button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="card mt-5">
                <div class="card-header">
                    <i class="fa-solid fa-bars"></i> Danh Mục
                </div>
                <ul class="list-group">
                    <li class="list-group-item active">Điện thoại di động <span style="float: right;"
                                                                                class="badge bg-secondary">50</span>
                    </li>
                    <li class="list-group-item">Máy tính xách tay <span style="float: right;"
                                                                        class="badge bg-secondary">3</span></li>
                    <li class="list-group-item">Đồng hồ cơ <span style="float: right;"
                                                                 class="badge bg-secondary">7</span></li>
                    <li class="list-group-item">Đồng hồ thông minh <span style="float: right;"
                                                                         class="badge bg-secondary">9</span></li>
                    <li class="list-group-item">Tai nghe <span style="float: right;"
                                                               class="badge bg-secondary">11</span></li>
                    <li class="list-group-item">Máy ảnh <span style="float: right;"
                                                              class="badge bg-secondary">15</span></li>
                </ul>
            </div>
        </div>
        <div class="col-9 text-center" id="sp">
            <ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home"
                            type="button" role="tab" aria-controls="home" aria-selected="true">Sản phẩm
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile"
                            type="button" role="tab" aria-controls="profile" aria-selected="false">Vị trí của
                        hàng
                    </button>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <div class="cart mb-3" style="max-width: 100%;">
                        <div class="row g-0 mt-5">
                            <c:forEach items="${sanPhamList.content}" var="sp" varStatus="status">
                                <c:if test="${status.index % 4 == 0}">
                                    <div class="row mb-3">
                                </c:if>

                                <div class="col-3">
                                    <div class="card" style="width: 17rem;">
                                        <img src="images/${sp.hinhAnh}" class="card-img-top" style="height: 250px"
                                             alt="...">
                                        <div class="card-body">
                                            <h4 class="card-title"><b>${sp.tenSP}</b></h4>
                                            <div class="text-lg-start">Mã Sản Phẩm: <b>${sp.maSP}</b></div>
                                            <div class="text-lg-start">Trạng Thái: <b>${sp.trangThaiSP}</b></div>
                                            <div class="text-lg-start mb-2">Giá: <b>${sp.giaSP} VND</b></div>
                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                    data-bs-target="#staticBackdrop">
                                                <a href="/home?page=${param.page}&key=${param.key}&sp=${sp.id}&#sp"
                                                   class="text text-light" style="text-decoration: none">Thêm vào
                                                    giỏ</a>
                                            </button>
                                            <a href="#" id="col-6" class="btn btn-primary">Xem chi tiết</a>
                                        </div>
                                    </div>
                                </div>

                                <c:if test="${status.index % 4 == 3 || status.last}">
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="d-flex justify-content-between mb-3">
                        <c:if test="${sanPhamList.number > 0}">
                            <a href="/home?page=${sanPhamList.number - 1}&key=${param.key}&#sp" class="btn btn-primary">Previous</a>
                        </c:if>
                        <div>
                            Page ${sanPhamList.number + 1} of ${sanPhamList.totalPages}
                        </div>
                        <c:if test="${!sanPhamList.last}">
                            <a href="/home?page=${sanPhamList.number + 1}&key=${param.key}&#sp" class="btn btn-primary">Next</a>
                        </c:if>
                    </div>
                </div>
            </div>
            <c:if test="${not empty tb}">
                <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
                    <div id="liveToast" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
                        <div class="toast-header">
                            <strong class="me-auto">Thông báo</strong>
                            <small>Bây giờ</small>
                            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                        </div>
                        <div class="toast-body">
                                ${tb}
                        </div>
                    </div>
                </div>
            </c:if>
            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab"
                 style="text-align: center; margin: 30px;">
                <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.8946156636507!2d105.8320917747695!3d21.03690228749976!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135aba15ec15d17%3A0x620e85c2cfe14d4c!2zTMSDbmcgQ2jhu6cgdOG7i2NoIEjhu5MgQ2jDrSBNaW5o!5e0!3m2!1svi!2s!4v1704794403439!5m2!1svi!2s"
                        width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <footer class="py-1 bg-secondary">
        <div class="footer small text-center text-white-50">
            <p class="m-0 text-center text-white">Copyright &copy; chienlmph35388 Website 2024</p>
        </div>
    </footer>
</div>

<%--    modal--%>
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Điền thông tin</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/add-to-cart" method="post">
                    <div class="row mb-3">
                        <div class="col" hidden="true">
                            <label for="recipient-name" class="col-form-label">Sản phẩm:</label>
                            <input readonly type="text" name="productId" value="${getOneSP.id}" class="form-control">
                        </div>
                        <div class="col">
                            <label for="recipient-name" class="col-form-label">Sản phẩm:</label>
                            <input readonly type="text" name="tenSP" value="${getOneSP.tenSP}" class="form-control"
                                   id="recipient-name">
                        </div>
                        <div class="col">
                            <label for="message-text" class="col-form-label">Màu sắc</label>
                            <select class="form-select" name="idMau">
                                <c:forEach items="${MauSac}" var="ms">
                                    <option value="${ms.id}">${ms.tenMau}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label for="message-text" class="col-form-label">Kích thước:</label>
                            <select class="form-select" name="idSize">
                                <c:forEach items="${Size}" var="s">
                                    <option value="${s.id}">${s.tenSize}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col">
                            <label for="message-text" class="col-form-label">Số lượng:</label>
                            <input type="number" name="soLuong" class="form-control" min="1" max="99" value="1">
                        </div>
                    </div>
                    <div class="d-flex justify-content-end">
                        <button type="submit" class="btn btn-primary me-2">Thêm</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var liveToastBtn = document.getElementById('liveToastBtn');
        var liveToast = new bootstrap.Toast(document.getElementById('liveToast'));

        if ('${not empty tb}') {
            liveToast.show();
        }
    });

</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js"></script>
</body>

</html>
