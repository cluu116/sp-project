<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: CHIEN
  Date: 09/04/2024
  Time: 07:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign-up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .rounded-t-5 {
            border-top-left-radius: 0.5rem;
            border-top-right-radius: 0.5rem;
        }

        @media (min-width: 992px) {
            .rounded-tr-lg-0 {
                border-top-right-radius: 0;
            }

            .rounded-bl-lg-5 {
                border-bottom-left-radius: 0.5rem;
            }
        }
    </style>
</head>
<body>
<section class=" text-center text-lg-start">
    <div class="card mb-3">
        <c:if test="${not empty error1}">
            <div class="alert alert-warning" role="alert">
                <span class="text-success">${error1}</span>
            </div>
        </c:if>
        <div class="row g-0 d-flex align-items-center">
            <div class="col-lg-4 d-none d-lg-flex">
                <img src="https://mdbootstrap.com/img/new/ecommerce/vertical/004.jpg" alt="Trendy Pants and Shoes"
                     class="w-100 rounded-t-5 rounded-tr-lg-0 rounded-bl-lg-5" />
            </div>
            <div class="col-lg-8">
                <div class="card-body py-5 px-md-5">

                    <form action="/signUp" method="post">
                        <div data-mdb-input-init class="form-outline mb-4">
                            <label class="form-label" for="form2Example1">Họ tên</label>
                            <input type="text" name="khachHang.hoTen" id="form2Example1" class="form-control" />
                        </div>
                        <div data-mdb-input-init class="form-outline mb-4">
                            <label class="form-label" for="form2Example1">Địa chỉ</label>
                            <input type="text" name="khachHang.diaChi" id="form2Example1" class="form-control" />
                        </div>
                        <div data-mdb-input-init class="form-outline mb-4">
                            <label class="form-label" for="form2Example1">Số điện thoại</label>
                            <input type="tel" name="khachHang.sdt" id="form2Example1" class="form-control" />
                        </div>
                        <div data-mdb-input-init class="form-outline mb-4">
                            <label class="form-label" for="form2Example2">Tên đăng nhập</label>
                            <input type="text" name="username" id="form2Example2" class="form-control" />
                        </div>
                        <div data-mdb-input-init class="form-outline mb-4">
                            <label class="form-label" for="form2Example2">Mật khẩu</label>
                            <input type="password" name="password" id="form2Example2" class="form-control" />
                        </div>

                        <div class="row mb-4">
                            <div class="col d-flex justify-content-center">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />
                                    <label class="form-check-label" for="form2Example31"> Nhớ tôi </label>
                                </div>
                            </div>

                            <div class="col">
                                <a href="#!" style="text-decoration: none">Forgot password?</a>
                            </div>
                        </div>
                        <button type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-block mb-4">Sign in</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
