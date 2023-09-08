<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="feature.cart.dao.*"%>
<%@ page import="feature.cart.vo.*"%>
<%@ page import="feature.item.vo.*"%>
<%@ page import="feature.cart.service.*"%>
<%@ page import="feature.item.dao.impl.*"%>

<!-- <%@ page isELIgnored="false"%> -->

<%-- 此頁練習採用 EL 的寫法取值 --%>

<% %>


<!DOCTYPE html>
<html lang="zh-Hant">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
<title>PolyBrain確認訂單</title>


<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>

<body bgcolor='lightpink'>

<div class="container">
    <div class="row">


        <table id="table-1">
	        <tr><td>
		        <h3>購物車</h3>
		        <h4><a href="select.jsp">回首頁</a></h4>
	        </td></tr>
        </table>

        <table>
	        <tr>
		        <th>遊戲名稱</th>
                <th>商品簡介</th>
                <th>價格</th>
                <th>數量</th>
                <th>小計</th>
	        </tr>
	    <c:forEach var="itemVOs" items="${itemVONewList}" >
		  <tr>
			    <td>${itemVOs.itemName}</td>
			    <td>${itemVOs.itemProdDescription}</td>
			    <td>${itemVOs.itemPrice}</td>

		    <td>
	            <c:forEach var="cartTraceVOs" items="${cartTraceVOList}" >
                    <c:if test="${cartTraceVOs.itemNo eq itemVOs.itemNo}">

                        <input type="hidden" name="action" value="UpdateItemQuantity" id="actionInput">
                        <input type="number" value="${cartTraceVOs.quantity}" id="actionInput">
                        <td>${cartTraceVOs.quantity * itemVOs.itemPrice}</td>
                    </c:if>
                </c:forEach>
            </td>
		  </tr>
	</c:forEach>
   <span class="orderTotal"> 總計: ${orderTotal} </span>

</table>
    <form method="post" action="<%=request.getContextPath()%>/view/CartTrace/ConfirmOrder" >

			<input type="hidden" name="action" value="orderConfirm" id="actionInput">
			<input type="submit" class="confirmButton" value="confirm" id="orderconfirm">
			<p style="display: block; color: red; padding: 0px 3px">${errorMsgs["noConfirmOrder"]}</p>
			<a href="#" class="canceled">返回購物車</a>
        </div>
    </form>


    </div>
<script>

</script>
</body>
</html>