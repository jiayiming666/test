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
function delgoods(gid) {
	$.ajax({
		url:'<%=path%>/delgoods.do',
		data:{gid:gid},
		dataType:'json',
		type:'post',
		success:function(obj){
			if(obj>0){
				layer.msg("删除成功")
				oClick('goodslist.do');
			}else{
				layer.msg("删除失败")
			}	
		}
	});
}
</script>
</head>
<body>
	<button onclick="openWin('addgoods.do','添加用户','500px','350px')">添加用户</button>
	<table class="table table-bordered">
		<tr  class="active" >
			<td>商品编号</td>
			<td>商品名称</td>
			<td>商品价格</td>
			<td>上架时间</td>
			<td>商品数量</td>
			<td>商品图片</td>
			<td>商品类型</td>
		</tr>
		<c:forEach items="${list }" var="a">
			<tr>
				<td>${a.gid }</td>
				<td>${a.gname }</td>
				<td>${a.gprice }</td>
				<td>${a.gtime }</td>
				<td>${a.gnum }</td>
				<td><img alt="暂无图片" src="<%=path %>/${a.gurl}" width="30px;" height="30px;"></td>
				<td>${a.tname }</td>
				<td><button onclick="openWin('updategoods.do?gid='+${a.gid},'修改用户信息','500px','350px')">修改</button></td>
				<td><input type="button" value="删除" onclick="delgoods(${a.gid })"></td>
			</tr>
		</c:forEach>
		 <tr class="active"><td colspan="8">${page}</td></tr>
	</table>
</body>
</html>