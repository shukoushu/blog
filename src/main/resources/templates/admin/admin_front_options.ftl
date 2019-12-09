<#include "module/macro.ftl">
<@head title="个人资料"></@head>
<div class="wrapper">
    <#include "module/header.ftl">
    <#include "module/sidebar.ftl">
    <div class="content-wrapper">
        <section class="content-header">
            <h1 style="display: inline-block;">社交资料&样式</h1>
            <ol class="breadcrumb">
                <li><a data-pjax="true" href="/admin"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">社交资料&样式</li>
            </ol>
        </section>

        <section class="content container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#sns" data-toggle="tab">社交资料</a>
                            </li>
                            <li>
                                <a href="#style" data-toggle="tab">样式</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="sns">
                                <form method="post" class="form-horizontal" id="Options">
                                    <div class="box-body">
                                        <#--<div class="form-group">-->
                                            <#--<label for="anatoleSnsRss" class="col-sm-2 control-label">RSS：</label>-->
                                            <#--<div class="col-sm-8">-->
                                                <#--<label class="radio-inline">-->
                                                    <#--<input type="radio" name="theme_anatole_sns_rss" id="anatoleSnsRss" value="true" ${((options.theme_anatole_sns_rss?default('true'))=='true')?string('checked','')}> 显示-->
                                                <#--</label>-->
                                                <#--<label class="radio-inline">-->
                                                    <#--<input type="radio" name="theme_anatole_sns_rss" id="anatoleSnsRss" value="false" ${((options.theme_anatole_sns_rss?if_exists)=='false')?string('checked','')}> 隐藏-->
                                                <#--</label>-->
                                            <#--</div>-->
                                        <#--</div>    -->
                                        <div class="form-group">
                                            <label for="weibo_url" class="col-sm-2 control-label">Weibo：</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="weibo_url" name="weibo_url" value="${options.weibo_url?if_exists}" >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="email_address" class="col-sm-2 control-label">Email：</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="email_address" name="email_address" value="${options.email_address?if_exists}" >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="github_url" class="col-sm-2 control-label">Github：</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="github_url" name="github_url" value="${options.github_url?if_exists}" >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="qq_number" class="col-sm-2 control-label">QQ：</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="qq_number" name="qq_number" value="${options.qq_number?if_exists}" >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="twitter_account" class="col-sm-2 control-label">Twitter：</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="twitter_account" name="twitter_account" value="${options.twitter_account?if_exists}" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <button type="button" class="btn btn-primary btn-sm pull-right" onclick="saveThemeOptions('Options')">保存设置</button>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane" id="style">
                                <form method="post" class="form-horizontal" id="StyleOptions">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="user_location" class="col-sm-2 control-label">用户地址：</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" id="user_location" name="user_location" value="${options.user_location?if_exists}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="StyleHitokoto" class="col-sm-2 control-label">博客描述开启一言：</label>
                                            <div class="col-sm-8">
                                                <label class="radio-inline">
                                                    <input type="radio" name="style_hitokoto" id="StyleHitokoto" value="true" ${((options.style_hitokoto?if_exists)=='true')?string('checked','')}> 开启
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="style_hitokoto" id="StyleHitokoto" value="false" ${((options.style_hitokoto?default('false'))=='false')?string('checked','')}> 关闭
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <button type="button" class="btn btn-primary btn-sm pull-right" onclick="saveThemeOptions('StyleOptions')">保存设置</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    });


    function saveThemeOptions(option) {
        var param = $('#'+option).serialize();
        $.ajax({
            type: 'post',
            url: '/admin/options/save',
            data: param,
            success: function (data) {
                if(data==true){
                    showMsg("保存成功!", "success", 1000);
                }else{
                    showMsg("保存失败!", "error", 1000);
                }
            }
        });
    }
    function openAttach(id) {
        layer.open({
            type: 2,
            title: '所有图片',
            shadeClose: true,
            shade: 0.5,
            maxmin: true,
            area: ['90%', '90%'],
            content: '/admin/img/select?id=' + id,
            scrollbar: false
        });
    }
</script>
<@footer></@footer>