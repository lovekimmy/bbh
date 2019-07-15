<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 方徽
  Date: 2019/7/8
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <style type="text/css">
        body {
            background: lightgray;
            text-align: center;
            margin-top: 200px;
            font-size: 50px;
        }

        input {
            width: 100px;
            height: 40px;
        }

        select {
            width: 100px;
            height: 40px;
        }

        button {
            width: 100px;
            height: 40px;
            font-size: 20px;
        }

        form {
            border: 1px solid black;
            /*margin-right: 10px;*/
            padding-right: -200px;
            background-color: yellowgreen;
        }
    </style>
</head>

<body>
<form action="reading">
    <div align="center" class="111">
        <div>
            宿舍号：
            <select name="roomId">
                <c:forEach var="r" items="${room}">
                    <option value="${r.id}">${r.room}</option>
                    <br/>
                </c:forEach>
            </select>
        </div>
        当月用水吨数：<input type="text" name="waterNum"/><br/>
        当月用电度数：<input type="text" name="electricNum"/><br/>
        <button type="submit">提交</button>
    </div>
</form>
</body>

</html>