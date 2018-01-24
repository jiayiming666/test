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
	function deluser(uid) {
		$.ajax({
			url:'<%=path%>/deluser.do',
			data:{uid:uid},
			dataType:'json',
			type:'post',
			success:function(obj){
				if(obj>0){
					layer.msg("删除成功");
					oClick('userlist.do');
				}else{
					layer.msg("删除失败")
				}	
			}
		});
	}
</script>
</head>
<body>
	<button onclick="openWin('adduser.do','添加用户')">添加用户</button>
	<table class="table table-bordered">
		<tr  class="active" >
			<td>编号</td>
			<td>用户名</td>
			<td>密码</td>
			<td>性别</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${list }" var="a">
			<tr>
				<td>${a.uid }</td>
				<td>${a.uname }</td>
				<td>${a.upwd }</td>
				<td>${a.usex }</td>
				<td><button onclick="openWin('updateuser.do?uid='+${a.uid},'修改用户信息')">修改</button></td>
				<td><input type="button" value="删除" onclick="deluser(${a.uid })"></td>
			</tr>
		</c:forEach>
		 <tr class="active"><td colspan="8">${page}</td></tr>
	</table>
</body>
</html>