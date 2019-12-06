<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>codeomni.tistory.com 모달 소스 코드</title>
        
        <style>
        </style>
    </head>
    <body>  
    <jsp:include page="../include/style.jsp"/>  
        <button data-toggle="modal" data-target="#intro">
            모달 실행
        </button>
        <div class="modal fade" id="intro" role="dialog" aria-labelledby="introHeader" aria-hidden="true" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">공지 사항</h4>
                    </div>
                    <div class="modal-body">
                        <p>안녕하세요.</p>
                        <p>codeomni 입니다. 방문해주셔서 감사합니다. 궁금하신 사항이나 문의 사항은 방명록에 공개 또는 비공개로 남겨주세요.</p>
                        <p>블로그 주소는 http://codeomni.tistory.com/입니다.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../include/loader.jsp"/>
    </body>
    
</html>
