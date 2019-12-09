<#include "module/macro.ftl">
<@head title="文章发布"></@head>
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
                <div class="col-md-9">
                    <div style="margin-bottom: 10px;">
                        <input type="text" class="form-control input-lg" id="postTitle" name="postTitle"
                               placeholder="标题" autocomplete="off" value="<#if post??>${post.postTitle}</#if>">
                        <#if post??><input type="hidden" id="postId" value="${post.postId}"></#if>
                    </div>
                    <div class="box box-primary">
                        <div class="box-body pad">
                            <div id="markdown-editor">
                                <div class="modal-body navbar-static-top" style="z-index:2000">
                                    <textarea id="editorarea"
                                              style="display:none;"><#if post??>${post.postContentMd?if_exists}</#if></textarea>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-3">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">
                                文章链接</h3>
                            <div class="box-tools">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"
                                        data-toggle="tooltip" title="Collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <span style="vertical-align: inherit;">http://localhost:8090/archives/</span>
                                <input type="text" class="form-control" id="blog_title" placeholder="默认为标题拼音"
                                       style="display:inline;width:150px;">
                            </div>
                        </div>
                        <div class="box-footer">
                        </div>
                    </div>
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">
                                Tag标签</h3>
                            <div class="box-tools">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"
                                        data-toggle="tooltip" title="Collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <select class="form-control select2" multiple="multiple" data-placeholder="Tag"
                                        style="width: 100%;" id="select2">
                                    <@commonTag method="tags">
                                        <#if tags??>
                                            <#list tags as tag>
                                                <option>${tag.tagName}</option>
                                            </#list>
                                        </#if>
                                    </@commonTag>
                                </select>
                            </div>
                        </div>
                        <div class="box-footer">
                            <a href="/admin/tag">
                                <button class="btn btn-primary btn-sm pull-right " data-loading-text="添加Tag">添加Tag
                                </button>
                            </a>
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
                                            <div onclick="openDetail(${image.imgId})">
                                                <a href="javascript:void(0)" class="thumbnail"
                                                   style="width: 150px; height: 150px;">
                                                    <img width="100%" height="100%" src="${image.imgPath}"
                                                         class="img-responsive">
                                                </a>
                                            </div>
                                        </#list>
                                    </#if>
                                </@commonTag>
                            </div>
                        </div>
                    </div>
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
                </div>
            </div>

        </section>
    </div>
</div>
<script>
    $(".select2").select2({
        language: {
            noResults: function (params) {
                return "暂无标签";
            }
        }
    });
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

    function push() {
        $.post('/admin/posts', {
            'postId': $("#postId").val(),
            'postTitle': $("#postTitle").val(),
            'postUrl': $("#postTitle").toPinyin(),
            'postContentMd': easyMDE.value(),
            'postContent': easyMDE.markdown(easyMDE.value()),
            'tags': $("#select2").val()
        }, function (data) {
            if (data.succes == 1) {
                //清除自动保存的内容
                easyMDE.toTextArea();
                easyMDE.s
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
                        window.location.href = "/admin/posts/write";
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
