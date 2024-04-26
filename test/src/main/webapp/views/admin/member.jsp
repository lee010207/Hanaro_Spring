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
    let memberPage = function (){
        $("#selecPage").change(()=>{
            // 선택된 옵션의 값을 가져옵니다.
            let page = $("#selecPage").val();

            if(page == 0){
                location.href='/admin/member';
            }else{
                location.href="/admin/memberPage/"+page;
            }

        });
    }

    let memberSort = function () {

        $("#selecOrder").change(function (){
            // 선택된 옵션의 값을 가져옵니다.
            var sort = $(this).val();
            location.href='/admin/memberSort?sort='+sort;
        })

    }
    let memberSearch = function (){
        $("#searchbtn").click(function() {
            var searchOption = $("#searchAdmin").val();
            var keyword = $("#search_keyword").val();

            $.ajax({
                url: "/admin/member/search",
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
    }

    $(document).ready(function() {
        memberPage();
        memberSearch();
        memberSort();

    });

    function displaySearchResult(results) {
        var resultTable = $("#search_results_body");
        resultTable.empty(); // 기존 내용을 비웁니다.

        // 결과를 테이블에 추가합니다.
        results.forEach((resultItem) => {
            var newRow = $("<tr>");

            var cell1 = $("<td>").text(resultItem.memberId);
            newRow.append(cell1);

            var cell2 = $("<td>").text(resultItem.memberName);
            newRow.append(cell2);

            var cell3 = $("<td>").text(resultItem.memberEmail);
            newRow.append(cell3);

            var cell4 = $("<td>").text(resultItem.memberBirthDate);
            newRow.append(cell4);

            var cell5 = $("<td>").text(resultItem.memberJoinDate);
            newRow.append(cell5);

            var cell6 = $("<td>").text("이메일 보내기");
            newRow.append(cell6);

            resultTable.append(newRow);
        });
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
            <li><a href="<c:url value="/admin/notice"/>" >공지사항 관리</a></li>
            <li><a href="#">1:1문의 관리</a></li>
            <li><a href="#">묻고답하기 관리</a></li>
            <li><a href="#">FAQ 관리</a></li>
            <li><a href="#">제품 관리</a></li>
        </ul>
    </div>
    <!-- 메인 -->
    <div id="adminSection">
        <div class="adminDiv">
            <h3>회원관리</h3>
        </div>
        <div class="adminDiv">
            검색 옵션
            <select name="searchAdmin" id="searchAdmin">
                <option value="0" selected>전체</option>
                <option value="1">아이디</option>
                <option value="2">성명</option>
                <option value="3">이메일</option>
            </select>
            <input type="text" name="search_keyword" id="search_keyword" value="">
            <input type="image" src="../img/community/search.gif" id="searchbtn">
        </div>
        <div class="adminDiv">
            <select class="size" name="selecOrder" id="selecOrder">
                <option selected>정렬</option>
                <option value="1">아이디 오름차순</option>
                <option value="2">아이디 내림차순</option>
                <option value="3">가입일 오름차순</option>
                <option value="4">가입일 내림차순</option>
            </select>
        </div>
        <div class="adminDiv2" id="tableTitle">
            <div>회원목록 ${memberList.size()}건</div>
            <div>
                <select class="size" name="selecPage" id="selecPage">
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
                    <th>아이디</th>
                    <th>성명</th>
                    <th>이메일</th>
                    <th>생일</th>
                    <th>가입일</th>
                    <th>임시비밀번호</th>
                </tr>
                </thead>
                <tbody id="search_results_body">
                <c:forEach items="${memberList}" var="c">
                    <tr>
                        <td>${c.memberId}</td>
                        <td>${c.memberName}</td>
                        <td>${c.memberEmail}</td>
                        <td>${c.memberBirthDate}</td>
                        <td>${c.memberJoinDate}</td>
                        <td>이메일 보내기</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

        <div class="pageNav adminDiv2">
            <div> </div>
            <div>
                <a href="/admin_member?page=1">처음</a>
                <a href="/admin_member?page=1">이전</a>
                <a href="/admin_member?page=1">1</a>
                <a href="/admin_member?page=2">2</a>
                <a href="/admin_member?page=3">3</a>
                <a href="/admin_member?page=2">다음</a>
                <a href="/admin_member?page=3">마지막</a>
            </div>
            <div> </div>
        </div>

    </div>
</div>
