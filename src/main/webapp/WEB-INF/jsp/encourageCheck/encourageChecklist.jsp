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
  
  //第一个实例
  table.render({
    elem: '#demo'
    ,url: '${path}/encourageCheck/encourageChecklist' //数据接口
    ,page: true //开启分页
    ,limit:8
    ,limits:[8,16,24,32,40]
    ,title:'奖励审核列表'
    ,cols: [[ //表头
      {field: 'id', 'checkbox':true,align:'center', fixed: 'left'}
      ,{field: 'carId', title: '车牌号', width:'10%',align:'center'}
      ,{field: 'driver', title: '司机姓名', width:'14.1%',align:'center'}
      ,{field: 'score', title: '司机评分', width:'10.5%',align:'center',templet:function(data){
    	  return "+"+data.score;
      }}
      ,{field: 'why', title: '奖励标准', width:'15%',align:'center'}
      ,{field: 'shortName', title: '所属公司', width:'15%',align:'center'}
      ,{field: 'sendTime', title: '上报时间', width:'20%',align:'center',templet:function(data){
    	  return updateDateTime(data.sendTime)
      }}
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
		var res1="";
		var res2="";
		if(data.length==0){
			layer.msg('请至少选中一条要修改的数据！',{icon: 2,offset: '150px'});
		}else if(data.length>1){
			layer.msg('只能选中一条要修改的数据！',{icon: 2,offset: '150px'});
		}else{
			if(data[0].isType == 1){
		    	layer.msg('审核失败！不能审核已通过的数据',{icon: 2,offset: '150px'});
		    	return;
			}
			res = data[0].id;
			res1 = data[0].carId;
			res2 = parseInt(data[0].score);

			layer.confirm('是否确认送审所选中的信息?', {icon: 3, title:'提示',offset: '150px'}, function(index){
				$.post("${path}/encourageCheck/sendEncourage",{"res":res,"res1":res1,"res2":res2},function(data){
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