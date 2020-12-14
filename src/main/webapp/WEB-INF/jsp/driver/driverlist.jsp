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

<table id="demo" lay-filter="test"></table>
<script src="${path}/plugins/layui/layui.all.js"></script>

<script type="text/html" id="add-car-form" >
<form class="layui-form" action="" id="add-form" lay-filter="add-form">
 <div class="layui-form-item">
<input type="hidden" name="id">
    <div class="layui-inline">
      <label class="layui-form-label">姓名</label>
      <div class="layui-input-inline">
        <input type="text" name="name"  lay-verify="required" class="layui-input">
      </div>
	</div>

    <div class="layui-inline">
    	<label class="layui-form-label">性别</label>
    	<div class="layui-input-block">
     		 <input type="radio" name="sex" lay-verify="required" value="男" title="男" checked="checked">
      		<input type="radio" name="sex" lay-verify="required" value="女" title="女">
    	</div>
  	</div>
 </div>

  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">身份证号</label>
      <div class="layui-input-inline">
        <input type="text" name="card_Id"  lay-verify="required" class="layui-input">
      </div>
	</div>

    <div class="layui-inline">
      <label class="layui-form-label">家庭住址</label>
      <div class="layui-input-inline">
        <input type="text" name="address"  lay-verify="required" class="layui-input">
      </div>
	</div>

  </div>

  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">电话</label>
      <div class="layui-input-inline">
        <input type="text" name="tel"  lay-verify="required" class="layui-input">
      </div>
	</div>
    <div class="layui-inline">
      <label class="layui-form-label">选择车辆</label>
      <div class="layui-input-inline">
         <select name="carId"  id="select" lay-verify="required">
        </select>
      </div>
    </div>
  </div>

<div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">籍贯</label>
      <div class="layui-input-inline">
        <input type="text" name="Native"  lay-verify="required" class="layui-input">
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

  //第一个实例
  table.render({
    elem: '#demo'
    ,url: '${path}/driver/driverlist' //数据接口
    ,page: true //开启分页
    ,limit:8
    ,limits:[8,16,24,32,40]
    ,title:'司机列表'
    ,cols: [[ //表头
      {field: 'id', 'checkbox':true,align:'center', fixed: 'left'}
      ,{field: 'name', title: '车主名', width:'10%',align:'center'}
      ,{field: 'sex', title: '性别', width:'5%',align:'center'}
      ,{field: 'card_Id',title: '身份证号', width:'17.75%',align:'center'}
      ,{field: 'address', title: '家庭地址', width:'16%',align:'center'}
      ,{field: 'tel', title: '手机号', width:'12%',align:'center'}
      ,{field:'carId',title: '车辆',width:'8%',align:'center'}
      ,{field:'Native',title: '籍贯',width:'8%',align:'center'}
      ,{field:'score',title: '积分',width:'8%',align:'center'}
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
    ]]
  });
  
//新增
	$("#add-btn").click(function() {
		index=layer.open({
			title:['新增司机信息', 'font-size:18px;'],
			area: ['700px', '330px'],
			type:1,
			resize:false,
			content:$("#add-car-form").html(),
			 offset: '100px'
			});
		
		$.post('${path}/driver/getAllCarInfo',function(data){
			  
			  var str="<option value=''>请选择车辆</option>";
			  for (var i = 0; i < data.length; i++) {
				str+="<option value='"+data[i].carId+"'>"+data[i].carId+"</option>";
			  }
			  $("#select").html(str);
			  form.render("select"); 
		  });
		
		form.on('submit(formbtn)', function(data){
			  $.post("${path}/driver/editdriver",$("#add-form").serialize(),function(data){
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

	//删除
	$("#del-btn").click(function(){
			var checkStatus = table.checkStatus('demo');
			var data = checkStatus.data;
			var res="";
			if(checkStatus.data.length==0){
				layer.msg("请至少选中一条要删除的数据！",{icon: 2,offset: '150px'});
			}else{
				for (var i = 0; i < data.length; i++) {
					res+=data[i].id+",";
				}
				layer.confirm('是否确认删除所选中的信息?', {icon: 3, title:'提示',offset: '150px'}, function(index){
					$.post("${path}/driver/deleteDriverById",{"res":res},function(data){
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
				$.post("${path}/driver/sendDriver",{"res":res},function(data){
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
		    	layer.msg('不能修改已审核成功的数据！',{icon:2,offset:'150px'});
		    }else{
		    	index=layer.open({
					title:['编辑司机信息', 'font-size:18px;'],
					area: ['700px', '400px'],
					type:1,
					resize:false,
					content:$("#add-car-form").html(),
					 offset: '100px'
					});
				
				$.post("${path}/driver/getDriverInfoById",{id:data[0].id},function(data){
					form.val("add-form",{
						"id":data.id,
						"name":data.name,
						"sex":data.sex,
						"card_Id":data.card_Id,
						"address":data.address,
						"tel":data.tel,
						"Native":data.Native
					})
					});
				
					 $.post("${path}/driver/getDriverInfoById",{id:data[0].id},function(data){
						  var str="<option value=''>请选择车辆</option>";
						  for (var i = 0; i < data.carlist.length; i++) {
							str+="<option value='"+data.carlist[i].carId+"'";
							if(data.carId == data.carlist[i].carId){
								str += "selected";
							}
							str += ">"+data.carlist[i].carId+"</option>"
						}
						  $("#select").html(str);
						  form.render("select"); 
					 });
					 
				form.on('submit(formbtn)',function(data){
							  $.post("${path}/driver/editdriver",$("#add-form").serialize(),function(data){
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
</script>
</body>
</html>