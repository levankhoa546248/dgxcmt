<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <%--    <meta http-equiv="refresh" content="60*60; url=trangchu">--%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Định giá xe cũ miền tây</title>
    <!--CSS-->
    <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png" />" type="image/x-icon"/>
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="<c:url value="/resources/css/sb-admin-2.min.css" />" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="<c:url value="/resources/fontawesome-free/css/all.min.css" />" rel="stylesheet">
    <!-- jqGrid 4.6.0 -->
    <link href="<c:url value="/resources/jqgrid-4.6.0/css/ui.jqgrid.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/jquery-ui-1.13.0.custom/jquery-ui.min.css" />" rel="stylesheet">
    <style>

    </style>
</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <%@include file="../menu/sidebar.jsp" %>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <%@include file="../menu/topbar.jsp" %>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Hãng xe</h1>
                </div>

                <!-- Content Row -->
                <div class="row">

                </div>

                <div class="row">
                    <div class="col-md-12">
                        <table id="dsHangXe"></table>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <%@include file="../menu/footer.jsp" %>

        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
</body>

<!--JS-->
<!-- Bootstrap core JavaScript-->
<script src="<c:url value="/resources/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<!-- Core plugin JavaScript-->
<script src="<c:url value="/resources/jquery-easing/jquery.easing.min.js"/>"></script>
<!-- Custom scripts for all pages-->
<script src="<c:url value="/resources/js/sb-admin-2.min.js"/>"></script>
<!-- jqGrid 4.6.0 -->
<script src="<c:url value="/resources/jqgrid-4.6.0/js/i18n/grid.locale-vi.js"/>"></script>
<script src="<c:url value="/resources/jqgrid-4.6.0/js/jquery.jqGrid.src.js"/>"></script>
<script src="<c:url value="/resources/jquery-ui-1.13.0.custom/jquery-ui.min.js"/>"></script>

<script>
    $(function () {
        $("#dsHangXe").jqGrid({
            url: 'danh-sach-hang-xe',
            datatype: "json",
            loadonce: true,
            autowidth: true,
            rowNum: 1000000,
            ignoreCase: true,
            rownumbers: true,
            colModel: [
                {name: 'id', label: 'Id', align: 'center', width: '30%'},
                {name: "scode", label: "Scode", hidden: true},
                {name: "tenhangxe", label: "Tên hãng xe"}
            ],
            caption: "Danh sách hãng xe",
            footerrow: true
        });

    });
</script>
</html>