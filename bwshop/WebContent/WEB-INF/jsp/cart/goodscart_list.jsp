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
function reduce(num){
	var n = $("#gnum"+num).val();
	if(n>1){
		n = parseInt(n)-1;
		$("#gnum"+num).val(n);
	}
};

function add(num){
	var n = $("#gnum"+num).val();
	n = parseInt(n)+1;
	$("#gnum"+num).val(n)
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
				oClick("cartdetail.do");
			}else {
				layer.msg("添加失败");
			}
		}
	});
}
function goodscartlist(uid) {
	location.href="<%=path%>/goodscartlist.do?uid="+uid;
}
</script>
</head>
<body>
	<button onclick="goodscartlist(1)">进入购物车</button>
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
				<td>
				<%-- <select id="gnum" name="gnum">
	           		 <c:forEach begin="1" end="100" step="1" var="n">
	             			 <option value="${n}">${n}</option>
	           		 </c:forEach>
	       		</select> --%>
	    			   <div>
	       					<a id="reduce" href="javascript://" onclick="reduce('${a.gid}')">-</a>
	       						<input type="text" id="gnum${a.gid }" size="10px" name="gnum" value="1">
	       					<a id="add" href="javascript://" onclick="add('${a.gid}')">+</a>
					   </div>                                 
					   
      			 </td>
				<td><button class="btn btn-success"  onclick="javascript:addCart('${a.gid }',$('#gnum${a.gid }').val())">添加购物车</button></td>
			</tr>
		</c:forEach>
		 <tr class="active"><td colspan="8">${page}</td></tr>
	</table>
</body>
</html>