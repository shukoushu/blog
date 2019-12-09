<#include "module/macro.ftl">
<@head title="新建页面"></@head>
<div class="wrapper">
    <#include "module/header.ftl">
    <#include "module/sidebar.ftl">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                新建页面
                <small>Optional description</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">Here</li>
            </ol>
        </section>

        <section class="content container-fluid">
            <div class="row">
                <div class="col-md-9">
                    <div style="margin-bottom: 10px;">
                        <input type="text" class="form-control input-lg" id="pageTitle" name="postTitle"
                               placeholder="标题" autocomplete="off" value="<#if page??>${page.pageTitle}</#if>">
                        <input type="hidden" id="pageId" value="<#if page??>${page.pageId}</#if>">
                    </div>
                    <div class="box box-primary">
                        <!-- Editor.md编辑器 -->
                        <div class="box-body pad">
                            <div id="markdown-editor">
                                <div class="modal-body navbar-static-top" style="z-index:2000">
                                    <textarea id="editorarea"
                                              style="display:none;"><#if page??>${page.pageContentMd?if_exists}</#if></textarea>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-3">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">
                                发布</h3>
                            <div class="box-tools">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"
                                        data-toggle="tooltip" title="Collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="box-body">
                        </div>
                        <div class="box-footer">
                            <button onclick="push()" class="btn btn-primary btn-sm pull-right " data-loading-text="发布">
                                发布
                            </button>
                        </div>
                    </div>
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">图库</h3>
                            <div class="box-tools">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"
                                        data-toggle="tooltip" title="Collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div>
                                <input type="hidden" id="photourl" value="img">
                                <@commonTag method="img">
                                    <#if img??>
                                        <#list img as image>
                                            <div onclick="openDetail(${image.imgId})" >
                                                <a href="javascript:void(0)" class="thumbnail" style="width: 150px; height: 150px;" >
                                                    <img style="max-width:100%;max-height:100%;" src="${image.imgPath}" class="img-responsive">
                                                </a>
                                            </div>
                                        </#list>
                                    </#if>
                                </@commonTag>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<script>
    var easyMDE = new EasyMDE({
        element: document.getElementById("editorarea"),
        autoDownloadFontAwesome: false,
        autofocus: true,
        autosave: {
            enabled: true,
            uniqueId: "editor-temp-0",
            delay: 10000
        },
        renderingConfig: {
            codeSyntaxHighlighting: true
        },
        previewRender: function (plainText) {
            var preview = document.getElementsByClassName("editor-preview-side")[0];
            preview.innerHTML = this.parent.markdown(plainText);
            preview.setAttribute('id', 'editor-preview');
            /*MathJax.Hub.Queue(["Typeset", MathJax.Hub, "editor-preview"]);*/
            return preview.innerHTML;
        },
        showIcons: ["code", "table"],
        status: ["autosave", "lines", "words"],
        tabSize: 4
    });
    function openDetail(id) {
        layer.open({
            type: 2,
            title: '图片详情',
            shadeClose: true,
            shade: 0.5,
            maxmin: true,
            area: ['90%', '90%'],
            content: '/admin/img/' + id,
            scrollbar: false
        });
    }
    /*function push() {
        $.post('/admin/posts',{
            'postTitle': postTitle.val(),
            'postContentMd': easyMDE.value(),
        },function (data) {
            if(data.code === 1){
                //清除自动保存的内容
                easyMDE.toTextArea();
                easyMDE = null;
                layer.msg("ok",{time:1000})
            },'JSON');
        }
    }*/

    function push() {
        $.post('/admin/page', {
            <#if page??>
            'pageId':$("#pageId").val(),
            </#if>
            'pagePost':$("#pageTitle").toPinyin(),
            'pageTitle': $("#pageTitle").val(),
            'pageContentMd': easyMDE.value(),
            'pageUrl': $("#pageTitle").toPinyin(),
            'pageContent': easyMDE.markdown(easyMDE.value())
        }, function (data) {
            if (data.succes == 1) {
                //清除自动保存的内容
                easyMDE.toTextArea();
                easyMDE = new EasyMDE();
                $.toast({
                    text: "发布成功！",
                    heading: '提示',
                    icon: 'success',
                    showHideTransition: 'fade',
                    allowToastClose: true,
                    hideAfter: 1000,
                    stack: 1,
                    position: 'top-center',
                    textAlign: 'left',
                    loader: true,
                    loaderBg: '#ffffff',
                    afterHidden: function () {
                        window.location.href = "/admin/page/edit";
                    }
                });
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
