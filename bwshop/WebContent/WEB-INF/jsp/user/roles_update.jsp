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
var uid = ${param.uid}
	$(function() {
		$.ajax({
			url:'<%=path%>/toRolesUpdate.do',
			data:{uid:uid},
			dataType:'json',
			type:'post',
			success:function(obj){
				var user = obj.user;
				var roles = obj.roles;
				var rolebyid = obj.rolebyid;
				for(var i in roles){
					$("#rid").append("<input type='checkbox' class='ck' value='"+roles[i].rid+"'>"+roles[i].rname);
				}
				for(var j in rolebyid){
					$(".ck[value='"+rolebyid[j].rid+"']").attr('checked',true);
				}
				$("#uid").val(user.uid);
				$("#uname").val(user.uname);
			}
		});
	})
	function rolesupdate() {
	var sel = $(".ck:checked");
	if(sel.length>0){
		var rids = "";
		sel.map(function() {
			rids += ","+$(this).val();
		});
		rids = rids.substring(1);
	}
	$.ajax({
		url:'<%=path%>/UpdateRolesByUid.do',
		data:{"uid":uid,"rids":rids},
		dataType:'json',
		type:'post',
		success:function(obj){
			if(obj>0){
				alert("修改成功")
				oClick('roleslist.do');
				closeWin('分配角色');
			}
		}
	});
	}
	function cl() {
		oClick('userlist.do');
		closeWin();
	}
</script>
</head>
<body>
	<form id="form">
		<input type="hidden"  id="uid" name="uid">
	<table class="table table-bordered">
		<tr>
			<td>用户名<input type="text" id="uname" name="uname" value="${u.uname}"></td>
		</tr>
		<tr>
			<td id="rid" name="rid"></td>
		</tr>
		<tr>
			<td><input type="button" class="btn btn-default" value="修改" onclick="rolesupdate()">
			&nbsp;<button class="btn btn-default" onclick="cl()">关闭</button></td>
		</tr>
	</table>
	</form>
</body>
</html>