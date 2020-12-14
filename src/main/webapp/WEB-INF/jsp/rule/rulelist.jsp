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
</div>

 
<table id="demo" lay-filter="test"></table>
 
 <script type="text/html" id="rule-form-info">
<form class="layui-form" action="" id="rule-form" lay-filter="rule-form-filter">
	<input type="hidden" name="id">
  <div class="layui-form-item" style="margin-top:5px">
    <label class="layui-form-label">考核名称</label>
    <div class="layui-input-inline">
      <input type="text" name="name" required  lay-verify="required" placeholder="请输入考核名称" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">考核分数</label>
    <div class="layui-input-inline">
      <input type="text" name="score" required lay-verify="required" placeholder="请输入考核分数" autocomplete="off" class="layui-input">
    </div>
  </div>

  <div class="layui-form-item">
    <label class="layui-form-label">考核类型</label>
    <div class="layui-input-block">
      <input type="radio" name="type" value="1" title="奖励" checked>
      <input type="radio" name="type" value="0" title="惩罚">
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">考核描述</label>
    <div class="layui-input-inline">
      <textarea name="scription" placeholder="请输入考核描述" class="layui-textarea" style="width:250px"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
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
	
	//新增
	$("#add-btn").click(function() {
		index=layer.open({
			title:['新增规章信息', 'font-size:18px;'],
			type:1,
			resize:false,
			content:$("#rule-form-info").html(),
			 offset: '50px',
			 area:['450px','400px']
			});
		form.render();
	});
	
	form.on('submit(formDemo)', function(data){
		$.post("${path}/rule/editRuleInfo",$("#rule-form").serialize(),function(flag){
			  if(flag==0){
		    	  layer.msg('保存成功！',{icon: 1,offset: '150px'});
		    	  layer.close(index); //再执行关闭  
		    	  table.reload("demo");
		      }else{
		    	  layer.msg('保存失败！',{icon: 2,offset: '150px'});
		      }
		      
		  });
		  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
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
			//修改查询用户信息
			index=layer.open({
			title:['编辑规章信息', 'font-size:18px;'],
			type:1,
			resize:false,
			content:$("#rule-form-info").html(),
			 offset: '50px',
			 area:['450px','400px']
			});
			form.render();
			$.post("${path}/rule/getruleById",{id:data[0].id},function(data){
				form.val("rule-form-filter",{
					"id":data.id,
					"name":data.name,
					"scription":data.scription,
					"score":data.score,
					"type":data.type == '1'?'1':'0'
				});
				form.render();
			},"json");
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
					res+=data[i].id+",";
				}
				layer.confirm('是否确认删除所选中的信息?', {icon: 3, title:'提示',offset: '150px'}, function(index){
					$.post("${path}/rule/deleteRule",{"res":res},function(data){
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
  
  //第一个实例
  table.render({
    elem: '#demo'
    ,url: '${path}/rule/rulelist' //数据接口
    ,page: true //开启分页
    ,limit:8
    ,limits:[8,16,24,32,40]
    ,title:'规章列表'
    ,cols: [[ //表头
      {field: 'id', 'checkbox':true,align:'center', fixed: 'left'}
      ,{field: 'name', title: '考核名称', width:'15%',align:'center'}
      ,{field: 'scription', title: '考核说明', width:'15%',align:'center'}
      ,{field: 'score', title: '考核分数', width:'15%',align:'center', templet:function(data){
    	  if(data.type == 0)
    		  return "-"+data.score;
    	  else
    		  return "+"+data.score;
      }}
      ,{field: 'type', title: '考核类型', width:'15%',align:'center', templet:function(data){
    	  if(data.type == 0)
    		  return "惩罚";
    	  else
    		  return "奖励";
      }}
      ,{field: 'createTime', title: '创建时间', width:'22.6%',align:'center',templet:function(data){
    	  return updateDateTime(data.createTime);
      }} 
      ,{field: 'operator', title: '创建人', width:'13.8%',align:'center'}
    ]]
  });
  
  form.on('submit(subdeptform)', function(data){
		$.post("${path}/dept/updateDeptInfo",$("#dept-form").serialize(),function(flag){
			  if(flag==0){
		    	  layer.msg('保存成功！',{icon: 1,offset: '150px'});
		    	  layer.close(index); //再执行关闭  
		    	  table.reload("demo");
		      }else{
		    	  layer.msg('保存失败！',{icon: 2,offset: '150px'});
		      }
		      
		  });
		  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
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