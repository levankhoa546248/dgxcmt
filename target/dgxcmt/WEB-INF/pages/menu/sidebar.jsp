<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String uri = request.getAttribute("javax.servlet.forward.request_uri").toString();
    String url = uri.replaceAll(path + "/", "");
%>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="trang-chu">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3"> ĐGXCMT</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item <%=url.equals("trang-chu")?"active":""%>">
        <a class="nav-link" href="trang-chu">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Trang chủ</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        QUẢN LÝ
    </div>

    <!-- Nav Item - Charts -->
    <li class="nav-item <%=url.equals("nhap-xe")?"active":""%>">
        <a class="nav-link" href="nhap-xe">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Nhập xe</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        CẤU HÌNH
    </div>

    <!-- Nav Item - Charts -->
    <li class="nav-item <%=url.equals("dong-xe")?"active":""%>">
        <a class="nav-link" href="dong-xe">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Dòng xe</span></a>
    </li>

    <!-- Nav Item - Charts -->
    <li class="nav-item <%=url.equals("nhan-vien")?"active":""%>">
        <a class="nav-link" href="nhan-vien">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Nhân viên</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>