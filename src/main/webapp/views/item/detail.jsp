<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let item_detail = {
        init : ()=>{
            $('#register_btn').click(()=>{
                item_detail.send();
            })
            $('#delete_btn').click(()=>{
                let c = confirm("Do you want to delete this item for sure?");
                if(c==true){
                    location.href = '/item/deleteimpl?id=${gitem.id}';
                }
            })
        },
        send : ()=>{
            $('#register_form').attr({
                method : 'post',   //post방식으로
                action : '/item/updateimpl',    //라우터는 해당 라우터
                enctype : 'multipart/form-data'
            });
            $('#register_form').submit();
        }
    };

    $(()=>{
        item_detail.init();
    })
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Item Detail</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">${gitem.id} 번 아이템</h6>
        </div>
        <div class="card-body">
            <form id="register_form" class="form-horizontal well">
                <input type="hidden" name="id" value="${gitem.id}">
                <input type="hidden" name="imgname"
                       value="${gitem.imgname}">
                <div class="form-group">
                    <div class="col-sm-10">
                        <img src="/uimg/${gitem.imgname}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="price">Price:</label>
                    <div class="col-sm-10">
                        <input type="int" name="price" class="form-control" id="price"
                               placeholder="${gitem.price}를 재조정해주세요">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="name">NAME:</label>
                    <div class="col-sm-10">
                        <input type="text" name="name" class="form-control" id="name" placeholder="${gitem.name}">
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
                        <button id="register_btn" type="button" class="btn btn-success">Update</button>
                        <button id="delete_btn" type="button" class="btn btn-danger">Delete</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- /.container-fluid -->