<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let cust_detail = {
        init : ()=>{
            $('#update_btn').click(()=>{
                cust_detail.send();
            })
            $('#delete_btn').click(()=>{
                let c = confirm("삭제하시겠습니까?");
                if(c == true){
                    location.href="/cust/deleteimpl";
                }
            })
        },
        send : ()=>{
            $('#detail_form').attr({
                method : 'post',
                action : '/cust/updateimpl'
            });
            $('#detail_form').submit();
        }
    };

    $(()=>{
        cust_detail.init();
    })
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Detail cust</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <form id="detail_form" class="form-horizontal well">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="id">ID:</label>
                    <div class="col-sm-10">
                        <input type="text" name="id" class="form-control" id="id"
                               placeholder="Enter id" value="${custinfo.id}">
                    </div>
                    <div class="col-sm-10">
                        <span id="check_id" class="bg-danger"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Password:</label>
                    <div class="col-sm-10">
                        <input type="password" name="pwd" class="form-control" id="pwd"
                               placeholder="Enter password" value="${custinfo.pwd}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="name">Name:</label>
                    <div class="col-sm-10">
                        <input type="password" name="name" class="form-control" id="name"
                               placeholder="Enter name" value="${custinfo.name}">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="update_btn" type="button" class="btn btn-success">Update</button>
                    </div>
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="delete_btn" type="button" class="btn btn-danger">Delete</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>
<!-- /.container-fluid -->