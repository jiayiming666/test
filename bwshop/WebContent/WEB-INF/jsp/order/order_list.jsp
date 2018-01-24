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
function reduce(price,num){
    var n=$("#gnum"+num).val();
    var sm=0;
    if(n>1){
    	n=parseInt(n)-1;
    	//数量相减
    	$("#gnum"+num).val(n);
    	//金额重算
    	$("#total"+num).val(price*n);
    	//实付金额重算
    	$("input.gt").map(function(){
    		sm=sm+parseInt($(this).val());
    	});
    	//重新赋值
    	$("#sum").val(sm);
    }
};
//数量的减
function add(price,num){
var n=$("#gnum"+num).val();
var sm=0;
	n=parseInt(n)+1;
	$("#gnum"+num).val(n);
	//金额重算
	$("#total"+num).val(price*n);
	//实付金额重算
	$("input.gt").map(function(){
		sm=sm+parseInt($(this).val());
	});
	//重新赋值
	$("#sum").val(sm);
};
//加载省级目录
var state2= $("#stateh").val();
$.post('<%=path%>/listdistrict.do','',function(data){
   for (var i in data) {
	  if(state2==data[i].id){
		  $("#state2").append("<option value='"+data[i].id+"' selected='true'>"+data[i].name+"</option>");
	  }else{
		  $("#state2").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
	  }
	 
   }
})
showcity(state2);
var city2= $("#cityh").val();
//加载市级目录
function showcity(upid){
  $("#city2").empty();
  $("#dist2").empty();
  $.ajax({
	  url:'<%=path%>/listdistrict.do',
	  data:{upid:upid},
	  type:'post',
	  dataType:'json',
	  success:function(data){
		   for (var i in data) {
				  if(city2==data[i].id){
					  $("#city2").append("<option value='"+data[i].id+"' selected='selected'>"+data[i].name+"</option>");
				  }else{
					  $("#city2").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
				  }
			}
	  }
  });

}
//加载区县级目录
var dist2=$("#disth").val();
showdist(city2);
function showdist(upid){
 $.post('<%=path%>/listdistrict.do',{upid:upid},function(data){
	   $("#dist2").empty();
	   for (var i in data) {
		  if(dist2==data[i].id){
			  $("#dist2").append("<option value='"+data[i].id+"' selected='true'>"+data[i].name+"</option>");
		  }else{
			  $("#dist2").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
		  }
		  
	   }
   });
}


//修改地址
function editAddress(){
	location.href="<%=path%>/listusersaddress.do";
}
//ajax提交表单
function suborder() {
	$("#orderfrm").ajaxSubmit(function(msg) {
		 if(msg>0){
			  layer.msg("操作成功！");
			  location='<%=path%>/finish.do';
		 }
	});
}

</script>
</head>
<body>
<div><h1><font color="red">订单明细</font></h1></div>
<div align="right">
   <input class="btn btn-warning" type="button" onclick="editAddress();" value="修改地址">
</div>
	<form id="orderfrm" action="<%=path%>/addorderdetail.do" method="post">
	<div class="row">
        <div class="col-xs-12">
                                    收件人：<input class="form-control" type="text" name="orderShipping.receiver_name" value="${ad.receiver_name}">
        </div>
         <div class="col-xs-12">      
                                    联系方式：<input class="form-control" type="text" name="orderShipping.receiver_phone" value="${ad.receiver_phone}">
         </div>
         <div class="col-xs-4">       
                                    省：<select type="text"  class="form-control" placeholder=".col-xs-3" id="state2" name="orderShipping.receiver_state" onchange="showcity(value)" ></select>&nbsp;
               <input type="hidden" id="stateh" value="${ad.receiver_state}">
         </div>
         <div class="col-xs-4">      
                                     市：<select type="text"  class="form-control" placeholder=".col-xs-3" id="city2" name="orderShipping.receiver_city" onchange="showdist(value)"></select>&nbsp;
               <input type="hidden" id="cityh" value="${ad.receiver_city}">
         </div>
         <div class="col-xs-4">                  
                                      区/县：<select type="text" class="form-control" placeholder=".col-xs-3" id="dist2" name="orderShipping.receiver_district"></select>
               <input type="hidden" id="disth" value="${ad.receiver_district}" >
         </div> 
         <div class="col-xs-12">                     
                                     邮编：<input class="form-control" type="text" name="orderShipping.receiver_zip" value="${ad.receiver_zip}">
         </div> 
         <div class="col-xs-12">                     
                                     详细地址：<textarea class="form-control" name="orderShipping.receiver_address" rows="3" cols="30" >${ad.receiver_address}</textarea>
         </div> 
   </div>
	<!--商品信息-->
   <table class="table table-bordered">
     <tr class="active" >
       <td>商品编号</td>
       <td>商品名称</td>
       <td>商品价格</td>
       <td>商品图片</td>
       <td>数量</td>
       <td>总价</td>
     </tr>
    <c:forEach items="${list}" var="g" varStatus="goods">
     <c:set var="t" value="${t+g.gtotal}"></c:set>
       <tr>
       <td><input name="orderItemList[${goods.index}].goods_id" value="${g.gid}"></td>
       <td><input name="orderItemList[${goods.index}].gname"  value="${g.gname}"></td>
       <td><input name="orderItemList[${goods.index}].price" value="${g.gprice}"></td>
       <td>
          <img  alt="暂无图片" src="<%=path%>/${g.gurl}" width="50px;" height="30px;">
          <input type="hidden" name="orderItemList[${goods.index}].gurl" value="${g.gurl}">
       </td>
       <td>
	       <div>
				<a id="reduce" href="javascript://" data-param="0" onclick="reduce('${g.gprice}','${g.gid}')">-</a>
				   <input size="10px"  id="gnum${g.gid}" name="orderItemList[${goods.index}].gnum" type="text" value="${g.gnum}" >
				<a id="add" href="javascript://" data-param="0" onclick="add('${g.gprice}','${g.gid}')">+</a>
		   </div>
       </td>
       <td><input class="gt"  id="total${g.gid}" name="orderItemList[${goods.index}].total" value="${g.gtotal}"></td>
     </tr>
    </c:forEach>
   </table>
   <div align="right"><h1><font color="red">实付金额：￥<input id="sum" name="payment" size="10px" value="${t}"></input></font></h1></div>
   <div>
      <label class="form-control">物流信息</label>
      <input type="text" class="form-control" name="shipping_name" value="八维物流">
      <input type="hidden" name="shipping_code" value="99999">
   </div>
   <div>
    <label class="form-control">支付方式</label>
     <!-- <input type="text" class="form-control" name="" value="货到付款">
     <input type="hidden" class="form-control" name="payment_type" value="0">
     -->
     <select class="form-control" id="payment_type" name="payment_type">
     	<option value="0">货到付款</option>
     	<option value="1">微信付款</option>
     	<option value="2">支付宝付款</option>
     	<option value="3">银行卡付款</option>
     </select>
   </div>
   <div align="right">
      <input onclick="suborder()" type="button" class="btn btn-danger" id="btn" value="提交订单">
   </div>
	</form>
</body>
</html>