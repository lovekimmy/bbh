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


        <form action="toFindElse" name="formname" method="post">
            <div class="search">

                <input type="date" name="startDay"
                       value="<fmt:formatDate value="${condition.startDay}" pattern="yyyy-MM-dd"/>"/>--

                <input type="date" name="endDay"
                       value="<fmt:formatDate value="${condition.endDay}" pattern="yyyy-MM-dd"/>"/>

                <select name="roomid">
                    <option value="">全部宿舍</option>
                    <c:forEach items="${roomlist}" var="rooms">
                        <option value="${rooms.id}"
                                <c:if test="${condition.roomid eq rooms.id}">selected="selected"</c:if>>${rooms.room}</option>
                    </c:forEach>
                </select>
                <select name="classid">
                    <option value="">全部班级</option>
                    <c:forEach items="${classlist}" var="cl">
                        <option value="${cl.id}"
                                <c:if test="${condition.classid eq cl.id}">selected="selected"</c:if>>${cl.classname}</option>
                    </c:forEach>
                </select>

                <select name="payId">

                    <option value="">缴费状态</option>
                    <c:if test="${condition!=null}">
                        <option value="1" <c:if test="${condition.payId eq 1}">selected="selected"</c:if>>已缴</option>
                        <option value="2" <c:if test="${condition.payId eq 2}">selected="selected"</c:if>>未缴</option>
                    </c:if>

                </select>

                <input type="submit" value="查询" id="searchUser" style="width: 100px;height:35px "/>

            </div>

            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th></th>
                    <th>姓名</th>
                    <th>宿舍号</th>
                    <th>班级</th>
                    <th>抄表日期</th>
                    <th>缴费状态</th>
                    <th>确认缴费</th>
                </tr>


                <div class="th">
                    <c:forEach items="${pageInfo.list}" var="l">
                        <tr>
                            <th><input type="checkbox" value=" Don't push me"/></th>
                            <th>${l.realname}</th>
                            <th>${l.room.room}</th>
                            <th>${l.userclass.classname}</th>
                            <th><fmt:formatDate value="${l.roomMoney.readingDay}" pattern="yyyy-MM-dd"/></th>
                            <th>${l.payId eq 1?"已缴":"未缴"}</th>
                            <th>
                                <button onclick="">确认</button>
                            </th>
                        </tr>
                    </c:forEach>
                </div>

            </table>


            <h3>第${pageInfo.pageNum}/总${pageInfo.pages}页</h3><a
                href="javascript:formname.action='toFindElse?pageNum=1';formname.submit()">首页 </a>

            <c:if test="${pageInfo.hasPreviousPage}">
                <a href="javascript:formname.action='toFindElse?pageNum=${pageInfo.pageNum-1}';formname.submit()">上一页 </a>
            </c:if>
            <c:if test="${pageInfo.hasNextPage}">
                <a href="javascript:formname.action='toFindElse?pageNum=${pageInfo.pageNum+1}';formname.submit()">下一页 </a>
            </c:if>
            <a href="javascript:formname.action='toFindElse?pageNum=${pageInfo.pages}';formname.submit()">末页</a>

            <button type="submit">一键催缴</button>


        </form>

    </div>

</section>

<!--点击删除按钮后弹出的页面-->
<%--<div class="zhezhao"></div>--%>
<%--<div class="remove" id="removeUse">--%>
<%--    <div class="removerChid">--%>
<%--        <h2>提示</h2>--%>
<%--        <div class="removeMain">--%>
<%--            <p>你确定要删除该用户吗？</p>--%>
<%--            <a href="#" id="yes">确定</a>--%>
<%--            <a href="#" id="no">取消</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<footer class="footer">
    版权归北大青鸟
</footer>

<%--<script src="js/jquery.js"></script>--%>
<%--<script src="js/user.js"></script>--%>
<%--<script src="js/time.js"></script>--%>

</body>
</html>
