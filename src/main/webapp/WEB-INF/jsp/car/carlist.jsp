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

<script src="${path}/plugins/layui/layui.all.js"></script>
<script type="text/html" id="info-user-form" >
<form class="layui-form" action=""  lay-filter="form-info">
 <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">车辆名称</label>
      <div class="layui-input-inline">
		
        <input type="text" name="name" disabled="disabled"  class="layui-input">
      </div>
	</div>
	<div class="layui-inline">
    	<label class="layui-form-label">车牌号</label>
    	<div class="layui-input-inline">
    		<input type="text" name="carId" disabled="disabled"  class="layui-input">
		</div>
  	</div>
    <div class="layui-inline">
      <label class="layui-form-label">车身颜色</label>
      <div class="layui-input-inline">
       <input type="text" name="color" disabled="disabled"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">车辆型号</label>
      <div class="layui-input-inline">
        <input type="text" name="car_type" disabled="disabled"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">载客人数</label>
      <div class="layui-input-inline">
        <input type="text" name="count_passenger" disabled="disabled"  class="layui-input">
      </div>
    </div>
 <div class="layui-inline">
      <label class="layui-form-label">燃油类型</label>
      <div class="layui-input-inline">
         <input type="text" name="oilType" disabled="disabled"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">发动机编号</label>
      <div class="layui-input-inline">
         <input type="text" name="Engine_num" disabled="disabled"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">出厂日期</label>
      <div class="layui-input-inline">
         <input type="text" name="date_production" disabled="disabled"  class="layui-input">
      </div>
    </div>
    
    <div class="layui-inline">
      <label class="layui-form-label">生产厂商</label>
      <div class="layui-input-inline">
         <input type="text" name="vender" disabled="disabled"  class="layui-input">
      </div>
    </div>
  <div class="layui-inline">
      <label class="layui-form-label">所属车主</label>
      <div class="layui-input-inline">
        <input type="text" name="ownerName" disabled="disabled"  class="layui-input">
      </div>
   </div>

<div class="layui-inline">
      <label class="layui-form-label">驾驶者</label>
      <div class="layui-input-inline">
        <input type="text" name="driverName" disabled="disabled"  class="layui-input">
      </div>
   </div>
<div class="layui-inline">
      <label class="layui-form-label">创建时间</label>
      <div class="layui-input-inline">
        <input type="text" name="oper_time" disabled="disabled"  class="layui-input">
      </div>
   </div>
<div class="layui-inline">
      <label class="layui-form-label">审核状态</label>
      <div class="layui-input-inline">
        <input type="text" name="isType" disabled="disabled"  class="layui-input">
      </div>
   </div>
<div class="layui-inline">
      <label class="layui-form-label">审核说明</label>
      <div class="layui-input-inline">
        <input type="text" name="check_suggestion" disabled="disabled"  class="layui-input">
      </div>
   </div>
<div class="layui-inline">
      <label class="layui-form-label">审核人</label>
      <div class="layui-input-inline">
        <input type="text" name="check_People_name" disabled="disabled"  class="layui-input">
      </div>
   </div>
<div class="layui-inline">
      <label class="layui-form-label">送审时间</label>
      <div class="layui-input-inline">
        <input type="text" name="sendTime" disabled="disabled"  class="layui-input">
      </div>
   </div>
<div class="layui-inline">
      <label class="layui-form-label">审核时间</label>
      <div class="layui-input-inline">
        <input type="text" name="sendSuccessTime" disabled="disabled"  class="layui-input">
      </div>
   </div>
 </div>s
</script>

<script type="text/html" id="add-car-form" >
<form class="layui-form" action="" id="add-form" lay-filter="add-form">
 <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">车辆名称</label>
      <div class="layui-input-inline">
        <input type="text" name="name"  lay-verify="required" class="layui-input">
		<input type="hidden" name="id">
      </div>
	</div>

    <div class="layui-inline">
      <label class="layui-form-label">车牌号</label>
      <div class="layui-input-inline">
        <input type="text" name="carId" lay-verify="required" class="layui-input">
      </div>
    </div>
 </div>

  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">车身颜色</label>
      <div class="layui-input-inline">
        <select name="color" lay-verify="required">
           <option value="">请选择车身颜色</option>
           <option value="红色">红色</option>
           <option value="黑色">黑色</option>
           <option value="白色">白色</option>
           <option value="蓝色">蓝色</option>
        </select>
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">燃油类型</label>
      <div class="layui-input-inline">
        <select name="oilType" lay-verify="required">
           <option value="">请选择燃油类型</option>
           <option value="汽油">汽油</option>
           <option value="柴油">柴油</option>
        </select>
      </div>
    </div>
  </div>

  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">选择车主</label>
      <div class="layui-input-inline">
         <select name="ownerId"  id="select" lay-verify="required">
        </select>
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">载客人数</label>
      <div class="layui-input-inline">
        <input type="text" name="count_passenger" lay-verify="required" class="layui-input">
      </div>
    </div>
  </div>

<div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">发动机编号</label>
      <div class="layui-input-inline">
        <input type="text" name="Engine_num" lay-verify="required" class="layui-input">
      </div>
    </div>
<div class="layui-inline">
      <label class="layui-form-label">车辆型号</label>
      <div class="layui-input-inline">
        <input type="text" name="car_type" lay-verify="required" class="layui-input">
      </div>
    </div>
  </div>

<div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">生产厂家</label>
      <div class="layui-input-inline">
        <input type="text" name="vender" lay-verify="required" class="layui-input">
      </div>
    </div>
<div class="layui-inline">
      <label class="layui-form-label">出厂日期</label>
      <div class="layui-input-inline">
        <input type="text" name="date_production" lay-verify="required" id="date" class="layui-input">
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

<script>

	var table = layui.table;
	var layer=layui.layer;
	var $ = layui.$;
	var form=layui.form;
	var index;
	var laydate = layui.laydate;
  
  //第一个实例
  table.render({
    elem: '#demo'
    ,url: '${path}/car/carlist' //数据接口
    ,page: true //开启分页
    ,limit:8
    ,limits:[8,16,24,32,40]
    ,title:'车辆列表'
    ,cols: [[ //表头
      {field: 'id', 'checkbox':true,align:'center', fixed: 'left'}
      ,{field: 'name', title: '车辆名称', width:'13.5%',align:'center'}
      ,{field: 'carId', title: '车牌号', width:'15%',align:'center'}
      ,{field: 'color', title: '车身颜色', width:'12%',align:'center'}
      ,{field: 'car_type', title: '车辆型号', width:'12%',align:'center'}
      ,{field: 'count_passenger', title: '载客人数', width:'12%',align:'center'}
      ,{field: 'oilType', title: '燃油类型', width:'12%',align:'center'}
      ,{field: 'isType', title: '审核状态', width:'12%',align:'center',templet:function(data){
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
			  area: ['1050px', '340px'],
			  title:'用户信息',
			  offset:'100px'
			});
	    form.val("form-info", {
			 "name":data.name 
			 ,"carId":data.carId
			  ,"color":data.color
			  ,"car_type":data.car_type
			  ,"count_passenger":data.count_passenger
			  ,"oilType":data.oilType
			  ,"Engine_num":data.Engine_num
			  ,"date_production":updateDate(data.date_production)
			  ,"vender":data.vender
			  ,"ownerName":data.ownerName
			  ,"driverName":function(){
				  if(data.driverName == null){
					  return "暂无安排司机";
				  }else{
					  return data.driverName;
				  }
			  }
			  ,"oper_time":updateDateTime(data.oper_time)
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
			  ,"check_suggestion":data.check_suggestion
			  ,"check_People_name":function(){
				  if(data.check_People_name == null){
					  return "暂无审核人员";
				  }else{
					  return data.check_People_name;
				  }
			  }
			  ,"sendTime":function(){
				  if(data.sendTime == null){
					  return "数据暂未送审";
				  }else{
					  return updateDateTime(data.sendTime);
				  }
			  }
			  ,"sendSuccessTime":function(){
				  if(data.sendSuccessTime == null){
					  return "暂未审核";
				  }else{
					  return updateDateTime(data.sendSuccessTime);
				  }
			  }
			})
	  }); 
  
//新增
	$("#add-btn").click(function() {
		index=layer.open({
			title:['新增车辆信息', 'font-size:18px;'],
			area: ['700px', '400px'],
			type:1,
			resize:false,
			content:$("#add-car-form").html(),
			 offset: '100px'
			});
		laydate.render({
		    elem: '#date'
		  });
		
		$.post('${path}/car/getAllCarOwnerInfo',function(data){
			  
			  var str="<option value=''>请选择车主</option>";
			  for (var i = 0; i < data.length; i++) {
				str+="<option value='"+data[i].ownerId+"'>"+data[i].ownerName+"</option>";
			}
			  $("#select").html(str);
			  form.render("select"); 
		  });
		
		form.on('submit(formbtn)', function(data){
			  $.post('${path}/car/editcar',$("#add-form").serialize(),function(data){
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
				layer.msg('不能修改已审核成功的数据！',{icon: 2,offset: '150px'});
			} else if(data[0].isType == 0){
		index=layer.open({
			title:['编辑车辆信息', 'font-size:18px;'],
			area: ['700px', '400px'],
			type:1,
			resize:false,
			content:$("#add-car-form").html(),
			 offset: '100px'
			});
		laydate.render({
		    elem: '#date'
		  });
		
		$.post("${path}/car/getCarInfoById",{id:data[0].id},function(data){
			form.val("add-form",{
				"id":data.id,
				"name":data.name,
				"carId":data.carId,
				"color":data.color,
				"oilType":data.oilType,
				"count_passenger":data.count_passenger,
				"Engine_num":data.Engine_num,
				"car_type":data.car_type,
				"vender":data.vender,
				"date_production":updateDate(data.date_production)
			})
			});
		
			 $.post("${path}/car/getCarInfoById",{id:data[0].id},function(data){
				  var str="<option value=''>请选择车主</option>";
				  for (var i = 0; i < data.ownerlist.length; i++) {
					str+="<option value='"+data.ownerlist[i].ownerId+"'";
					if(data.ownerId == data.ownerlist[i].ownerId){
						str += "selected";
					}
					str += ">"+data.ownerlist[i].ownerName+"</option>"
				}
				  $("#select").html(str);
				  form.render("select"); 
			 });
			 
		form.on('submit(formbtn)',function(data){
					  $.post('${path}/car/editcar',$("#add-form").serialize(),function(data){
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
				$.post("${path}/car/sendCar",{"res":res},function(data){
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
				for(var i=0; i<data.length; i++){
					if(data[i].isType == 1){
						layer.msg('删除失败，在选中数据中包含已审核的数据',{icon:2, offset:'150px'});
						return;
					}
				}
				for (var i = 0; i < data.length; i++) {
					res+=data[i].id+",";
				}
				layer.confirm('是否确认删除所选中的信息?', {icon: 3, title:'提示',offset: '150px'}, function(index){
					$.post("${path}/car/deleteCarById",{"res":res},function(data){
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
	
	function updateDate(data){
		  var time = data;
		  var first = time.split(/[, ,]/); 
		  var year = first[3]
		  var month = first[0]
		  var date = first[1]
		  if(month == "一月"){
				  month = "01";
			  }else if(month == "二月"){
				  month = "02";
			  }else if(month == "三月"){
				  month = "03";
			  }else if(month == "四月"){
				  month = "04";
			  }else if(month == "五月"){
				  month = "05";
			  }else if(month == "六月"){
				  month = "06";
			  }else if(month == "七月"){
				  month = "07";
			  }else if(month == "八月"){
				  month = "08";
			  }else if(month == "九月"){
				  month = "09";
			  }else if(month == "十月"){
				  month = 10;
			  }else if(month == "十一月"){
				  month = 11;
			  }else{
				  month = 12;
			  }

			  if(date.length == 1){
			  	date = '0'+date;
			  }
		  
		  return year+'-'+month+'-'+date;
		  
	}
	
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