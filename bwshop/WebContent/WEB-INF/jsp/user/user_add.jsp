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
	function useradd() {
		$.post('<%=path%>/useradd.do',$('#form').serialize(),function(data){
			if(data>0){
				oClick('userlist.do');
				closeWin('添加');
			}
		});
	}
</script>
</head>
<body>
	<form id="form">
	<table class="table table-bordered">
		<tr>
			<td>用户名<input type="text" id="uname" name="uname"></td>
		</tr>
		<tr>
			<td>密码<input type="text" id="upwd" name="upwd"></td>
		</tr>
		<tr>
			<td>性别<input type="text" id="upwd" name="usex"></td>
		</tr>
		<tr>
			<td><input type="button" class="btn btn-default" value="添加" onclick="useradd()">
			
			&nbsp;<button class="btn btn-default" onclick="closeWin('添加用户')">关闭</button></td>
		</tr>
	</table>
	</form>
</body>
</html>