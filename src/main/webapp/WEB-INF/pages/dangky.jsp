<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Định giá xe cũ miền tây</title>
    <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png" />" type="image/x-icon"/>

    <link href="<c:url value="/resources/jAlert/jquery.alerts.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/fontawesome-free/css/all.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/sb-admin-2.min.css" />" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <script src="<c:url value="/resources/jquery/jquery.min.js" />"></script>
    <script src="<c:url value="/resources/js/sb-admin-2.min.js" />"></script>
    <script src="<c:url value="/resources/bootstrap/js/bootstrap.bundle.min.js" />"></script>
    <script src="<c:url value="/resources/jquery-easing/jquery.easing.min.js" />"></script>
    <script src="<c:url value="/resources/jAlert/jquery.alerts.js" />"></script>

</head>

<script>
    $(function () {
        $("#ho").keypress(function (e) {
            if (e.keyCode == 13) {
                $("#ten").focus();
            }
        });
        $("#ten").keypress(function (e) {
            if (e.keyCode == 13) {
                $("#taiKhoan").focus();
            }
        });
        $("#taiKhoan").keypress(function (e) {
            if (e.keyCode == 13) {
                $("#matKhau").focus();
            }
        });
        $("#matKhau").keypress(function (e) {
            if (e.keyCode == 13) {
                $("#nhapLaiMatKhau").focus();
            }
        });
        $("#nhapLaiMatKhau").keypress(function (e) {
            if (e.keyCode == 13) {
                var matKhau = $("#matKhau").val();
                var nhapLaiMatKhau = $("#nhapLaiMatKhau").val();
                if (matKhau !== nhapLaiMatKhau) {
                    jAlert("Mật khẩu không trùng khớp", "Thông báo", function (e) {
                        if (e) {
                            $("#nhapLaiMatKhau").focus();
                        }
                    });
                } else {
                    dangky();
                }
            }
        });

        function dangky() {
            var ho = $("#ho").val();
            var ten = $("#ten").val();
            var taiKhoan = $("#taiKhoan").val();
            var matKhau = $("#matKhau").val();
            var nhapLaiMatKhau = $("#nhapLaiMatKhau").val();
            if (ho !== "" && ten !== "" && taiKhoan !== "" && matKhau !== "" && matKhau === nhapLaiMatKhau) {
                $.post("dang-ky-tai-khoan", {
                    ho: ho,
                    ten: ten,
                    taikhoan: taiKhoan,
                    matkhau: matKhau
                }).done(function (data) {
                    if (data > 0) {
                        $(location).attr("href", "trang-chu");
                    } else {
                        if (data == "-1"){
                            jAlert("Tài khoản đã tồn tại", "Thông báo");
                        } else {
                            jAlert("Lỗi hệ thống. Code: " + data, "Thông báo");
                        }
                    }
                });
            }
        }

        $("#dangKy").click(function (e) {
            dangky();
        });
    });
</script>

<body class="bg-gradient-primary">

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-6 d-none d-lg-block bg-register-image"></div>
                <div class="col-lg-6">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Đăng ký tài khoản!</h1>
                        </div>
                        <form class="user" onsubmit="return false;">
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user" id="ho"
                                           placeholder="Họ" required>
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control form-control-user" id="ten"
                                           placeholder="Tên" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="taiKhoan"
                                       placeholder="Tài khoản" required>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control form-control-user"
                                       id="matKhau" placeholder="Mật khẩu" required>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control form-control-user"
                                       id="nhapLaiMatKhau" placeholder="Nhập lại mật khẩu">

                            </div>
                            <button id="dangKy" class="btn btn-primary btn-user btn-block">
                                Đăng ký
                            </button>
                        </form>
                        <hr>
                        <div class="text-center">
                            <a class="small" href="quen-mat-khau">Quên mật khẩu?</a>
                        </div>
                        <div class="text-center">
                            <a class="small" href="trang-chu">Bạn đã có tài khoản? Đăng nhập</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

</body>


</html>