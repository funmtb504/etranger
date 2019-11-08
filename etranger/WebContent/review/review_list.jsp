<%@page import="review.vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="review.vo.ReviewBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 전달받은 request 객체로부터 데이터 가져오기
	// "pageInfo" 객체와 "articleList" 객체를 request 객체로부터 꺼내서 저장
	// "pageInfo" 객체로부터 페이지 관련 값들을 꺼내서 변수에 저장
	ArrayList<ReviewBean> articleList = (ArrayList<ReviewBean>)request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int listCount = pageInfo.getListCount();
%>  
<!DOCTYPE html>
<html>
  <head>
	<!-- 스타일 인클루드 -->
<jsp:include page="/include/style.jsp"/>
  </head>
  <body>
	<!-- 탑메뉴 인클루드 -->    
<jsp:include page="/include/top_menu.jsp"/>
    
    <section class="home-slider owl-carousel">
      <div class="slider-item" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
          <div class="row slider-text align-items-center">
            <div class="col-md-7 col-sm-12 ftco-animate">
              <p class="breadcrumbs"><span class="mr-2"><a href="../main/index.jsp">Home</a></span></p>
              <h1 class="mb-3">여행후기 모음</h1>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- END slider -->
    <section class="ftco-section bg-light">
			<%
			if(articleList != null && listCount > 0) {%>
      <div class="container">
        <div class="row">
			<!--리스트에서 보여지는 게시물 썸네일 한 덩이 시작 -->
				<%for(int i=0; i<articleList.size(); i++) {%>
          <div class="col-md-6 col-lg-3 ftco-animate">
            <div class="blog-entry">
              <a href="ReviewDetail.rv?num=<%=articleList.get(i).getReview_num()%>" class="block-20" style="background-image: url('reviewUpload/<%=articleList.get(i).getReview_image()%>');">
              </a>
              <div class="text p-4" >
                <div class="meta" onclick="location.href='ReviewDetail.rv?num=<%=articleList.get(i).getReview_num()%>'">
<%--                   <div><a href="#"><%=articleList.get(i).getReview_date()%></a></div> --%>
                  <div><a href="ReviewDetail.rv?num=<%=articleList.get(i).getReview_num()%>"><%=articleList.get(i).getReview_member_id()%></a></div><!-- 아이디 대신 이름 들어갈 곳 -->
                </div>
                <h3 class="heading"><a href="ReviewDetail.rv?num=<%=articleList.get(i).getReview_num()%>"><%=articleList.get(i).getReview_content()%></a></h3>
                <p class="clearfix">
                  <a href="ReviewDetail.rv?num=<%=articleList.get(i).getReview_num()%>" class="float-left"><%=articleList.get(i).getReview_date()%></a>
                  <a href="ReviewDetail.rv?num=<%=articleList.get(i).getReview_num()%>" class="float-right meta-chat"><span class="icon-chat"></span>댓글 수 </a>
                </p>
              </div>
            </div>
          </div>
				<%}%>
          <!-- 리스트에서 보여지는 게시물 썸네일 한 덩이 끝 -->
        </div> <!-- <div class="row">의 끝 -->
		<!-- 페이지 부분 -->
        <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
            <%if(nowPage<=1){%>
            <li><a>&lt;</a></li>
            <%}else
            {%><li><a href="ReviewList.rv?page=<%=nowPage -1%>">&lt;</a></li><%} %>
            	<%for(int i=startPage; i<=endPage; i++) {
            	if(i== nowPage) {%><li class="active"><span><%=i %></span></li>
            	<%}else{%>
                <li><a href="ReviewList.rv?page=<%=i%>"><%=i %></a></li>
                <%}%>
                <%}%>
                <%if(nowPage>=maxPage){%><li><a>&gt;</a></li>
                <%}else{ %>
                <li><a href="ReviewList.rv?page=<%=nowPage +1%>">&gt;</a></li>
                <%} %>
              </ul>
            </div>
          </div>
        </div>
        <!-- 페이지 부분 -->
	<%}else{%><div id="emptyArticle">등록된 글이 없습니다</div><%} %>
      </div> <!-- <div class="container">의 끝 -->
    </section>
    
<!--     <li class="active"><span>1</span></li> -->

	<!-- footer 인클루드 -->
<jsp:include page="/include/footer.jsp"/>

	<!-- loader 인클루드 -->
<jsp:include page="/include/loader.jsp"/>
    <script type="text/javascript">
$('h3.heading').each(function(){
	 
	  var length = 18; //표시할 글자수 정하기
	  
	  //전체 옵션을 자를 경우
	  $(this).each(function(){
	   if( $(this).text().length >= length ){
	    $(this).text($(this).text().substr(0,length)+'...'); //지정한 글자수 이후 표시할 텍스트(...)
	   }
	  });
	  
	 });
</script>
  </body>
</html>