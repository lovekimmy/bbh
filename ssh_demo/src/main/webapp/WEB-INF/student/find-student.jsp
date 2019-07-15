<%@ page import="java.util.Date" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>水电费管理系统</title>
    <%--<base href="<%=request.getContextPath()%>/">--%>
    <link type="text/css" rel="stylesheet" href="../static/css/style.css"/>
    <link type="text/css" rel="stylesheet" href="../static/css/public.css"/>
    <script type="text/javascript" src="../static/js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".removeClass").click(function () {
                if (confirm("你确定要删除吗？")) {
                    // alert("开始删除")
                    var $tr = $(this).parent().parent();
                    var id = $tr.find("td:eq(0)").html();
                    //alert("userCode:"+userCode)
                    $.ajax({
                        type: "GET",
                        async: true,
                        url: "/del",
                        data: {"id": id},
                        dataType: "json",
                        success: function (data) {
                            if (data.result == "success") {
                                alert("删除成功！")
                                $tr.remove();
                            } else {
                                alert("删除失败！")
                            }
                        }
                    })
                }
            })
        })
    </script>

</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>水电费管理系统</h1>
    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b">
            <%--            ${loginedUser.userName}</span> , 欢迎你！--%>
        </p>
        <a href="/user/logout.action">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time">
        <%
            out.print(new Date().toLocaleString());
        %>
    </span>
    <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
</section>
<!--主体内容-->
<section class="publicMian ">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="/list">班级管理</a></li>
                <li><a href="proList.pro">宿舍管理</a></li>
                <li><a href="/user/list.action">学生管理</a></li>
                <li><a href="password.jsp">水电费管理</a></li>
                <li><a href="/user/logout.action">账户管理</a></li>
                <li><a href="/user/logout.action">消息系统</a></li>
                <li><a href="/user/logout.action">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>班级管理页面</span>
        </div>


        <c:if test="${list.size() ne 0}">

            <!--用户-->
            <h2 align="center">未缴清水电费</h2>

            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                        <%--                    <th width="10%">编号</th>--%>
                        <%--                    <th width="20%">班级</th>--%>
                        <%--                    <th width="20%">班主任</th>--%>
                        <%--                    <th width="20%">开班时间</th>--%>
                        <%--                    <th width="30%">操作</th>--%>
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
            <p>
                    <%--        当前${pageInfo.pageNum}/${pageInfo.pages}&nbsp;--%>
                    <%--        <a href="list?pageNum=1&name=${bbh.name}&teacher=${bbh.teacher}">首页</a>--%>
                    <%--        <c:if test="${pageInfo.hasPreviousPage}">--%>
                    <%--            <a href="list?pageNum=${pageInfo.pageNum-1}&name=${bbh.name}&teacher=${bbh.teacher}">上一页</a>--%>
                    <%--        </c:if>--%>
                <a href="toFindStudentList" style="font-size: larger;">查看缴费记录</a>

                <a href="jiaofei">跳转缴费页面</a>
            </p>
        </c:if>


        <c:if test="${list.size() eq 0}">

            <h2 align="center">已缴清水电费</h2>
            <a href="toFindStudentList" style="font-size: larger;">查看缴费记录</a>
        </c:if>


    </div>

</section>


<footer class="footer">
    版权归北大青鸟
</footer>

</body>
</html>
