<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="<%= request.getContextPath() %>/view/emp/css/item.css" rel="stylesheet" />    <!--側邊欄的css-->
<script src="https://kit.fontawesome.com/cb31023646.js" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>員工資料新增 </title>

<style type="text/css">

	button {
		padding: 5px;
	}
	form {
		display: table;
	}
	form div {
		display: table-row;
	}
	label, input, span, select {
		display: table-cell;
		margin: 5px;
		text-align: left;
	}
	input[type=text], input[type=password], select, textarea {
		width: 200px;
		margin: 5px;
	}
	form div div {
		display: table-cell;
	}
	.center {
        margin-left: auto;
        margin-right: auto;
    }
</style>
</head>
<body id="page-top">
<!---------------------------------------------以下為頂板--------------------------------------------------------->
<main class="flex-shrink-0">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: black;">
        <div class="container px-5">
            <img src="${pageContext.request.contextPath}/view/logo/PolyBrain_Logo.png" style="width: 110px; height: auto; margin-bottom: 5px;"></a>
        </div>
    </nav>
</main>
<!---------------------------------------------以上為頂板--------------------------------------------------------->



    <div id="layoutSidenav">  <!--勿刪到-->
<!---------------------------------------------以下為側邊攔--------------------------------------------------------->
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">

                                <!-------------會員中心-------------->
                        <div class="sb-sidenav-menu-heading">會員</div>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/member/listAllmem.jsp"><div class="sb-nav-link-icon"></div>
                            所有會員管理
                        </a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/view/forum/Listallarti.jsp"><div class="sb-nav-link-icon"></div>
                            討論區文章管理
                        </a>
                                <!-------------會員中心-------------->
                                <!--------------商城---------------->
                        <div class="sb-sidenav-menu-heading">商城</div>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/item/itemConsole.html"><div class="sb-nav-link-icon"></div>
                            商城管理
                        </a>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/item/itemClassConsole.html"><div class="sb-nav-link-icon"></div>
                            商品類別管理
                        </a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/view/order/listAllOrder.jsp"><div class="sb-nav-link-icon"></div>
                            訂單管理
                        </a>
                                <!-------------商城-------------->
                                <!-------------預約-------------->
                        <div class="sb-sidenav-menu-heading">預約</div>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/book/BookTable.html"><div class="sb-nav-link-icon"></div>
                            報到管理
                        </a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/view/bookingtast/Modifytimeperiod.jsp"><div class="sb-nav-link-icon"></div>
                            時段管理
                        </a>
                                <!-------------預約-------------->
                                <!-------------競標-------------->
                        <div class="sb-sidenav-menu-heading">預約</div>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/bid/BidEventList.jsp"><div class="sb-nav-link-icon"></div>
                            競標活動管理
                        </a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/view/bid/BidItemTable.html"><div class="sb-nav-link-icon"></div>
                            競標商品管理
                        </a>
                        <a class="nav-link" href="<%= request.getContextPath() %>/view/order/bidOrderBackend.html"><div class="sb-nav-link-icon"></div>
                            競標訂單
                        </a>
                                <!-------------競標-------------->
                        <div class="sb-sidenav-menu-heading">員工</div>

                        <a class="nav-link" href="<%= request.getContextPath() %>/view/emp/allEmpList.jsp"><div class="sb-nav-link-icon"></div>
                            員工管理
                        </a>
                    </div>
                </div>
            </nav>
        </div>
<!---------------------------------------------以上為側邊攔--------------------------------------------------------->


        <div id="layoutSidenav_content"> <!--勿刪到-->
<!-----------------------------以下為內容---------------------------->
    <main>
        <br>
        <div align="center"> <h2>員工資料新增</h2>
        <h3><a class="navbar-brand" href="<%=request.getContextPath()%>/view/emp/allEmpList.jsp">回查詢頁${success}</a></h3></div>
        <hr>
        <br>
      	<div align="center">
      	<h3><b>所有欄位皆為必填欄位</b></h3>
      	<br>
      	    <form action="<%=request.getContextPath()%>/general/addEmpServlet/do" method="post"
                <!-- 姓名 -->
                    <div class="form-group">
                        <input type="text" class="form-control form-control-user" id="fullName"
                            name="name" placeholder="姓名" required>
                    </div>

                <!-- 性别 -->
                    <div class="form-group" style="width: 100%; height: auto;">
                        <select class="form-control form-control-user" id="gender" name="gender" required>
                            <option value="" disabled selected>選擇性別</option> <!-- 默认选项 -->
                            <option value="1">男</option>
                            <option value="0">女</option>
                        </select>
                    </div>

                <!-- 信箱 -->
                    <div class="form-group">
                        <input type="email" class="form-control form-control-user" id="email"
                            name="email" placeholder="輸入信箱" required>
                    </div>

                <!-- 密码 -->
                    <div class="form-group">
                        <input type="password" class="form-control form-control-user"
                            id="password" name="password" placeholder="密碼" required>
                    </div>

                <!-- 手機 -->
                    <div class="form-group">
                        <input type="tel" class="form-control form-control-user" id="phone"
                            name="phone" placeholder="手機" pattern="\d{10}" required>
                    </div>

                <!-- 狀態 -->
                    <div class="form-group" style="width: 100%; height: auto;">
                        <select class="form-control form-control-user" id="state" name="state" required>
                            <option value="" disabled selected>請選擇</option> <!-- 默认选项 -->
                            <option value="0">離職</option>
                            <option value="1">在職中</option>
                            <option value="2">停職</option>
                        </select>
                    </div>


                <!-- 显示错误消息 -->
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>

                <br>
                <!-- 提交按钮 -->
                    <button type="submit" class="btn btn-primary btn-user btn-block">
                        送出新增
                    </button>
            </form>
    </main>
<!-----------------------------以上為內容---------------------------->
        </div>
    </div>
</body>
</html>