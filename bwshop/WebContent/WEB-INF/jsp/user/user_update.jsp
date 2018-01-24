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
	function userupdate() {
		$.post('<%=path%>/userupdate.do',$('#form').serialize(),function(data){
			if(data>0){
				oClick('userlist.do');
				closeWin();
			}
		});
	}
	function cl() {
		oClick('userlist.do');
		closeWin('分配角色');
	}
</script>
</head>
<body>
	<form id="form">
		<input type="hidden" value="${u.uid }" id="uid" name="uid">
	<table class="table table-bordered">
		<tr>
			<td>用户名<input type="text" id="uname" name="uname" value="${u.uname}"></td>
		</tr>
		<tr>
			<td>密码<input type="text" id="upwd" name="upwd" value="${u.upwd}"></td>
		</tr>
		<tr>
			<td>性别<input type="text" id="usex" name="usex" value="${u.usex}"></td>
		</tr>
		<tr>
			<td><input type="button" class="btn btn-default" value="修改" onclick="userupdate()">
			&nbsp;<button class="btn btn-default" onclick="cl()">关闭</button></td>
		</tr>
	</table>
	</form>
</body>
</html>