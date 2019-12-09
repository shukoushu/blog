<#include "module/macro.ftl">
<@head title="BLog"></@head>
<link rel="stylesheet" href="/static/bootstrap-fileinput-master/css/fileinput.css">
<div class="wrapper">
    <#include "module/header.ftl">
    <#include "module/sidebar.ftl">
    <div class="content-wrapper">
        <section class="content-header">
            <h1 style="display: inline-block;">后台首页</h1>
            <ol class="breadcrumb">
                <li><a data-pjax="true" href="/admin"><i class="fa fa-dashboard"></i> 首页</a></li>
            </ol>
        </section>

        <section class="content container-fluid">
            <!-- Small boxes (Stat box) -->
            <div class="row">
                    <div class="col-lg-3 col-xs-6" id="widgetPostCountBody">
                        <div class="small-box bg-aqua">
                            <div class="inner"><h3>${postCount?default(0)}</h3>
                                <p>文章</p></div>
                            <div class="icon"><i class="ion ion-bag"></i></div>
                            <a data-pjax="true" href="/admin/posts" class="small-box-footer">查看所有 <i
                                        class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-xs-6" id="widgetCommentCountBody">
                        <div class="small-box bg-green">
                            <div class="inner"><h3>${commentCount?default(0)}</h3>
                                <p>评论</p></div>
                            <div class="icon"><i class="ion ion-stats-bars"></i></div>
                            <a data-pjax="true" href="/admin/comment" class="small-box-footer">查看所有 <i
                                        class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-xs-6" id="widgetAttachmentCountBody">
                        <div class="small-box bg-yellow">
                            <div class="inner"><h3>${imageCountCount?default(0)}</h3>
                                <p>图库</p></div>
                            <div class="icon"><i class="ion ion-person-add"></i></div>
                            <a data-pjax="true" href="/admin/img" class="small-box-footer">上传图片 <i
                                        class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
            </div>
            <div class="row">
                    <div class="col-lg-6 col-xs-12" id="widgetPostLastestBody">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">最新文章</h3>
                                <div class="box-tools">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"
                                            data-toggle="tooltip" title="Collapse">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="box-body table-responsive">
                                <table class="table table-bordered table-hover text-center">
                                    <thead>
                                    <tr>
                                        <th>标题</th>
                                        <th>日期</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if postTopFive??>
                                        <#list postTopFive as post>
                                            <tr>
                                                <td><a target="_blank"
                                                       href="/archives/${post.postUrl}">${post.postTitle}</a></td>
                                                <td>${post.postDate?if_exists?string("yyyy-MM-dd HH:mm")}</td>
                                            </tr>
                                        </#list>
                                    <#else>
                                        <tr>
                                            <td>暂无数据</td>
                                        </tr>
                                    </#if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xs-12" id="widgetCommentLastestBody">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">最新评论</h3>
                                <div class="box-tools">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"
                                            data-toggle="tooltip" title="Collapse">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="box-body table-responsive">
                                <table class="table table-bordered table-hover text-center">
                                    <thead>
                                    <tr>
                                        <th>评论者</th>
                                        <th>评论页面</th>
                                        <th>内容</th>
                                        <th>时间</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if comments??>
                                        <#list comments as comment>
                                            <tr>
                                                <td>${comment.commentAuthor}</td>
                                                <td>
                                                    <a target="_blank"
                                                       href="/archives/${comment.post.getPostUrl()}">${comment.post.postTitle}</a>
                                                </td>
                                                <td>
                                                    <a href="/admin/comment">${comment.commentContent}</a>
                                                </td>
                                                <td>${comment.commentDate?string("yyyy-MM-dd HH:mm")}</td>
                                            </tr>
                                        </#list>
                                    <#else>
                                        <tr>
                                            <td>暂无数据</td>
                                        </tr>
                                    </#if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                <div class="col-lg-6 col-xs-12" id="widgetLogsLastestBody">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">最新日志</h3>
                            <div class="box-tools">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                        <i class="fa fa-bars"></i></button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#" onclick="openAllLogs()">查看所有</a></li>
                                        <li><a href="/admin/logs/clear">清空日志</a></li>
                                    </ul>
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="box-body table-responsive">
                            <table class="table table-bordered table-hover text-center">
                                <thead>
                                <tr>
                                    <th>事件</th>
                                    <th>结果</th>
                                    <th>IP</th>
                                    <th>时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#if logs??>
                                    <#list logs as log>
                                        <tr>
                                            <td>${log.logTitle}</td>
                                            <td>${log.logContent}</td>
                                            <td>${log.logIp}</td>
                                            <td>${log.logCreated?string("yyyy-MM-dd HH:mm")}</td>
                                        </tr>
                                    </#list>
                                <#else>
                                    <tr><td>暂无数据</td></tr>
                                </#if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<script>
    function openAllLogs() {
        layer.open({
            type: 2,
            title: '所有日志',
            shadeClose: true,
            shade: 0.5,
            maxmin: true,
            area: ['90%', '90%'],
            content: '/admin/logs',
            scrollbar: false
        });
    }
</script>
<@footer></@footer>