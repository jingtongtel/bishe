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
     <script src="http://www.jq22.com/jquery/jquery-2.1.1.js"></script>
    <script src="assets/js/amazeui.min.js"></script>
    <script src="assets/js/app.js"></script>
     <script src="assets/js/echarts.min.js"></script>
</head>

<body data-type="generalComponents">
<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		function initIndex1() {
			var asd=document.getElementById("textfiled").value;
			stuid ={ // 请求参数
				'stu_name' : asd
				
			},
			$.ajax({
				type : "post",
				url : '${pageContext.request.contextPath }/Grade/leida.do',
				async : true,
				timeout : 5000,
				
				data :JSON.stringify(stuid),
	            contentType:'application/json;charset=UTF-8',
				dataType : "json",
				success : function(data) {
					data = entrance(data);
					try {
						
						var option = getPieOption(data);
						var myChart = echarts.init(document.getElementById('main2'));
						myChart.setOption(option);
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
		function getPieOption(data){
			alert(data);
			 var option = {
					    title: {
					        text: '基础雷达图'
					    },
					    tooltip: {},
					    legend: {
					        data: ['平均分数（The average score）', '学生分数（Student score）']
					    },
					    radar: {
					        // shape: 'circle',
					        indicator: [
					           { name: 'java（sales）', max: 100},
					           { name: '高数（Administration）', max: 100},
					           { name: '英语（Information Techology）', max: 100},
					           { name: '物理（Customer Support）', max: 100},
					           { name: '线性代数（Development）', max: 100},
					           { name: '计算机基础（Marketing）', max: 100}
					        ]
					    },
					    series: [{
					        name: '预算 vs 开销（Budget vs spending）',
					        type: 'radar',
					        // areaStyle: {normal: {}},
					        data : [
					            {
					                value : [data.avggrade[0].ping, data.avggrade[1].ping, data.avggrade[2].ping, data.avggrade[3].ping, data.avggrade[4].ping, data.avggrade[5].ping],
					                name : '平均分数（The average score）'
					            },
					             {
					                value : [data.grade[0].grade, data.grade[1].grade, data.grade[2].grade, data.grade[3].grade, data.grade[4].grade, data.grade[5].grade],
					                name : '学生分数（Student score）'
					            }
					        ]
					    }]
					};
			 return option;
		};
		
		function entrance(data){
			try{
				if(data.type=='fail'){
					alert('很抱歉，没有查到数据');
				}
			}catch(e){}
			try{
				if(data.type=='error'){
					console.log('参数错误！');
				}
			}catch(e){}
			
			return data;
		}

		// 使用刚指定的配置项和数据显示图表。
	</script>

<jsp:include page="/top.jsp"></jsp:include>







    <div class="tpl-page-container tpl-page-header-fixed">

                 <jsp:include page="/left.jsp"></jsp:include>



        <div class="tpl-content-wrapper">
            <div class="tpl-content-page-title">
                
            </div>
            <ol class="am-breadcrumb">
                <li><a href="#" class="am-icon-home">首页</a></li>
                <li><a href="#">成绩管理</a></li>
                <li class="am-active">个人成绩统计</li>
            </ol>
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 
                    </div>
                    <div class="tpl-portlet-input tpl-fz-ml">
                        <div class="portlet-input input-small input-inline">
                            <div class="input-icon right">
                                <i class="am-icon-search"></i>
                        </div>
                    </div>


                </div>
                <div class="tpl-block">
                    <div class="am-g">
                       
                       
                        <div class="am-u-sm-12 am-u-md-3">
                            <div class="am-input-group am-input-group-sm">
                                <input type="text" id="textfiled"  class="am-form-field">
                                <span class="am-input-group-btn">
            <button class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search" type="button" onclick="initIndex1()"></button>
          </span>
                            </div>
                        </div>
                    </div>

                    
                </div>
<!--       <form id="form2" runat ="server"> -->
<!--         <input type ="text" id="textfiled"  />  -->
<!-- 	<input type="button"  id="qaz" value="123" onclick="initIndex1()"> -->
<!--      </form>  -->
<div id="main2" style="width: 800px;height:600px;"></div>
	

            </div>










        </div>

    </div>


    <script src="http://www.jq22.com/jquery/jquery-2.1.1.js"></script>
    <script src="assets/js/amazeui.min.js"></script>
    <script src="assets/js/app.js"></script>
</body>

</html>