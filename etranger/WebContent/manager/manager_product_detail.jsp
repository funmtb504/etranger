<%@page import="manager.vo.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="manager.vo.CategoryBean"%>
<%@page import="java.util.Locale.Category"%>
<%@page import="manager.dao.ManagerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<CategoryBean> regionList = (ArrayList<CategoryBean>) request.getAttribute("regionList");
	ArrayList<CategoryBean> themeList = (ArrayList<CategoryBean>) request.getAttribute("themeList");
	ArrayList<CategoryBean> productList = (ArrayList<CategoryBean>) request.getAttribute("productList");
	ArrayList<CategoryBean> pdetail = (ArrayList<CategoryBean>) request.getAttribute("pdetail");
	ArrayList<ProductBean> pdList = (ArrayList<ProductBean>) request.getAttribute("pdList");
	String code = "";
	String image = "";
	String name = "";
	String content = "";
	String theme = "";
	int region_code = 0;
	int city_code = 0;
	for (int i = 0; i < pdetail.size(); i++) {

		code = pdetail.get(i).getPackage_category_code();
		image = pdetail.get(i).getPackage_category_image();
		name = pdetail.get(i).getPackage_category_name();
		content = pdetail.get(i).getPackage_category_content();
		theme = pdetail.get(i).getPackage_category_theme();
		region_code = pdetail.get(i).getPackage_category_region();
		city_code = pdetail.get(i).getPackage_category_city();
	}
%>




<!DOCTYPE html>
<html lang="en">

<head>
<!-- 스타일 인클루드 -->
<jsp:include page="../include/style.jsp" />
<style type="text/css">
table.pdList {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    margin: 20px 10px;
    width: 115%;
}
table.pdList th {
    width: 155px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #ff5f5f ;
}
table.pdList td {
    width: 155px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #eee;
}
</style>
</head>
<%-- <body onload="checkSession(<%=sid%>)"> --%>

<body>

	<!-- 탑메뉴 인클루드 -->
	<jsp:include page="../include/top_menu.jsp" />

	<section class="home-slider owl-carousel">
		<div class="slider-item"
			style="background-image: url('images/bg_3.jpg');"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div class="row slider-text align-items-center">
					<div class="col-md-7 col-sm-12 ftco-animate">
						<p class="breadcrumbs">
							<span class="mr-2"><a href="../main/index.jsp"></a></span> <span><a
								href="blog.html"></a></span> <span></span>
						</p>
						<h1 class="mb-3">상품 상세페이지</h1>
						<br>

					</div>


				</div>
			</div>
		</div>
	</section>

	<!-- END slider -->

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-md-8 ftco-animate">

					<!--  글 작성 폼 시작 -->
					<div class="managerdetailform">
						<h3 class="mb-5">상품 상세 페이지</h3>
					</div>

					<div class="writeform-group">
						<label for="image">이미지</label><a href="#" class="block-20"
							style="background-image: url('ManagerImgUpload/<%=image%>'
										);">
						</a>
					</div>

					<div class="writeform-group">
						<br> <label for="code">상품코드</label><input type="text"
							class="form-control" name="product_code" id="product_code_id"
							value="<%=code%>" />
					</div>

					<br>
					<div class="writeform-group">
						<label for="code">지역코드</label><input type="text"
							class="form-control" name="product_region_code"
							id="product_region_code_id" value="<%=region_code%>" />
					</div>

					<br>
					<div class="writeform-group">
						<label for="code">도시코드</label><input type="text"
							class="form-control" name="product_city_code"
							id="product_city_code_id" value="<%=city_code%>" />
					</div>

					<br>
					<div class="writeform-group">
						<label for="name">상품명</label> <input type="text"
							class="form-control" name="product_name" id="product_name_id"
							value="<%=name%>" />
					</div>

					<br>
					<div class="writeform-group">
						<label for="name">상품테마</label> <input type="text"
							class="form-control" name="product_theme" id="product_theme_id"
							value="<%=theme%>" />
					</div>

					<div class="writeform-group">
						<br> <label for="name">상세내용</label> <br>
						<textarea name="Product_Detail_content" cols="72" rows="20"><%=content%></textarea>
					</div>

					<div class="writeform-group">
						<br>
						<h3><label for="name">날짜별 상품</label></h3>


						<table class="pdList">
							<%
								if (pdList != null) {
							%>
							<tr id="tr_top">
								<th>상품코드</th>
								<th>출발날짜</th>
								<th>도착날짜</th>
								<th>가격</th>
								<th>총인원수</th>
								<th>제어</th>
								
							</tr>

							<%
								for (int i = 0; i < pdList.size(); i++) {
							%>
							<tr>
								<td><%=pdList.get(i).getProductNum()%></td>
								<td><%=pdList.get(i).getProductDepartDate()%></td>
								<td><%=pdList.get(i).getProductArrivDate()%></td>
								<td><%=pdList.get(i).getProductPrice()%></td>
								<td><%=pdList.get(i).getProductTotal()%></td>
								<td><input type="button" onclick="deleteList.ma?pdList=<%=pdList.get(i).getProductNum()%>" value="delete"></td>
							</tr>
							<%
								}
								}
							%>
						</table>

					</div>

					<div class="form-group">
						<input type="button" value="날짜별 패키지상품 추가하기" class="btn py-3 px-4 btn-primary"
							onclick="location.href='ProductInsert.ma?package_category_code=<%=code%>'">
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- .section -->

	<!-- footer 인클루드 -->
	<jsp:include page="../include/footer.jsp" />

	<!-- loader 인클루드 -->
	<jsp:include page="../include/loader.jsp" />

</body>

</html>