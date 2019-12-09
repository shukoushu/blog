<#include "module/macro.ftl">
<@head title="个人资料"></@head>
<div class="wrapper">
    <#include "module/header.ftl">
    <#include "module/sidebar.ftl">
    <div class="content-wrapper">
        <section class="content-header">
            <h1 style="display: inline-block;">设置</h1>
            <ol class="breadcrumb">
                <li><a data-pjax="true" href="/admin"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">设置</li>
            </ol>
        </section>

        <section class="content container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#general" data-toggle="tab">常规设置</a>
                            </li>
                            <li>
                                <a href="#post" data-toggle="tab">文章设置</a>
                            </li>
                            <li>
                                <a href="#comment" data-toggle="tab">评论设置</a>
                            </li>
                            <li>
                                <a href="#admin" data-toggle="tab">后台设置</a>
                            </li>
                        </ul>
                        <!-- 基础设置 -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="general">
                                <form method="post" class="form-horizontal" id="commonOptions">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="blogTitle" class="col-sm-2 control-label">博客标题：</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" id="blogTitle" name="blog_title" value="${options.blog_title?if_exists}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="blogUrl" class="col-sm-2 control-label">博客地址：</label>
                                            <div class="col-sm-4">
                                                <input type="url" class="form-control" id="blogUrl" name="blog_url" value="${options.blog_url?default('http://localhost:8080')}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="blog_favicon" class="col-sm-2 control-label">LOGO：
                                                <span data-toggle="tooltip" data-placement="top" title="网站favtion" style="cursor: pointer">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i>
                                                </span>
                                            </label>
                                            <div class="col-sm-4">
                                                <div class="input-group">
                                                    <input type="text" class="form-control selectData" id="blog_favicon" name="blog_favicon" value="${options.blog_favicon?if_exists}">
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-default " type="button" onclick="openAttach('blog_favicon')">选择</button>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="blogFooterInfo" class="col-sm-2 control-label">页脚信息：
                                                <span data-toggle="tooltip" data-placement="top" title="支持HTML" style="cursor: pointer">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i>
                                                </span>
                                            </label>
                                            <div class="col-sm-4">
                                                <textarea class="form-control" rows="5" id="blogFooterInfo" name="blog_footer_info" style="resize: none">${options.blog_footer_info?if_exists}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <button type="button" class="btn btn-primary btn-sm " onclick="saveOptions('commonOptions')">保存</button>
                                    </div>
                                </form>
                            </div>
                            <!-- seo设置 -->
                            <#--<div class="tab-pane" id="seo">-->
                            <#--<form method="post" class="form-horizontal" id="seoOptions">-->
                            <#--<div class="box-body">-->
                            <#--<div class="form-group">-->
                            <#--<label for="keywords" class="col-sm-2 control-label">关键词：-->
                            <#--<span data-toggle="tooltip" data-placement="top" title="多个关键词使用,隔开" style="cursor: pointer">-->
                            <#--<i class="fa fa-question-circle" aria-hidden="true"></i>-->
                            <#--</span>-->
                            <#--</label>-->
                            <#--<div class="col-sm-4">-->
                            <#--<input type="text" class="form-control" id="keywords" name="seo_keywords" value="${options.seo_keywords?if_exists}">-->
                            <#--</div>-->
                            <#--</div>-->
                            <#--<div class="form-group">-->
                            <#--<label for="desc" class="col-sm-2 control-label">站点描述：</label>-->
                            <#--<div class="col-sm-4">-->
                            <#--<input type="text" class="form-control" id="desc" name="seo_desc" value="${options.seo_desc?if_exists}">-->
                            <#--</div>-->
                            <#--</div>-->
                            <#--<div class="form-group">-->
                            <#--<label for="baiduToken" class="col-sm-2 control-label">百度推送token：-->
                            <#--<span data-toggle="tooltip" data-placement="top" title="自行百度获取" style="cursor: pointer">-->
                            <#--<i class="fa fa-question-circle" aria-hidden="true"></i>-->
                            <#--</span>-->
                            <#--</label>-->
                            <#--<div class="col-sm-4">-->
                            <#--<input type="text" class="form-control" id="baiduToken" name="seo_baidu_token" value="${options.seo_baidu_token?if_exists}">-->
                            <#--</div>-->
                            <#--</div>-->
                            <#--</div>-->
                            <#--<div class="box-footer">-->
                            <#--<button type="button" class="btn btn-primary btn-sm " onclick="saveOptions('seoOptions')">保存</button>-->
                            <#--</div>-->
                            <#--</form>-->
                            <#--</div>-->
                            <!-- 文章设置 -->
                            <div class="tab-pane" id="post">
                                <form method="post" class="form-horizontal" id="postOptions">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="indexPosts" class="col-sm-2 control-label">首页显示条数：
                                                <span data-toggle="tooltip" data-placement="top" title="默认为10条" style="cursor: pointer">
                                                    <i class="fa fa-question-circle" aria-hidden="true"></i>
                                                </span>
                                            </label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" id="indexPosts" name="index_posts" value="${options.index_posts?default('10')}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="postSummary" class="col-sm-2 control-label">文章摘要字数：</label>
                                            <div class="col-sm-4">
                                                <div class="input-group">
                                                    <input type="number" class="form-control" id="postSummary" name="post_summary" value="${options.post_summary?default('50')}">
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-default " id="btn_update_summary" onclick="updateAllSummary()" type="button">更新</button>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <button type="button" class="btn btn-primary btn-sm " onclick="saveOptions('postOptions')">保存</button>
                                    </div>
                                </form>
                            </div>

                            <!-- 评论设置 -->
                            <div class="tab-pane" id="comment">
                                <form method="post" class="form-horizontal" id="commentOptions">
                                    <div class="box-body">
                                        <div class="native-options">
                                            <div class="form-group">
                                                <label for="nativeCommentAvatar" class="col-sm-2 control-label">评论者头像：
                                                    <span data-toggle="tooltip" data-placement="top" title="为用户评论者默认设置一个邮箱" style="cursor: pointer">
                                                        <i class="fa fa-question-circle" aria-hidden="true"></i>
                                                    </span>
                                                </label>
                                                <div class="col-sm-4">
                                                    <select class="form-control" id="nativeCommentAvatar" name="native_comment_avatar">
                                                        <option value="mm" ${((options.native_comment_avatar?default('default'))=='mm')?string('selected','')}>默认</option>
                                                        <option value="identicon" ${((options.native_comment_avatar?default('default'))=='identicon')?string('selected','')}>抽象几何图形</option>
                                                        <option value="monsterid" ${((options.native_comment_avatar?default('default'))=='monsterid')?string('selected','')}>小怪物</option>
                                                        <option value="wavatar" ${((options.native_comment_avatar?default('default'))=='wavatar')?string('selected','')}>Wavatar</option>
                                                        <option value="retro" ${((options.native_comment_avatar?default('default'))=='retro')?string('selected','')}>复古</option>
                                                        <option value="robohash" ${((options.native_comment_avatar?default('default'))=='robohash')?string('selected','')}>机器人</option>
                                                        <option value="blank" ${((options.native_comment_avatar?default('default'))=='blank')?string('selected','')}>不显示头像</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">新评论通知：</label>
                                                <div class="col-sm-4">
                                                    <label class="radio-inline">
                                                        <input type="radio" name="new_comment_notice" value="true" ${((options.new_comment_notice?if_exists)=='true')?string('checked','')}> 启用
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="new_comment_notice" value="false" ${((options.new_comment_notice?if_exists)=='false')?string('checked','')}> 禁用
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="indexComments" class="col-lg-2 col-sm-4 control-label">每页显示条数
                                                    <span data-toggle="tooltip" data-placement="top" title="默认10条" style="cursor: pointer">
                                                <i class="fa fa-question-circle" aria-hidden="true"></i>
                                            </span>
                                                </label>
                                                <div class="col-lg-4 col-sm-8">
                                                    <input type="number" class="form-control" id="indexComments" name="index_comments" value="${options.index_comments!'10'}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="nativeCommentPlaceholder" class="col-lg-2 col-sm-4 control-label">占位提示：</label>
                                                <div class="col-lg-4 col-sm-8">
                                                    <input type="url" class="form-control" id="nativeCommentPlaceholder" name="native_comment_placeholder" value="${options.native_comment_placeholder!'赶快评论一个吧！'}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="nativeCss" class="col-sm-2 control-label">自定义CSS：
                                                    <span data-toggle="tooltip" data-placement="top" title="对评论框自定义样式，如边距等" style="cursor: pointer">
                                                        <i class="fa fa-question-circle" aria-hidden="true"></i>
                                                    </span>
                                                </label>
                                                <div class="col-sm-4">
                                                    <textarea class="form-control" rows="5" id="nativeCss" name="native_css" style="resize: none">${options.native_css?if_exists}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <button type="button" class="btn btn-primary btn-sm " onclick="saveOptions('commentOptions')">保存</button>
                                    </div>
                                </form>
                            </div>

                            <!-- 后台设置 -->
                            <div class="tab-pane" id="admin">
                                <form method="post" class="form-horizontal" id="adminOptions">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">后台加载动画：</label>
                                            <div class="col-sm-4">
                                                <label class="radio-inline">
                                                    <input type="radio" name="admin_loading" value="true" ${((options.admin_loading?default('true'))=='true')?string('checked','')}> 启用
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="admin_loading" value="false" ${((options.admin_loading?if_exists)=='false')?string('checked','')}> 禁用
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">后台布局：</label>
                                            <div class="col-sm-4">
                                                <label class="radio-inline">
                                                    <input type="radio" name="admin_layout" value="" ${((options.admin_layout?default(''))=='')?string('checked','')}> 正常布局
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="admin_layout" value="layout-boxed" ${((options.admin_layout?default(''))=='layout-boxed')?string('checked','')}> 盒子布局
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="adminTheme" class="col-sm-2 control-label">后台主题：</label>
                                            <div class="col-sm-4">
                                                <select class="form-control" id="adminTheme" name="admin_theme">
                                                    <option value="skin-blue" ${((options.admin_theme?default('skin-blue'))=='skin-blue')?string('selected','')}>默认主题</option>
                                                    <option value="skin-blue-light" ${((options.admin_theme?default('skin-blue'))=='skin-blue-light')?string('selected','')}>上蓝左白</option>
                                                    <option value="skin-black" ${((options.admin_theme?default('skin-blue'))=='skin-black')?string('selected','')}>上白左黑</option>
                                                    <option value="skin-black-light" ${((options.admin_theme?default('skin-blue'))=='skin-black-light')?string('selected','')}>上白左白</option>
                                                    <option value="skin-green" ${((options.admin_theme?default('skin-blue'))=='skin-green')?string('selected','')}>上绿左黑</option>
                                                    <option value="skin-green-light" ${((options.admin_theme?default('skin-blue'))=='skin-green-light')?string('selected','')}>上绿左白</option>
                                                    <option value="skin-purple" ${((options.admin_theme?default('skin-blue'))=='skin-purple')?string('selected','')}>上紫左黑</option>
                                                    <option value="skin-purple-light" ${((options.admin_theme?default('skin-blue'))=='skin-purple-light')?string('selected','')}>上紫左白</option>
                                                    <option value="skin-red" ${((options.admin_theme?default('skin-blue'))=='skin-red')?string('selected','')}>上红左黑</option>
                                                    <option value="skin-red-light" ${((options.admin_theme?default('skin-blue'))=='skin-red-light')?string('selected','')}>上红左白</option>
                                                    <option value="skin-yellow" ${((options.admin_theme?default('skin-blue'))=='skin-yellow')?string('selected','')}>上黄左黑</option>
                                                    <option value="skin-yellow-light" ${((options.admin_theme?default('skin-blue'))=='skin-yellow-light')?string('selected','')}>上黄左白</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">侧边栏样式：</label>
                                            <div class="col-sm-4">
                                                <label class="radio-inline">
                                                    <input type="radio" name="sidebar_style" value="" ${((options.sidebar_style?default(''))=='')?string('checked','')}> 展开
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="sidebar_style" value="sidebar-collapse" ${((options.sidebar_style?default(''))=='sidebar-collapse')?string('checked','')}> 收拢
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <button type="button" class="btn btn-primary btn-sm " onclick="saveOptions('adminOptions')">保存</button>
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

    function saveOptions(option) {
        var param = $('#'+option).serialize();
        $.ajax({
            type: 'post',
            url: '/admin/options/save',
            data: param,
            success: function (result) {
                showMsg("保存成功！","success",1000);
                setTimeout(function () {
                    window.location.reload();
                },1500);
            }
        });
    }
    function viewLayout() {
        var layout = $('input:radio[value=layout-boxed]:checked').val();
        if(layout!=null){
            $('body').addClass('layout-boxed');
        }else{
            $('body').removeClass('layout-boxed');
        }
    }
    function viewSideBar() {
        var layout = $('input:radio[value=sidebar-collapse]:checked').val();
        if(layout!=null){
            $('body').addClass('sidebar-collapse');
        }else{
            $('body').removeClass('sidebar-collapse');
        }
    }

    $('input[name=admin_layout]').click(function () {
        viewLayout();
    });
    $('input[name=sidebar_style]').click(function () {
        viewSideBar();
    });


    $(function () {
        var beforeTheme;
        $('#adminTheme').change(function () {
            if($('body').hasClass("${options.admin_theme!'skin-blue'}")){
                $('body').removeClass("${options.admin_theme!'skin-blue'}");
            }
            if(beforeTheme!=null){
                $('body').removeClass(beforeTheme);
            }
            $('body').addClass($(this).val());
            beforeTheme = $(this).val();
        })
    })


</script>
<@footer></@footer>