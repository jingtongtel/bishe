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
<link rel="apple-touch-icon-precomposed"
	href="assets/i/app-icon72x72@2x.png">
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
			var banji = document.getElementById("banji").value;
			var data_full = document.getElementById("data_full").value;

					stuid = {
						"para" : {
							"dataView" : "default",
							"banji" : banji,
							"data_full" : data_full
						}
					},
					$
							.ajax({
								type : "post",
								url : '${pageContext.request.contextPath }/Attendance/statistics.do',
								async : true,
								timeout : 5000,

								data : JSON.stringify(stuid),
								contentType : 'application/json;charset=UTF-8',
								dataType : "json",
								success : function(data) {
									data = entrance(data);
									try {

										var option = getPieOption(data);
										var myChart = echarts.init(document
												.getElementById('main2'));
										myChart.setOption(option);

										var optionAll = getPieOptionAll(data);
										var myChart = echarts.init(document
												.getElementById('main3'));
										myChart.setOption(optionAll);

										var optionindex = getPieOptionindex(data);
										var myChart = echarts.init(document
												.getElementById('main4'));
										myChart.setOption(optionindex);
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
		function getPieOption(data) {
			var option = {
				tooltip : {
					trigger : 'item',
					formatter : "{a} <br/>{b}: {c} ({d}%)"
				},
				legend : {
					orient : 'vertical',
					x : 'left',
					data : [ '不及格', '良好', '优秀' ]
				},
				series : [ {
					name : '访问来源',
					type : 'pie',
					radius : [ '50%', '70%' ],
					avoidLabelOverlap : false,
					label : {
						normal : {
							show : false,
							position : 'center'
						},
						emphasis : {
							show : true,
							textStyle : {
								fontSize : '30',
								fontWeight : 'bold'
							}
						}
					},
					labelLine : {
						normal : {
							show : false
						}
					},
					data : [ {
						value : data.data.chidao,
						name : '迟到'
					}, {
						value : data.data.qingjia,
						name : '请假'
					}, {
						value : data.data.zaotui,
						name : '早退'
					}

					]
				} ]
			};
			return option;
		};

		function getPieOptionAll(data) {
			var option = {
				tooltip : {
					trigger : 'axis',
					axisPointer : { // 坐标轴指示器，坐标轴触发有效
						type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
					}
				},
				legend : {
					data : [ '直接访问', '邮件营销', '联盟广告', '视频广告', '搜索引擎' ]
				},
				grid : {
					left : '3%',
					right : '4%',
					bottom : '3%',
					containLabel : true
				},
				xAxis : {
					type : 'value'
				},
				yAxis : {
					type : 'category',
					data : [ '周一', '周二', '周三', '周四', '周五', '周六', '周日' ]
				},
				series : [
						{
							name : '迟到',
							type : 'bar',
							stack : '总量',
							label : {
								normal : {
									show : true,
									position : 'insideRight'
								}
							},
							data : [ data.data.allValue[0].chidao,
									data.data.allValue[1].chidao ]
						},
						{
							name : '请假',
							type : 'bar',
							stack : '总量',
							label : {
								normal : {
									show : true,
									position : 'insideRight'
								}
							},
							data : [ data.data.allValue[0].qingjia,
									data.data.allValue[1].qingjia,
									data.data.allValue[2].qingjia,
									data.data.allValue[3].qingjia]
						},
						{
							name : '早退',
							type : 'bar',
							stack : '总量',
							label : {
								normal : {
									show : true,
									position : 'insideRight'
								}
							},
							data : [ data.data.allValue[0].zaotui,
									data.data.allValue[1].zaotui,
									data.data.allValue[2].zaotui,
									data.data.allValue[3].zaotui]
						}

				]
			};
			return option;
		};

		function getPieOptionindex(data) {

			var option = {
				tooltip : {
					formatter : "{a} <br/>{b} : {c}%"
				},
				toolbox : {
					feature : {
						restore : {},
						saveAsImage : {}
					}
				},
				series : [ {
					name : '班级综合指数',
					type : 'gauge',
					detail : {
						formatter : '{value}'
					},
					data : [ {
						value : data.data.Integrated,
						name : '指数'
					} ]
				} ]
			};

			return option;
		};

		function entrance(data) {
			try {
				if (data.type == 'fail') {
					alert('很抱歉，没有查到数据');
				}
			} catch (e) {
			}
			try {
				if (data.type == 'error') {
					console.log('参数错误！');
				}
			} catch (e) {
			}

			return data;
		}

		// 使用刚指定的配置项和数据显示图表。
	</script>
<jsp:include page="/top.jsp"></jsp:include>








	<div class="tpl-page-container tpl-page-header-fixed">

		<jsp:include page="/left.jsp"></jsp:include>



		<div class="tpl-content-wrapper">
			<div class="tpl-content-page-title"></div>
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
								<div class="am-form-group">
									时间：<input type="text" id="data_full" class="am-form-field">
								</div>
							</div>

							<div class="am-u-sm-12 am-u-md-3">
								班级：
								<div class="am-input-group am-input-group-sm">

									<input type="text" id="banji" class="am-form-field"> <span
										class="am-input-group-btn">

										<button
											class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search"
											type="button" onclick="initIndex1()"></button>
									</span>
								</div>
							</div>

						</div>


					</div>
					<!--       <form id="form2" runat ="server"> -->
					<!--         <input type ="text" id="textfiled"  />  -->
					<!-- 	<input type="button"  id="qaz" value="123" onclick="initIndex1()"> -->
					<!--      </form>  -->
					<div style="font-size:30px">班级所有学生考勤   </div><br>
					<div id="main2" style="width: 800px; height: 600px;"></div>
					<div style="font-size:30px">所有班级考勤统计   </div><br>
					<div id="main3" style="width: 800px; height: 600px;"></div>
					<div style="font-size:30px">班级考勤综合指数   </div><br>
					<div id="main4" style="width: 800px; height: 600px;"></div>


				</div>










			</div>

		</div>


		<script src="http://www.jq22.com/jquery/jquery-2.1.1.js"></script>
		<script src="assets/js/amazeui.min.js"></script>
		<script src="assets/js/app.js"></script>
</body>

</html>