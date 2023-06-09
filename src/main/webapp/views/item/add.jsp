<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let item_add = {
        init : ()=>{
            $('#register_btn').click(()=>{
                item_add.send();
            })
        },
        send : ()=>{
            $('#register_form').attr({
                method : 'post',   //post방식으로
                action : '/item/addimpl',    //라우터는 해당 라우터
                enctype : 'multipart/form-data'
            });
            $('#register_form').submit();
        }
    };

    $(()=>{
        item_add.init();
    })
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Item add</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <form id="register_form" class="form-horizontal well">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="name">Name:</label>
                    <div class="col-sm-10">
                        <input type="text" name="name" class="form-control" id="name" placeholder="Enter name">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="price">Price:</label>
                    <div class="col-sm-10">
                        <input type="number" name="price" class="form-control" id="price" placeholder="Enter price">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="img">Image:</label>
                    <div class="col-sm-10">
                        <input type="file" name="img" class="form-control" id="img" placeholder="Input image">
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