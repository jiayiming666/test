<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path=request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
	<table class="table table-bordered">
		<tr  class="active" >
			<td>编号</td>
			<td>用户名</td>
			<td>密码</td>
			<td>性别</td>
			<td>角色</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${list }" var="a">
			<tr>
				<td>${a.uid }</td>
				<td>${a.uname }</td>
				<td>${a.upwd }</td>
				<td>${a.usex }</td>
				<td>${a.rname }</td>
				<td><button onclick="openWin('updateRoles.do?uid='+${a.uid},'分配角色')">分配角色</button></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>