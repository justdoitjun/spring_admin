<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">ITEM all</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
<%--        검색라인--%>

<%--        화면에서 필요한 검색조건이 4가지이다. --%>
        <form action="/item/search" method="get" id="search_form" class="form-inline well">

            <div class="form-group">
                <label class="control-label col-sm-2" for="name">Name:</label>
                <div class="col-sm-10">
                    <input type="text" name="name" class="form-control" id="name" placeholder="Enter title"
                           value="${ms.name}"
                    >
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="price">Price:</label>
                <div class="col-sm-10">
                    <input type="number" name="price" class="form-control" id="price" placeholder="Enter title"
                           value="${ms.price}"
                    >
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="startdate">Start Date:</label>
                <div class="col-sm-10">
                    <input type="date" name="startdate" class="form-control" id="startdate" placeholder="Enter title"
                           value="${ms.startdate}"
                    >
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="enddate">End Date:</label>
                <div class="col-sm-10">
                    <input type="date" name="enddate" class="form-control" id="enddate" placeholder="Enter title"
                           value="${ms.enddate}"
                    >
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-2">
                    <button id="search_btn"  class="btn btn-info">Search</button>
                </div>
            </div>
        </form>



<%--본래 있던 내용--%>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>이미지</th>
                        <th>이름</th>
                        <th>가격</th>
                        <th>등록일</th>
                    </tr>
                    <tbody>
                        <c:forEach var="obj" items="${ilist}">
                            <tr>
                                <td>
                                    <a href="#" data-toggle="modal" data-target="#target${obj.id}">
                                        <img id="item_img"src="/static/img/{obj.imgname}">
                                    </a>
                                </td>
                                <td>${obj.name}</td>
                                <td><fmt:formatNumber value="${obj.price}" type="currency" /></td>
                                <td><fmt:formatDate  value="${obj.rdate}" pattern="MM-dd-yyyy" /></td>
                            </tr>
                            <!-- Modal -->
                            <div id="target${obj.id}" class="modal fade" role="dialog">
                                <div class="modal-dialog">
                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <div class="modal-body">
                                            <p>${obj.name}</p>
                                            <p><img src="/static/img/{obj.imgname}"></p>
                                            <a href="/item/detail?id=${obj.id}" class="btn btn-info" role="button">Detail</a>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End of Modal -->
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->

