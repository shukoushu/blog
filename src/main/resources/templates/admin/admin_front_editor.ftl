<#include "module/macro.ftl">
<@head title="前台编辑"></@head>
<div class="wrapper">
    <#include "module/header.ftl">
    <#include "module/sidebar.ftl">
    <div class="content-wrapper">
        <link rel="stylesheet" href="/static/easymde/easymde.min.css">
        <section class="content-header" id="animated-header">
            <h1 style="display: inline-block;">前台编辑</h1>
            <ol class="breadcrumb">
                <li>
                    <a data-pjax="true" href="/admin"><i class="fa fa-dashboard"></i>首页</a>
                </li>
                <li><a data-pjax="true" href="javascript:void(0)">外观</a></li>
                <li class="active">编辑</li>
            </ol>
        </section>
        <section class="content container-fluid" id="animated-content">
            <div class="row">
                <div class="col-md-9">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title" id="tplNameTitle"></h3>
                        </div>
                        <div class="box-body">
                            <div id="theme-editor">
                                <textarea style="display:none;" id="tplContent"></textarea>
                            </div>
                        </div>
                        <div class="box-footer">
                            <button type="button" class="btn btn-primary " onclick="saveTpl()">确定修改</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">文件名</h3>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <div class="table-responsive mailbox-messages">
                                <table class="table table-hover table-striped">
                                    <tbody>
                                    <#list tpls as tpl>
                                        <tr style="cursor: pointer">
                                            <td class="mailbox-name" onclick="loadContent('${tpl}')"><a
                                                        href="javascript:void(0)">${tpl}</a></td>
                                            <td class="mailbox-subject">
                                                <#switch tpl>
                                                    <#case "index.ftl">
                                                        首页
                                                        <#break >
                                                    <#case "post.ftl">
                                                        文章页面
                                                        <#break >
                                                    <#case "archives.ftl">
                                                        文章归档页面
                                                        <#break >
                                                    <#case "links.ftl">
                                                        友情链接页面
                                                        <#break >
                                                    <#case "module/macro.ftl">
                                                        宏模板
                                                        <#break >
                                                    <#case "page.ftl">
                                                        自定义页面
                                                        <#break>
                                                    <#case "gallery.ftl">
                                                        图库页面
                                                        <#break >
                                                    <#case "module/options.ftl">
                                                        设置选项
                                                        <#break >
                                                </#switch>
                                            </td>
                                        </tr>
                                    </#list>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="/static/easymde/easymde.min.js"></script>
        <script>
            /**
             * 加载编辑器
             */
            var easymde = new EasyMDE({
                element: document.getElementById("tplContent"),
                autoDownloadFontAwesome: false,
                autofocus: true,
                renderingConfig: {
                    codeSyntaxHighlighting: true
                },
                showIcons: ["code", "table"],
                status: false,
                tabSize: 4,
                toolbar: false,
                toolbarTips: false
            });

            function loadContent(tplName) {
                if (tplName && tplName != '') {
                    $.ajax({
                        type: 'GET',
                        url: '/admin/front/getTpl',
                        async: false,
                        data: {
                            tplName: tplName
                        },
                        success: function (data) {
                            easymde.value(data);
                            $('#tplNameTitle').html(tplName);
                        }
                    });
                } else {
                    easymde.value('');
                    $('#tplNameTitle').html('');
                }
            }

            function saveTpl() {
                $.ajax({
                    type: 'POST',
                    url: '/admin/front/editor/save',
                    async: false,
                    data: {
                        'tplName': $('#tplNameTitle').html(),
                        'tplContent': easymde.value()
                    },
                    success: function (data) {
                        if (data == true) {
                            showMsg("成功", 'success', 1000);
                        } else {
                            showMsg('失败', 'error', 2000);
                        }
                    }
                });
            }
        </script>
    </div>
</div>
