<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>添加租户</title>
		    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <!--<link type="text/css" rel="stylesheet" href="css/public.css"/>-->
		<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#name").blur(function() {
					$.ajax({
						type: "GET",
						async: true,
						url: "/checkNameExists",
						data: {
							"name": $(this).val()
						},
						dataType: "json",
						success: function(data) {
							//alert("data:"+JSON.stringify(data));
							if(data.result == "exists") {
								$("#namespan").html('该班级名已存在，请重新输入').css("color", "red");
							} else {
								$("#namespan").html('✔').css("color", "green");
							}
						}
					})
				})
			})
		</script>
		<style type="text/css">
		</style>
	</head>

	<body>
		<form action="/addUser" align="center">
			<h3> 添加租户信息
				</h3>
			<table>
				<tr>
					<td>
						<span> 当前租户：
									</span>
					</td>

				</tr>
				<tr>
					<td class="dd"> 班级：
						<select name="class">
							<for:forEach items=""
							<option value="java26"> java26
							</option>
							<option value="java27"> java27
							</option>
						</select>
						<span id="namespan"> 输入班级
																				</span>
					</td>
				</tr>
				<tr>
					<td class="dd"> 新租户：
						<select name="name">
							<option value="张悦"> 张悦
							</option>
							<option value="姚方辉"> 姚方辉
							</option>

						</select>
						<span id="namespan"> 输入姓名
																																</span>
					</td>
				</tr>

			</table>
			<p align="center">
				<input type="submit" value="提交">
				<input type="button" value="返回" onclick="location.href='/list'">
			</p>

		</form>
	</body>

</html>