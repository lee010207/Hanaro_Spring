<%--
  Created by IntelliJ IDEA.
  User: 졍
  Date: 2024-04-18
  Time: 오전 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value="/css/admin/admin.css"/>" />
<script>
    function selecLimit() {
        // 선택된 옵션의 값을 가져옵니다.
        var page = $("#selecPage").val();

        if(page == 0){
            console.log("전체보기");
            location.href='/admin/notice';
        }else{
            location.href="/admin/noticePage/"+page;
        }
    }
    function selecSort() {
        // 선택된 옵션의 값을 가져옵니다.
        var sort = $("#selecOrder").val();

        location.href='/admin/noticeSort?sort='+sort;

    }

    $(document).ready(function() {
        $("#searchbtn").click(function() {
            var searchOption = $("#searchAdmin").val();
            var keyword = $("#search_keyword").val();

            $.ajax({
                url: "/admin/search",
                method: "GET",
                data: {
                    searchOption: searchOption,
                    keyword: keyword
                },
                success: function(response) {
                    displaySearchResult(response);
                },
                error:(e)=>{
                    console.log(e);
                }
            });
        });
    });

    function displaySearchResult(results) {

        var resultTable = $("#search_results_body");
        // resultTable.empty();
        var newRow = "";

        results.forEach((resultItem)=>{
            newRow+="<tr>";
            newRow+="<td>" + resultItem.noticeIdx + "</td>";
            newRow+= "<td><a href='/admin/modify?idx=" + resultItem.noticeIdx + "'>" + resultItem.noticeTitle + "</a>";
            newRow+= "<td>" + resultItem.noticeMemberId + "</td>";
            newRow+= "<td>" + resultItem.noticeDate+ "</td>";
            newRow+="</tr>";
        });
        resultTable.html(newRow);
    }

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
            <li><a href="<c:url value="/admin/member"/>" class="adminSideActive">회원 관리</a></li>
            <li><a href="<c:url value="/admin/notice"/>">공지사항 관리</a></li>
            <li><a href="#">1:1문의 관리</a></li>
            <li><a href="#">묻고답하기 관리</a></li>
            <li><a href="#">FAQ 관리</a></li>
            <li><a href="#">제품 관리</a></li>
        </ul>
    </div>
    <!-- 메인 -->
    <div id="adminSection">
        <div class="adminDiv">
            <h3>공지사항 관리</h3>
        </div>
        <div class="adminDiv">
            검색 옵션
            <select name="searchAdmin" id="searchAdmin">
                <option value="0" selected>전체</option>
                <option value="1">제목</option>
                <option value="2">내용</option>
                <option value="3">작성자아이디</option>
            </select>
            <input type="text" name="search_keyword" id="search_keyword" value="">
            <input type="image" src="<c:url value="/img/community/search.gif"/>" id="searchbtn">
        </div>
        <div class="adminDiv">
            <select class="size" name="selecOrder" id="selecOrder" onchange="selecSort()">
                <option selected>정렬</option>
                <option value="1">아이디 오름차순</option>
                <option value="2">아이디 내림차순</option>
                <option value="3">등록일 오름차순</option>
                <option value="4">등록일 내림차순</option>
            </select>
        </div>
        <div class="adminDiv2" id="tableTitle">
            <div>목록 ${noticeinfo.size()}건</div>
            <div>
                <select class="size" name="selecPage" id="selecPage" onchange="selecLimit()">
                    <option selected>한페이지 행수</option>
                    <option value="0">전체보기</option>
                    <option value="5">5개씩 보기</option>
                    <option value="10">10개씩 보기</option>
                </select>
            </div>
        </div>
        <div class="">
            <table class="adminTable">
                <thead>
                <tr>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>글쓴이</th>
                    <th>작성일</th>
                </tr>
                </thead>
                <tbody id="search_results_body">
                <c:forEach items="${noticeinfo}" var="c">
                    <tr>
                        <td>${c.noticeIdx}</td>
                        <td><a href="<c:url value="/admin/modify"/>?idx=${c.noticeIdx}">${c.noticeTitle}</a></td>
                        <td>${c.noticeMemberId}</td>
                        <td>${c.noticeDate}</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

        <div class="pageNav adminDiv2">
            <div></div>
            <div>
                <a href="/admin_notice?page=1">처음</a>
                <a href="/admin_notice?page=1">이전</a>
                <a href="/admin_notice?page=1">1</a>
                <a href="/admin_notice?page=2">2</a>
                <a href="/admin_notice?page=3">3</a>
                <a href="/admin_notice?page=2">다음</a>
                <a href="/admin_notice?page=3">마지막</a>
            </div>
            <div><a href="<c:url value="/admin/write"/>">공지글 쓰기</a></div>
        </div>
    </div>
</div>
