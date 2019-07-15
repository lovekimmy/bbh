<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>宿舍编辑</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="../../resources/js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        // $(function () {
        //     $(".addRoom").click(function (){
        //         if (confirm("你确定要删除吗？")) {
        //             var $tr = $(this).parent().parent();
        //             var id = $tr.find("td:eq(0)").html();
        //             //alert("userCode:"+userCode)
        //             $.ajax({
        //                 type: "GET",
        //                 async: true,
        //                 url: "/delete",
        //                 data: {"id": id},
        //                 dataType: "json",
        //                 success: function (data) {
        //                     if (data.result == "success") {
        //                         alert("删除成功！")
        //                         $tr.remove();
        //                     } else {
        //                         alert("删除失败！")
        //                     }
        //                 }
        //             })
        //         }
        //     })
        // })
        var i = 1;
        $(function () {
            $("#box").on('click', '.addp', function () {
                //$('#pp').after($("#pp").clone());
                var addP = $(this).parent().clone();
                $(this).parent().after(addP);
                $('#pp a').each(function (i, e) {
                    $(e).text(i + 1);
                })
            });
            $("#box").on("click", '.delp', function () {
                $(this).parent().remove();
                $('#pp a').each(function (i, e) {
                    $(e).text(i + 1);
                })
            })
        });
    </script>
</head>
<body>
<form action="/add" method="post">
    <div align="center">
        <tr>
            <td>宿舍信息：<input type="text" name="number" value="${room.id}"></td>
            &nbsp;

            <td>最大人数：<input type="text" name="size" value="${room.size}"></td>
        </tr>
    </div>

    <div>
        <tr>
            <td>面积：<input type="text" name="name" value="${room.square}"></td>
        </tr>
    </div>
    <div>
        <tr>
            <td>朝向：<input type="text" name="name" id="name" value="${room.face}"></td>
        </tr>
    </div>
    <a href="toAddUser?id=${room.id}"
    <%--<div id="box">--%>
    <%--<p id="pp"><a>1</a><input type="text" name="gx">--%>
    <%--<button class='addp'>+</button>--%>
    <%--<button class='delp'>-</button>--%>
    <%--</p>--%>
    <%--</div>--%>
    <a href="javascript:void(0);" class="addRoom">提交</a>
    <%--<input type="submit" value="提交">--%>
</form>
</body>
</html>