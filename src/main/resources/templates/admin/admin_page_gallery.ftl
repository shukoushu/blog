<#include "module/macro.ftl">
<@head title="画廊"></@head>
<link rel="stylesheet" href="/static/bootstrap-fileinput-master/css/fileinput.css">
<div class="wrapper">
    <#include "module/header.ftl">
    <#include "module/sidebar.ftl">
    <div class="content-wrapper">
        <section class="content-header">
            <h1 style="display: inline-block;">画廊</h1>
            <a class="btn-header" id="showForm" href="javascript:void(0)">
                <i class="fa fa-cloud-upload" aria-hidden="true"></i>添加图片
            </a>
            <ol class="breadcrumb">
                <li><a data-pjax="true" href="/admin"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">画廊</li>
            </ol>
        </section>

        <section class="content container-fluid">
            <div class="row" id="newPicturePanel" style="display: none;">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">添加图片</h3>
                        </div>
                        <form action="/admin/page/gallery/save" method="post" role="form" class="form-horizontal">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="galleryName" class="col-sm-2 control-label">图片标题：</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="galleryName" name="galleryName">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="galleryDesc" class="col-sm-2 control-label">图片描述：</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="galleryDesc" name="galleryDesc">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="galleryUrl" class="col-sm-2 control-label">图片地址：</label>
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="galleryUrl" name="galleryUrl">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default " type="button" onclick="openAttach('galleryUrl')">选择</button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="galleryDate" class="col-sm-2 control-label">图片日期（如有）：</label>
                                    <div class="col-sm-4">
                                        <input type="date" class="form-control" id="galleryDate" name="galleryDate">
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary pull-left">保存</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row">
                <#if gallerys.content?size gt 0>
                    <#list gallerys.content as gallery>
                        <div class="col-lg-2 col-md-3 col-sm-6 col-xs-6 div-thumbnail" onclick="openDetail(${gallery.galleryId})">
                            <a href="javascript:void(0)" class="thumbnail">
                                <img src="${gallery.galleryUrl}" class="img-responsive">
                            </a>
                        </div>
                    </#list>
                </#if>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="no-margin pull-left">
                        第 ${gallerys.number+1}/${gallerys.totalPages}页
                    </div>
                    <div class="btn-group pull-right btn-group-sm" role="group">
                        <a data-pjax="true" class="btn btn-default <#if !gallerys.hasPrevious()>disabled</#if>"
                           href="/admin/page/gallery">
                            首页
                        </a>
                        <a data-pjax="true" class="btn btn-default <#if !gallerys.hasPrevious()>disabled</#if>"
                           href="/admin/page/gallery?page=${gallerys.number-1}">
                            上一页
                        </a>
                        <a data-pjax="true" class="btn btn-default <#if !gallerys.hasNext()>disabled</#if>"
                           href="/admin/page/gallery?page=${gallerys.number+1}">
                            下一页
                        </a>
                        <a data-pjax="true" class="btn btn-default <#if !gallerys.hasNext()>disabled</#if>"
                           href="/admin/page/gallery?page=${gallerys.totalPages-1}">
                            尾页
                        </a>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<script>
    $("#showForm").click(function(){
        $("#newPicturePanel").slideToggle(400);
    });
    function openDetail(id) {
        layer.open({
            type: 2,
            title: '图片详情',
            shadeClose: true,
            shade: 0.5,
            maxmin: true,
            area: ['90%', '90%'],
            content: '/admin/page/gallery/'+id,
            scrollbar: false
        });
    }
    function openAttach(id) {
        layer.open({
            type: 2,
            title: '所有附件',
            shadeClose: true,
            shade: 0.5,
            area: ['90%', '90%'],
            content: '/admin/img/select?id='+id,
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
