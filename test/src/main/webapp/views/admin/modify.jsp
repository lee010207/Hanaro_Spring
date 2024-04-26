<%--
  Created by IntelliJ IDEA.
  User: 졍
  Date: 2024-04-18
  Time: 오전 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value="/css/admin/admin.css"/>">
<script>
    /*$("#regNotice").click(()=>{
        <%--let adminId = '${sessionScope.adminId}';--%>
        let title = $('#noticeTitle').val();
        let content = $('textarea[name="noticeContent"]').val();

        $.ajax({
            url:'/admin/writeImpl',
            success:()=>{
                alert("공지사항 등록 완료");
                location.href="/admin/notice";
            },
            error:(e)=>{
                console.log(e);
            }
        });
    })*/
</script>
<!-- 메인 -->
<!-- COMMON -->

<div class="commonSection1">
    <div class="commonContent1">
        <img src="<c:url value="/img/member/sub-visual01.jpg"/>"
             style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>관리자페이지</h3>
            </div>
            <div>
                <p><img src="<c:url value="/img/icon-home.png"/>"> > 관리자페이지</p>
            </div>
        </div>
    </div>
</div>

<div id="adminMain">
    <!-- 사이드메뉴 -->
    <div id="adminSide">
        <ul>
            <li><a href="<c:url value="/admin/member"/>">회원 관리</a></li>
            <li><a href="<c:url value="/admin/notice"/>" class="adminSideActive">공지사항 관리</a></li>

        </ul>
    </div>
    <!-- 메인 -->
    <div id="adminSection">
        <div class="adminDiv">
            <h3>공지사항 관리</h3>
        </div>
        <form action="/admin/modifyImpl" method="post">
            <input name="noticeIdx" value="${modifyinfo.noticeIdx}" type="hidden">
            <div class="noticeWriteTitle adminDiv2">
                <table style="width: 100%;">
                    <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                    </tr>

                    </thead>
                    <tbody>
                        <tr>
                            <td>${modifyinfo.noticeIdx}</td>
                            <td>${modifyinfo.noticeTitle}</td>
                            <td>${modifyinfo.noticeMemberId}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="adminDiv2">
                <textarea rows="5" cols="50" id="editor4" name="noticeContent">${modifyinfo.noticeContent}</textarea>

            </div>
            <div class="noticeWriteBtns adminDiv2">
                <input type="submit" id="modiNotice" value="수정">
                <input type="button" onclick="history.back()" value="취소">
            </div>
        </form>

    </div>
</div>


<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<!-- <script>CKEDITOR.replace('editor4');</script> -->
<script>
    var ckeditor_config = {
        resize_enaleb : false,
        enterMode : CKEDITOR.ENTER_BR,
        shiftEnterMode : CKEDITOR.ENTER_P,
        filebrowserUploadUrl : "/ckUpload"
    };
    CKEDITOR.replace("editor4", ckeditor_config);
</script>

