<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 响应式布局-->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Insert title here</title>
<link href="${path}/plugins/layui/css/layui.css" rel="stylesheet"/>
<title>Insert title here</title>
</head>
<body>

<div class="layui-btn-group">
  <button class="layui-btn layui-btn-sm" id="add">
    <i class="layui-icon">&#xe654;</i>
  </button>
  <button class="layui-btn layui-btn-sm"  id="edit">
    <i class="layui-icon">&#xe642;</i>
  </button>
  <button class="layui-btn layui-btn-sm" id="del">
    <i class="layui-icon">&#xe640;</i>
  </button>
  
</div>
<table id="demo" lay-filter="test"></table>

<script type="text/javascript" src="${path}/plugins/layui/layui.all.js"></script>

<script type="text/html" id="add-user-form-1" >
<form class="layui-form" action="" id="add-form-1" lay-filter="form-test-1">
 <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">用户名</label>
      <div class="layui-input-inline">
        <input type="text" name="uName"  lay-verify="required" class="layui-input">
		<input type="hidden" name="uId">
		<input type="hidden" name="type" value="1">
      </div>
	</div>
	<div class="layui-inline">
    	<label class="layui-form-label">性别</label>
    	<div class="layui-input-block">
     		 <input type="radio" name="uSex" lay-verify="required" value="男" title="男" checked="checked">
      		<input type="radio" name="uSex" lay-verify="required" value="女" title="女">
    	</div>
  	</div>
 </div>

  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">生日</label>
      <div class="layui-input-inline">
        <input type="text" name="uBirth" lay-verify="required" id="date" class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">地址</label>
      <div class="layui-input-inline">
        <input type="text" name="uAddress" lay-verify="required" class="layui-input">
      </div>
    </div>
  </div>

  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">电话</label>
      <div class="layui-input-inline">
        <input type="text" name="mobile" lay-verify="required|mobile" class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">公司</label>
      <div class="layui-input-inline">
         <select name="companyId"  id="select" lay-verify="required">
        </select>
      </div>
    </div>
  </div>

<div class="layui-form-item">
    <label class="layui-form-label">菜单</label>
    <div class="layui-input-block" name="checkbox" id="checkbox">
    </div>
  </div>
  
 <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn layui-btn-radius" lay-submit lay-filter="formbtn-1">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-radius layui-btn-warm">重置</button>
    </div>
  </div>
</form>
</script>

<script type="text/html" id="add-user-form" >
<form class="layui-form" action="" id="add-form" lay-filter="form-test">
 <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">用户名</label>
      <div class="layui-input-inline">
        <input type="text" name="uName"  lay-verify="required" class="layui-input">
		<input type="hidden" name="uId">
		<input type="hidden" name="type" value="1">
      </div>
	</div>
	<div class="layui-inline">
    	<label class="layui-form-label">性别</label>
    	<div class="layui-input-block">
     		 <input type="radio" name="uSex" lay-verify="required" value="男" title="男" checked="checked">
      		<input type="radio" name="uSex" lay-verify="required" value="女" title="女">
    	</div>
  	</div>
 </div>

  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">生日</label>
      <div class="layui-input-inline">
        <input type="text" name="uBirth" lay-verify="required" id="date" class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">地址</label>
      <div class="layui-input-inline">
        <input type="text" name="uAddress" lay-verify="required" class="layui-input">
      </div>
    </div>
  </div>

  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">电话</label>
      <div class="layui-input-inline">
        <input type="text" name="mobile" lay-verify="required|mobile" class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">部门</label>
      <div class="layui-input-inline">
         <select name="uDeptId"  id="select" lay-verify="required">
        </select>
      </div>
    </div>
  </div>

<div class="layui-form-item">
    <label class="layui-form-label">菜单</label>
    <div class="layui-input-block" name="menu_id" id="checkbox">
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

<script type="text/javascript">
	var layer=layui.layer;
	var $=layui.$;
	var form=layui.form;
	var element = layui.element;
	var $ = layui.$;
	var confirm=layui.confirm;
	
	var table = layui.table;
	var laydate = layui.laydate;
	var index;
	/* 表格的渲染 */
	 table.render({
		   elem: '#demo',
		   url: '${path}/user/userlist', //数据接口 ,
		   page: true,
		   limit:10,
		   cols: [[ //表头
		      {field: 'id',"checkbox":true,  sort: true, fixed: 'left',align:'center'},
			  {field: 'account', title: '账号' ,align:'center'},
			  {field: 'birthday', title: '生日', align:'center',templet:function(data){
				  return updateDate(data.birthday);
			  }},   
			  {field: 'sex', title: '性别',align:'center',templet:function(data){
				  if(data.sex==null){
					  return "/";
				  }else{
					  return data.sex;
				  }
			  }},   
			  {field: 'address', title: '家庭地址',align:'center',width:'11%',templet:function(data){
				  if(data.address==null){
					  return "/";
				  }else{
					  return data.address;
				  }
			  }},   
			  {field: 'mobile', title: '电话',align:'center',width:'12%',templet:function(data){
				  if(data.mobile==null){
					  return "/";
				  }else{
					  return data.mobile;
				  }
			  }}, 
			  {field: 'type', title: '类型',align:'center',width:'11%',templet:function(data){
				  if(data.TYPE==1){
					  return "出租管理处账户";
				  }else if(data.TYPE==0){
					  return "超级管理员";
				  }else if(data.TYPE==2){
					  return "出租公司账户";
				  }
			  }},   
			  {field: 'deptname', title: '部门名称',align:'center',templet:function(data){
				  if(data.deptname==null){
					  return "/";
				  }else{
					  return data.deptname;
				  }
			  }},
			  {field: 'companyname', align:'center',title:'公司名称',templet:function(data){
				  if(data.companyname==null){
					  return "/";
				  }else{
					  return data.companyname;
				  }
			  }},
			  {field: 'opertime', align:'center',title: '操作时间',width:'15%',templet:function(data){
				  return updateDateTime(data.opertime);
			  }}
		    ]] 
		  });

	 $("#add").click(function() {
		 index=layer.confirm('您要添加哪种类型的用户？', {
			  btn: ['管理处普通用户', '出租车公司管理员'] //可以无限个按钮
			  
		/*******************管理处普通用户添加*******************************/	  
			}, function(index, layero){
				layer.close(index);
				index=layer.open({
					  type: 1,
					  content: $('#add-user-form').html(),
					  area: ['700px', '390px'],
					  offset:'100px'
					});
				  laydate.render({
				    elem: '#date'
				  });
				  form.on('submit(formbtn)', function(data){
						  $.post('${path}/user/edituser',$("#add-form").serialize(),function(data){
								if(data==1){
									layer.msg('操作成功', {icon: 1,offset:'150ox'}); 
									layer.close(index);
									table.reload("demo");
								}else if(data==0){
									layer.msg('操作失败', {icon: 2,offset:'150ox'});
								}
							})
					  
					  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
					});
				  
					$.post('${path}/user/getAllMenuInfo',function(data){
						var str="";
						for(var i = 0; i < data.length; i++){
							str += "<input type='checkbox' name='menu_id' value='"+data[i].id+"' title='"+data[i].m_name+"'>";
						}
						$("#checkbox").html(str);
						form.render("checkbox");
					});
					
				$.post('${path}/user/getAllDeptInfo',function(data){
					  
					  var str="<option value=''>请选择部门</option>";
					  for (var i = 0; i < data.length; i++) {
						str+="<option value='"+data[i].id+"'>"+data[i].name+"</option>";
					}
					  $("#select").html(str);
					  form.render("select"); 
				  })
				  
				form.render();
           /****************************************************************************/	
           
           /***************************公司管理员添加************************************/
			}, function(index){
				layer.close(index);
				index=layer.open({
					  type: 1,
					  content: $('#add-user-form-1').html(),
					  area: ['700px', '390px'],
					  offset:'100px'
					});
				  laydate.render({
				    elem: '#date'
				  });
				  form.on('submit(formbtn-1)', function(data){
						  $.post('${path}/user/editcompany_user',$("#add-form-1").serialize(),function(data){
								if(data==1){
									layer.msg('操作成功', {icon: 1,offset:'150ox'}); 
									layer.close(index);
									table.reload("demo");
								}else if(data==0){
									layer.msg('操作失败', {icon: 2,offset:'150ox'});
								}
							});
					  
					  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
					});
				  
					$.post('${path}/user/getAllMenuInfo',function(data){
						var str="";
						for(var i = 0; i < data.length; i++){
							str += "<input type='checkbox' name='menu_id' value='"+data[i].id+"' title='"+data[i].m_name+"'>";
						}
						$("#checkbox").html(str);
						form.render("checkbox");
					});
					
				$.post('${path}/user/getAllCompanyInfo',function(data){
					  
					  var str="<option value=''>请选择公司</option>";
					  for (var i = 0; i < data.length; i++) {
						str+="<option value='"+data[i].id+"'>"+data[i].fullName+"</option>";
					  }
					  $("#select").html(str);
					  form.render("select"); 
				  });
				  
				form.render();
			});
		 });
		 
		//删除
		$("#del").click(function(){
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
						$.post("${path}/user/deleteUserById",{"res":res},function(data){
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
		//修改
		$("#edit").click(function() {
			var checkStatus = table.checkStatus("demo");
			var data = checkStatus.data;
			if(data.length==0){
				layer.msg('请至少选中一条要修改的数据！',{icon: 2,offset: '150px'});
			}else if(data.length>1){
				layer.msg('只能选中一条要修改的数据！',{icon: 2,offset: '150px'});
			}else{
				if(data[0].TYPE == 1){
					//修改查询用户信息
					index=layer.open({
				        type: 1,
				     content: $('#add-user-form').html(),
				        area: ['700px', '390px'],
				      offset:'100px'
				    });
			       laydate.render({
			            elem: '#date'
			        });
			       
			       $.post("${path}/user/getUserById",{id:data[0].id},function(data){
						form.val("form-test",{
							"uId":data.u_id,
							"uName":data.u_name,
							"uSex":data.u_sex,
							"uBirth":updateDate(data.u_birth),
							"uAddress":data.u_address,
							"mobile":data.u_tel,
						});
						
			       $.post('${path}/user/getUserById',{id:data.u_id},function(data){
						  var str="<option value=''>请选择部门</option>";
						  for (var i = 0; i < data.deptlist.length; i++) {
							str+="<option value='"+data.deptlist[i].id+"'";
							if(data.u_deptId == data.deptlist[i].id){
								str += "selected";
							}
							str += ">"+data.deptlist[i].name+"</option>"
						}
						  $("#select").html(str);
						  form.render("select"); 

						  var str="";
						  for(var i = 0; i < data.menulist.length; i++){
							  str+="<input type='checkbox' name='menu_id' value='"+data.menulist[i].id+"' title='"+data.menulist[i].m_name+"'";
							  for(var j=0; j<data.ownMenu.length; j++){
								  if(data.menulist[i].id == data.ownMenu[j].menu_id){
									  str += "checked";
									  break;
								  }
							  }
							  str += ">";
						  }
						  $("#checkbox").html(str);
							form.render("checkbox");
					  });
					  	
				    	 $("#menuid").html(str);
						form.render();
					},"json");
			       
			       form.on('submit(formbtn)', function(data){
						  
						  $.post('${path}/user/edituser',$("#add-form").serialize(),function(data){
								if(data==1){
									layer.msg('操作成功', {icon: 1,offset:'150ox'}); 
									layer.close(index);
									table.reload("demo");
								}else if(data==0){
									layer.msg('操作失败', {icon: 2,offset:'150ox'});
								}
							})
					  
					  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
					});
					form.render();
				}else if(data[0].TYPE == 2){
					//修改查询用户信息
					index=layer.open({
				        type: 1,
				     content: $('#add-user-form-1').html(),
				        area: ['700px', '390px'],
				      offset:'100px'
				    });
			       laydate.render({
			            elem: '#date'
			        });
			       
			       $.post("${path}/user/getUserById",{id:data[0].id},function(data){
						form.val("form-test-1",{
							"uId":data.u_id,
							"uName":data.u_name,
							"uSex":data.u_sex,
							"uBirth":updateDate(data.u_birth),
							"uAddress":data.u_address,
							"mobile":data.u_tel,
						});
						
			       $.post('${path}/user/getUserById',{id:data.u_id},function(data){
						  var str="<option value=''>请选择公司</option>";
						  for (var i = 0; i < data.companylist.length; i++) {
							str+="<option value='"+data.companylist[i].id+"'";
							if(data.u_companyId == data.companylist[i].id){
								str += "selected";
							}
							str += ">"+data.companylist[i].fullName+"</option>"
						}
						  $("#select").html(str);
						  form.render("select");
						  
						  var str="";
						  for(var i = 0; i < data.menulist.length; i++){
							  str+="<input type='checkbox' name='menu_id' value='"+data.menulist[i].id+"' title='"+data.menulist[i].m_name+"'";
							  for(var j=0; j<data.ownMenu.length; j++){
								  if(data.menulist[i].id == data.ownMenu[j].menu_id){
									  str += "checked";
									  break;
								  }
							  }
							  str += ">";
						  }
						  $("#checkbox").html(str);
							form.render("checkbox");
						  
					  });
					  	
				    	 $("#menuid").html(str);
						form.render();
					},"json");
			       
			       form.on('submit(formbtn-1)', function(data){
						  
						  $.post('${path}/user/editcompany_user',$("#add-form-1").serialize(),function(data){
								if(data==1){
									layer.msg('操作成功', {icon: 1,offset:'150ox'}); 
									layer.close(index);
									table.reload("demo");
								}else if(data==0){
									layer.msg('操作失败', {icon: 2,offset:'150ox'});
								}
							})
					  
					  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
					});
					form.render();
				}
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