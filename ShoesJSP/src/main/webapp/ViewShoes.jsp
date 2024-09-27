<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品列表</title>
<style>
    /* 基本設定 */
    body {
        font-family: 'Georgia', serif;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        min-height: 100vh;
        margin: 0;
        padding: 0;
        background-color: #eae6d6; /* 柔和的卡其色 */
        background-image: linear-gradient(120deg, #eae6d6, #f0f4f1);
    }

    h1 {
        text-align: center;
        color: #4a4e3d; /* 深灰綠色 */
        margin-bottom: 20px;
    }

    /* 搜尋表單樣式 */
    form {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 20px;
    }

    input[type="text"] {
        padding: 10px;
        font-size: 16px;
        width: 300px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-right: 10px;
    }

    button {
        padding: 10px 20px;
        font-size: 16px;
        background-color: #d0b899; /* 新的顏色，柔和的土黃色 */
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #a77b3d; /* 深色調 */
    }

    /* 表格樣式 */
    table {
        width: 80%;
        border-collapse: collapse;
        margin: 20px 0;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        background-color: white;
    }

    table, th, td {
        border: 1px solid #ddd;
    }

    th {
        padding: 12px;
        background-color: #7c9a7a; /* 淺綠色 */
        color: white;
        text-align: center;
    }

    td {
        padding: 12px;
        text-align: center;
    }

    tr:hover {
        background-color: #f0f0e3; /* 浅灰色 */
    }

    /* 分頁按鈕樣式 */
    .pagination {
        margin-top: 20px;
        text-align: center;
    }

    .pagination a {
        margin: 0 5px;
        padding: 10px 15px;
        text-decoration: none;
        border: 1px solid #6b8e23; /* 橄欖綠色 */
        color: #6b8e23;
        border-radius: 5px;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    .pagination a:hover {
        background-color: #6b8e23;
        color: white;
    }

    .pagination a.active {
        background-color: #6b8e23;
        color: white;
        font-weight: bold;
    }
</style>
</head>
<body>

<h1>商品列表</h1>

<!-- 搜尋表單 -->
<form action="Shoes" method="get">
    <input type="text" name="searchName" placeholder="輸入商品名稱">
    <button type="submit">搜尋</button>
</form>

<hr>

<!-- 商品列表表格 -->
<table>
  <thead>
    <tr>
      <th>商品編號</th>
      <th>商品名稱</th>
      <th>商品價格</th>
      <th>商品庫存</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="ss" items="${Shoes}">
     <tr>
        <td>${ss.code}</td>
        <td>${ss.name}</td>
        <td>${ss.price}</td>
        <td>${ss.quantity}</td>
     </tr>
  </c:forEach> 
  </tbody>
</table>

<!-- 分頁按鈕 -->
<div class="pagination">
    <!-- 前一頁按鈕，無論如何都顯示 -->
    <a href="Shoes?page=${currentPage > 1 ? currentPage - 1 : 1}&searchName=${searchName}">前一頁</a>

    <c:forEach begin="${startPage}" end="${endPage}" var="i">
        <a href="Shoes?page=${i}&searchName=${searchName}" class="${i == currentPage ? 'active' : ''}">${i}</a>
    </c:forEach>

    <!-- 後一頁按鈕，無論如何都顯示 -->
    <a href="Shoes?page=${currentPage < totalPages ? currentPage + 1 : totalPages}&searchName=${searchName}">下一頁</a>
</div>




</body>
</html>
