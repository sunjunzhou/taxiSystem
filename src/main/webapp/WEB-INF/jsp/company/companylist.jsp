<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>companylist</title>
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
 
 <script type="text/html" id="Companyform">
<form class="layui-form" action="" id="Company-form" lay-filter="Company-form-filter">
	<input type="hidden" name="id">
    <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">公司简称</label>
      <div class="layui-input-inline">
        <input type="text" name="shortName" lay-verify="required"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">公司全名</label>
      <div class="layui-input-inline">
        <input type="text" name="fullName" lay-verify="required"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">营业证号</label>
      <div class="layui-input-inline">
        <input type="text" name="businessNum" lay-verify="required"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">公司法人</label>
      <div class="layui-input-inline">
        <input type="text" name="leaderName" lay-verify="required"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">公司电话</label>
      <div class="layui-input-inline">
        <input type="text" name="tel" lay-verify="required"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">公司地址</label>
      <div class="layui-input-inline">
        <input type="text" name="address" lay-verify="required"  class="layui-input">
      </div>
    </div>

  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="subCompanyform">保存</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
   </form>
</script>

 <script type="text/html" id="Companyform_1">
<form class="layui-form" action="" id="Company-form_1" lay-filter="Company-form-filter_1">
    <div class="layui-form-item">

    <div class="layui-inline">
      <label class="layui-form-label">公司简称</label>
      <div class="layui-input-inline">
        <input type="text" name="shortName" lay-verify="required"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">公司全名</label>
      <div class="layui-input-inline">
        <input type="text" name="fullName" lay-verify="required"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">营业证号</label>
      <div class="layui-input-inline">
        <input type="text" name="businessNum" lay-verify="required"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">公司法人</label>
      <div class="layui-input-inline">
        <input type="text" name="leaderName" lay-verify="required"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">公司电话</label>
      <div class="layui-input-inline">
        <input type="text" name="tel" lay-verify="required"  class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">公司地址</label>
      <div class="layui-input-inline">
        <input type="text" name="address" lay-verify="required"  class="layui-input">
      </div>
    </div>
    
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="subCompanyform_1">保存</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
   </form>
</script>
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
			title:['新增公司信息', 'font-size:18px;'],
			type:1,
			resize:false,
			content:$("#Companyform_1").html(),
			 offset: '50px'
			});
	});
	
	form.on('submit(subCompanyform_1)', function(data){
		$.post("${path}/company/insertCompanyInfo",$("#Company-form_1").serialize(),function(flag){
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
			title:['编辑公司信息', 'font-size:18px;'],
			type:1,
			resize:false,
			content:$("#Companyform").html(),
			 offset: '50px'
			});
			$.post("${path}/company/getCompanyById",{id:data[0].id},function(data){
				form.val("Company-form-filter",{
					"id":data.id,
					"shortName":data.shortName,
					"fullName":data.fullName,
					"businessNum":data.businessNum,
					"leaderName":data.leaderName,
					"tel":data.tel,
					"address":data.address
				})
		    	 $("#menuid").html(str);
				form.render();
			},"json");
		}
		
	});
	
	//删除
	$("#del-btn").click(function(){
			var checkStatus = table.checkStatus('demo');
			var data = checkStatus.data;
			var res="";
			if(data.length==0){
				layer.msg("请至少选中一条要删除的数据！",{icon: 2,offset: '150px'});
			}else{
				for (var i = 0; i < data.length; i++) {
					res+=data[i].id+",";
				}
				layer.confirm('是否确认删除所选中的信息?', {icon: 3, title:'提示',offset: '150px'}, function(index){
					$.post("${path}/company/deleteCompanyById",{"res":res},function(data){
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
    ,url: '${path}/company/companylist' //数据接口
    ,page: true //开启分页
    ,cols: [[ //表头
      {field: 'id', 'checkbox':true,align:'center', fixed: 'left'}
      ,{field: 'shortName', title: '公司简称', width:'10%',align:'center'}
      ,{field: 'fullName', title: '公司全程', width:'20%',align:'center'}
      ,{field: 'businessNum', title: '营业证号', width:'15%',align:'center'} 
      ,{field: 'leaderName', title: '法人名称', width:'15%',align:'center'}
      ,{field: 'tel', title: '电话',width:'13.6%',align:'center'}
      ,{field: 'address', title: '地址', width:'13%',align:'center'}
      ,{field: 'user_name', title: '操作人', width:'10%'}
    ]]
  });
  
  form.on('submit(subCompanyform)', function(data){
		$.post("${path}/company/updateCompanyInfo",$("#Company-form").serialize(),function(flag){
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

</script>
</body>
</html>