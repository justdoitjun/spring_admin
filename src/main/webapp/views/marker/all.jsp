<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script>
    let marker_search = {
        init :()=>{
            $('#search_btn').click(()=>{
                console.log("clicked");
                $('#search_form').attr({
                    method : 'get',
                    action : '/marker/search'
                });//form에 속성값 부여
                $('#search_form').submit();
            })// click 시
        }
    }// marker_search

    $(()=>{
        marker_search.init();
    })// document.ready
</script>


<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Marker ALL </h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            <form class="form-inline well" id="search_form" action="">
                <div class="form-group">
                    <select class="form-control" name="loc">
                        <option value="">전체</option>
                        <option value="">지역</option>
                        <option value="s"      <c:if test="${ms.loc =='s'}">selected</c:if>     >서울</option>
                        <option value="b"      <c:if test="${ms.loc =='b'}">selected</c:if>     >부산</option>
                        <option value="j"      <c:if test="${ms.loc =='j'}">selected</c:if>     >제주</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="title">title: </label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="title" placeholder="Enter title"
                               name="title" value="${ms.title}">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-2">
                        <button type="button" id="search_btn" class="btn btn-primary">Search</button>
                    </div>
                </div>
            </form>

        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>이름</th>
                        <th>url</th>
                        <th>위도</th>
                        <th>경도</th>
                        <th>위치</th>
                    </tr>
                    <tbody>
                        <c:forEach var="obj" items="${mlist}">
                            <tr>
                                <td><a href="detail?id=${obj.id}"> ${obj.title} </a>
                                        </td>
                                <td>${obj.target}</td>
                                <td>${obj.lat}</td>
                                <td>${obj.lng}</td>
                                <td>${obj.loc}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->

