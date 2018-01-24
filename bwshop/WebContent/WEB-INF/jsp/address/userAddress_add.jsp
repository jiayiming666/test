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
<form id="udfrm" action="<%=path%>/addAddress.do" method="post">
   <div class="row">
        <div class="col-xs-12">
                                    收件人：<input class="form-control" type="text" name="receiver_name">
        </div>
         <div class="col-xs-12">      
                                    联系方式：<input class="form-control" type="text" name="receiver_phone">
         </div>
         <div class="col-xs-4">                 
                                    省：<select class="form-control" placeholder=".col-xs-3" id="state1" name="receiver_state" onchange="showcity(value)"><option value="-1">==请选择==</option></select>&nbsp;
         </div>
         <div class="col-xs-4">      
                                     市：<select class="form-control" placeholder=".col-xs-3" id="city1" name="receiver_city" onchange="showdist(value)"></select>&nbsp;
         </div>
         <div class="col-xs-4">                  
                                      区/县：<select class="form-control" placeholder=".col-xs-3" id="dist1" name="receiver_district"></select>
         </div> 
         <div class="col-xs-12">                     
                                     邮编：<input class="form-control" type="text" name="receiver_zip">
         </div> 
         <div class="col-xs-12">                     
                                     详细地址：<textarea class="form-control" name="receiver_address" rows="3" cols="30"></textarea>
         </div> 
   </div>
   <div align="center">
      <input type="button" onclick="save()" class="btn btn-success" value="保存">
      <input type="button" class="btn btn-danger" onclick="closeWin();" value="关闭">
   </div>
</form>
  
</body>
<script type="text/javascript">
 //加载省级目录
 $.post('<%=path%>/listdistrict.do','',function(data){
	   for (var i in data) {
		  $("#state1").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
	   }
   })
 //加载市级目录
 function showcity(upid){
	 $.post('<%=path%>/listdistrict.do',{upid:upid},function(data){
		   $("#city1").empty();
		   $("#dist1").empty();
		   for (var i in data) {
			  $("#city1").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
		   }
	   })
 }
 //加载区县级目录
 function showdist(upid){
	 $.post('<%=path%>/listdistrict.do',{upid:upid},function(data){
		   $("#dist1").empty();
		   for (var i in data) {
			  $("#dist1").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
		   }
	   })
 }
 
//ajax提交表单
function save() {
		 $("#udfrm").ajaxSubmit(function(msg) {
	 		 if(msg>0){
	 			  layer.msg("操作成功！");
	 			  location='<%=path%>/listusersaddress.do';
	 		 }
	 	}); 
}
 	

</script>
</html>