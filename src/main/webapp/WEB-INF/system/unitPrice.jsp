<%--
  Created by IntelliJ IDEA.
  User: 方徽
  Date: 2019/7/8
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title></title>
    <style type="text/css">
        body {
            text-align: center;
            margin-top: 200px;
            font-family: "微软雅黑";
            font-size: 50px;
            background: lightgray;
        }
        input {
            width: 125px;
            height: 40px;

        }

        button {
            width: 125px;
            height: 40px;
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
<form action="upUnitPrice">
    <tr>
        <td>
            水费单价：<input value="${price.waterUnit}" name="waterUnit"><br/>
        </td>
        <td>
            电费单价：<input type="text" value="${price.electricUnit}" name="electricUnit"><br/>
        </td>
        <button type="submit" style="font-family: '微软雅黑';">修改</button>
    </tr>
</form>
</body>
</html>