<%@page import="java.util.List"%>

<!doctype html>
<html>
<%@ page language="java" pageEncoding="UTF-8"%>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Amaze UI Admin index Examples</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/demo/demo.css">
	<script src="http://www.jq22.com/jquery/jquery-2.1.1.js"></script>
    <script src="assets/js/amazeui.min.js"></script>
    <script src="assets/js/app.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/menu.js"></script>
</head>
<script type="text/javascript">
$(function(){
	var pager = $('#dg').datagrid({
		title : "用户列表",
		nowrap : true,
			rownumbers : true,
			fitColumns : true,
			pagination : true,
		pageNumber : 1,
			pageSize : 5,
			pageList : [ 5, 10 ]
		}).datagrid('getPager');	// get the pager of datagrid
	pager.pagination({
		buttons:[{
			iconCls:'icon-add',
			handler:function(){
// 					alert('添加');
// 					window.location.href="${pageContext.request.contextPath }/Grade/insert.do";
				$('#dlg').dialog('open');
			}
		},{
			iconCls:'icon-edit',
			handler:function(){
				var rows = $('#dg').datagrid('getSelections');
				if (rows.length==1) {
					var testid = rows[0].stuId;
					var kemu = rows[0].kemu;
					var grade = rows[0].grade;
					var q1=document.getElementById("stuid1");
					var q2=document.getElementById("kemu1");
					var q3=document.getElementById("grade1");
					q1.value=testid;
					q2.value=kemu;
					q3.value=grade;
					$('#dlg1').dialog('open'); 					

				}else {
				$.messager.alert('注意','请选中一行进行编辑','warning');
				}
			}
		},

		{
			iconCls:'icon-cut',
			handler:function(){
				var rows = $('#dg').datagrid('getSelections');
				var projectInfo = {
						row:rows



				};
				if (rows.length>0) {
					$.messager.confirm('删除信息', '确定要删除?删除之后无法找回?！', function(r){
						$.ajax({
							type : "post",
							url :'${pageContext.request.contextPath }/Grade/delete.do',
							async : true,
							timeout : 5000,
							data :JSON.stringify(projectInfo),
							contentType:"application/json",
							dataType : "json",
							success : function(data) {
								if(data==1)location='table-font-list.jsp'

								try {


								} catch (e) {
								}
							},
							error : function(data) {

								$('.mask').fadeOut();
							},
							complete : function(XMLHttpRequest, textStatus) {
								this;
							}
						});

					});
				}else {
				$.messager.alert('注意','请选择至少一行进行删除','warning');
				}
			}
		}]
	});
})
function update() {
	var stuid=document.getElementById("stuid1").value;
	var kemu=document.getElementById("kemu1").value;
	var grade=document.getElementById("grade1").value;
	
	var projectInfo = {
			stuid:stuid,
			kemu:kemu,
			grade:grade

	};

	$.ajax({
		type : "post",
		url :'${pageContext.request.contextPath }/Grade/update.do',
		async : true,
		timeout : 5000,
		data :JSON.stringify(projectInfo),
		contentType:"application/json",
		dataType : "json",
		success : function(data) {
			if(data==1)location='table-font-list.jsp'
	            alert(data);
			try {


			} catch (e) {
			}
		},
		error : function(data) {

			$('.mask').fadeOut();
		},
		complete : function(XMLHttpRequest, textStatus) {
			this;
		}
	});
}
function insert() {
	var stuid=document.getElementById("stuid").value;
	var kemu=document.getElementById("kemu").value;
	var grade=document.getElementById("grade").value;
	var projectInfo = {
			stuid:stuid,
			kemu:kemu,
			grade:grade

	};

	$.ajax({
		type : "post",
		url :'${pageContext.request.contextPath }/Grade/insert.do',
		async : true,
		timeout : 5000,
		data :JSON.stringify(projectInfo),
		contentType:"application/json",
		dataType : "json",
		success : function(data) {
			if(data==1)location='table-font-list.jsp'
	            alert(data);
			try {


			} catch (e) {
			}
		},
		error : function(data) {

			$('.mask').fadeOut();
		},
		complete : function(XMLHttpRequest, textStatus) {
			this;
		}
	});
}
$(function(){
    $("#send").click(function(){
    	var projectInfo = {
    			stuid:"1"


    	};
    	var asd=document.getElementById("qwe");
    	$.ajax({
    		type : "post",
    		url :'${pageContext.request.contextPath }/Grade/grade.do',
    		async : true,
    		timeout : 5000,
    		data :JSON.stringify(projectInfo),
    		contentType:"application/json",
    		dataType : "json",
    		success : function(data) {
    			 var res = '';
    			 for (var i = 0; i < data.length; i++) {
    				var list='<tr>'+'<th>'+data[i].id+'</th>'+
    				 '<th>'+data[i].stuid+'</th>'+
    				 '<th>'+data[i].kemu+'</th>'+
    				 '<th>'+data[i].grade+'</th>'+'</tr>';
    				 res+=list;
				    }
    			 var fin='<tbody>'+res+'</tbody>'

				 alert(fin);
    			
    			$('#gf').append(fin);
    			asd.innerHTML=fin;
    			try {


    			} catch (e) {
    			}
    		},
    		error : function(data) {

    			$('.mask').fadeOut();
    		},
    		complete : function(XMLHttpRequest, textStatus) {
    			this;
    		}
    	});
    })
})

</script>
<body data-type="generalComponents">


  <jsp:include page="/top.jsp"></jsp:include>






    <div class="tpl-page-container tpl-page-header-fixed">


                     <jsp:include page="/left.jsp"></jsp:include>




        <div class="tpl-content-wrapper">
           <div class="tpl-content-page-title"></div>
			<ol class="am-breadcrumb">
				<li><a href="#" class="am-icon-home">首页</a></li>
				<li><a href="#">成绩管理</a></li>
				<li class="am-active">添加/修改成绩</li>
			</ol>
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 列表
                    </div>
                    <div class="tpl-portlet-input tpl-fz-ml">
                        <div class="portlet-input input-small input-inline">
                            <div class="input-icon right">
                                <i class="am-icon-search"></i>
                                <input type="text" class="form-control form-control-solid" placeholder="搜索..."> </div>
                        </div>
                    </div>


                </div>
               
                    <div class="am-g">
                        <div class="am-u-sm-12">
                            <form class="am-form">

    <div style="font-size:50px;">
	<table id="dg" title="这是一个标题" style="width:700px"
			data-options="rownumbers:true,singleSelect:false,pagination:true,url:'${pageContext.request.contextPath}/Grade/grade.do',method:'post'">
		<thead>
			<tr>
				<th data-options="field:'id',width:80,checkbox : true">ID</th>

				<th data-options="field:'stuName',width:80,align:'center'">姓名</th>
				<th data-options="field:'stuId',width:80,align:'center'">姓名</th>
				<th data-options="field:'kemuname',width:100,align:'center'">科目</th>
				<th data-options="field:'kemu',width:100,align:'center'">科目</th>
				<th data-options="field:'grade',width:80,align:'center'">成绩</th>




			</tr>
		</thead>
	</table>

<p id="gf"></p>

<table cellpadding="0" cellspacing="0" border="1" id='financeinfoList' >
	<div id="dlg" class="easyui-dialog" title="新增" data-options="modal:true,iconCls:'icon-add'"  style="width:350px;height:230px;padding:10px;" closed="true">
			<form  style="font-size:20px;padding-left: 50px;">
				<br/>
				学生ID：<input type="text" id="stuid"/><br/><br/>
				科目：<input type="text" id="kemu"/><br/><br/>
				成绩：<input type="text" id="grade"/><br/><br/>

				<input type="submit" value="发布" onclick="insert()"/>
			</form>
	</div>
	
	<div id="dlg1" class="easyui-dialog" title="新增" data-options="modal:true,iconCls:'icon-add'"  style="width:350px;height:230px;padding:10px;" closed="true">
			<form  style="font-size:20px;padding-left: 50px;">
				<br/>
				学生ID：<input type="text" id="stuid1" /><br/><br/>
				科目：<input type="text" id="kemu1"/><br/><br/>
				成绩111：<input type="text" id="grade1"/><br/><br/>

				<input type="submit" value="发布" onclick="update()"/>
			</form>
	</div>
        <hr>
                <div class="tpl-alert"></div>
        </table>
        </div>
        </form>
        </div>
        </div>
        </div>
        </div>
 
 
</body>

</html>