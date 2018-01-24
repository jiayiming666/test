<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
  String path=request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
   <h1><font color="red">支付成功</font></h1><br>
   <h3><font color="green">您总共支付：￥${sum}元整</font></h3>
   <h3><font color="green">你的宝贝估计在${day}天后送达，请耐心等待！</font></h3>
   <a href="javascript://" onclick="location='<%=path%>/goodslist.do'">返回</a>
</div>
</body>
</html>