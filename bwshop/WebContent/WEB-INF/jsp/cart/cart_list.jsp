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
<link rel="stylesheet" href="<%=path%>/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="<%=path%>/zTree/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/bootstrap/js/jquery-form.js"></script>
<script type="text/javascript" src="<%=path%>/layer/layer.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
function reduce(num,gprice){
	var ms = 0;
	var n = $("#gnum"+num).val();
	if(n>1){
		n = parseInt(n)-1;
		$("#gnum"+num).val(n);
		$("#gtotal"+num).val(n*gprice);
		$("input.gt").map(function() {
			ms = ms+parseInt($(this).val());
		})
		$("#sum").val(ms);
	}
};

function add(num,gprice){
	var ms = 0;
	var n = $("#gnum"+num).val();
	n = parseInt(n)+1;
	$("#gnum"+num).val(n)
	$("#gtotal"+num).val(n*gprice);
	$("input.gt").map(function() {
		ms = ms+parseInt($(this).val());
	})
	$("#sum").val(ms);
};
function addCart(gid,gnum) {
	$.ajax({
		url:"<%=path%>/addshopcart.do",
		data:{gid:gid,gnum:gnum},
		dataType:"json",
		type:"post",
		success:function(data){
			if(data>0){
				layer.msg("已加入购物车");
			}else {
				layer.msg("添加失败");
			}
		}
	});
}
function toorderdetail() {
	location.href="<%=path%>/toorderdetail.do";
}
</script>
</head>
<body>
	<table class="table table-bordered">
		<tr  class="active" >
			<td>商品编号</td>
			<td>商品名称</td>
			<td>商品价格</td>
			<td>上架时间</td>
			<td>商品数量</td>
			<td>商品图片</td>
			<td>商品类型</td>
			<td>商品价格</td>
		</tr>
		<c:forEach items="${list }" var="a">
		 <c:set var="t" value="${t+a.gtotal}"></c:set>
			<tr>
				<td>${a.gid }</td>
				<td>${a.gname }</td>
				<td>${a.gprice }</td>
				<td>${a.gtime }</td>
				<td><%-- <select id="gnum" name="gnum">
	           		 <c:forEach begin="1" end="100" step="1" var="n">
	             			 <option value="${n}">${n}</option>
	           		 </c:forEach>
	       		</select> --%>
	    			   <div>
	       					<a id="reduce" href="javascript://" onclick="reduce('${a.gid}','${a.gprice }')">-</a>
	       						<input type="text" id="gnum${a.gid }" size="10px" name="gnum" value="${a.gnum }">
	       					<a id="add" href="javascript://" onclick="add('${a.gid}','${a.gprice }')">+</a>
					   </div>                                 
					   </td>
				<td><img alt="暂无图片" src="<%=path %>/${a.gurl}" width="30px;" height="30px;"></td>
				<td>${a.tname }</td>
				<td><input class="gt" id="gtotal${a.gid }" readonly="readonly" value="${a.gtotal }"></td>
			</tr>
		</c:forEach>
		
	</table>
	<div align="right"><h1><font color="red">实付金额：￥<input id="sum" readonly="readonly" size="10px" value="${t}"></input></font></h1></div>
   <div align="right"><button class="btn btn-danger" onclick="toorderdetail()">结算</button></div>
</body>
</html>