<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 方徽
  Date: 2019/7/8
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <style>
        body {
            text-align: center;
            background: lightgray;
        }


        table {
            background: orange;
        }

        div {
            margin: 0px;
            padding: 20px;
        }

        body {
            width: 90%;
            height: 200px;
        }
    </style>

</head>

<body>

<div>
    <form action="toFindElse" name="formname" method="post">
        <div>
            <%--            <input type="date" name="startDay" value="">—--%>
            <%--            <input type="date" name="endDay" value="">--%>

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
            <button type="submit">查询</button>

        </div>

        <table id="111" align="center" wdith="90%" border="1" cellpadding="10" cellspacing="0">
            <tr>
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
</body>

</html>