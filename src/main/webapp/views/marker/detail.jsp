<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    #map{
        width:400px;
        height:400px;
        border:2px solid blueviolet;
    }
</style>

<script>
    let marker_detail_map= {
        map:null,
        init:()=>{
            let mapContainer = document.querySelector('#map');
            let mapOption = {
                center: new kakao.maps.LatLng(${marker.lat}, ${marker.lng}), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
            map = new kakao.maps.Map(mapContainer, mapOption);
            var mapTypeControl = new kakao.maps.MapTypeControl();
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
            var markerPosition  = new kakao.maps.LatLng(37.450701, 126.8);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);
            var iwContent = '<img src="${marker.img}" style="width:80px"><div style="padding:5px;">Hello World!</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
            var infowindow = new kakao.maps.InfoWindow({
                content : iwContent
            });
            kakao.maps.event.addListener(marker, 'click', function() {
                location.href='${marker.target}';
            });
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                infowindow.open(map, marker);
            });
            kakao.maps.event.addListener(marker, 'mouseout', function() {
                // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                infowindow.close();
            });
        } //end of map01 - init
    }; // end of map01

    $(()=>{
        marker_detail_map.init();
    });// end of onload

</script>

<!-- Begin Page Content -->
<div class="container-fluid">
    <h1> Marker Detail </h1>
    <h2>관리자님! ${marker.id}번 맛집 데이터에 대한 정보입니다. </h2>
    <hr>
    <h4>맛집 이름 :  ${marker.title}</h4>
    <h4>위도 : ${marker.lat} 경도 : ${marker.lng}</h4>
    <h4>주소상징값 : ${marker.loc}</h4>

    <div class="card-body">
        <div class="row">
            <div class="col-sm-10" id="map">
                <!-- map의 디자인을 그려주지 않으면 안 뿌려진다. -->

            </div>
        </div>
    </div><!-- card body-->

</div>
<!-- /.container-fluid -->