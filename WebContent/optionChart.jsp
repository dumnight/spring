<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Google chart</title>
</head>
<body>
<div style="width: auto; height: 200px; border: 1px solid red;">
	<form action="optionChart" method="post">
		<div>

			<div style="width: 10%; height: 100%; text-align:center; float: left">
				<div style="height: 70px"></div>
				<select name="selectlist"
					style="text-align: center; width: 100px; height: 60px; font-size: 20px; border: solid 1px blue; border-radius: 10px;">
					<option value="" selected>전체</option>
					<option value="10">서울</option>
					<option value="20">경기</option>
					<option value="30">인천</option>
					<option value="40">평택</option>
					<option value="50">울산</option>
					<option value="60">대전</option>
					<option value="70">부산</option>
					<option value="80">광주</option>
					<option value="90">제주</option>
				</select>
				<div style="height: 70px"></div>
			</div>

			<div style="width: 60%; height: 100%; float: left; padding:10px;">
				<div style="width: 100%; height: 50px"> </div>
				<div style="width: 100%; height: 40%;text-align: center; border: 1px solid blue;">
					<label class="radio-inline" style="width: 100px; height: 100%;"><input type="radio" checked name="datagr" value="" style="width: 30px; height: 30px; font-size: 30px;">전체</label> 
					<label class="radio-inline" style="width: 100px; height: 100%;"><input type="radio" name="datagr" value="00" style="width: 30px; height: 30px; font-size: 30px; margin: auto;">DATA</label>
					<label class="radio-inline" style="width: 100px; height: 100%;"><input type="radio" name="datagr" value="01" style="width: 30px; height: 30px; font-size: 30px; margin: auto;">중간총계</label>
					<label class="radio-inline" style="width: 100px; height: 100%;"><input type="radio" name="datagr" value="11" style="width: 30px; height: 30px; font-size: 30px; margin: auto;">총계</label>
				</div>
				<div style="width: 100%; height: 10px;"> </div>
				<div style="width: 100%; height: 40%; text-align: center; border: 1px solid blue;">
					<label for="usr" style="width: 40px;">서울<input name="areacode1" type="text" class="form-control" id="usr" value="1"></label> 
					<label for="usr" style="width: 40px;">경기<input name="areacode2" type="text" class="form-control" id="usr" value="2"></label>
					<label for="usr" style="width: 40px;">인천<input name="areacode3" type="text" class="form-control" id="usr" value="3"></label>
					<label for="usr" style="width: 40px;">평택<input name="areacode4" type="text" class="form-control" id="usr" value="4"></label> 
					<label for="usr" style="width: 40px;">울산<input name="areacode5" type="text" class="form-control" id="usr" value="5"></label> 
					<label for="usr" style="width: 40px;">대전<input name="areacode6" type="text" class="form-control" id="usr" value="6"></label> 
					<label for="usr" style="width: 40px;">부산<input name="areacode7" type="text" class="form-control" id="usr" value="7"></label> 
					<label for="usr" style="width: 40px;">광주<input name="areacode8" type="text" class="form-control" id="usr" value="8"></label>
					<label for="usr" style="width: 40px;">제주<input name="areacode9" type="text" class="form-control" id="usr" value="9"></label>
				</div>
			</div>
			<div style="width: 20%; height: 100%;float: left; text-align: left; margin-left: 20px 1px solid red; ">
			<div style="height: 20px"></div>
			<DIV style="width: 100%; height: 40%; border: 1px solid blue;">
				<label class="radio-inline" style="width: 100%;">
				<input type="radio" checked name="orderdata" value="f" style="width: 30px; height: 30px; font-size: 30px; margin: auto;">DATA우선</label>
				<label class="radio-inline" style="width: 100%;">
				<input type="radio" name="orderdata" value="F" style="width: 30px; height: 30px; font-size: 30px; margin: auto;">총계우선</label>
			</DIV>
			<div style="width: 100%; height: 10px;"> </div>
			<DIV style="width:100%; height: 40%">
				<label for="cnt" style="width: 100%; height: 100%; font-size: 40px;">건수<input name="cntdata" type="text" id="cnt" style="width: 50%; height: 60px; font-size: 40px;" value="1000"></label>
				
			</DIV>
			<div style="height: 20px"></div>
			
			</div>
			<div
				style="width: 10%	; height: 200px; float: right;">
				<div style="width: 140px; height: 130px;"></div>
				<div style="width: 140px; height: 70px;">
					<button id="btn1" class="btn btn-lg btn-default" style="width: 120">검색</button>
				</div>

			</div>
		</div>
		

	
	<div style="width:100%; height:50px; display: inline-block;  border: 5px solid gree; text-align: center">
	<input style="height: 80opx; width: 150px; background-color:yellow; font-size: 15px" id="totalt" type="text" value="asd" readonly="readonly">
	</div>
	
	
	</form>
		
	<div style="width: 100%;">
		<div style="width: 45%;display: inline-block;text-align: center; float: left" id="chart_div"></div>
		<div id="columnchart_values" style="width: 45%; text-align: center; display: inline-block; float:right;" ></div>
	</div>
		
	<table width="100%" cellpadding="0" cellspacing="0" border="1">
		<tr style="height: 50px;text-align: center;font-size: 20px">
			<td>판매</td>
			<td>구매</td>
			<td>청소기</td>
			<td>세탁기</td>
			<td>건조기</td>
			<td>정수기</td>
			<td>도어락</td>
			<td>전화기</td>
			<td>냉장고</td>
			<td>김치냉장고</td>
			<td>전자레인지</td>
			<td>가스레인지</td>
			<td>TOT</td>
		<tr>		
	</table>
</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script>
		var ntime = window.performance.timing;

		var total = ntime.unloadEventStart - ntime.navigationStart; //전체 소요시간
		var redirect = ntime.redirectEnd - ntime.redirectStart; // 동일 origin에서의 redirect 시간
		var cache = ntime.domainLookupStart - ntime.fetchStart; // cache 시간
		var dnslookup = ntime.domainLookupEnd - ntime.domainLookupStart; //DNS Lookup 시간
		var connect = ntime.connectEnd - ntime.connectStart; // 웹서버 연결 시간
		var request = ntime.responseStart - ntime.requestStart; // 요청 소요 시간
		var response = ntime.responseEnd - ntime.responseStart; // 응답 데이터를 모두 받은 시간
		var dom = ntime.domComplete - ntime.domLoading; // DOM객체 생성 시간 *******************
		var load = ntime.loadEventEnd - ntime.loadEventStart; // 브라우저의 Load 이벤트 실행시간
		var pageEnd = ntime.loadEventEnd - ntime.responseEnd; //  서버에서 페이지를 받고 페이지를 로드하는데 걸린 시간
		var networkDelay = ntime.responseEnd - ntime.fetchStart; //  네트워크 지연 시간

		$(document).ready(function() {
			document.getElementById('totalt').value ="경과 시간  " + Math.floor(total/1000) + "  SEC";
			console.log(total);
		});
		
	</script>
	</body>
</html>