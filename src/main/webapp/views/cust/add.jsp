<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let cust_add = {
        init : ()=>{
            $('#register_btn').click(()=>{
                cust_add.send();
            })
        },
        send : ()=>{
            $('#register_form').attr({
                method : 'post',
                action : '/cust/addimpl'
            });
            $('#register_form').submit();
        }
    };

    $(()=>{
        cust_add.init();
    })
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Cust all</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <form id="register_form" class="form-horizontal well">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="id">ID:</label>
                    <div class="col-sm-10">
                        <input type="text" name="id" class="form-control" id="id" placeholder="Enter id">
                    </div>
                    <div class="col-sm-10">
                        <span id="check_id" class="bg-danger"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Password:</label>
                    <div class="col-sm-10">
                        <input type="password" name="pwd" class="form-control" id="pwd" placeholder="Enter password">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="name">Name:</label>
                    <div class="col-sm-10">
                        <input type="password" name="name" class="form-control" id="name" placeholder="Enter name">
                    </div>
                </div>
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