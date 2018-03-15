<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="tpl-left-nav tpl-left-nav-hover">
			<div class="tpl-left-nav-title">功能 列表</div>
			<div class="tpl-left-nav-list">
				<ul class="tpl-left-nav-menu">
					<li class="tpl-left-nav-item"><a href="index2.jsp"
						class="nav-link"> <i class="am-icon-home"></i> <span>首页</span>
					</a></li>
					<li class="tpl-left-nav-item"><a href="chart.jsp"
						class="nav-link tpl-left-nav-link-list active"> <i
							class="am-icon-bar-chart"></i> <span>放弃</span> <i
							class="tpl-left-nav-content tpl-badge-danger"> 12 </i>
					</a></li>

					<li class="tpl-left-nav-item"><a href="javascript:;"
						class="nav-link tpl-left-nav-link-list"> <i
							class="am-icon-table"></i> <span>成绩统计</span> <i
							class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
					</a>
						<ul class="tpl-left-nav-sub-menu">
							<li><a href="CURD.jsp"> <i
									class="am-icon-angle-right"></i> <span>添加/修改成绩</span> <i
									class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
							</a> <a href="statisticsBanji.jsp"> <i
									class="am-icon-angle-right"></i> <span>班级成绩统计</span> <i
									class="tpl-left-nav-content tpl-badge-success"> 18 </i> <a
									href="statisticsPeo.jsp"> <i class="am-icon-angle-right"></i> <span>个人成绩统计</span>
										

									</a>
<!-- 									<a href="statisticsBanjizhishu.jsp"> <i -->
<!-- 									class="am-icon-angle-right"></i> <span>班级成绩综合指数</span> <i -->
<!-- 									class="tpl-left-nav-content tpl-badge-success"> 18 </i> -->
<!-- 									<a href="statisticsBanjiAll.jsp"> <i -->
<!-- 									class="am-icon-angle-right"></i> <span>所有班级成绩</span> <i -->
<!-- 									class="tpl-left-nav-content tpl-badge-success"> 18 </i> -->
									</li>
						</ul></li>

					<li class="tpl-left-nav-item"><a href="javascript:;"
						class="nav-link tpl-left-nav-link-list"> <i
							class="am-icon-wpforms"></i> <span>考勤管理</span> <i
							class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
					</a>
						<ul class="tpl-left-nav-sub-menu">
							<li><a href="CURDKaoqin.jsp"> <i
									class="am-icon-angle-right"></i> <span>添加考勤记录</span> <i
									class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
							</a> <a href="statisticsKaoqinPeo.jsp"> <i class="am-icon-angle-right"></i>
									<span>个人考勤统计</span>
							</a> <a href="banjikaoqin.jsp"> <i class="am-icon-angle-right"></i>
									<span>班级考勤统计</span>
							</a></li>
						</ul></li>

					<li class="tpl-left-nav-item"><a href="login.jsp"
						class="nav-link tpl-left-nav-link-list"> <i
							class="am-icon-key"></i> <span>登录</span>

					</a></li>
				</ul>
			</div>
		</div>
</body>
</html>