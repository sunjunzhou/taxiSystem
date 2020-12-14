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
  <button type="button" class="layui-btn layui-btn-sm" id="check-btn">
   <i class="layui-icon">&#xe609;</i>审核
  </button>
</div>
 
<table id="demo" lay-filter="test"></table>

<script src="${path}/plugins/layui/layui.all.js"></script>

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
    ,url: '${path}/carownerCheck/carownerChecklist' //数据接口
    ,page: true //开启分页
    ,limit:8
    ,limits:[8,16,24,32,40]
    ,title:'车辆列表'
    ,cols: [[ //表头
      {field: 'id', 'checkbox':true,align:'center', fixed: 'left'}
      ,{field: 'name', title: '车主名', width:'13.5%',align:'center'}
      ,{field: 'sex', title: '性别', width:'15%',align:'center'}
      ,{field: 'tel', title: '手机号', width:'15.9%',align:'center'}
      ,{field: 'address', title: '地址', width:'20%',align:'center'}
      ,{field: 'companyName', title: '所属公司', width:'20%',align:'center'}
      ,{field: 'isType', title: '审核状态', width:'12%',align:'center',templet:function(data){
    	  if(data.isType == 1){
    		  return "审核已通过";
    	  }else{
    		  return "审核未通过";
    	  }
      }}
    ]]
  });


	//审核
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
				$.post("${path}/carownerCheck/sendCarOwner",{"res":res},function(data){
					if(data==0){
				    	  layer.msg('审核成功！',{icon: 1,offset: '150px'});
				    	  layer.close(index); //再执行关闭  
				    	  table.reload("demo");
				      }else{
				    	  layer.msg('审核失败！',{icon: 2,offset: '150px'});
				      }
				});
				  
				  layer.close(index);
				});
		}
	}); 
	
</script>
</body>
</html>