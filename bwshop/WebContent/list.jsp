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
<%-- <script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/util.js'></script>
<script type="text/javascript" src="<%=path%>/dwr/interface/Hello.js"></script> --%>
<script type="text/javascript" src="<%=path%>/bootstrap/js/jquery-2.1.4.min.js"></script> 
<script type="text/javascript">
var c = 5;
var r;
	function timeCount() {
		$("#text").val(c);
		c = c-1;
		r = setTimeout("timeCount()",1000)
		if(c<0){
			clearTimeout(r)
			$("#ms").removeAttr("disabled")
		}
	}
</script>
</head>
<body>
<form>
	<input type="button" value="开始计时" onclick="timeCount()">
	<input type="text" id="text" readonly="readonly">
	<input type="button" value="秒杀" id="ms" disabled="false">
</form>
</body>
</html>