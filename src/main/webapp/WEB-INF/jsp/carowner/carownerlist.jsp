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
   <i class="layui-icon">&#xe609;</i>
   送审
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
      <label class="layui-form-label">车主名</label>
      <div class="layui-input-inline">
		
        <input type="text" name="name" disabled="disabled"  class="layui-input">
      </div>
	</div>
	<div class="layui-inline">
    	<label class="layui-form-label">性别</label>
    	<div class="layui-input-inline">
    		<input type="text" name="sex" disabled="disabled"  class="layui-input">
		</div>
  	</div>
    <div class="layui-inline">
      <label class="layui-form-label">身份证号</label>
      <div class="layui-input-inline">
       <input type="text" name="cardId" disabled="disabled"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">电话</label>
      <div class="layui-input-inline">
        <input type="text" name="tel" disabled="disabled"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">地址</label>
      <div class="layui-input-inline">
        <input type="text" name="address" disabled="disabled"  class="layui-input">
      </div>
    </div>
 <div class="layui-inline">
      <label class="layui-form-label">状态</label>
      <div class="layui-input-inline">
         <input type="text" name="isType" disabled="disabled"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">创建时间</label>
      <div class="layui-input-inline">
         <input type="text" name="operator_time" disabled="disabled"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">创建者</label>
      <div class="layui-input-inline">
         <input type="text" name="operator_name" disabled="disabled"  class="layui-input">
      </div>
    </div>
    
    <div class="layui-inline">
      <label class="layui-form-label">公司简称</label>
      <div class="layui-input-inline">
         <input type="text" name="shortName" disabled="disabled"  class="layui-input">
      </div>
    </div>
  <div class="layui-inline">
      <label class="layui-form-label">审核时间</label>
      <div class="layui-input-inline">
        <input type="text" name="check_time" disabled="disabled"  class="layui-input">
      </div>
   </div>
<div class="layui-inline">
      <label class="layui-form-label">审核人</label>
      <div class="layui-input-inline">
         <input type="text" name="checkPeople_name" disabled="disabled"  class="layui-input">
      </div>
    </div>
<div class="layui-inline">
      <label class="layui-form-label">审核意见</label>
      <div class="layui-input-inline">
         <input type="text" name="check_suggestion" disabled="disabled"  class="layui-input">
      </div>
    </div>
 </div>
</form>
</script>

<script type="text/html" id="add-info-form" >
<form class="layui-form" action="" id="add-form" lay-filter="form-test">
<input type="hidden" name="id"> 
<div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">车主名</label>
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
        <input type="text" name="cardId" lay-verify="required" id="date" class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">电话</label>
      <div class="layui-input-inline">
        <input type="text" name="tel" lay-verify="required" class="layui-input">
      </div>
    </div>
  </div>

  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">地址</label>
      <div class="layui-input-inline">
        <input type="text" name="address" lay-verify="required" class="layui-input">
      </div>
    </div>
  
 <div class="layui-form-item"  style="margin-top:10px;">
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
	var index;
  
  //第一个实例
  table.render({
    elem: '#demo'
    ,url: '${path}/carowner/carownerlist' //数据接口
    ,page: true //开启分页
    ,limit:8
    ,limits:[8,16,24,32,40]
    ,title:'车主列表'
    ,cols: [[ //表头
      {field: 'id', 'checkbox':true,align:'center', fixed: 'left'}
      ,{field: 'name', title: '车主名', width:'13.5%',align:'center'}
      ,{field: 'sex', title: '性别', width:'10%',align:'center'}
      ,{field: 'cardId',title: '身份证号', width:'20%',align:'center'}
      ,{field: 'tel', title: '手机号', width:'17%',align:'center'}
      ,{field: 'address', title: '地址', width:'16%',align:'center'}
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
			  area: ['700px', '320px'],
			  title:'用户信息',
			  offset:'100px'
			});
	    form.val("form-info", {
			 "name":data.name 
			 ,"sex":data.sex
			 ,"cardId":data.cardId
			 ,"tel":data.tel
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
			  ,"address":data.address
			  ,"operator_name":data.operator_name
			  ,"operator_time":updateDateTime(data.operator_time)
			  ,"shortName":data.shortName
			  ,"check_time":function(){
				  if(data.check_time == null){
					  return "暂无";
				  }else{
					  return updateDateTime(data.check_time);
				  }
			  }
			  ,"checkPeople_name":function(){
				  if(data.checkPeople_name == null){
					  return "暂无审核人员";
				  }else{
					  return data.checkPeople_name;
				  }
			  }
			  ,"check_suggestion":function(){
				  if(data.check_suggestion == null){
					  return "暂无审核人员提出意见";
				  }else{
					  return data.check_suggestion;
				  }
			  }
			})
	  }); 
  
//新增
	$("#add-btn").click(function() {
		index=layer.open({
			title:['新增车主信息', 'font-size:18px;'],
			area: ['700px', '270px'],
			type:1,
			resize:false,
			content:$("#add-info-form").html(),
			 offset: '100px'
			});
		form.render();
	});
	
	form.on('submit(formbtn)', function(data){
		$.post("${path}/carowner/editCarOwner",$("#add-form").serialize(),function(flag){
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
					$.post("${path}/carowner/deleteCarOwnerById",{"res":res},function(data){
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
					$.post("${path}/carowner/sendCarOwner",{"res":res},function(data){
						if(data==0){
					    	  layer.msg('送审成功！',{icon: 1,offset: '150px'});
					    	  layer.close(index); //再执行关闭  
					    	  table.reload("demo");
					      }else{
					    	  layer.msg('送失败！',{icon: 2,offset: '150px'});
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
				layer.msg('不能修改已审核成功的数据！',{icon: 2,offset: '150px'});
			} else if(data[0].isType == 0){
				//修改查询用户信息
				index=layer.open({
					title:['编辑车主信息', 'font-size:18px;'],
					area: ['700px', '270px'],
					type:1,
					resize:false,
					content:$("#add-info-form").html(),
					 offset: '100px'
					});
				$.post("${path}/carowner/getcarownerById",{id:data[0].id},function(data){
					form.val("form-test",{
						"id":data.id,
						"name":data.name,
						"sex":data.sex,
						"cardId":data.cardId,
						"tel":data.tel,
						"address":data.address
					})
			    	 $("#menuid").html(str);
					form.render();
				},"json");
			}
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