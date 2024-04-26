<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-03-27
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    #geo > #map{
        width: 100%;
        height: 300px;
    }
</style>
<script>
    let geo2 = {
        mpa:null,
        // initialize
        init:function (){
            this.mapdisplay();
            $('#btn_s').click(()=>{
                this.go(37.5447611,127.0564625);
                this.getgeodata("s");
            });
            $('#btn_b').click(() => {
                this.go(35.1290483,129.0446982);
                this.getgeodata("b");
            });
            $('#btn_j').click(() => {
                this.go(33.3846216,126.5534925);
                this.getgeodata("j");
            });
        },
        // mpa 객체 생성
        mapdisplay :function (){
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                mapOption = {
                    center: new kakao.maps.LatLng(37.5447611,127.0564625), // 지도의 중심좌표
                    level: 8 // 지도의 확대 레벨
                };
            this.map = new kakao.maps.Map(mapContainer, mapOption);

            var market_position = new kakao.maps.LatLng(37.5447611,127.0564625);
            var marker = new kakao.maps.Marker({
                position: market_position
            });
            marker.setMap(this.map);
        },
        go:function (lat, lng){
            var moveLatLon = new kakao.maps.LatLng(lat, lng);
            this.map.panTo(moveLatLon);
        },
        getgeodata:function (loc){
            $.ajax({
                url:'<c:url value="/geo/getgeodata?loc='+loc+'"/>',
                success:function (datas){
                    console.log(datas);
                    geo2.display(datas);
                },
                error:function (e){
                    console.log(e);
                }
            });
        },
        display:function (datas){
            var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_p.png';
            $(datas).each(function(index, item) {
                // marker 생성
                // window 생성
                // event
                var imageSize = new kakao.maps.Size(30, 30);
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

                var marketPosition = new kakao.maps.LatLng(item.lat, item.lng);
                var marker = new kakao.maps.Marker({
                    map: geo2.map,
                    position: marketPosition,
                    title: item.title,
                    image: markerImage
                });
                // infowindow
                var infoContent = '<p>' + item.title + '</p>';
                infoContent += '<img style="width:50px;"  src="<c:url value="/img/bab.jpeg"/>">';

                var infowindow = new kakao.maps.InfoWindow({
                    content: infoContent,
                    position: marketPosition
                });
            });
        }
    };
    $(function (){
        geo2.init();
    });
</script>
<div class="container" id="geo">
    <h2>GEO2 Page</h2>
    <button type="button" id="btn_s" class="btn btn-primary">Seoul</button>
    <button type="button" id="btn_b" class="btn btn-primary">Busan</button>
    <button type="button" id="btn_j" class="btn btn-primary">Jeju</button>
    <div id="map">
        <!-- div 안에 내용이 있으면 알아서 너비, 높이를 잡는데
         안에 요소가 없으면 반드시 너비, 높이를 잡아줘야 영역이 보임-->
    </div>
</div>
