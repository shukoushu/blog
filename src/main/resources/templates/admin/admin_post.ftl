<#include "module/macro.ftl">
<@head title="文章"></@head>
<div class="wrapper">
    <#include "module/header.ftl">
    <#include "module/sidebar.ftl">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                文章发布
                <small>Optional description</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">Here</li>
            </ol>
        </section>

        <section class="content container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-body table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>标题</th>
                                    <th>日期</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#if posts.content?size gt 0>
                                    <#list posts.content as post>
                                        <tr>
                                            <td>${post.postTitle}</td>
                                            <td>${post.postDate?if_exists?string("yyyy-MM-dd HH:mm")}</td>
                                            <td>
                                                <a href="/admin/posts/${post.postId}"
                                                   class="btn btn-primary btn-xs ">修改</a>
                                                <button class="btn btn-danger btn-xs "
                                                        onclick="modelShow('/admin/posts/remove/${post.postId}','确定永久删除？(不可逆)')">
                                                    永久删除
                                                </button>
                                            </td>
                                        </tr>
                                    </#list>
                                <#else>
                                    <tr>
                                        <th colspan="6" style="text-align: center">暂无文章</th>
                                    </tr>
                                </#if>
                                </tbody>
                            </table>
                        </div>
                        <div class="box-footer clearfix">
                            <div class="no-margin pull-left">
                                第${posts.number+1}/${posts.totalPages}页
                            </div>
                            <ul class="pagination no-margin pull-right">
                                <li><a data-pjax="true" class="btn btn-sm <#if !posts.hasPrevious()>disabled</#if>"
                                       href="/admin/posts">首页</a></li>
                                <li><a data-pjax="true" class="btn btn-sm <#if !posts.hasPrevious()>disabled</#if>"
                                       href="/admin/posts?page=${posts.number-1}">上页</a></li>
                                <li><a data-pjax="true" class="btn btn-sm <#if !posts.hasNext()>disabled</#if>"
                                       href="/admin/posts?page=${posts.number+1}">下页</a></li>
                                <li><a data-pjax="true" class="btn btn-sm <#if !posts.hasNext()>disabled</#if>"
                                       href="/admin/posts?page=${posts.totalPages-1}">尾页</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </section>
        <div class="modal fade" id="removePostModal">
            <div class="modal-dialog">
                <div class="modal-content message_align">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">×</span></button>
                        <h4 class="modal-title">提示信息</h4>
                    </div>
                    <div class="modal-body">
                        <p id="message"></p>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" id="url"/>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <a onclick="removeIt()" class="btn btn-danger" data-dismiss="modal">确定</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function modelShow(url, message) {
        $('#url').val(url);
        $('#message').html(message);
        $('#removePostModal').modal();
    }

    function removeIt() {
        var url = $.trim($("#url").val());
        $.ajax({
            url: url,
            type: "POST",
            data: {_method: "DELETE"},
            dataType: "text",
            success: function (result) {
                window.location.href = "/admin/posts";
            }
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
