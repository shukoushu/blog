<#include "module/macro.ftl">
<@head title="菜单"></@head>
<div class="wrapper">
    <#include "module/header.ftl">
    <#include "module/sidebar.ftl">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                菜单
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
                        <div class="box-header with-border">
                            <h3 class="box-title">${statusName}菜单<#if updateMenu??>[${updateMenu.menuName}]</#if></h3>
                        </div>
                        <form action="/admin/menu" method="post" role="form" id="menuAddForm">
                            <#if updateMenu??>
                                <input type="hidden" name="menuId" value="${updateMenu.menuId}">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="menuName">名称</label>
                                        <input type="text" class="form-control" id="menuName" name="menuName"
                                               value="${updateMenu.menuName}">
                                        <small>页面上所显示的名称</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="menuUrl">路径</label>
                                        <input type="text" class="form-control" id="menuUrl" name="menuUrl"
                                               value="${updateMenu.menuUrl}">
                                        <small>*菜单的路径，最好为英文</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="menuSort">排序编号</label>
                                        <input type="number" class="form-control" id="menuSort" name="menuSort"
                                               value="${updateMenu.menuSort}">
                                    </div>
                                    <#--<div class="form-group">
                                        <label for="menuIcon">打开方式</label>
                                        <select class="form-control" id="menuTarget" name="menuTarget">
                                            <option value="_self" ${((updateMenu.menuTarget?default("_self")=="_self")?string('selected',''))}>当前窗口</option>
                                            <option value="_blank" ${((updateMenu.menuTarget?if_exists=="_blank")?string('selected',''))}>新窗口</option>
                                        </select>
                                    </div>-->
                                </div>
                            <#else >
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="menuName">名称</label>
                                        <input type="text" class="form-control" id="menuName" name="menuName">
                                        <small>页面上所显示的名称</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="menuUrl">路径</label>
                                        <input type="text" class="form-control" id="menuUrl" name="menuUrl">
                                        <small>*菜单的路径，最好为英文</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="menuSort">排序编号</label>
                                        <input type="text" class="form-control" id="menuSort" name="menuSort">
                                    </div>
                                    <#--<div class="form-group">
                                        <label for="menuIcon">打开方式</label>
                                        <select class="form-control" id="menuTarget" name="menuTarget">
                                            <option value="_self">当前窗口</option>
                                            <option value="_blank">新窗口</option>
                                        </select>
                                    </div>-->
                                </div>
                            </#if>
                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary btn-sm">确定${statusName}</button>
                                <#if updateMenu??>
                                    <a data-pjax="true" href="/admin/menu" class="btn btn-info btn-sm ">返回添加</a>
                                </#if>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">所有菜单</h3>
                        </div>
                        <div class="box-body table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>名称</th>
                                    <th>路径</th>
                                    <th>排序</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <#list menus as menu>
                                    <tr>
                                        <td>${menu.menuName}</td>
                                        <td>${menu.menuUrl}</td>
                                        <td>${(menu.menuSort)!}</td>
                                        <td>
                                            <#if updateMenu?? && menu.menuId==updateMenu.menuId>
                                                <a href="#" class="btn btn-primary btn-xs " disabled="">正在修改</a>
                                            <#else>
                                                <a data-pjax="true" href="/admin/menu/${menu.menuId}"
                                                   class="btn btn-primary btn-xs ">修改</a>
                                            </#if>
                                            <button class="btn btn-danger btn-xs "
                                                    onclick="modelShow('/admin/menu/remove/${menu.menuId}')">删除
                                            </button>
                                        </td>
                                    </tr>
                                </#list>

                                </tbody>
                            </table>
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
                window.location.href = "/admin/menu";
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
