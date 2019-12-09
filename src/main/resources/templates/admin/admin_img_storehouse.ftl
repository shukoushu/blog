<#include "module/macro.ftl">
<@head title="图库"></@head>
<link rel="stylesheet" href="/static/bootstrap-fileinput-master/css/fileinput.css">
<div class="wrapper">
    <#include "module/header.ftl">
    <#include "module/sidebar.ftl">
    <div class="content-wrapper">
        <section class="content-header">
            <h1 style="display: inline-block;">图库</h1>
            <a class="btn-header" id="showForm" href="javascript:void(0)">
                <i class="fa fa-cloud-upload" aria-hidden="true"></i>上传
            </a>
            <ol class="breadcrumb">
                <li><a data-pjax="true" href="/admin"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">图库</li>
            </ol>
        </section>

        <section class="content container-fluid">
            <div class="row" id="uploadForm" style="display: none;">
                <div class="col-md-12">
                    <div class="form-group">
                        <div class="file-loading">
                            <input id="uploadImg" class="file" type="file" multiple name="file">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <#if imgs.content?size gt 0>
                    <#list imgs.content as img>
                        <div class="col-lg-2 col-md-3 col-sm-6 col-xs-6 div-thumbnail" onclick="openDetail(${img.imgId})">
                            <a href="javascript:void(0)" class="thumbnail">
                                <img src="${img.imgPath}" class="img-responsive">
                            </a>
                        </div>
                    </#list>
                </#if>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="no-margin pull-left">
                        第 ${imgs.number+1}/${imgs.totalPages}页
                    </div>
                    <div class="btn-group pull-right btn-group-sm" role="group">
                        <a data-pjax="true" class="btn btn-default <#if !imgs.hasPrevious()>disabled</#if>"
                           href="/admin/imgs">
                            首页
                        </a>
                        <a data-pjax="true" class="btn btn-default <#if !imgs.hasPrevious()>disabled</#if>"
                           href="/admin/imgs?page=${imgs.number-1}">
                            上一页
                        </a>
                        <a data-pjax="true" class="btn btn-default <#if !imgs.hasNext()>disabled</#if>"
                           href="/admin/imgs?page=${imgs.number+1}">
                            下一页
                        </a>
                        <a data-pjax="true" class="btn btn-default <#if !imgs.hasNext()>disabled</#if>"
                           href="/admin/imgs?page=${imgs.totalPages-1}">
                            尾页
                        </a>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<script>
    $('#uploadImg').fileinput({
        language: 'zh',
        uploadUrl: '/admin/img',
        uploadAsync: true,
        allowedFileExtensions: ['jpg', 'gif', 'png', 'jpeg', 'svg', 'psd'],
        maxFileCount: 100,
        showCancel: false,
        enctype: 'multipart/form-data',
        showClose: false,
    }).on("fileuploaded", function (event, data, previewId, index) {
        layer.msg("ok", {time: 1000});
        window.location.reload();

    });
    $("#showForm").click(function(){
        $("#uploadForm").slideToggle(400);
    });
    function openDetail(id) {
        layer.open({
            type: 2,
            title: '图片详情',
            shadeClose: true,
            shade: 0.5,
            maxmin: true,
            area: ['90%', '90%'],
            content: '/admin/img/'+id,
            scrollbar: false
        });
    }
    $("#outLogin").click(function () {
        console.log("test");
        $.post("/admin/loginOut",
            function () {
                window.location.href = "/admin/login";
            }
        );
    });
</script>
<@footer></@footer>

