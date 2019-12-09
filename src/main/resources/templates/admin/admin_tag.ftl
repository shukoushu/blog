<#include "module/macro.ftl">
<@head title="菜单"></@head>
<div class="wrapper">
    <#include "module/header.ftl">
    <#include "module/sidebar.ftl">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                Tag
                <small>Optional description</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">Here</li>
            </ol>
        </section>

        <section class="content container-fluid">
            <div class="row">
                <div class="col-md-5">
                    <div class="box box-primary">
                        <#if updateTag??>
                            <div class="box-header with-border">
                                <h3 class="box-title">修改标签<#if tag??>(${updateTag.tagName})</#if></h3>
                            </div>
                            <form action="/admin/tag/save" method="post" role="form">
                                <input type="hidden" name="tagId" value="${updateTag.tagId}">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="tagName">名称</label>
                                        <input type="text" class="form-control" id="tagName" name="tagName" value="${updateTag.tagName}">
                                        <small>页面上所显示的名称</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="tagUrl">路径名称</label>
                                        <input type="text" class="form-control" id="tagUrl" name="tagUrl" value="${updateTag.tagUrl}">
                                        <small>*这是文章路径上显示的名称，最好为英文</small>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <button type="submit" class="btn btn-primary btn-sm ">确定修改</button>
                                    <a data-pjax="true" href="/admin/tag" class="btn btn-info btn-sm ">返回添加</a>
                                    <#if updateTag.posts?size = 0>
                                        <a data-pjax="true" class="btn btn-danger btn-sm  pull-right" onclick="modelShow('/admin/tag/remove?tagId=${updateTag.tagId}','确定删除')">删除</a>
                                    </#if>
                                </div>
                            </form>
                        <#else>
                            <div class="box-header with-border">
                                <h3 class="box-title">添加标签</h3>
                            </div>
                            <form action="/admin/tag/save" method="post" role="form" onsubmit="return checkTag()">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="tagName">名称</label>
                                        <input type="text" class="form-control" id="tagName" name="tagName">
                                        <small>页面上所显示的名称</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="tagUrl">路径名称</label>
                                        <input type="text" class="form-control" id="tagUrl" name="tagUrl">
                                        <small>*这是文章路径上显示的名称，最好为英文</small>
                                    </div>
                                </div>
                                <div class="box-footer">
                                    <button type="submit" class="btn btn-primary btn-sm ">确定添加</button>
                                </div>
                            </form>
                        </#if>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">所有标签</h3>
                        </div>
                        <div class="box-body table-responsive">
                            <@commonTag method="tags">
                                <#if tags?? && tags?size gt 0>
                                <#list tags as tag>
                                        <a class="btn btn-primary" href="/admin/tag/edit?tagId=${tag.tagId}" role="button">
                                            ${tag.tagName}
                                            <span class="badge">${tag.posts?size}</span>
                                        </a>
                                </#list>
                                    <#else>
                                </#if>
                            </@commonTag>
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
            dataType: "text",
            success: function (result) {
                if(result==false){
                    showMsg("删除失败",'error',2000);
                }else{showMsg("删除成功",'error',2000);}
                setTimeout(function () {
                    window.location.href = "/admin/tag";
                },2000);

            }

        });
    }
    function checkTag() {
        var name = $('#tagName').val();
        var url = $('#tagUrl').val();
        var result = true;
        if(name==""||url==""){
            showMsg("不能为空",'info',2000);
            result = false;
        }
        $.ajax({
            type: 'GET',
            url: '/admin/tag/checkUrl',
            async: false,
            data: {
                'tagUrl' : url,
                'tagName' : name
            },
            success: function (data) {
                if(data==false){
                    showMsg("标签重复",'error',2000);
                    result = false;
                }
            }
        });
        return result;
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
