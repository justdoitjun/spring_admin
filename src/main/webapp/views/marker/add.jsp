<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let marker_add = {
        init : ()=>{
            $('#register_btn').click(()=>{
                marker_add.send();
            })
            $("#locs").change(function() {
                if ($(this).is(":checked")) {
                    console.log("Seoul is checked");
                    $("#lat").attr("min", "37.6");
                    $("#lat").attr("max", "38.3");
                    $("#lng").attr("min", "126.90");
                    $("#lng").attr("max", "129.0");
                } else {
                    console.log("Seoul is not checked");
                }
            });
            $("#locb").change(function() {
                if ($(this).is(":checked")) {
                    console.log("Seoul is checked");
                    $("#lat").attr("min", "35.17");
                    $("#lat").attr("max", "35.19");
                    $("#lng").attr("min", "129.07");
                    $("#lng").attr("max", "129.37");
                } else {
                    console.log("Seoul is not checked");
                }
            });
            $("#locj").change(function() {
                if ($(this).is(":checked")) {
                    console.log("Seoul is checked");
                    $("#lat").attr("min", "33.48");
                    $("#lat").attr("max", "33.78");
                    $("#lng").attr("min", "126.52");
                    $("#lng").attr("max", "126.54");
                } else {
                    console.log("Seoul is not checked");
                }
            });

        },
        send : ()=>{
            $('#register_form').attr({
                method : 'post',   //post방식으로
                action : '/marker/addimpl'    //라우터는 해당 라우터
            });
            $('#register_form').submit();
        }
    };

    $(()=>{
        marker_add.init();
    })
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Marker add</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <form id="register_form" class="form-horizontal well">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="title">Title:</label>
                    <div class="col-sm-10">
                        <input type="text" name="title" class="form-control" id="title" value="제주국수준혁">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="target">target :</label>
                    <div class="col-sm-10">
                        <input type="text" name="target" class="form-control" id="target" value="www.economist.com">
                    </div>
                </div>

                <div class="form-group">    <!-- 서울을 선택하면, 해당 좌표가 latitude와 longitude에 반영됨. -->
                    <label class="control-label col-sm-2">Location:</label>
                    <div class="col-sm-10">
                        <input type="radio" name="loc" class="form-control" id="locs" value="s">서울
                        <input type="radio" name="loc" class="form-control" id="locb" value="b">부산
                        <input type="radio" name="loc" class="form-control" id="locj" value="j">제주
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="lat">Latitude:</label>
                    <div class="col-sm-10">
                        <input type="range" name="lat" class="form-control" id="lat"
                               min="126.00" max="128.00" step="0.01"
                               placeholder="Enter price">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="lng">Longitude:</label>
                    <div class="col-sm-10">
                        <input type="range" name="lng" class="form-control" id="lng"
                               min="126.00" max="128.00" step="0.01"
                               placeholder="Enter price">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="img">Image : </label>
                    <div class="col-sm-10">
                        <input type="text" name="img" id="img" class="form-control" value="귀찮아테스트.jpg">
                    </div>
                </div>
<%--                --%>
<%--                <div class="form-group">--%>
<%--                    <label class="control-label col-sm-2" for="lat">Latitude:</label>--%>
<%--                    <div class="col-sm-10">--%>
<%--                        <input type="range" name="lat" class="form-control" id="lat"--%>
<%--                               min="37.63" max="37.64" step="10"--%>
<%--                               placeholder="Enter price">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label class="control-label col-sm-2" for="lng">Longitude:</label>--%>
<%--                    <div class="col-sm-10">--%>
<%--                        <input type="range" name="lng" class="form-control" id="lng"--%>
<%--                               min="127.00" max="127.10" step="10"--%>
<%--                               placeholder="Enter price">--%>
<%--                    </div>--%>
<%--                </div>--%>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="register_btn" type="button" class="btn btn-success">Register</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- /.container-fluid -->