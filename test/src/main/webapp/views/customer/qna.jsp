<%--
  Created by IntelliJ IDEA.
  User: 졍
  Date: 2024-04-18
  Time: 오전 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="iconSrc" value="/img/customer/icon_sct.gif" />
<link rel="stylesheet" href="../css/customer/customer02.css">
<script>

    function openWindow( no ){
        window.open('/cust/qnaCheck?idx='+no, '비밀번호확인', 'width=430,height=300,location=no,status=no,scrollbars=no')
    }

    $(document).ready(function() {
        $("#searchbtn").click(function() {
            var searchOption = $("#searchOption").val();
            var keyword = $("#search_keyword").val();

            $.ajax({
                url: "/cust/qnaSearch",
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
        var iconSrc = "${iconSrc}";

        var resultTable = $("#search_results_body");
        resultTable.empty(); // 테이블 초기화

        results.forEach((resultItem) => {
            var newRow = $("<tr>");

            // 클릭 이벤트 핸들러 추가
            newRow.click(function() {
                openWindow(resultItem.qnaIdx);
            });

            var cell1 = $("<td>").text(resultItem.qnaIdx);
            newRow.append(cell1);

            var cell2 = $("<td>").html('<img src="' + iconSrc + '" />' + resultItem.qnaTitle);
            newRow.append(cell2);

            var cell3 = $("<td>").text(resultItem.qnaName);
            newRow.append(cell3);

            var cell4 = $("<td>").text(resultItem.qnaDate);
            newRow.append(cell4);

            resultTable.append(newRow);
        });
    }

</script>

<!-- 메인 -->
<!-- 1:1문의 -->
<!-- COMMON -->
<div class="commonSection1">
    <div class="commonContent1">
        <img src="<c:url value="/img/member/sub-visual02.jpg"/>"
             style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>COSTOMER</h3>
            </div>
            <div>
                <p><img src="<c:url value="/img/icon-home.png"/>"> > 고객지원 > 묻고답하기</p>
            </div>
        </div>
    </div>
</div>
<!-- COMMON - 드랍다운 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="../index.html"><button class="homeBtn">H</button></a>
    <ul class="navbar-nav mr-auto navbar-nav-scroll"
        style="max-height: 100px;">

        <li class="nav-item dropdown dropdownHide">
            <a class="nav-link dropdown-toggle" href="#" role="button"
               data-toggle="dropdown" aria-expanded="false">
                고객지원
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                <li><a class="dropdown-item" href="#">회사소개</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">사업분야</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">제품안내</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">커뮤니티</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">고객지원</a></li>
            </ul>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown"
               role="button" data-toggle="dropdown" aria-expanded="false">
                묻고답하기
            </a>
            <ul class="dropdown-menu asd">
                <li><a class="dropdown-item" href="../customer/costomer01.html">1:1문의</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="../customer/costomer02.html">묻고답하기</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="../customer/costomer03.html">FAQ</a></li>
            </ul>
        </li>
    </ul>
    </div>
</nav>

<!-- 묻고답하기 -->
<div class="communitySection2 container text-center">
    <div>
        <div>묻고답하기</div>
        <div>The design and maintenance are excellent.</div>
    </div>
    <div class="qna">
        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
            </thead>
            <tbody id="search_results_body">
                <c:forEach items="${qna}" var="q">
                    <tr onclick="openWindow('${q.qnaIdx}')">
                        <td>${q.qnaIdx}</td>
                        <td><img src="<c:url value="/img/customer/icon_sct.gif"/>">${q.qnaTitle}</td>
                        <td>${q.qnaName}</td>
                        <td>${q.qnaDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- search bar -->
<div class="search container">
    <div>
        <img src="<c:url value="/img/customer/write.gif"/>">
    </div>
    <table>
        <tr>
            <td>
                <select name="내용" id="searchOption">
                    <option value="1">제목</option>
                    <option value="2">내용</option>
                    <option value="3">작성자</option>
                </select>
            </td>
            <td>
                <input type="text" id="search_keyword">
            </td>
            <td>
                <input type="image" id="searchbtn" src="<c:url value="/img/customer/search.gif"/>">
            </td>
        </tr>
    </table>
</div>
