<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title></title>
  <link rel="stylesheet" href="${path}/plugins/layui/css/layui.css" media="all">
</head>
<body>
<div class="layui-btn-group">
  <button type="button" class="layui-btn layui-btn-sm" id="add-btn">
    <i class="layui-icon">&#xe654;</i>
  </button>
  <button type="button" class="layui-btn layui-btn-sm" id="update-btn">
    <i class="layui-icon">&#xe642;</i>
  </button>
  <button type="button" class="layui-btn layui-btn-sm" id="del-btn">
    <i class="layui-icon">&#xe640;</i>
  </button>
  <button type="button" class="layui-btn layui-btn-sm" id="check-btn">
    <i class="layui-icon">&#xe609;</i>送审
  </button>
</div>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs layui-btn-radius "  lay-event="show">详细信息</a>
</script>
 
<table id="demo" lay-filter="test"></table>
 <script type="text/html" id="info-user-form" >
<form class="layui-form" action=""  lay-filter="form-info">
 <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">车牌号</label>
      <div class="layui-input-inline">
		
        <input type="text" name="carId" disabled="disabled"  class="layui-input">
      </div>
	</div>
	<div class="layui-inline">
    	<label class="layui-form-label">司机姓名</label>
    	<div class="layui-input-inline">
    		<input type="text" name="driver" disabled="disabled"  class="layui-input">
		</div>
  	</div>
    <div class="layui-inline">
      <label class="layui-form-label">奖励标准</label>
      <div class="layui-input-inline">
       <input type="text" name="why" disabled="disabled"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">上报人</label>
      <div class="layui-input-inline">
        <input type="text" name="who_send" disabled="disabled"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">所报公司</label>
      <div class="layui-input-inline">
        <input type="text" name="shortName" disabled="disabled"  class="layui-input">
      </div>
    </div>
 <div class="layui-inline">
      <label class="layui-form-label">上报时间</label>
      <div class="layui-input-inline">
         <input type="text" name="sendTime" disabled="disabled"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">状态</label>
      <div class="layui-input-inline">
         <input type="text" name="isType" disabled="disabled"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">审核人</label>
      <div class="layui-input-inline">
         <input type="text" name="who_check" disabled="disabled"  class="layui-input">
      </div>
    </div>
    
    <div class="layui-inline">
      <label class="layui-form-label">审核时间</label>
      <div class="layui-input-inline">
         <input type="text" name="successTime" disabled="disabled"  class="layui-input">
      </div>
    </div>
  <div class="layui-inline">
      <label class="layui-form-label">审核意见</label>
      <div class="layui-input-inline">
        <input type="text" name="suggestion" disabled="disabled"  class="layui-input">
      </div>
   </div>
 </div>
</form>
</script>


<script type="text/html" id="add-car-form" >
<form class="layui-form" action="" id="add-form" lay-filter="add-form">
 <div class="layui-form-item">
<input type="hidden" name="id">
     <div class="layui-inline">
      <label class="layui-form-label">选择车牌号</label>
      <div class="layui-input-inline">
         <select name="carId"  id="select1" lay-verify="required">
        </select>
      </div>
    </div>
   </div>
<div class="layui-form-item">
     <div class="layui-inline">
      <label class="layui-form-label">选择奖励原因</label>
      <div class="layui-input-inline">
         <select name="why"  id="select" lay-verify="required">
        </select>
      </div>
    </div>
 </div>

 <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn layui-btn-radius" lay-submit lay-filter="formbtn">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-radius layui-btn-warm">重置</button>
    </div>
  </div>

</form>
</script>

<script src="${path}/plugins/layui/layui.all.js"></script>
<script>

	var table = layui.table;
	var layer=layui.layer;
	var $ = layui.$;
	var form=layui.form;
	var laydate = layui.laydate;
	var index;
  
  //第一个实例
  table.render({
    elem: '#demo'
    ,url: '${path}/encourage/getAllEncourageList' //数据接口
    ,page: true //开启分页
    ,limit:8
    ,limits:[8,16,24,32,40]
    ,title:'奖励登记'
    ,cols: [[ //表头
      {field: 'id', 'checkbox':true,align:'center', fixed: 'left'}
      ,{field: 'carId', title: '车牌号', width:'15%',align:'center'}
      ,{field: 'driver', title: '司机姓名', width:'15%',align:'center'}
      ,{field: 'why', title: '奖励标准', width:'28.5%',align:'center'} 
      ,{field: 'shortName', title: '所属公司', width:'15%',align:'center'}
      ,{field: 'isType', title: '状态', width:'15%',align:'center',templet:function(data){
    	  if(data.isType==1){
			  return "已审核";
		  }else{
			  if(data.isSend == 0)
			      return "未审核";
			  else
				  return "待审核";
		  }
      }}
      ,{field:'',title: '查看详细',width:'8%', toolbar: '#barDemo',align:'center'}
      ]]
  });
  
  table.on('tool(test)', function(obj){
	    var data = obj.data;
	    index=layer.open({
			  type: 1,
			  content: $('#info-user-form').html(),
			  area: ['700px', '320px'],
			  title:'用户奖励信息',
			  offset:'100px'
			});
	    form.val("form-info", {
			 "driver":data.driver 
			 ,"carId":data.carId
			 ,"why":data.scription
			 ,"who_send":data.who_send
			 ,"shortName":data.shortName
			 ,"sendTime":function(){
				  return updateDateTime(data.sendTime);
			  }
			 ,"isType":function(){
				  if(data.isType==1){
					  return "审核已通过";
				  }else{
					  if(data.isSend == 1){
						  return "已送审，但暂无人员审核";
					  }else{
						  return "还未送审，请提交审核";
					  }
				  }
			  }
			  ,"who_check":function(){
				  if(data.who_check == null){
					  return "暂无人员审核"
				  }else{
					  return data.who_check
				  }
			  }
			  ,"suggestion":function(){
				  if(data.isType==1){
					  return "审核已通过";
				  }else{
					  if(data.isSend == 1){
						  return "已送审，但暂无人员审核";
					  }else{
						  return "还未送审，请提交审核";
					  }
				  }
			  }
			  ,"successTime":function(){
				  return updateDateTime(data.successTime);
			  }
			})
	  });
1
	//新增
	$("#add-btn").click(function() {
		index=layer.open({
			title:['新增司机信息', 'font-size:18px;'],

			type:1,
			resize:false,
			content:$("#add-car-form").html(),
			 offset: '100px'
			});
		
		$.post('${path}/encourage/getAllCarInfo',function(data){
			  
			  var str="<option value=''>请选择车牌号</option>";
			  for (var i = 0; i < data.length; i++) {
				str+="<option value='"+data[i].id+"'>"+data[i].carId+"</option>";
			  }
			  $("#select1").html(str);
			  form.render("select"); 
		  });
		
		$.post('${path}/encourage/getAllEncourageInfo',function(data){
			  
			  var str="<option value=''>请选择奖励原因</option>";
			  for (var i = 0; i < data.length; i++) {
				str+="<option value='"+data[i].id+"'>"+data[i].name+"</option>";
			  }
			  $("#select").html(str);
			  form.render("select"); 
		  });
		
		form.on('submit(formbtn)', function(data){
			  $.post("${path}/encourage/editencourage",$("#add-form").serialize(),function(data){
					if(data==0){
						layer.msg('操作成功', {icon: 1,offset:'150ox'}); 
						layer.close(index);
						table.reload("demo");
					}else{
						layer.msg('操作失败', {icon: 2,offset:'150ox'});
					}
				});
		  
		  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		});
		  
		form.render();
	});
  
//修改
$("#update-btn").click(function() {
	var checkStatus = table.checkStatus("demo");
	var data = checkStatus.data;
	if(data.length==0){
		layer.msg('请至少选中一条要修改的数据！',{icon: 2,offset: '150px'});
	}else if(data.length>1){
		layer.msg('只能选中一条要修改的数据！',{icon: 2,offset: '150px'});
	}else{
		if(data[0].isType == 1){
			layer.msg('不能修改已审核成功的数据！',{icon:2,offset:'150px'})
		}else{
			index=layer.open({
				title:['编辑司机奖励信息', 'font-size:18px;'],
				type:1,
				resize:false,
				content:$("#add-car-form").html(),
				 offset: '100px'
				});
			
			$.post("${path}/encourage/getEncourageInfoById",{id:data[0].id},function(data){
				
				form.val("add-form",{
					"id":data.id
				})
				});
			
				 $.post("${path}/encourage/getEncourageInfoById",{id:data[0].id},function(data){
					  var str="<option value=''>请选择车牌号</option>";
					  for (var i = 0; i < data.carlist.length; i++) {
						str+="<option value='"+data.carlist[i].id+"'";
						if(data.carId == data.carlist[i].id){
							str += "selected";
						}
						str += ">"+data.carlist[i].carId+"</option>"
					}
					  $("#select1").html(str);
					  form.render("select"); 
				 });
				 
				 $.post("${path}/encourage/getEncourageInfoById",{id:data[0].id},function(data){
					  var str="<option value=''>请选择奖励原因</option>";
					  for (var i = 0; i < data.encouragelist.length; i++) {
						str+="<option value='"+data.encouragelist[i].id+"'";
						if(data.why == data.encouragelist[i].id){
							str += "selected";
						}
						str += ">"+data.encouragelist[i].name+"</option>"
					}
					  $("#select").html(str);
					  form.render("select"); 
				 });
				 
			form.on('submit(formbtn)',function(data){
						  $.post("${path}/encourage/editencourage",$("#add-form").serialize(),function(data){
								if(data==0){
									layer.msg('操作成功', {icon: 1,offset:'150ox'}); 
									layer.close(index);
									table.reload("demo");
								}else{
									layer.msg('操作失败', {icon: 2,offset:'150ox'});
								}
							});
					  
					  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
					});
			form.render();
		}
	}
	
});

//送审
$("#check-btn").click(function(){
	var checkStatus = table.checkStatus('demo');
	var data = checkStatus.data;
	var res="";
	if(checkStatus.data.length==0){
		layer.msg("请至少选中一条要送审的数据！",{icon: 2,offset: '150px'});
	}else{
		for (var i = 0; i < data.length; i++) {
			res+=data[i].id+",";
		}
		layer.confirm('是否确认送审所选中的信息?', {icon: 3, title:'提示',offset: '150px'}, function(index){
			$.post("${path}/encourage/sendEncourage",{"res":res},function(data){
				if(data==0){
			    	  layer.msg('送审成功！',{icon: 1,offset: '150px'});
			    	  layer.close(index); //再执行关闭  
			    	  table.reload("demo");
			      }else{
			    	  layer.msg('送审失败！',{icon: 2,offset: '150px'});
			      }
			});
			  
			  layer.close(index);
			});
	}
});


	//删除
	$("#del-btn").click(function(){
		var checkStatus = table.checkStatus('demo');
		var data = checkStatus.data;
		var res="";
		if(checkStatus.data.length==0){
			layer.msg("请至少选中一条要删除的数据！",{icon: 2,offset: '150px'});
		}else{
			for (var i = 0; i < data.length; i++) {
				if(data[i].isType == 1){
					layer.msg('不能删除已审核的数据，请仔细核查',{icon:2,offset:'150px'});
					return;
				}
				res+=data[i].id+",";
			}
			layer.confirm('是否确认删除所选中的信息?', {icon: 3, title:'提示',offset: '150px'}, function(index){
				$.post("${path}/encourage/deleteEncourageById",{"res":res},function(data){
					if(data==0){
				    	  layer.msg('删除成功！',{icon: 1,offset: '150px'});
				    	  layer.close(index); //再执行关闭  
				    	  table.reload("demo");
				      }else{
				    	  layer.msg('删除失败！',{icon: 2,offset: '150px'});
				      }
				});
				  
				  layer.close(index);
				});
		}
	}); 
	
	
	function updateDateTime(data){
	  var time = data;
	  var first = time.split(/[, ,]/); 
	  var year = first[3];
	  var Time = first[4].split(":");
	  var hour = Time[0];
	  var min = Time[1];
	  var sec = Time[2];
	  if(parseInt(hour) < 10){
		  hour = "0"+hour;
	  }
	  if(first[5] == "PM" && hour != "12")
	  {
		  hour = parseInt(hour)+12;
	  }
			
	  var month = first[0]
	  var date = first[1]
	  if(date.length == 1){
		  date = '0'+date;
	  }					  
	  if(month == "Jan"){
	      month = "01";
	  }else if(month == "Feb"){
		  month = "02";
	  }else if(month == "Mar"){
		  month = "03";
	  }else if(month == "Apr"){
		  month = "04";
	  }else if(month == "May"){
		  month = "05";
	  }else if(month == "Jun"){
		  month = "06";
	  }else if(month == "Jul"){
		  month = "07";
	  }else if(month == "Aug"){
	      month = "08";
	  }else if(month == "Sep"){
	      month = "09";
	  }else if(month == "Oct"){
		  month = 10;
	  }else if(month == "Nov"){
	      month = 11;
	  }else if(month == "Dec"){
		  month = 12;
	  }
	  return year+'-'+month+'-'+date+" "+hour+":"+min+":"+sec;
}
</script>
</body>
</html>