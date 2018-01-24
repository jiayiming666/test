<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
  String path=request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=path%>/bootstrap/css/bootstrap.min.css">
<link href="<%=path%>/zTree/css/style.css" rel="stylesheet">
<link href="<%=path%>/zTree/css/zTreeStyle.css" rel="stylesheet"  type="text/css">
<script type="text/javascript" src="<%=path%>/zTree/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/zTree/js/jquery.ztree.all-3.3.js"></script>
<script type="text/javascript" src="<%=path%>/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/layer/my.js"></script>
<script type="text/javascript" src="<%=path%>/bootstrap/js/jquery-form.js"></script>
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="row">
		<div class="col-md-12" align="center" style="background-color: blue;height: 100px"><h1>八维超市管理平台</h1></div>
	</div>
	<div class="row">
		<div class="col-md-2">
			<ul id="tree" class="ztree"></ul>
		</div>
		<div class="col-md-10">
			<div id="content"></div>
		</div>
	</div>
</body>
</html>