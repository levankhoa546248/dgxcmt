<%--
    Document   : dangnhap
    Created on : Dec 23, 2015, 10:13:36 PM
    Author     : NguyenHoanTuan
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="google-site-verification" content="u6uNEfD4cb3gidezi4r_6aI8Wb1E07-ufBeCQpvmlqQ" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Hệ thống chăm sóc sức khỏe</title>
    <link rel="icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/x-icon"/>
    <link rel="shortcut icon" href="<c:url value="/resources/images/favicon.ico" />" type="image/x-icon"/>
    <link rel='stylesheet prefetch' href=''>
    <script src="<c:url value="/resources/js/jquery.min.1.9.1.js" />"></script>
    <link href="<c:url value="/resources/combogrid/css/smoothness/jquery-ui-1.10.1.custom.css" />" rel="stylesheet"/>
    <script src="<c:url value="/resources/combogrid/jquery/jquery-ui-1.10.1.custom.min.js" />"></script>
    <script src="<c:url value="/resources/login/js/login.js" />"></script>
    <script src="<c:url value="/resources/js/cookies.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.md5.js" />"></script>
    <link href="<c:url value="/resources/alert/simply-toast.css" />" rel="stylesheet"/>
    <script src="<c:url value="/resources/alert/simply-toast.js" />"></script>
</head>
<style>
    *, *:before, *:after {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    html, body {
        font-size: 62.5%;
        height: 100%;
        overflow: hidden;
    }
    @media (max-width: 768px) {
        html, body {
            font-size: 50%;
        }
    }

    svg {
        display: inline-block;
        width: 2rem;
        height: 2rem;
        overflow: visible;
    }

    .svg-icon {
        cursor: pointer;
    }
    .svg-icon path {
        stroke: rgba(255, 255, 255, 0.9);
        fill: none;
        stroke-width: 1;
    }

    input, button {
        outline: none;
        border: none;
    }

    .cont {
        position: relative;
        height: 100%;
        background-image: url(<c:url value="/resources/login/img/hinhnen.jpg" />);
        background-size: cover;
        overflow: auto;
        font-family: "Open Sans", Helvetica, Arial, sans-serif;
    }

    .demo {
        position: absolute;
        top: 50%;
        left: 50%;
        margin-left: -15rem;
        margin-top: -19rem;
        width: 30rem;
        height: 45rem;
        overflow: hidden;
    }
    @media (max-width: 480px) {
        .demo {
            position: absolute;
            top: 0;
            left: 0;
            margin: 0 0 1rem 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
    }
    @media (max-width: 900px) and (orientation : landscape) {
        .demo {
            margin-bottom: 5rem;
        }
    }
    ::-webkit-input-placeholder {
        color: #E9E9F1;
    }

    :-moz-placeholder { /* Firefox 18- */
        color: #E9E9F1;
    }

    ::-moz-placeholder {  /* Firefox 19+ */
        color: #E9E9F1;
    }

    :-ms-input-placeholder {
        color: #E9E9F1;
    }
    .login {
        position: relative;
        height: 100%;
        background: -webkit-linear-gradient(top, rgba(146, 135, 187, 0.8) 10%, rgba(0, 0, 0, 0.6) 70%);
        background: linear-gradient(to bottom, rgba(146, 135, 187, 0.8) 10%, rgba(0, 0, 0, 0.6) 70%);
        -webkit-transition: opacity 0.1s, -webkit-transform 0.3s cubic-bezier(0.17, -0.65, 0.665, 1.25);
        transition: opacity 0.1s, -webkit-transform 0.3s cubic-bezier(0.17, -0.65, 0.665, 1.25);
        transition: opacity 0.1s, transform 0.3s cubic-bezier(0.17, -0.65, 0.665, 1.25);
        transition: opacity 0.1s, transform 0.3s cubic-bezier(0.17, -0.65, 0.665, 1.25), -webkit-transform 0.3s cubic-bezier(0.17, -0.65, 0.665, 1.25);
        -webkit-transform: scale(1);
        transform: scale(1);
    }
    .login.inactive {
        opacity: 0;
        -webkit-transform: scale(1.1);
        transform: scale(1.1);
    }
    .login_right_bottom {
        position: absolute;
        bottom: 5px;
        /*right: 20px;*/
        width: 100%;
        height: 50px;
        z-index: 2;
        color: white;
        font-size:15px;
        text-align: center;
        vertical-align: bottom;
        font-weight: bolder;
        -webkit-text-stroke: 0.2px #FF3366;
    }

    .login__check {
        position: absolute;
        top: 16rem;
        left: 13.5rem;
        width: 14rem;
        height: 2.8rem;
        background: #fff;
        -webkit-transform-origin: 0 100%;
        transform-origin: 0 100%;
        -webkit-transform: rotate(-45deg);
        transform: rotate(-45deg);
    }
    .login__check:before {
        content: "";
        position: absolute;
        left: 0;
        bottom: 100%;
        width: 2.8rem;
        height: 5.2rem;
        background: #fff;
        box-shadow: inset -0.2rem -2rem 2rem rgba(0, 0, 0, 0.2);
    }
    .login__form {
        position: absolute;
        left: 0;
        width: 100%;
        height: 50%;
        padding: 1.5rem 2.5rem;
    }
    .login_header{
        padding-top: 20px;
        width: 100%;
        text-align: center;
        font-size: 50px;
        color:#0051E9;
        font-weight:bolder;
        -webkit-text-stroke: 1px white;
    }
    .login__row {
        height: 5rem;
        padding-top: 1rem;
        border-bottom: 1px solid rgba(255, 255, 255, 0.2);
    }
    .login__icon {
        margin-bottom: -0.4rem;
        margin-right: 0.5rem;
    }
    .login__icon.name path {
        stroke-dasharray: 73.50196075439453;
        stroke-dashoffset: 73.50196075439453;
        -webkit-animation: animatePath 2s 0.5s forwards;
        animation: animatePath 2s 0.5s forwards;
    }
    .login__icon.pass path {
        stroke-dasharray: 92.10662841796875;
        stroke-dashoffset: 92.10662841796875;
        -webkit-animation: animatePath 2s 0.5s forwards;
        animation: animatePath 2s 0.5s forwards;
    }
    .login__input {
        display: inline-block;
        width: 22rem;
        height: 100%;
        padding-left: 1.5rem;
        font-size: 1.5rem;
        background: transparent;
        -webkit-background: transparent;
        -moz-background: transparent;
        -o-background: transparent;
        background:rgb(0,0,0);
        background:rgba(0,0,0,0);
        background-color:rgba(0, 0, 0, 0);
        background-color: transparent;
        color: #FDFCFD;
    }
    .login__submit {
        position: relative;
        width: 100%;
        height: 4rem;
        margin: 5rem 0 2.2rem;
        color: rgba(255, 255, 255, 0.8);
        font-weight: bold;
        background: #FF3366;
        font-size: 1.5rem;
        border-radius: 3rem;
        cursor: pointer;
        overflow: hidden;
        -webkit-transition: width 0.3s 0.15s, font-size 0.1s 0.15s;
        transition: width 0.3s 0.15s, font-size 0.1s 0.15s;
    }
    .login__submit:after {
        content: "";
        position: absolute;
        top: 50%;
        left: 50%;
        margin-left: -1.5rem;
        margin-top: -1.5rem;
        width: 3rem;
        height: 3rem;
        border: 2px dotted #fff;
        border-radius: 50%;
        border-left: none;
        border-bottom: none;
        -webkit-transition: opacity 0.1s 0.4s;
        transition: opacity 0.1s 0.4s;
        opacity: 0;
    }
    .login__submit.processing {
        width: 4rem;
        font-size: 0;
    }
    .login__submit.processing:after {
        opacity: 1;
        -webkit-animation: rotate 0.5s 0.4s infinite linear;
        animation: rotate 0.5s 0.4s infinite linear;
    }
    .login__submit.success {
        -webkit-transition: opacity 0.1s 0.3s, background-color 0.1s 0.3s, -webkit-transform 0.3s 0.1s ease-out;
        transition: opacity 0.1s 0.3s, background-color 0.1s 0.3s, -webkit-transform 0.3s 0.1s ease-out;
        transition: transform 0.3s 0.1s ease-out, opacity 0.1s 0.3s, background-color 0.1s 0.3s;
        transition: transform 0.3s 0.1s ease-out, opacity 0.1s 0.3s, background-color 0.1s 0.3s, -webkit-transform 0.3s 0.1s ease-out;
        -webkit-transform: scale(30);
        transform: scale(30);
        opacity: 0.9;
    }
    .login__submit.success:after {
        -webkit-transition: opacity 0.1s 0s;
        transition: opacity 0.1s 0s;
        opacity: 0;
        -webkit-animation: none;
        animation: none;
    }
    .login__signup {
        text-shadow: 0 0.5px 0 white, 0 -0.5px 0 white, 0.5px 0 0 white, -0.5px 0 0 white;
        font-size: 16px;
        font-weight: bold;
        color: #0051E9;
        text-align: right;
        padding-right: 10px;
    }
    .login__infor {
        font-size: 12px;
        font-weight: bold;
        color: white;
        text-align: justify;
        padding: 10px 10px 10px 10px;
    }
    .login__signup a {
        color: #0051E9;
        cursor: pointer;
    }

    .app {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        opacity: 0;
        display: none;
        -webkit-transition: opacity 0.1s, -webkit-transform 0.3s cubic-bezier(0.68, -0.45, 0.465, 1.25);
        transition: opacity 0.1s, -webkit-transform 0.3s cubic-bezier(0.68, -0.45, 0.465, 1.25);
        transition: opacity 0.1s, transform 0.3s cubic-bezier(0.68, -0.45, 0.465, 1.25);
        transition: opacity 0.1s, transform 0.3s cubic-bezier(0.68, -0.45, 0.465, 1.25), -webkit-transform 0.3s cubic-bezier(0.68, -0.45, 0.465, 1.25);
        -webkit-transform: scale(1.2);
        transform: scale(1.2);
    }
    .app.active {
        opacity: 1;
        -webkit-transform: scale(1);
        transform: scale(1);
    }
    .app.active .app__user-photo {
        -webkit-transform: scale(1);
        transform: scale(1);
    }
    .app.active .app__meeting {
        -webkit-transform: translateY(0);
        transform: translateY(0);
        opacity: 1;
    }
    .app.active .app__logout {
        -webkit-transform: scale(1);
        transform: scale(1);
    }
    .app__top {
        position: relative;
        height: 28rem;
        background: rgba(0, 0, 0, 0.5);
        padding: 6rem 1.5rem 2rem;
        text-align: center;
    }
    .app__bot {
        position: relative;
        height: 25rem;
        background: #fff;
    }
    .app__menu-btn {
        position: absolute;
        top: 2rem;
        left: 1.5rem;
        width: 1.8rem;
        height: 1.7rem;
        cursor: pointer;
    }
    .app__menu-btn span, .app__menu-btn:before, .app__menu-btn:after {
        position: absolute;
        left: 0;
        width: 100%;
        height: 1px;
        background: rgba(255, 255, 255, 0.6);
    }
    .app__menu-btn span {
        top: 0.8rem;
    }
    .app__menu-btn:before {
        content: "";
        top: 0;
    }
    .app__menu-btn:after {
        content: "";
        bottom: 0;
    }
    .app__icon {
        position: absolute;
        top: 2rem;
    }
    .app__icon.search {
        right: 1.5rem;
        stroke-dasharray: 61.847137451171875;
        stroke-dashoffset: 61.847137451171875;
        -webkit-animation: animatePath 0.5s 0.5s forwards;
        animation: animatePath 0.5s 0.5s forwards;
    }
    .app__hello {
        font-size: 2.2rem;
        color: #fff;
        font-weight: normal;
        margin-bottom: 3rem;
    }
    .app__user {
        position: relative;
        display: inline-block;
        width: 9rem;
        height: 9rem;
        margin-bottom: 3rem;
    }
    .app__user-photo {
        width: 100%;
        height: 100%;
        border-radius: 50%;
        -webkit-transition: -webkit-transform 0.3s 0.2s cubic-bezier(0.62, 0.35, 0.56, 1.55);
        transition: -webkit-transform 0.3s 0.2s cubic-bezier(0.62, 0.35, 0.56, 1.55);
        transition: transform 0.3s 0.2s cubic-bezier(0.62, 0.35, 0.56, 1.55);
        transition: transform 0.3s 0.2s cubic-bezier(0.62, 0.35, 0.56, 1.55), -webkit-transform 0.3s 0.2s cubic-bezier(0.62, 0.35, 0.56, 1.55);
        -webkit-transform: scale(0);
        transform: scale(0);
    }
    .app__user-notif {
        position: absolute;
        top: 0;
        right: 0;
        width: 3rem;
        height: 3rem;
        border-radius: 50%;
        line-height: 3rem;
        text-align: center;
        background: #50D2C2;
        color: #fff;
        font-size: 1.5rem;
    }
    .app__month:after {
        content: "";
        display: table;
        clear: both;
    }
    .app__month-name {
        display: inline-block;
        color: rgba(255, 255, 255, 0.6);
        font-size: 1.2rem;
        text-transform: uppercase;
    }
    .app__month-btn {
        display: inline-block;
        width: 1.2rem;
        height: 1.2rem;
        border: 1px solid rgba(255, 255, 255, 0.6);
        border-left: none;
        border-bottom: none;
        cursor: pointer;
    }
    .app__month-btn.left {
        float: left;
        -webkit-transform: rotate(-135deg);
        transform: rotate(-135deg);
    }
    .app__month-btn.right {
        float: right;
        -webkit-transform: rotate(45deg);
        transform: rotate(45deg);
    }
    .app__days {
        height: 7rem;
        padding: 1.5rem 2rem;
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: justify;
        -webkit-justify-content: space-between;
        -ms-flex-pack: justify;
        justify-content: space-between;
        -webkit-flex-wrap: wrap;
        -ms-flex-wrap: wrap;
        flex-wrap: wrap;
    }
    .app__day {
        width: 14%;
        text-align: center;
        font-size: 1.2rem;
    }
    .app__day.weekday {
        color: #919197;
        text-transform: uppercase;
    }
    .app__day.date {
        font-size: 1.2rem;
        font-weight: bold;
        color: #3C3C43;
    }
    .app__meeting {
        position: relative;
        height: 6rem;
        border-top: 1px solid #EEEEEF;
        padding: 1rem 2rem 1rem 7.5rem;
        -webkit-transition: opacity 0.3s, -webkit-transform 0.3s;
        transition: opacity 0.3s, -webkit-transform 0.3s;
        transition: transform 0.3s, opacity 0.3s;
        transition: transform 0.3s, opacity 0.3s, -webkit-transform 0.3s;
        -webkit-transform: translateY(-50%);
        transform: translateY(-50%);
        opacity: 0;
    }
    .app__meeting:nth-child(1) {
        -webkit-transition-delay: 0.2s;
        transition-delay: 0.2s;
    }
    .app__meeting:nth-child(2) {
        -webkit-transition-delay: 0.3s;
        transition-delay: 0.3s;
    }
    .app__meeting:nth-child(3) {
        -webkit-transition-delay: 0.4s;
        transition-delay: 0.4s;
    }
    .app__meeting:nth-child(4) {
        -webkit-transition-delay: 0.5s;
        transition-delay: 0.5s;
    }
    .app__meeting:nth-child(5) {
        -webkit-transition-delay: 0.6s;
        transition-delay: 0.6s;
    }
    .app__meeting-photo {
        position: absolute;
        left: 2rem;
        top: 1rem;
        width: 4rem;
        height: 4rem;
    }
    .app__meeting-name {
        color: #000;
        font-size: 1.3rem;
    }
    .app__meeting-info {
        color: #949498;
        font-size: 1.1rem;
    }
    .app__logout {
        position: absolute;
        bottom: 3.3rem;
        right: 3.3rem;
        width: 4.6rem;
        height: 4.6rem;
        margin-right: -2.3rem;
        margin-bottom: -2.3rem;
        background: #FC3768;
        color: #fff;
        font-size: 2rem;
        border-radius: 50%;
        cursor: pointer;
        -webkit-transition: bottom 0.4s 0.1s, right 0.4s 0.1s, opacity 0.1s 0.7s, background-color 0.1s 0.7s, -webkit-transform 0.4s 0.4s;
        transition: bottom 0.4s 0.1s, right 0.4s 0.1s, opacity 0.1s 0.7s, background-color 0.1s 0.7s, -webkit-transform 0.4s 0.4s;
        transition: bottom 0.4s 0.1s, right 0.4s 0.1s, transform 0.4s 0.4s, opacity 0.1s 0.7s, background-color 0.1s 0.7s;
        transition: bottom 0.4s 0.1s, right 0.4s 0.1s, transform 0.4s 0.4s, opacity 0.1s 0.7s, background-color 0.1s 0.7s, -webkit-transform 0.4s 0.4s;
        -webkit-transform: scale(0);
        transform: scale(0);
    }
    .app__logout.clicked {
        bottom: 50%;
        right: 50%;
        -webkit-transform: scale(30) !important;
        transform: scale(30) !important;
        opacity: 0.9;
    }
    .app__logout.clicked svg {
        opacity: 0;
    }
    .app__logout-icon {
        position: absolute;
        width: 3rem;
        height: 3rem;
        top: 50%;
        left: 50%;
        margin-left: -1.5rem;
        margin-top: -1.5rem;
        -webkit-transition: opacity 0.1s;
        transition: opacity 0.1s;
    }
    .app__logout-icon path {
        stroke-width: 4px;
        stroke-dasharray: 64.36235046386719;
        stroke-dashoffset: 64.36235046386719;
        -webkit-animation: animatePath 0.5s 0.5s forwards;
        animation: animatePath 0.5s 0.5s forwards;
    }

    .ripple {
        position: absolute;
        width: 15rem;
        height: 15rem;
        margin-left: -7.5rem;
        margin-top: -7.5rem;
        background: rgba(0, 0, 0, 0.4);
        -webkit-transform: scale(0);
        transform: scale(0);
        -webkit-animation: animRipple 0.4s;
        animation: animRipple 0.4s;
        border-radius: 50%;
    }

    @-webkit-keyframes animRipple {
        to {
            -webkit-transform: scale(3.5);
            transform: scale(3.5);
            opacity: 0;
        }
    }

    @keyframes animRipple {
        to {
            -webkit-transform: scale(3.5);
            transform: scale(3.5);
            opacity: 0;
        }
    }
    @-webkit-keyframes rotate {
        to {
            -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
        }
    }
    @keyframes rotate {
        to {
            -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
        }
    }
    @-webkit-keyframes animatePath {
        to {
            stroke-dashoffset: 0;
        }
    }
    @keyframes animatePath {
        to {
            stroke-dashoffset: 0;
        }
    }

</style>
<script>
    $(function() {
        //Start HIENNH.NAN HISHTROTGG-33824
        if(window.location.hostname =='yte-nghean.vnpthis.vn' ||window.location.hostname =='yte-test.vnhis.vn' ||window.location.hostname =='localhost' && (window.chrome && window.chrome.webstore))
        {
            var detect = function(base, if_installed, if_not_installed) {
                var s = document.createElement('script');
                s.onerror = if_not_installed;
                s.onload = if_installed;
                document.body.appendChild(s);
                s.src = base + '/ui/assets/font/roboto/Roboto-Light.ttf';
            }
            detect('chrome-extension://' + 'cahmomdpjikjfjlkgadbfjlkbnpengcg', function() {console.log('Tiện ích đã được cài đặt');},install_extention);

            function install_extention ()
            {
                $('#error').css('text-align','center');
                $('#error').html('Cài đặt tiện ích kiểm tra thẻ bảo hiểm <a target="_blank" style="color: wheat;" href="https://chrome.google.com/webstore/detail/vnpt-his-bhyt-checker-201/cahmomdpjikjfjlkgadbfjlkbnpengcg">VNPT HIS - BHYT Checker</a>');
            }
        }
        //End HIENNH.NAN HISHTROTGG-33824
        var dialog_dangnhap = $("#dangnhap_form").dialog({
            autoOpen: false,
            modal: true,
            resizable: false,
            width: 430,
            position: {my: "center", at: "center", of: window}
        });
        $(".login").click(function(evt) {
            //dangnhap_form.open();
            dialog_dangnhap.dialog("open");
            //$("#error").text("");
        });
        $("#dangnhap").click(function(evt) {
            if ("${khanCap}" == "0") {
                var tendn = $("#tendangnhap").val();
                var matkhau = $("#matkhau").val();
                var valueTest = kiemtratrangthaicosoyte(tendn, matkhau);
                if (parseInt(valueTest) > 0) {
                    $("#error").html("Cơ sở y tế đã bị khóa. Không thể đăng nhập vào.");
                } else {
                    dangnhap(evt);
                }
            }else {
                dangnhap(evt);
            }

        });
        $("#matkhau").keypress(function(evt) {
            if (evt.keyCode == 13){
                if ("${khanCap}" == "0") {
                    var tendn = $("#tendangnhap").val();
                    var matkhau = $("#matkhau").val();
                    var valueTest = kiemtratrangthaicosoyte(tendn, matkhau);
                    if (parseInt(valueTest) > 0){
                        $("#error").html("Cơ sở y tế đã bị khóa. Không thể đăng nhập vào.");
                    }else{
                        dangnhap(evt);
                    }
                }else {
                    dangnhap(evt);
                }
            }

        });
        $("#tendangnhap").keypress(function(evt) {
            if (evt.keyCode == 13)
            {
                $("#tendangnhap").val($("#tendangnhap").val().toUpperCase());
                $("#matkhau").focus();
            }
        });
        dialog_dangnhap.dialog("open");
        function dangnhap(evt) {
            var tendn = $("#tendangnhap").val();
            var matkhau = $("#matkhau").val();
            $("#error").html("");
            if (tendn !== "" && matkhau !== "") {
                var url = "login";
                var that = $("#dangnhap");
                ripple(that, evt);
                that.addClass("processing");
                $.post(url, {tendn: tendn, matkhau: $.md5(matkhau)}).done(function(data) {
                    if (data == "SUCCESS") {

                        //Nếu bật xác thực 2 bước
                        var isOTPLogin = getCookie("isLoginOTP");
                        if (isOTPLogin && isOTPLogin == "1") {
                            $(location).attr('href', 'xacthucotp');
                        }

                        if (animating)
                            return;
                        animating = true;
                        setTimeout(function() {
                            that.addClass("success");
                            setTimeout(function() {
                                $app.show();
                                $app.css("top");
                                $app.addClass("active");
                            }, submitPhase2 - 70);
                            setTimeout(function() {
                                $login.hide();
                                $login.addClass("inactive");
                                animating = false;
                                that.removeClass("success processing");
                            }, submitPhase2);
                        }, submitPhase1);
                        setCookie("booldangnhap", "1", 1);
                        sessionStorage.setItem("userId", getCookie("userId"));
                        var url_ts = "macdinhformthietlapphong";
                        $.ajax({
                            url: url_ts
                        }).done(function(macdinh) {
                            if (macdinh == "1"){
                                $(location).attr('href', 'thietlapphong');
                            } else {
                                if (checkCookie("phongkham")) {
                                    var maphong = getCookie("phongkham");
                                    var tenphong = decodeURI(getCookie("tenphongkham"));
                                    var url = "setphongkham";
                                    $.post(url, {ma: maphong, phong: tenphong}).done(function(data) {
                                        if (data == "SUCCESS") {
                                            var url_form = "layform_gannhat";
                                            $.ajax({
                                                url: url_form
                                            }).done(function(data) {
                                                if (data == "")
                                                    $(location).attr('href', 'thongtinnhanvien');
                                                else
                                                    $(location).attr('href', data);
                                            });
                                        } else {
                                            $(location).attr('href', 'thietlapphong');
                                        }
                                    });
                                }
                                else {
                                    var tendonvi = "${Sess_Tendonvi}";
                                    if (tendonvi.toLowerCase().indexOf("sở y tế") >= 0 || tendonvi.toLowerCase().indexOf("bhxh") >= 0) {
                                        $(location).attr('href', 'thongtinnhanvien');
                                    } else
                                        $(location).attr('href', 'thietlapphong');
                                }
                            }
                        });
                    }
                    else {
                        $("#error").html("Tên đăng nhập/mật khẩu không đúng hoặc số lượng connect quá cao");
                        var that = $("#dangnhap");
                        that.removeClass("success processing");
                    }
                }).fail(function(data) {

                });
            }
            else if (tendn == "") {
                $("#error").html("Tên đăng nhập không được trống");
                //$.simplyToast('Tên đăng nhập không được trống', 'danger');
                //return false;
            }
            else {
                $("#error").html("Mật khẩu không được trống");
                //$.simplyToast('Mật khẩu không được trống', 'danger');
                //return false;
            }
        }
        var animating = false,
            submitPhase1 = 1100,
            submitPhase2 = 400,
            logoutPhase1 = 800,
            $login = $(".login"),
            $app = $(".app");

        function ripple(elem, e) {
            $(".ripple").remove();
            var elTop = elem.offset().top,
                elLeft = elem.offset().left,
                x = e.pageX - elLeft,
                y = e.pageY - elTop;
            var $ripple = $("<div class='ripple'></div>");
            $ripple.css({top: y, left: x});
            elem.append($ripple);
        }
        ;

        $(document).on("click", ".app__logout", function(e) {
            if (animating)
                return;
            $(".ripple").remove();
            animating = true;
            var that = this;
            $(that).addClass("clicked");
            setTimeout(function() {
                $app.removeClass("active");
                $login.show();
                $login.css("top");
                $login.removeClass("inactive");
            }, logoutPhase1 - 120);
            setTimeout(function() {
                $app.hide();
                animating = false;
                $(that).removeClass("clicked");
            }, logoutPhase1);
        });
        $("#tendangnhap").focus();
    });

    function kiemtratrangthaicosoyte(user, pass) {
        var result = 0;
        $.ajax({
            url: "traCuuTrangThaiCoSoYTe",
            type: "POST",
            timeout: 3000,
            async: false,
            data: {
                tenDangNhap: user,
                matKhau: $.md5(pass)
            },
            success: function (data) {
                if (data){
                    var param = {
                        csytId: data.madonvi,
                        pmId: "21"
                    };
                    var settings = {
                        "url": "https://quantity.myhealth.vn/api/csyt-locks/locked?" + $.param(param),
                        "method": "GET",
                        "timeout": 3000,
                        "async": false,
                        "headers": {
                            "Authorization": "Bearer " + data.token,
                            "Content-Type": "application/json"
                        }
                    };

                    $.ajax(settings).done(function (response) {
                        // console.log('Json data',response);
                        result = response.length;
                    }).fail(function (jqXHR, textStatus) {
                        if (textStatus == 'timeout') {
                            result =  -500;
                        }
                    });
                }
            },
            error: function (jqXHR, textStatus) {
                if (textStatus == 'timeout'){
                    result = -401;
                }
            }
        });

        return result;
    }
</script>
<body>
<div class="cont">
    <div class="demo">
        <div class="login">
            <div class="login_header">VNPT-HIS</div>
            <div class="login__signup">Sản phẩm của &nbsp;<a><img src="<c:url value="/resources/images/logo-vnpt.png" />" width="50" height="50" /></a></div>
            <div class="login__form">
                <div class="login__row">
                    <svg class="login__icon name svg-icon" viewBox="0 0 20 20">
                        <path d="M0,20 a10,8 0 0,1 20,0z M10,0 a4,4 0 0,1 0,8 a4,4 0 0,1 0,-8" />
                    </svg>
                    <input type="text" class="login__input name" placeholder="Tên đăng nhập" name="tendangnhap" id="tendangnhap"/>
                </div>
                <div class="login__row">
                    <svg class="login__icon pass svg-icon" viewBox="0 0 20 20">
                        <path d="M0,20 20,20 20,8 0,8z M10,13 10,16z M4,8 a6,8 0 0,1 12,0" />
                    </svg>
                    <input type="password" class="login__input pass" placeholder="Mật khẩu" name="matkhau" id="matkhau"/>
                </div>

                <div style="text-align: center"><button type="button" name="dangnhap" id="dangnhap" class="login__submit">Đăng nhập</button></div>
                <div id="error" style="color: red;padding-bottom: 5px; font-size: 13px;"></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
