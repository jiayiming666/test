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
$("#edit").click(function(){
	$("#form").ajaxSubmit(function(msg) {
		 if(msg>0){
			  layer.msg("操作成功！");
			  closeWin();
			  oClick("goodslist.do");
		 }
	});
});
</script>
</head>
<body>
	<form id="form" class="form-horizontal" action="./goodsupdate.do" 
	enctype="multipart/form-data" method="post">
		<div class="form-group">
           <label class="col-sm-2 control-label">商品名称：</label>
	       <div class="col-sm-8">
	       <input type="hidden" class="form-control" name="gid" value="${a.gid}">
	          <input type="text" class="form-control" name="gname" value="${a.gname}">
	       </div>
      </div>
      <div class="form-group">
	       <label class="col-sm-2 control-label">商品价格：</label>
	       <div class="col-sm-8">
	          <input type="text" class="form-control"  name="gprice" value="${a.gprice}">
	       </div>
       </div>
		<div class="form-group">
           <label class="col-sm-2 control-label">商品数量：</label>
	       <div class="col-sm-8">
	           <input type="text" class="form-control" name="gnum" value="${a.gnum}">
	       </div>
       </div>
       <div class="form-group">
            <label class="col-sm-2 control-label">商品类型：</label>
	        <div class="col-sm-8">
	          <input id="tname" type="text" class="form-control" name="tname"  value="${a.tname}" onclick="openWin('goodstype.do','商品类型','300px','500px')">
	          <input id="tid" type="hidden" class="form-control" name="tid" value="${a.tid}">
	       </div>
      </div>
      <div class="form-group">
           <label class="col-sm-2 control-label">商品图片：</label>
           <div class="col-sm-8">
            <input type="file"  name="file">
            </div>
      </div>
      <div class="form-group">
           <img alt="暂无图片" src="<%=path%>/${a.gurl}" width="100px;" height="50px;">
       </div> 
       <div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-4">
				<input id="edit" class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;"/>
				<input class="btn btn-success radius" type="button" value="&nbsp;&nbsp;关闭&nbsp;&nbsp;" onclick="closeWin()" />
			</div>
		</div>
	</form>
</body>
</html>