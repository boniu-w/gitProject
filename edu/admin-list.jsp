<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="x-admin-sm">
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.1</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="../../page/css/font.css">
    <link rel="stylesheet" href="../../page/css/xadmin.css">
    <link rel="stylesheet" type="text/css" href="../../bootstrap-3.3.7-dist/css/bootstrap.min.css" />
    <script type="text/javascript" src="../../page/js/jquery-3.3.1.js""></script>
    <script type="text/javascript" src="../../page/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../page/js/xadmin.js"></script>
    <script type="text/javascript" src="../../page/js/cookie.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
    $(function(){
    	mainAjax(2);
    })
    	//显示数据 
    	//分页参数 currentPage
    	function mainAjax(currentPage){
    		
    		$.ajax({
    			type:"post",
    			url:"http://localhost:8080/edu.com/administerManage/administerRelated",	
    			async:true,
    			data:{pageVal:currentPage},
    			success:function(obj){
    				var list =obj.list;
    				var size =list.length;
    				
    				alert(obj.pages);
    				alert(list[0].userTypeUserMap.typeuserid);
    				var tr="";
    				for(var i=0;i<size;i++){
    					tr=tr+'<tr>'+
				    		            '<td>'+
				    		              '<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="2">'+
				    		              	'<i class="layui-icon">&#xe605;</i>'+
				    		              '</div>'+
				    		            '</td>'+
				    		            '<td>'+list[i].uId+'</td>'+
				    		            '<td>'+list[i].uName+'</td>'+
				    		            '<td>'+list[i].uTel+'</td>'+
				    		            '<td>管理员</td>'+
				    		            '<td>'+list[i].uTime+'</td>'+
				    		            '<td class="td-status">'+
				    		              '<span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span>'+
				    		            '</td>'+
				    		            '<td class="td-manage">'+
				    		              '<a onclick="member_stop(this,"10001")" href="javascript:;"  title="启用">'+
				    		                '<i class="layui-icon">&#xe601;</i>'+
				    		              '</a>'+
				    		              '<a title="编辑"  onclick="member_edit("编辑","./admin-editUser.jsp")" href="javascript:;">'+
				    		                '<i class="layui-icon">&#xe642;</i>'+
				    		              '</a>'+
				    		              '<a title="删除" id="'+list[i].uId+'" onclick="member_del(this,'+list[i].uId+')" href="javascript:;">'+
				    		                '<i class="layui-icon">&#xe640;</i>'+
				    		              '</a>'+
				    		            '</td>'+
				    		         '</tr>';
    				}
    				$("#tbody_userMessage").html(tr);
    				
    				//分页开始
    				var totalPage=obj.pages;
    				var fenye="";
    				fenye='<li>'+
				    				'<a href="#">Previous</a>'+
				    			  '</li>';
    				for(var i=1;i<=totalPage;i++){
    					fenye=fenye+  '<li>'+
    													'<a href="#" onclick="dividePage('+i+')">'+i+'</a>'+
    												  '</li>';
    				}
    				fenye=fenye+'<li>'+
								    				'<a href="#">Next</a>'+
								    			'</li>';
					
					$("#divide_page ul").html(fenye);
					//==>分页结束
    			},
    			error:function(){
    				console.log("myfunction1.ajax错误");
    			}				
    		})
    	}
    // 分页点击事件 
    function dividePage(page){
    	mainAjax(page);
    }
    
    /*用户-删除*/
    function member_del(obj,id){
    	var message=confirm("确认删除吗?");
    	if(message=true){
    		 $(obj).parents("tr").remove();
	         layer.msg('已删除!',{icon:1,time:1000});
    		$.ajax({
        		type:"post",
        		url:"http://localhost:8080/edu.com/administerManage/deleteOneUser",
        		async:true,
        		data:{userId:id},
        		dataType:"text",
        		success:function(obj){
        			console.log(obj);
        		},
        		error:function(){
        			console.log("删除出错");
        		}
        	});
    	}
    }
    </script>
  </head>
  
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加用户','./admin-addUser.jsp')"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：=============条</span>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>ID</th>
            <th>登录名</th>
            <th>手机</th>
            <th>角色</th>
            <th>加入时间</th>
            <th>状态</th>
            <th>操作</th>
        </thead>
        <tbody id="tbody_userMessage">
          
        </tbody>
      </table>
      <div class="page">
        <div>
          
        </div>
      </div>
      <div id="divide_page">
      
	      <ul class="pager">
				<li>
					<!-- 点击事件 把值 传给 currentPage; -->
					<a href="#">Previous</a>
				</li>
				<li>
					<a href="#">2</a>
				</li>
				<li>
					<a href="#">3</a>
				</li>
				<li>
					<a href="#">4</a>
				</li>
				<li>
					<a href="#">Next</a>
				</li>
			</ul>
      </div>
      
    </div>
    <script>
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });

       /*用户-停用*/
      function member_stop(obj,id){
          layer.confirm('确认要停用吗？',function(index){

              if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

              }else{
                $(obj).attr('title','启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 5,time:1000});
              }
              
          });
      }

      function delAll (argument) {
        var data = tableCheck.getData();
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
      }
    </script>
    <script>
    	var _hmt = _hmt || []; 
    	(function() {
        	var hm = document.createElement("script");
        	hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        	var s = document.getElementsByTagName("script")[0];
        	s.parentNode.insertBefore(hm, s);
      })();
    </script>
  </body>

</html>