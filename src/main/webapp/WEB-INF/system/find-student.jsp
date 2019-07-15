<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%--
  Created by IntelliJ IDEA.
  User: 方徽
  Date: 2019/7/8
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title>查询-学生</title>
    <style>
        body {
            text-align: center;
            background: lightgray;

            /*margin: 50px;*/
            /*padding: -50px;*/
        }
        button {
            font-family: "微软雅黑";

            margin-top: 35px;
            margin-right: 50px;
        }
        div {
            padding: 100px;
            margin: 100px;
        }

        table {
            background: orange;
        }

    </style>
</head>

<body>
<div>
    <h1 align="center">欢迎您！${user.name}</h1>


        <c:if test="${list.size() ne 0}">
            <h2>未缴水电费</h2>
            <table align="center" wdith="90%" border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <th>宿舍号</th>
                    <th>总人数</th>
                    <th>用电度数</th>
                    <th>用水吨数</th>
                    <th>总水电费</th>
                    <th>单人水电费</th>
                    <th>抄表日期</th>
                    <th>状态</th>
                </tr>
                <c:forEach items="${list}" var="l">
                    <tr>
                        <td>${l.room.room}</td>
                        <td>${l.room.number}</td>
                        <td>${l.roomMoney.electricNum}</td>
                        <td>${l.roomMoney.waterNum}</td>
                        <td>${l.roomMoney.price}</td>
                        <td>${l.roomMoney.price/l.room.number}</td>
                        <th><fmt:formatDate value="${l.roomMoney.readingDay}" pattern="yyyy-MM-dd"/></th>
                    <%--                        <td>${l.payId eq 1?"已缴":"未缴"}</td>--%>
                        <td>未缴</td>
                    </tr>
                </c:forEach>
            </table>
            <button onclick="location.href='toFindStudentList'">查看缴费记录</button>
            <button  type="button" onclick="location.href='jiaofei'" >跳转缴费页面</button>
        </c:if>

    <c:if test="${list.size() eq 0}">

        <h2 align="center">已缴清水电费</h2>
        <button onclick="location.href='toFindStudentList'">查看缴费记录</button>

    </c:if>



</div>
</body>
</html>
