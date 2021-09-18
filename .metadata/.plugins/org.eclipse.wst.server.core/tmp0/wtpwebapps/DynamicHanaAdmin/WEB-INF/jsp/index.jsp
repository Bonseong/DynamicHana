<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>하나카드 다이나믹하나 관리자페이지</title>
<!-- Favicon -->
<!-- // 나중에 인클루드로 빼 -->
<link
	href="${ pageContext.request.contextPath }/resources/assets/img/brand/favicon.png"
	rel="icon" type="image/png">
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<!-- Icons -->
<link
	href="${ pageContext.request.contextPath }/resources/assets/js/plugins/nucleo/css/nucleo.css"
	rel="stylesheet" />
<link
	href="${ pageContext.request.contextPath }/resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet" />
<!-- CSS Files -->
<link
	href="${ pageContext.request.contextPath }/resources/assets/css/argon-dashboard.css?v=1.1.2"
	rel="stylesheet" />
<link
	href="${ pageContext.request.contextPath }/resources/assets/custom.css"
	rel="stylesheet" />
<!-- Favicon -->
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/assets/img/brand/favicon.png"
	rel="icon" type="image/png">
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<!-- Icons -->
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/assets/js/plugins/nucleo/css/nucleo.css" />
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" />
<!-- CSS Files -->
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/assets/css/argon-dashboard.css?v=1.1.2" />

<!--   Core   -->
<script
	src="${ pageContext.request.contextPath }/resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!--   Optional JS   -->
<script
	src="${ pageContext.request.contextPath }/resources/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
<!--   Argon JS   -->
<script
	src="${ pageContext.request.contextPath }/resources/assets/js/argon-dashboard.min.js?v=1.1.2"></script>
<script
	src="${ pageContext.request.contextPath }/resources/assets/js/argon-dashboard.js"></script>
<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
<script>
	window.TrackJS && TrackJS.install({
		token : "ee6fab19c5a04ac1a32a645abde4613a",
		application : "argon-dashboard-free"
	});

	window.onload = function() {
		lineChartDraw();
		barChartDraw();

	}

	var label_1 = []
	var data_1 = []

	<c:forEach items="${requestScope.weelkyConsumption }" var="weelkyConsumption"
		varStatus="loop">
	data_1.push(parseInt("${ weelkyConsumption.subTotal }"))
	label_1.push("${ weelkyConsumption.historyDate }")
	</c:forEach>

	var max_value = Math.max.apply(null, data_1);

	lineChartData = {
		labels : label_1,
		datasets : [ {
			label : 'Performance',
			data : data_1
		} ]
	}

	let lineChartDraw = function() {
		var ctx = document.getElementById('myChart').getContext('2d');

		var lineChart = new Chart(
				ctx,
				{
					type : 'line',
					options : {
						scales : {
							yAxes : [ {

								gridLines : {
									lineWidth : 1,
									color : Charts.colors.gray[900],
									zeroLineColor : Charts.colors.gray[900]
								},
								ticks : {
									beginAtZero : false,
									userCallback : function(value, index,
											values) {
										value = value.toString();
										value = value.split(/(?=(?:...)*$)/);
										value = value.join(',');
										return value + "원";
									}

								}
							} ]
						},
						tooltips : {
							callbacks : {
								label : function(item, data) {
									var label = data.datasets[item.datasetIndex].label
											|| '';
									var yLabel = item.yLabel;
									var content = '';

									if (data.datasets.length > 1) {
										content += '<span class="popover-body-label mr-auto">'
												+ label + '</span>';
									}

									content += '<span class="popover-body-value">'
											+ yLabel + '원</span>';
									return content;
								}
							}
						}
					},
					data : lineChartData
				});

	};

	var label_2 = []
	var data_2 = []
	<c:forEach items="${requestScope.monthlyConsumption }" var="monthlyConsumption"
		varStatus="loop">
	data_2.push(parseFloat("${ monthlyConsumption.subTotalDouble }"))
	label_2.push("${ monthlyConsumption.historyDate }")
	</c:forEach>

	let barChartDraw = function() {
		var ctx = document.getElementById('myChart2').getContext('2d');

		var barChart = new Chart(
				ctx,
				{
					type : 'bar',
					options : {
						scales : {
							yAxes : [ {
								gridLines : {
									lineWidth : 1,
									color : '#dfe2e6',
									zeroLineColor : '#dfe2e6'
								},
								ticks : {
									callback : function(value) {
										if (!(value % 10)) {
											//return '$' + value + 'k'
											return value
										}
									}
								}
							} ]
						},
						tooltips : {
							callbacks : {
								label : function(item, data) {
									var label = data.datasets[item.datasetIndex].label
											|| '';
									var yLabel = item.yLabel;
									var content = '';

									if (data.datasets.length > 1) {
										content += '<span class="popover-body-label mr-auto">'
												+ label + '</span>';
									}

									content += '<span class="popover-body-value">'
											+ yLabel + '</span>';

									return content;
								}
							}
						}
					},
					data : {
						labels : label_2,
						datasets : [ {
							label : 'Sales',
							data : data_2
						} ]
					}
				})
	}
</script>


</head>

<body class="">
	<nav
		class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white"
		id="sidenav-main">
		<div class="container-fluid">
			<!-- Toggler -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#sidenav-collapse-main" aria-controls="sidenav-main"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- Brand -->
			<a class="navbar-brand pt-0" href="./index.html"> <img
				src="${ pageContext.request.contextPath }/resources/assets/img/brand/blue.png"
				class="navbar-brand-img" alt="...">
			</a>
			<!-- User -->
			<ul class="nav align-items-center d-md-none">
				<li class="nav-item dropdown"><a class="nav-link nav-link-icon"
					href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="ni ni-bell-55"></i>
				</a>
					<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right"
						aria-labelledby="navbar-default_dropdown_1">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item dropdown"><a class="nav-link" href="#"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false" /></a>
					<div class="media align-items-center">
						<span class="avatar avatar-sm rounded-circle"> <img
							alt="Image placeholder"
							src="${ pageContext.request.contextPath }/resources/assets/img/theme/team-1-800x800.jpg">
						</span>
					</div>

					<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
						<div class=" dropdown-header noti-title">
							<h6 class="text-overflow m-0">Welcome!</h6>
						</div>
						<a
							href="${ pageContext.request.contextPath }/resources/assets/examples/profile.html"
							class="dropdown-item"> <i class="ni ni-single-02"></i> <span>My
								profile</span>
						</a> <a
							href="${ pageContext.request.contextPath }/resources/assets/examples/profile.html"
							class="dropdown-item"> <i class="ni ni-settings-gear-65"></i>
							<span>Settings</span>
						</a> <a
							href="${ pageContext.request.contextPath }/resources/assets/examples/profile.html"
							class="dropdown-item"> <i class="ni ni-calendar-grid-58"></i>
							<span>Activity</span>
						</a> <a
							href="${ pageContext.request.contextPath }/resources/assets/examples/profile.html"
							class="dropdown-item"> <i class="ni ni-support-16"></i> <span>Support</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#!" class="dropdown-item"> <i class="ni ni-user-run"></i>
							<span>Logout</span>
						</a>
					</div></li>
			</ul>
			<!-- Collapse -->
			<div class="collapse navbar-collapse" id="sidenav-collapse-main">
				<!-- Collapse header -->
				<div class="navbar-collapse-header d-md-none">
					<div class="row">
						<div class="col-6 collapse-brand">
							<a href="./index.html"> <img
								src="${ pageContext.request.contextPath }/resources/assets/img/brand/blue.png">
							</a>
						</div>
						<div class="col-6 collapse-close">
							<button type="button" class="navbar-toggler"
								data-toggle="collapse" data-target="#sidenav-collapse-main"
								aria-controls="sidenav-main" aria-expanded="false"
								aria-label="Toggle sidenav">
								<span></span> <span></span>
							</button>
						</div>
					</div>
				</div>

				<!-- Navigation -->
				<ul class="navbar-nav">
					<li class="nav-item active "><a class="nav-link  active "
						href=""> <i class="ni ni-tv-2 text-primary"></i> 대시보드
					</a></li>
					<li class="nav-item"><a class="nav-link "
						href="${ pageContext.request.contextPath }/resources/assets/examples/icons.html">
							<i class="ni ni-planet text-blue"></i> 회원분석
					</a></li>
					<li class="nav-item"><a class="nav-link "
						href="${ pageContext.request.contextPath }/resources/assets/examples/maps.html">
							<i class="ni ni-pin-3 text-orange"></i> 월간 거래 레포트 로그
					</a></li>
					<li class="nav-item"><a class="nav-link "
						href="${ pageContext.request.contextPath }/resources/assets/examples/profile.html">
							<i class="ni ni-single-02 text-yellow"></i> 카드 추가
					</a></li>

				</ul>
				<!-- Divider -->
				<hr class="my-3">
				<!-- Heading -->
				<h6 class="navbar-heading text-muted">하나금융그룹</h6>
				<!-- Navigation -->
				<ul class="navbar-nav mb-md-3">
					<li class="nav-item"><a class="nav-link"
						href="http://localhost:8080/DynamicHana/"> <i
							class="ni ni-spaceship"></i> 다이나믹하나
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="https://www.hanacard.co.kr/"> <i class="ni ni-palette"></i>
							하나카드
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="https://www.hanafn.com/main.do"> <i class="ni ni-ui-04"></i>
							하나금융그룹
					</a></li>
				</ul>
				<ul class="navbar-nav">

				</ul>
			</div>
		</div>
	</nav>
	<div class="main-content">
		<!-- Navbar -->
		<nav class="navbar navbar-top navbar-expand-md navbar-dark"
			id="navbar-main">
			<div class="container-fluid vertical_center">
				<!-- Brand -->
				<h3 class="display-3 color_white vertical_center pd-top-25">다이나믹하나
					관리자</h3>

				<!-- User -->
				<ul class="navbar-nav align-items-center d-none d-md-flex">
					<li class="nav-item dropdown"><a class="nav-link pr-0"
						href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">
							<div class="media align-items-center">

								<div class="media-body ml-2 d-none d-lg-block">
									<span class="mb-0 text-sm  font-weight-bold color_white">관리자님
										환영합니다.</span>
								</div>
							</div>
					</a>
						<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
							<div class=" dropdown-header noti-title">
								<h6 class="text-overflow m-0">Welcome!</h6>
							</div>
							<a
								href="${ pageContext.request.contextPath }/resources/assets/examples/profile.html"
								class="dropdown-item"> <i class="ni ni-single-02"></i> <span>My
									profile</span>
							</a> <a
								href="${ pageContext.request.contextPath }/resources/assets/examples/profile.html"
								class="dropdown-item"> <i class="ni ni-settings-gear-65"></i>
								<span>Settings</span>
							</a> <a
								href="${ pageContext.request.contextPath }/resources/assets/examples/profile.html"
								class="dropdown-item"> <i class="ni ni-calendar-grid-58"></i>
								<span>Activity</span>
							</a> <a
								href="${ pageContext.request.contextPath }/resources/assets/examples/profile.html"
								class="dropdown-item"> <i class="ni ni-support-16"></i> <span>Support</span>
							</a>
							<div class="dropdown-divider"></div>
							<a href="#!" class="dropdown-item"> <i class="ni ni-user-run"></i>
								<span>Logout</span>
							</a>
						</div></li>
				</ul>
			</div>
		</nav>
		<!-- End Navbar -->
		<!-- Header -->
		<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
			<div class="container-fluid">
				<div class="header-body">
					<!-- Card stats -->
					<div class="row">
						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">총
												회원 수</h5>
											<span class="h2 font-weight-bold mb-0"><c:out
													value="${ totalMember.cnt }" /> 명</span>
										</div>
										<div class="col-auto">
											<div
												class="icon icon-shape bg-yellow text-white rounded-circle shadow">
												<i class="fas fa-users"></i>
											</div>
										</div>

									</div>
									<p class="mt-3 mb-0 text-muted text-sm">
										<c:if test="${ totalMember.ratio +0 >= 0}">


											<span class="text-success mr-2"><i
												class="fa fa-arrow-up"></i> <c:out
													value="${ totalMember.ratio }" />%</span>
											<span class="text-nowrap">지난달 대비 <c:out
													value="${ totalMember.compareValue }" /> 명 증가
											</span>
										</c:if>
										<c:if test="${ totalMember.ratio +0 < 0}">


											<span class="text-danger mr-2"><i
												class="fas fa-arrow-down"></i> <c:out
													value="${ totalMember.ratio }" />%</span>
											<span class="text-nowrap">지난달 대비 <c:out
													value="${ totalMember.compareValue }" /> 명 감소
											</span>
										</c:if>

									</p>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">금일
												거래수</h5>
											<span class="h2 font-weight-bold mb-0"><c:out
													value="${ totalTransaction.cnt }" /> 건</span>
										</div>
										<div class="col-auto">
											<div
												class="icon icon-shape bg-warning text-white rounded-circle shadow">
												<i class="fas fa-chart-pie"></i>
											</div>
										</div>
									</div>
									<p class="mt-3 mb-0 text-muted text-sm">
										<c:if
											test="${ totalTransaction.cnt +0 >= totalTransaction.compareValue+0}">


											<span class="text-success mr-2"><i
												class="fa fa-arrow-up"></i> <c:out
													value="${ totalTransaction.ratio }" />%</span>
											<span class="text-nowrap">하루 전 대비 <c:out
													value="${ totalTransaction.cnt +0 - totalTransaction.compareValue+0  }" />
												건 증가
											</span>
										</c:if>
										<c:if
											test="${ totalTransaction.cnt +0 < totalTransaction.compareValue+0}">


											<span class="text-danger mr-2"><i
												class="fas fa-arrow-down"></i> <c:out
													value="${ totalTransaction.ratio }" />%</span>
											<span class="text-nowrap">하루 전 대비 <c:out
													value="${ totalTransaction.compareValue+0- totalTransaction.cnt +0  }" />
												건 감소
											</span>
										</c:if>

									</p>
								</div>
							</div>
						</div>


						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">금일
												총 거래액</h5>
											<span class="h2 font-weight-bold mb-0"> <fmt:formatNumber
													value="${ totalAmount.cnt }" pattern="#,###" /> 원
											</span>


										</div>
										<div class="col-auto">
											<div
												class="icon icon-shape bg-warning text-white rounded-circle shadow">
												<i class="fas fa-chart-pie"></i>
											</div>
										</div>
									</div>
									<p class="mt-3 mb-0 text-muted text-sm">
										<c:if
											test="${ totalAmount.cnt +0 >= totalAmount.compareValue+0}">


											<span class="text-success mr-2"><i
												class="fa fa-arrow-up"></i> <c:out
													value="${ totalTransaction.ratio }" />%</span>
											<span class="text-nowrap">하루 전 대비 <fmt:formatNumber
													value="${ totalAmount.cnt +0 - totalAmount.compareValue+0 }"
													pattern="#,###" /> 원 증가
											</span>
										</c:if>
										<c:if
											test="${ totalAmount.cnt +0 < totalAmount.compareValue+0}">


											<span class="text-danger mr-2"><i
												class="fas fa-arrow-down"></i> <c:out
													value="${ totalAmount.ratio }" />%</span>
											<span class="text-nowrap">하루 전 대비 <fmt:formatNumber
													value="${ totalAmount.compareValue+0- totalAmount.cnt +0 }"
													pattern="#,###" /> 원 감소
											</span>
										</c:if>

									</p>
								</div>
							</div>
						</div>

						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">형성된
												고객 군집</h5>
											<span class="h2 font-weight-bold mb-0"><c:out
													value="${ totalCluster.cnt }" /> 개</span>

										</div>
										<div class="col-auto">
											<div
												class="icon icon-shape bg-info text-white rounded-circle shadow">
												<i class="fas fa-percent"></i>
											</div>
										</div>
									</div>
									<p class="mt-3 mb-0 text-muted text-sm">
										<c:if
											test="${ totalCluster.cnt +0 >= totalCluster.compareValue+0}">


											<span class="text-success mr-2"><i
												class="fa fa-arrow-up"></i> <c:out
													value="${ totalCluster.cnt+0 - totalCluster.compareValue+0  }" />
												개</span>
											<span class="text-nowrap">지난달 대비 </span>
										</c:if>
										<c:if
											test="${ totalCluster.cnt +0 < totalCluster.compareValue+0}">


											<span class="text-danger mr-2"><i
												class="fas fa-arrow-down"></i> <c:out
													value="${ totalCluster.compareValue+0 - totalCluster.cnt+0  }" />
												개</span>
											<span class="text-nowrap">지난달 대비 </span>
										</c:if>

									</p>
								</div>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid mt--7">

			<div class="row">
				<div class="col-xl-8 mb-5 mb-xl-0">
					<div class="card bg-gradient-default shadow">
						<div class="card-header bg-transparent">
							<div class="row align-items-center">
								<div class="col">
									<h6 class="text-uppercase text-light ls-1 mb-1">하나카드 회원</h6>
									<h2 class="text-white mb-0">최근 7일 거래액</h2>
								</div>

							</div>
						</div>
						<div class="card-body">
							<!-- Chart -->
							<div class="chart">
								<!-- Chart wrapper -->
								<canvas id="myChart" class="chart-canvas"></canvas>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-4">
					<div class="card shadow">
						<div class="card-header bg-transparent">
							<div class="row align-items-center">
								<div class="col">
									<h6 class="text-uppercase text-muted ls-1 mb-1">하나카드 회원</h6>
									<h2 class="mb-0">최근 6개월 거래액</h2>
									<h6 class="mb-0">(단위 : 억)</h6>
								</div>
							</div>
						</div>
						<div class="card-body">
							<!-- Chart -->
							<div class="chart">
								<canvas id="myChart2" class="chart-canvas"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-5">
				<div class="col-xl-8 mb-5 mb-xl-0">
					<div class="card shadow">
						<div class="card-header border-0">
							<div class="row align-items-center">
								<div class="col">
									<h3 class="mb-0">TOP 10 카드</h3>
								</div>

							</div>
						</div>
						<div class="table-responsive">
							<!-- Projects table -->
							<table class="table align-items-center table-flush">
								<thead class="thead-light">
									<tr>
										<th scope="col">카드명</th>
										<th scope="col">총 회원</th>
										<th scope="col">이번달 가입 회원</th>
										<th scope="col">지난달 대비 가입자</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${requestScope.topTenCard }" var="topTenCard"
										varStatus="loop">
										<tr>
											<td scope="row"><c:out value="${ topTenCard.cardName }" /></td>
											<td><c:out value="${ topTenCard.cnt }" /></td>
											<td><c:out value="${ topTenCard.thisMonth }" /></td>

											<c:choose>
												<c:when
													test="${ topTenCard.thisMonth+0 > topTenCard.lastMonth+0}">
													<td><i class="fas fa-arrow-up text-success mr-3"></i>
														<c:out value="${ topTenCard.ratio }" /> %</td>
												</c:when>
												<c:when
													test="${ topTenCard.thisMonth+0 < topTenCard.lastMonth+0}">
													<td><i class="fas fa-arrow-down text-warning mr-3"></i>
														<c:out value="${ topTenCard.ratio }" /> %</td>
												</c:when>
											</c:choose>
										</tr>
									</c:forEach>

								</tbody>
								<%-- <tbody>
									<c:forEach items="${requestScope.memberCluster }"
										var="memberCluster" varStatus="loop">
										<tr>
											<td scope="row"><c:out
													value="${ memberCluster.clusterNo }" /></td>
											<td><c:out value="${ memberCluster.cnt }" /></td>
											<td><c:out value="${ memberCluster.category }" /></td>
											<td>링크</td>
										</tr>
									</c:forEach>

								</tbody> --%>
							</table>
						</div>
					</div>
				</div>
				<div class="col-xl-4">
					<div class="card shadow">
						<div class="card-header border-0">
							<div class="row align-items-center">
								<div class="col">
									<h3 class="mb-0">이번달 시간대별 소비</h3>
								</div>

							</div>
						</div>
						<div class="table-responsive">
							<!-- Projects table -->
							<table class="table align-items-center table-flush">
								<thead class="thead-light">
									<tr>
										<th scope="col">시간대</th>
										<th scope="col">소비 건수</th>
										<th scope="col"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">아침</th>
										<td><fmt:formatNumber
												value="${ consumptionTimeSolt.morning }" pattern="#,###" />
											건</td>
										<td>
											<div class="d-flex align-items-center">
												<span class="mr-2"><fmt:formatNumber
														value="${ consumptionTimeSolt.morning * 100 / consumptionTimeSolt.subTotal }"
														pattern="##" /> %</span>
												<div>
													<div class="progress">
														<div class="progress-bar bg-gradient-danger"
															role="progressbar"
															aria-valuenow="${ consumptionTimeSolt.morning * 200 / consumptionTimeSolt.subTotal }"
															aria-valuemin="0" aria-valuemax="100"
															style="width: ${ consumptionTimeSolt.morning * 200 / consumptionTimeSolt.subTotal }%;"></div>
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">점심</th>
										<td><fmt:formatNumber
												value="${ consumptionTimeSolt.lunch }" pattern="#,###" /> 건</td>
										<td>
											<div class="d-flex align-items-center">
												<span class="mr-2"><fmt:formatNumber
														value="${ consumptionTimeSolt.lunch * 100 / consumptionTimeSolt.subTotal }"
														pattern="##" /> %</span>
												<div>
													<div class="progress">
														<div class="progress-bar bg-gradient-success"
															role="progressbar"
															aria-valuenow="${ consumptionTimeSolt.lunch * 200 / consumptionTimeSolt.subTotal }"
															aria-valuemin="0" aria-valuemax="100"
															style="width: ${ consumptionTimeSolt.lunch * 200 / consumptionTimeSolt.subTotal }%;"></div>
													</div>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<th scope="row">저녁</th>
										<td><fmt:formatNumber
												value="${ consumptionTimeSolt.dinner }" pattern="#,###" />
											건</td>
										<td>
											<div class="d-flex align-items-center">
												<span class="mr-2"><fmt:formatNumber
														value="${ consumptionTimeSolt.dinner * 100 / consumptionTimeSolt.subTotal }"
														pattern="##" /> %</span>
												<div>
													<div class="progress">
														<div class="progress-bar bg-gradient-primary"
															role="progressbar"
															aria-valuenow="${ consumptionTimeSolt.dinner * 200 / consumptionTimeSolt.subTotal }"
															aria-valuemin="0" aria-valuemax="100"
															style="width: ${ consumptionTimeSolt.dinner * 200 / consumptionTimeSolt.subTotal }%;"></div>
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">야간</th>
										<td><fmt:formatNumber
												value="${ consumptionTimeSolt.night }" pattern="#,###" /> 건</td>
										<td>
											<div class="d-flex align-items-center">
												<span class="mr-2"><fmt:formatNumber
														value="${ consumptionTimeSolt.night * 100 / consumptionTimeSolt.subTotal }"
														pattern="##" /> %</span>
												<div>
													<div class="progress">
														<div class="progress-bar bg-gradient-info"
															role="progressbar"
															aria-valuenow="${ consumptionTimeSolt.night * 200 / consumptionTimeSolt.subTotal }"
															aria-valuemin="0" aria-valuemax="100"
															style="width: ${ consumptionTimeSolt.night * 200 / consumptionTimeSolt.subTotal }%;"></div>
													</div>
												</div>
											</div>
										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer -->
			<footer class="footer">
				<div class="row align-items-center justify-content-xl-between">
					<div class="col-xl-6">
						<div class="copyright text-center text-xl-left text-muted">
							&copy; 2018 <a href="https://www.creative-tim.com"
								class="font-weight-bold ml-1" target="_blank">Creative Tim</a>
						</div>
					</div>
					<div class="col-xl-6">
						<ul
							class="nav nav-footer justify-content-center justify-content-xl-end">
							<li class="nav-item"><a href="https://www.creative-tim.com"
								class="nav-link" target="_blank">Creative Tim</a></li>
							<li class="nav-item"><a
								href="https://www.creative-tim.com/presentation"
								class="nav-link" target="_blank">About Us</a></li>
							<li class="nav-item"><a href="http://blog.creative-tim.com"
								class="nav-link" target="_blank">Blog</a></li>
							<li class="nav-item"><a
								href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md"
								class="nav-link" target="_blank">MIT License</a></li>
						</ul>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<!--   Core   -->
	<script
		src="${ pageContext.request.contextPath }/resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Optional JS   -->
	<script
		src="${ pageContext.request.contextPath }/resources/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
	<script
		src="${ pageContext.request.contextPath }/resources/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
	<!--   Argon JS   -->
	<script
		src="${ pageContext.request.contextPath }/resources/assets/js/argon-dashboard.min.js?v=1.1.2"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "argon-dashboard-free"
		});
	</script>
</body>

</html>

