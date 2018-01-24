<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
</head>
<body>
   <div><button class="btn btn-danger" onclick="addAddress()">新添地址</button></div>
   <table class="table table-bordered">
     <tr class="active" >
       <td>编号</td>
       <td>姓名</td>
       <td>电话</td>
       <td>省</td>
       <td>市</td>
       <td>区/县</td>
       <td>地址</td>
       <td>邮编</td>
       <td>操作</td>
     </tr>
    <c:forEach items="${list}" var="u">
       <tr>
       <td>${u.id}</td>
       <td>${u.receiver_name}</td>
       <td>${u.receiver_phone}</td>
       <td>${u.receiver_state}</td>
       <td>${u.receiver_city}</td>
       <td>${u.receiver_district}</td>
       <td>${u.receiver_address}</td>
       <td>${u.receiver_zip}</td>
       <td>
        <c:if test="${u.status==0}">
           <input type="button" class="btn btn-default" onclick="setDefault('${u.id}')" value="设置默认">
        </c:if>
        <c:if test="${u.status==1}">
           <input type="button" class="btn btn-info" value="默认地址">
        </c:if>
       </td>
     </tr>
    </c:forEach>
   </table>
</body>
<script type="text/javascript">

   //设置地址为默认
   function setDefault(id){
	   $.post('<%=path%>/editaddressdefault.do',{id:id},function(data){
		   if(data>0){
			   layer.msg("操作成功！");
	 		   location='<%=path%>/toorderdetail.do';
		   }
	   });
   }
   function addAddress() {
	location.href="<%=path%>/toaddusersaddress.do";
}


</script>
</html>