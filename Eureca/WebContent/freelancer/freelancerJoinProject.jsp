<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로젝트 참여신청</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="css/dropdown.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/frame/header.jsp"></jsp:include>
	<section id="container" class="">
		<section id="main-content">
			<section class="wrapper">
				<form method="post" action="FreelancerServ" id="frm" name="frm">
					<input type="hidden" name="command" value="freelancer_join_project">
					<div class="col-lg-8">
						<section class="panel">
							<header class="panel-heading no-border"> 프로젝트 검색 </header>
							<table class="table table-bordered align-middle">
								<tr>
									<th>프로젝트 명</th>
									<td><input type="text" name="projNameSearch"
										class="col-lg-8" value="${projName}"></td>
								</tr>
								<tr>
									<th>개발분야</th>
									<td><ul class="table-custom col-lg-12">
											<c:set var="devCheck" value="" />
											<c:forEach var="devName" items="${devCount}">
												<c:choose>
													<c:when test="${devName eq '웹'}">
														<c:set var="devCheck1" value="checked" />
													</c:when>
													<c:when test="${devName eq '안드로이드'}">
														<c:set var="devCheck2" value="checked" />
													</c:when>
													<c:when test="${devName eq '엠베디드'}">
														<c:set var="devCheck3" value="checked" />
													</c:when>
													<c:when test="${devName eq '응용프로그램'}">
														<c:set var="devCheck4" value="checked" />
													</c:when>
													<c:when test="${devName eq '안드로이드2'}">
														<c:set var="devCheck5" value="checked" />
													</c:when>
												</c:choose>
											</c:forEach>
											<li><input type="checkbox" name="devFieldSearch"
												value="웹" ${devCheck1} id="web"><label for="web">웹</label></li>
											<li><input type="checkbox" name="devFieldSearch"
												value="안드로이드" ${devCheck2} id="android"><label
												for="android">안드로이드</label></li>
											<li><input type="checkbox" name="devFieldSearch"
												value="엠베디드" ${devCheck3} id="embedded"><label
												for="embedded">엠베디드</label></li>
											<li><input type="checkbox" name="devFieldSearch"
												value="응용프로그램" ${devCheck4} id="application"><label
												for="application">응용프로그램</label></li>
											<li><input type="checkbox" name="devFieldSearch"
												value="안드로이드2" ${devCheck5} id="android2"><label
												for="android2">안드로이드2</label></li>
										</ul>
								</tr>
								<tr>
									<th>사용언어</th>
									<td>
										<ul class="table-custom col-lg-12">
											<c:forEach var="langIter" items="${langList}">
												<c:set var="langCheck" value="" />
												<c:forEach var="langName" items="${langCount}">
													<c:if test="${langName eq langIter.langName}">
														<c:set var="langCheck" value="checked" />
													</c:if>
												</c:forEach>
												<li><input type="checkbox" name="progLangSearch"
													value="${langIter.langName}" ${langCheck}
													id="${langIter.langName}"><label
													for="${langIter.langName}">${langIter.langName}</label> <c:set
														var="langCheck" value="" /></li>
											</c:forEach>
										</ul>
									</td>
								</tr>
								<tr>
									<th>DBMS</th>
									<td>
										<ul class="table-custom col-lg-12">
											<c:forEach var="DBMSIter" items="${dbmsList}">
												<c:set var="langCheck" value="" />
												<c:forEach var="dbName" items="${dbCount}">
													<c:if test="${dbName eq DBMSIter.dbName}">
														<c:set var="langCheck" value="checked" />
													</c:if>
												</c:forEach>
												<li><input type="checkbox" name="DBMSSearch"
													value="${DBMSIter.dbName}" ${langCheck}
													id="${DBMSIter.dbName}"><label
													for="${DBMSIter.dbName}">${DBMSIter.dbName}</label> <c:set
														var="langCheck" value="" /></li>
											</c:forEach>

										</ul>
									</td>
								</tr>
								<tr>
									<th>TOOL/framework</th>
									<td><ul class="table-custom col-lg-12">
											<c:forEach var="tfwIter" items="${frameList}">
												<c:set var="langCheck" value="" />
												<c:forEach var="frameName" items="${tfwCount}">
													<c:if test="${frameName eq tfwIter.frameName}">
														<c:set var="langCheck" value="checked" />
													</c:if>
												</c:forEach>
												<li><input type="checkbox" name="TOOLfwSearch"
													value="${tfwIter.frameName}" ${langCheck}
													id="${tfwIter.frameName}"><label
													for="${tfwIter.frameName}">${tfwIter.frameName}</label> <c:set
														var="langCheck" value="" /></li>
											</c:forEach>
										</ul></td>
								</tr>
								<tr>
									<th>기간</th>
									<td><input type="text" class="datepicker" name="period1"
										value="${time1}"> - <input type="text"
										class="datepicker" name="period2" value="${time2}"></td>
								<tr>
									<td colspan="2" class="align-right"><input type="button"
										value="검색" onclick="search()"><input type="hidden" name="result" value="${result}"></td>
								</tr>
							</table>
						</section>
					</div>
					<div class="clear"></div>
					<c:if test="${result != 0}">
					<div class="col-lg-10">
						<section class="panel">
							<header class="panel-heading no-border">
								검색결과<select name="order" onchange="onSubmit()">
									<option value="" ${order eq "" ? "selected" :""}>선택하세요</option>
									<option value="등록일" ${order eq "등록일" ? "selected" :""}>등록일</option>
									<option value="시작일" ${order eq "시작일" ? "selected" :""}>시작일</option>
									<option value="종료(예정)일" ${order eq "종료(예정)일" ? "selected" :""}>종료(예정)일</option>
									<option value="남은기간" ${order eq "남은기간" ? "selected" :""}>남은기간</option>
								</select>
							</header>

							<c:forEach var="pSelectViewList" items="${projViewList}" varStatus="projView">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											${pSelectViewList.projName}<input
												type="hidden" name="projName"
												value="${pSelectViewList.projName}">(등록일:${pSelectViewList.projRegisterDate})/${pSelectViewList.projState}
										</h4>
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion" href="#collapse${projView.index}">
											<table class="table table-bordered">
												<tr>
													<th>개발분야</th>
													<td colspan="">${pSelectViewList.projDevelopSort}<input
														type="hidden" name="projDevelopSort"
														value="${pSelectViewList.projDevelopSort}"></td>
													<th>시작일</th>
													<td>${pSelectViewList.projStartDate}<input
														type="hidden" name="projStartDate"
														value="${pSelectViewList.projStartDate}"></td>
													<th>예상기간</th>
													<td>${pSelectViewList.projExpectedTime}<input
														type="hidden" name="projExpectedTime"
														value="${pSelectViewList.projExpectedTime}"></td>
													<th>종료일</th>
													<td colspan="">${pSelectViewList.projEndDate}<input
														type="hidden" name="projEndDate"
														value="${pSelectViewList.projEndDate}"></td>
												</tr>

												<tr>
													<th>참여인원</th>
													<td colspan="">${pSelectViewList.joinFLCount}<input
														type="hidden" name="joinFLCount"
														value="${pSelectViewList.joinFLCount}"></td>
													<th>고객사</th>
													<td colspan="5">${pSelectViewList.projTarget}<input
														type="hidden" name="projTarget"
														value="${pSelectViewList.projTarget}"></td>
												</tr>
												<tr>
													<th>사용언어</th>
													<td colspan=""><c:forEach var='projLangList'
															items="${pSelectViewList.langs}" varStatus="status">
			${projLangList.langName}<c:if test="${not status.last}">/</c:if>
															<input type="hidden" name="langName"
																value="${projLangList.langName}">
														</c:forEach></td>
													<th>DBMS</th>
													<td colspan="">${pSelectViewList.usedDbName}<input
														type="hidden" name="usedDbName"
														value="${pSelectViewList.usedDbName}"></td>
													<th>TOOL/framework</th>
													<td colspan="3"><c:forEach var='projFrameList'
															items="${pSelectViewList.frames}" varStatus="status">
			${projFrameList.frameName}<c:if test="${not status.last}">/</c:if>
															<input type="hidden" name="frameName"
																value="${projFrameList.frameName}">
														</c:forEach></td>
												</tr>
											</table>
										</a>
									</div>
									<div id="collapse${projView.index}" class="panel-collapse collapse">
										<div class="panel-body">
											<table class="table table-bordered">
												<tr>
													<th>세부내용</th>
													<td colspan="7"><textarea rows="10" cols="80"
															name="projPlan" readonly>${pSelectViewList.projPlan}</textarea>
												</tr>
												<tr>
													<td colspan="8"><input type="button" value="참여신청"
														onclick="apply('${pSelectViewList.projNum}', '${pagenNum}')"></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</c:forEach>
						</section>
					</div>
					<div class="clear"></div>
					<table>
						<tr>
							<td colspan="7" class="align-center"><a href="#"
								onclick="projPrePageSelect('${pagenNum}')">이전</a> <c:forEach
									var="pageNumIter" begin="${firstPage}" end="${lastPage}">
									<input type="hidden" name="first" value="${firstPage}">
									<input type="hidden" name="last" value="${lastPage}">
									<input type="hidden" name="pageNum" value="${pageNumIter}">
									<a href="#" onclick="projPageSelect('${pageNumIter}')">
										${pageNumIter} </a>
								</c:forEach> <a href="#"
								onclick="projNextPageSelect('${pageNum}','${lastPage}')">다음</a></td>
						</tr>
					</table>
					</c:if>
				</form>
			</section>
		</section>
	</section>

	<jsp:include page="/frame/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/Eureca/script/dropdown.js"></script>
	<script type="text/javascript" src="/Eureca/script/freelancer.js"></script>
</body>
</html>